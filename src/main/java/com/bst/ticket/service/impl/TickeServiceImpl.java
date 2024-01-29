package com.bst.ticket.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bst.ticket.dao.TicketDao;
import com.bst.ticket.service.TicketService;

@Service
public class TickeServiceImpl implements TicketService{
  Logger logger = LoggerFactory.getLogger(TickeServiceImpl.class);
  
  @Autowired
  private TicketDao ticketDao;

  @Override
  public List<Map<String, Object>> ticketList(Map<String, Object> tmap) throws Exception {

    return ticketDao.ticketList(tmap);
  }
}
