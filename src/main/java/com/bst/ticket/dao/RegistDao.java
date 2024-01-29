package com.bst.ticket.dao;

import com.bst.ticket.vo.MemberVO;

import java.util.Map;

public interface RegistDao {

    /*
   작성자 : 이동건
   작성일자 : 24.01.18
   기능 : 회원가입(RegistDao)
   */
    public int regist(MemberVO memberVO) throws Exception;

    /*
     작성자 : 이동건
     작성일자 : 24.01.14
     기능 : 아이디 중복검사
    */
    public int checkId(String id) throws Exception;
}
