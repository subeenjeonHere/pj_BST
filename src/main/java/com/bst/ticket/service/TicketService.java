package com.bst.ticket.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface TicketService {

  List<Map<String, Object>> ticketList(Map<String, Object> tmap)throws Exception;

}
