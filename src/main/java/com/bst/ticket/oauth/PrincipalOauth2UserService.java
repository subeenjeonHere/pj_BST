package com.bst.ticket.oauth;

import com.bst.ticket.auth.PrincipalDetails;
import com.bst.ticket.dao.impl.LoginDaoImpl;
import com.bst.ticket.dao.impl.RegistDaoImpl;
import com.bst.ticket.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Map;


@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
    Logger logger = LoggerFactory.getLogger(PrincipalOauth2UserService.class);

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private LoginDaoImpl loginDaoImpl;

    @Autowired
    private RegistDaoImpl registDaoImpl;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);
        OAuth2UserInfo oAuth2UserInfo = null;
        logger.info("getAtrributes : {}" , oAuth2User.getAttributes());

        String mbr_provider = userRequest.getClientRegistration().getRegistrationId();

        if(mbr_provider.equals("google")) {
            logger.info("구글 로그인 요청");
            oAuth2UserInfo = new GoogleUserInfo( oAuth2User.getAttributes() );
        } else if(mbr_provider.equals("kakao")) {
            logger.info("카카오 로그인 요청");
            oAuth2UserInfo = new KakaoUserInfo((Map) oAuth2User.getAttributes());
        }else if(mbr_provider.equals("naver")) {
            logger.info("네이버 로그인 요청");
            oAuth2UserInfo = new NaverUserInfo( (Map)oAuth2User.getAttributes());
        }

        String birth = oAuth2UserInfo.getBirthday();
        String month = birth.substring(0, 2);
        String day = birth.substring(2, 4);

        String mbr_providerId = oAuth2UserInfo.getProviderId();
        String mbr_id = mbr_provider + "_" + mbr_providerId;
        String mbr_pwd = bCryptPasswordEncoder.encode("비밀번호가 필요해");
        String mbr_nm =  oAuth2UserInfo.getName();
        LocalDate mbr_birthdate = LocalDate.parse(oAuth2UserInfo.getBirthyear() + "-" + month + "-" + day);
        String mbr_phone= "010-1234-1234";
        String mbr_address = "addresssssssssss";
        String mbr_postalcode = "12345";
        String mbr_email = oAuth2UserInfo.getEmail();
        String mbr_role = "ROLE_USER";
        int team_id=10;

        logger.info("mbr_birthdate : "+mbr_birthdate);
        MemberVO mEntity = null;

        try {
            mEntity = loginDaoImpl.login(mbr_id);
            logger.info("mEntity" + mEntity);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (mEntity == null) { // 반환 받은 값이 없다 = username이 없으니까 강제 회원가입 처리
            try {
                mEntity = MemberVO.builder()
                        .mbr_id(mbr_id)
                        .mbr_pwd(mbr_pwd)
                        .mbr_email(mbr_email)
                        .mbr_role(mbr_role)
                        .mbr_nm(mbr_nm)
                        .mbr_birthdate(mbr_birthdate)
                        .mbr_phone(mbr_phone)
                        .mbr_address(mbr_address)
                        .mbr_postalcode(mbr_postalcode)
                        .team_id(team_id)
                        .mbr_provider(mbr_provider)
                        .mbr_providerId(mbr_providerId)
                        .build();
                registDaoImpl.regist(mEntity);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            logger.info("구글 로그인 한 적 있음");
        }

        return new PrincipalDetails(mEntity, oAuth2User.getAttributes());
    }
}
