package com.bst.ticket.dao.impl;

import com.bst.ticket.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bst.ticket.dao.LoginDao;

import java.util.Map;

@Repository
public class LoginDaoImpl implements LoginDao{
  Logger logger = LoggerFactory.getLogger(LoginDaoImpl.class);

  @Autowired
  private SqlSessionTemplate sqlSessionTemplate = null ;

   /*
  작성자 : 이유리
  작성일자 : 24.01.23
  기능 : 로그인 (DaoImpl)
  */
  @Override
  public MemberVO login(String username) throws Exception {
    logger.info("login() 호출 - 입력받은 값 : " + username);
    MemberVO memberVO = null;
    try {
      memberVO = sqlSessionTemplate.selectOne("login", username);
    } catch (Exception e) {
      logger.info(e.toString());
    }
    return memberVO;
  }

  /*
  작성자 : 이유리
  작성일자 : 24.01.24
  기능 : 아이디찾기 (DaoImpl)
*/
  @Override
  public String findId(Map<String, Object> fmap) throws Exception {
    logger.info("findId");
    logger.info("fmap : " + fmap);
    String id = sqlSessionTemplate.selectOne("findId", fmap);
    logger.info("찾은 id 값 : " + id);
    return id;
  }
} 