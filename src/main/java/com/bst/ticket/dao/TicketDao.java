package com.bst.ticket.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface TicketDao {

  List<Map<String, Object>> ticketList(Map<String, Object> tmap) throws Exception;

}