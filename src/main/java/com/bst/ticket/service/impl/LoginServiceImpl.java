package com.bst.ticket.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bst.ticket.dao.LoginDao;
import com.bst.ticket.service.LoginService;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService{
  Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

  @Autowired
  private LoginDao loginDao;

  /*
 작성자 : 이유리
 작성일자 : 24.01.24
 기능 : 아이디찾기(ServiceImpl)
*/
  @Override
  public String findId(Map<String, Object> fmap) throws Exception {
    logger.info("findId");
    String id = loginDao.findId(fmap);
    logger.info("id  : " + id);
    return id;
  }
}
