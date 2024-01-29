package com.bst.ticket.controller;

import java.util.List;
import java.util.Map;

import com.bst.ticket.vo.ReservationVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bst.ticket.service.ReservationService;

/**********************************************************************************
    작성자 : 박병현
    작성일자 : 24.01.17
    기능 : 예약리스트 조회
**********************************************************************************/
@Controller
@RequestMapping("/reservation/*")
public class      ReservationController {
  Logger logger = LoggerFactory.getLogger(ReservationController.class);

  @Autowired
  private ReservationService reservationService;
  
/**********************************************************************************
    작성자 : 박병현
    작성일자 : 24.01.17
    기능 : 마이페이지에 예약내역 조회
**********************************************************************************/
  @GetMapping("mypageForm")
  public String reserveList(@RequestParam Map<String,Object> mmap, Model model) throws Exception{
    logger.info("Controller : mypageForm 호출" + mmap);
    List<Map<String ,Object>> reserveList;
    reserveList = reservationService.reserveList(mmap);
    logger.info(reserveList.toString());
    model.addAttribute("reserveList", reserveList);

    return "forward:/mypage/mypageForm.jsp";
  }
  /**********************************************************************************
   작성자 : 박병현
   작성일자 : 24.01.18
   기능 : 예약 내역 페이지 조회
   **********************************************************************************/
  @GetMapping("reserveForm")
  public String reserveForm(@RequestParam Map<String,Object> mmap, Model model) throws Exception{
    logger.info("Controller : reserveForm 호출");
    List<Map<String ,Object>> reserveList;
    
    reserveList = reservationService.reserveList(mmap);
    model.addAttribute("reserveList", reserveList);

    return "forward:/mypage/reserveForm.jsp";
  }
  /**********************************************************************************
   작성자 : 박병현
   작성일자 : 24.01.27
   기능 : 티켓 예약하기
   **********************************************************************************/
  @GetMapping("ticketReservation")
  public String ticketReservation(ReservationVO reservationVO) throws Exception{
    logger.info("Controller : ticketReservation 호출");
    reservationService.ticketReservation(reservationVO);
    return "redirect:/ticket/ticketList";
  }

  /**********************************************************************************
   작성자 : 박병현
   작성일자 : 24.01.28
   기능 : 티켓 삭제하기
   **********************************************************************************/
  @GetMapping("reservationDelete")
  public String reservationDelete(ReservationVO reservationVO) throws Exception{
    logger.info("Controller : reservationDelete 호출");
    int result = 0;
    result = reservationService.reservationDelete(reservationVO);
    return "redirect:/";
  }
}
