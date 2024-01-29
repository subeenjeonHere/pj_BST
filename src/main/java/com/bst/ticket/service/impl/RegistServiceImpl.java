 
 package com.bst.ticket.service.impl;

 import java.util.Map;

 import com.bst.ticket.vo.MemberVO;
 import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Service;

import com.bst.ticket.dao.RegistDao;
import com.bst.ticket.service.RegistService;

@Service
public class RegistServiceImpl implements RegistService{
    Logger logger = LoggerFactory.getLogger(RegistServiceImpl.class);

  @Autowired
  private RegistDao registDao;
 /*
    작성자 : 이동건
    작성일자 : 24.01.18
    기능 : 회원가입(RegistServiceImpl)
    */

  @Override
  public int regist(MemberVO memberVO) throws Exception {
    logger.info("RegistServiceImpl : Regist 호출");
    int result = 0;
    result = registDao.regist(memberVO);
    return result;
  }

    /*
   작성자 : 이동건
   작성일자 : 24.01.14
   기능 : 아이디 중복검사
   */
    @Override
    public int checkId(String id) throws Exception {
       int cnt = registDao.checkId(id);
      return cnt;
    }
}