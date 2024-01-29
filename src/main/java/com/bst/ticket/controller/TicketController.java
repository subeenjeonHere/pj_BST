package com.bst.ticket.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bst.ticket.config.LocalDateTimeSerializer;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bst.ticket.service.TicketService;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {
  Logger logger = LoggerFactory.getLogger(TicketController.class);

  @Autowired
  private TicketService ticketService;

  /**********************************************************************************
   작성자 : 박병현
   작성일자 : 24.01.27
   기능 : 경기티켓 전체 조회
   **********************************************************************************/
  @GetMapping("ticketList")
  public String ticketList(@RequestParam Map<String,Object> tmap, Model model) throws Exception{
    logger.info("Controller : ticketList 호출");
    List<Map<String ,Object>> ticketList = null;
    ticketList = ticketService.ticketList(tmap);
    model.addAttribute("ticketList", ticketList);
//    logger.info(ticketList.toString());
    return "forward:/ticket/ticketList.jsp";
  }

  /**********************************************************************************
   작성자 : 박병현
   작성일자 : 24.01.27
   기능 : 경기티켓 조건 조회
   **********************************************************************************/
  @GetMapping("ticketDateList")
  @ResponseBody
  public String ticketDateList(@RequestParam Map<String,Object> gm_date) throws Exception{
    logger.info("Controller : ticketDateList 호출");
    List<Map<String,Object>> ticketList;
    logger.info(gm_date.toString());
    ticketList = ticketService.ticketList(gm_date);

    Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer())
            .create();

    String jsonTicketList = gson.toJson(ticketList);
    return jsonTicketList;
  }
}
