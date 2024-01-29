package com.bst.ticket.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface MainDao {

    /*
       작성자 : 한은지
       작성일자 : 24.01.24
       기능 : 티켓리스트(Dao)
    */
    public List<Map<String, Object>> ticketList(Map<String, Object> tmap) throws Exception;

    /*
       작성자 : 한은지
       작성일자 : 24.01.26
       기능 : 검색창(DaoImpl)
    */
    public List<Map<String, Object>> searchDetail(Map<String, Object> smap) throws Exception;
}
