package com.bst.ticket.controller;

import java.util.List;
import java.util.Map;

import com.bst.ticket.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bst.ticket.service.MemberService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
public class MemberContoller {
  Logger logger = LoggerFactory.getLogger(MemberContoller.class);

  @Autowired
  private MemberService memberService;

  /*
    작성자 : 박병현
    작성일자 : 24.01.18
    기능 : 프로필페이지에 회원 정보 조회
   */
  @GetMapping("memberProfile")
    public String memberProfile(@RequestParam Map<String,Object> mmap, Model model) throws Exception{
      logger.info("Controller : memberProfile 호출" + mmap);

      List<Map<String,Object>> memberList = null;
      memberList = memberService.memberList(mmap);
      logger.info(memberList.toString());
      model.addAttribute("memberList", memberList);
      return "forward:/mypage/profileForm.jsp";
  }

  /*
   작성자 : 박병현
   작성일자 : 24.01.24
   기능 : 회원 수정
  */
  @PostMapping("memberUpdate")
  public String memberUpdate(MemberVO memberVO, RedirectAttributes redirectAttributes) throws Exception {
    logger.info("Controller : memberUpdate 호출");
    int result = 0;
      result = memberService.memberUpdate(memberVO);
    if (result == 1) {
      redirectAttributes.addAttribute("mbr_seq", memberVO.getMbr_seq());
      return "redirect:/reservation/mypageForm";
    } else {
      return "";
    }
  }
  /*
   작성자 : 박병현
   작성일자 : 24.01.24
   기능 : 회원 삭제
  */
  @GetMapping("memberDelete")
  public String memberDelete(@RequestParam int mbr_seq) throws Exception {
    logger.info("Controller : memberDelete 호출" + mbr_seq);
    int result = 0;
      result = memberService.memberDelete(mbr_seq);
    if (result == 1) {

      return "redirect:/logout";
    } else {
      return "";
    }
  }

  /*
   작성자 : 박병현
   작성일자 : 24.01.24
   기능 : 비밀번호 확인
  */
  @PostMapping("checkPwd")
  public String checkPwd(@RequestParam String inputPassword, @RequestParam Map<String, Object> mbr_seq, RedirectAttributes redirectAttributes) throws Exception{
    logger.info("Controller : checkPwd 호출");
      logger.info(inputPassword);
      int result = 0;
      result = memberService.checkPwd(inputPassword, mbr_seq);
      if (result==1){
        redirectAttributes.addAttribute("mmap",mbr_seq.toString());
        return "redirect:/member/memberProfile";
      }else{
        return "";
      }
  }
}
