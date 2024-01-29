package com.bst.ticket.service;

import com.bst.ticket.vo.MemberVO;

import java.util.List;
import java.util.Map;

/*
    작성자 : 
    작성일자 : 24.01.12
    기능 : MemberService (Interface) 
*/
public interface MemberService {

  public List<Map<String,Object>> memberList(Map<String, Object> mmap) throws Exception;
  public int checkPwd(String inputPassword, Map<String, Object> mbr_seq) throws  Exception;

  public int memberUpdate(MemberVO memberVO) throws Exception;

  public int memberDelete(int mbrSeq) throws Exception;
}
