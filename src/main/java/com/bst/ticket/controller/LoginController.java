package com.bst.ticket.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bst.ticket.service.LoginService;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class LoginController {
  Logger logger = LoggerFactory.getLogger(LoginController.class);

  @Autowired
  private LoginService loginService;

  /*
 작성자 : 이유리
 작성일자 : 24.01.23
 기능 : 로그인(Controller)
*/
//  @GetMapping({ "", "/" })
//  public String index(HttpServletRequest req, Model model) {
//    logger.info("index 호출 > mainpage 이동");
//    logger.info("index"+req.isUserInRole("ROLE_USER"));
//    logger.info("index"+req.isUserInRole("ROLE_MANAGER"));
//    logger.info("index"+req.isUserInRole("ROLE_ADMIN"));
//
//    String role = "default";
//
//    if(req.isUserInRole("ROLE_ADMIN")) role="ROLE_ADMIN";
//    else if(req.isUserInRole("ROLE_MANAGER")) role="ROLE_MANAGER";
//    else if(req.isUserInRole("ROLE_USER")) role="ROLE_USER";
//
//    model.addAttribute("role", role);
//    return "redirect:";
//  }

  //   @PostMapping("/login")
  @GetMapping("/login")  // 여기 모르게뜸
  public String loginPage() {
    logger.info("loginPage() 호출");
    return "forward:auth/login/login.jsp";
  }

  /*
   작성자 : 이유리
   작성일자 : 24.01.24
   기능 : 아이디찾기(Controller)
  */
  @PostMapping("/findId")
  public String findId(@RequestParam Map<String, Object> fmap, Model model) {
    logger.info("findId");

    try {
      String id = loginService.findId(fmap);
      logger.info("id : "+id);
      model.addAttribute("findId", id);
      return "forward:auth/login/login.jsp";
    }
    catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  /*
 작성자 : 이유리
 작성일자 : 24.01.26
 기능 : 아이디찾기 페이지 호출(Controller)
*/
  @GetMapping("/find")
  public String findPage() {
    logger.info("findPage() 호출");
    return "forward:auth/login/findID.jsp";
  }
  
  // 로그인처리가 되지 않았을 때 에러페이지 호출
  @GetMapping("/login-error")
  public String loginError() {
    return "errorPage";
  }



}
