package com.bst.ticket.dao.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bst.ticket.dao.TicketDao;

@Repository
public class TicketDaoImpl implements TicketDao{
  Logger logger = LoggerFactory.getLogger(TicketDaoImpl.class);

  @Autowired
  SqlSessionTemplate sqlSessionTemplate;

  @Override
  public List<Map<String, Object>> ticketList(Map<String, Object> tmap) throws Exception {
    logger.info("Ropositiry : ticketList 호출");
    List<Map<String, Object>> tList = null;
    tList = sqlSessionTemplate.selectList("ticketList", tmap);
    logger.info(tList.toString());
    return tList;
  }

}
