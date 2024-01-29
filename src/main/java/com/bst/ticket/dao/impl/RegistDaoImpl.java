package com.bst.ticket.dao.impl;

import com.bst.ticket.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bst.ticket.dao.RegistDao;

@Repository
public class RegistDaoImpl implements RegistDao {
  Logger logger = LoggerFactory.getLogger(RegistDaoImpl.class);

  @Autowired
  SqlSessionTemplate sqlSessionTemplate;

    /*
    작성자 : 이동건
    작성일자 : 24.01.18
    기능 : 회원가입(RegistDaoImpl)
    */
    @Override
    public int regist(MemberVO memberVO) throws Exception {
      logger.info("RegistDaoImpl 호출");
      int result = 0;
      result = sqlSessionTemplate.insert("memberInsert",memberVO);
      return result;
    }

  /*
 작성자 : 이동건
 작성일자 : 24.01.14
 기능 : 아이디 중복검사
 */
  @Override
  public int checkId(String id) throws Exception {
    int cnt = sqlSessionTemplate.selectOne("checkId",id);
    return cnt;
  }


}
