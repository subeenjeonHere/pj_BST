package com.bst.ticket.service;

import java.util.Map;

public interface LoginService {
/*
 작성자 : 이유리
 작성일자 : 24.01.24
 기능 : 아이디찾기(Service)
*/
    public String findId(Map<String, Object> fmap) throws Exception;

}
