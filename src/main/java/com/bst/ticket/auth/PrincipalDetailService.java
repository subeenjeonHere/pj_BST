package com.bst.ticket.auth;

import com.bst.ticket.dao.impl.LoginDaoImpl;
import com.bst.ticket.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


// 스프링 시큐리티가 낚아채서 로그인 진행해줌 - 왜냐면 세션관리를 해야 하니까
// SecurityConfig설정에서 loginProcessingUrl)"/loginProcess") 이부분
// loginProcess 요청이 오면 자동으로 UserDetailsService타입으로 IoC되어 있는
// loadUserByUsername함수가 실행된다 - 스프링 시큐리티 컨벤션
// 시큐리티에서 session을 관리한다 Authentication <- UserDetails
@Service
public class PrincipalDetailService implements UserDetailsService {
    Logger logger = LoggerFactory.getLogger(PrincipalDetailService.class);

    @Autowired
    private LoginDaoImpl loginDaoImpl;

    @Override
    public UserDetails loadUserByUsername(String mbr_id) throws UsernameNotFoundException {
        logger.info("loadUserByUsername() 호출");
        logger.info("입력 받은 값 : " + mbr_id); // 파라미터로 사용자가 입력한 이름이 담김
        MemberVO memberVO = null;
        try {
            memberVO = loginDaoImpl.login(mbr_id);
            logger.info("memberVO : " + memberVO);
            if (memberVO != null) {
                logger.info("입력 받은 값과 일치하는 DB 찾음 > PrincipalDetails 이동 ");
                return new PrincipalDetails(memberVO);
            }
            return null;
        } catch (Exception e) {
            logger.info("일치하는 값 없음");
            throw new RuntimeException(e);
        }
    }
}
