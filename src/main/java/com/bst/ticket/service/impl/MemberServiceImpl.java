package com.bst.ticket.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bst.ticket.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bst.ticket.dao.MemberDao;
import com.bst.ticket.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
  Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

  @Autowired
  private MemberDao memberDao;
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;

  /*ex)
    작성자 : 홍길동
    작성일자 : 24.01.12
    기능 : 회원조회(service)
  */
  @Override
  public List<Map<String, Object>> memberList(Map<String, Object> mmap) throws Exception {
    logger.info("Service : memberList 호출");
    List<Map<String,Object>> mList = memberDao.memberList(mmap);
    return mList;
  }


  @Override
  public int memberUpdate(MemberVO memberVO) throws Exception {
    logger.info("Service : memberUpdate 호출");
    int result = 0;
    String rawPassword = memberVO.getMbr_pwd();
    String encPassword = bCryptPasswordEncoder.encode(rawPassword);
    memberVO.setMbr_pwd(encPassword);
    result = memberDao.memberUpdate(memberVO);
    return result;
  }

  @Override
  public int memberDelete(int mbrSeq) throws Exception {
    logger.info("Service : memberDelete 호출");
    return memberDao.memberDelete(mbrSeq);
  }
  @Override
  public int checkPwd(String inputPassword, Map<String, Object> mbr_seq) throws Exception {
    logger.info("Service : checkPwd 호출");
    String rawPassword = inputPassword;
    String storedPassword = memberDao.checkPwd(mbr_seq);

    //matches 메소드가 이미 저장된 비밀번호와 rawPassword를 맞는지 매칭해준다
    if(bCryptPasswordEncoder.matches(rawPassword, storedPassword)){
      return 1;
    }else{
      return 0;
    }
  }
}
