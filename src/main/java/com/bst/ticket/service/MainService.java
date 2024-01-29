package com.bst.ticket.service;

import java.util.List;
import java.util.Map;

public interface MainService {

    /*
       작성자 : 한은지
       작성일자 : 24.01.24
       기능 : 티켓리스트(Service)
    */
    List<Map<String, Object>> ticketList(Map<String, Object> tmap);

    /*
       작성자 : 한은지
       작성일자 : 24.01.26
       기능 : 검색창(Service)
    */
    List<Map<String, Object>> searchDetail(Map<String, Object> smap);


}
