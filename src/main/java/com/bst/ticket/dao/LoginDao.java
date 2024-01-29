package com.bst.ticket.dao;

import com.bst.ticket.vo.MemberVO;

import java.util.Map;

public interface LoginDao {
  /*
  작성자 : 이유리
  작성일자 : 24.01.23
  기능 : 로그인(Dao)
  */
  public MemberVO login(String mbr_id) throws Exception;

  /*
    작성자 : 이유리
    작성일자 : 24.01.24
    기능 : 아이디찾기(Dao)
  */
  public String findId(Map<String, Object> fmap) throws Exception;


}
