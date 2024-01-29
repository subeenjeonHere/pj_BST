package com.bst.ticket.controller;

import com.bst.ticket.service.MainService;
import com.bst.ticket.vo.MainVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
//@RequestMapping("/")
public class MainController {
    Logger logger = LoggerFactory.getLogger(MainController.class);
    @Autowired
    private MainService mainService;
    /*
       작성자 : 한은지
       작성일자 : 24.01.23
       기능 : 메인페이지(Controller)
    */
    @GetMapping("/")
    public String mainpage(Model model,@RequestParam Map<String,Object> tmap) {
        List<Map<String,Object>> ticketList = null;
        logger.info("MainController: mainpage 호출");
        ticketList = mainService.ticketList(tmap);
        logger.info(ticketList.toString());
        model.addAttribute("ticketList", ticketList);
        return "forward:/mainpage.jsp";
    }
    /*
       작성자 : 한은지
       작성일자 : 24.01.23
       기능 : 티켓리스트(Controller)
    */
    @GetMapping("/magepage/ticketList")
    public String ticketList(Model model,@RequestParam Map<String,Object> tmap) {
        List<Map<String,Object>> ticketList = null;
        logger.info("MainController: ticketList 호출");
        ticketList = mainService.ticketList(tmap);
        logger.info(ticketList.toString());
        model.addAttribute("ticketList", ticketList);
        return "forward:mainpage.jsp";
    }

    /*
       작성자 : 한은지
       작성일자 : 24.01.23
       기능 : 검색창(Controller)
    */
    @GetMapping("/searchDetail")
    public String searchDetail(Model model, @RequestParam Map<String,Object> smap) {
        List<Map<String,Object>> smList = null;
        logger.info("MainController: searchDetail 호출"+smap);

        smList = mainService.searchDetail(smap);
        logger.info(smList.toString());
        // 검색 결과를 모델에 추가하여 뷰로 전달
        model.addAttribute("listA", smList);
        return "forward:/notice/noticeList"; // 검색 상세 페이지로 이동
    }
}