package com.bst.ticket.service;

import com.bst.ticket.vo.MemberVO;

import java.util.Map;

public interface RegistService {

   /*
    작성자 : 이동건
    작성일자 : 24.01.18
    기능 : 회원가입(RegistService)
    */
   public int regist(MemberVO memberVO) throws Exception;

    /*
   작성자 : 이동건
   작성일자 : 24.01.14
   기능 : 아이디 중복검사
   */
    int checkId(String id)throws Exception;
}
