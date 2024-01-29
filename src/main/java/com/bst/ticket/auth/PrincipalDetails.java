package com.bst.ticket.auth;

import com.bst.ticket.vo.MemberVO;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {
    Logger logger = LoggerFactory.getLogger(PrincipalDetails.class);

    // 구글 로그인시 구글 서버에서 넣어주는 정보가 Map의 형태임
    private Map<String, Object> attributes;

    private MemberVO memberVO;

    public PrincipalDetails(MemberVO memberVO) {
        this.memberVO = memberVO;
    }

    public PrincipalDetails(MemberVO memberVO, Map<String, Object> attributes ) {
        this.memberVO = memberVO;
        this.attributes = attributes;
    }

    // 해당 User의 권한 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                logger.info("getAuthority : " + memberVO.getMbr_role());
                return memberVO.getMbr_role();
            }
        });
        return collect;
    }

    //  DB와 매칭 실패 시 loginFail.jsp 호출
    @Override
    public String getPassword() {
        logger.info("getPassword : " + memberVO.getMbr_pwd());
        return memberVO.getMbr_pwd();
    }

    @Override
    public String getUsername() {
        logger.info("getUsername = " + memberVO.getMbr_id());
        return memberVO.getMbr_id();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getName() {
        return null;
    }
    // 구글 로그인 후에 프로필 정보를 담을 변수
    // {sub=구글에서 할당하는 나에대한 고유식별자숫자값, name=이름, picture = , email, email_verified}
    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
}
