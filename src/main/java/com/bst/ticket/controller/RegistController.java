package com.bst.ticket.controller;

import java.util.Map;

import com.bst.ticket.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.bst.ticket.service.RegistService;

@Controller
@RequestMapping("/auth/*")
public class RegistController {
  Logger logger = LoggerFactory.getLogger(RegistController.class);

  @Autowired
  RegistService registService;

  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;

      /*
    작성자 : 이동건
    작성일자 : 24.01.18
    기능 : 회원가입 (RegistController)
    */
    /*
    작성자 : 이유리
    작성일자 : 24.01.24
    기능 : 회원가입 시큐리티 추가 (RegistController)
    */

  @PostMapping("regist")
  public String regist(MemberVO memberVO) throws Exception{
    logger.info(memberVO.toString());
    memberVO.setMbr_role(("ROLE_USER"));
    int result = 0;
    String path = "";

    String rawPassword = memberVO.getMbr_pwd();
    String encPassword = bCryptPasswordEncoder.encode(rawPassword);
    memberVO.setMbr_pwd(encPassword);//password변수 치환
    result = registService.regist(memberVO);
    if(result == 1){
      path = "redirect:/auth/login/login.jsp";
    }else{
      path = "redirect:/registerror.jsp";
    }
    return path;
  }

  /*
작성자 : 이동건
작성일자 : 24.01.14
기능 : 아이디 중복검사
*/
  @PostMapping("checkId")
  @ResponseBody
  public int checkId(@RequestParam("id") String id ) throws Exception {
    logger.info(id);
    int cnt = registService.checkId(id);
    return cnt;
  }

  /*
  작성자 : 이동건
  작성일자 : 24.01.25
  기능 : 약관동의 페이지 호출 
*/
  @GetMapping("/termPage")
  public String termPage() {
    logger.info("termPage() 호출");
    return "forward:term/term.jsp";
  }
  /*
작성자 : 이동건
작성일자 : 24.01.25
기능 : 회원가입 페이지 호출
*/
  @GetMapping("/registPage")
  public String registPage() {
    logger.info("registPage() 호출");
    return "forward:regist/regist.jsp";
  }
}
