package com.bst.ticket.controller;

import com.bst.ticket.dao.CommunityCommentDao;
import com.bst.ticket.dao.CommunityDao;
import com.bst.ticket.dto.SearchDto;
import com.bst.ticket.vo.CommunityCommentVO;
import com.bst.ticket.vo.CommunityVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
    Logger logger = LoggerFactory.getLogger(CommunityController.class);

    @Autowired
    private CommunityDao communityDao;
    @Autowired
    private CommunityCommentDao communityCommentDao;


    public CommunityController(CommunityDao communityDao, CommunityCommentDao communityCommentDao) {
        this.communityDao = communityDao;
        this.communityCommentDao = communityCommentDao;
    }

    /*
    Author: 전수빈
    Data: 22 Jan, 24 Jan
    Feature: Community board, Pagination
     */
    //게시글 리스트
    @GetMapping("/")
    public ModelAndView CommunityboardList(@ModelAttribute SearchDto searchDto) {
        ModelAndView mav = new ModelAndView("community");

        //Start paging
        // 페이지 및 레코드 크기 설정
        int page = searchDto.getPage();
        int recordSize = searchDto.getRecordSize();

        // 전체 게시글 수 Counting
        int totalBoards = communityDao.count(searchDto);

        // 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalBoards / recordSize);

        searchDto.setRecordSize(recordSize);
        searchDto.setPage(page);


        List<CommunityVO> communityBoardList = communityDao.getCommunityBoardList(searchDto);
        logger.info("Total Boards: " + totalBoards);
        mav.addObject("communityBoardList", communityBoardList);
        mav.addObject("totalPages", totalPages);
        mav.addObject("currentPage", page);
        return mav;
    }

    //게시글 조회
    @GetMapping("/view/{boardId}")
    public ModelAndView getCommunityBoard(@PathVariable("boardId") Integer boardId) {
        ModelAndView mav = new ModelAndView("communityBoardDetail");

        CommunityVO communityBoard = communityDao.getCommunityBoardById(boardId);
        List<CommunityCommentVO> commentList = communityCommentDao.getCommunityCommentList(boardId);

        if (communityBoard != null) {
            logger.info("Board title={}, content={}, hit={}", communityBoard.getBoardTitle(), communityBoard.getBoardContent(), communityBoard.getBoardHit());
            logger.info(commentList.toString());
            communityDao.boardHitUpdate(boardId);
            mav.addObject("communityBoard", communityBoard);
            mav.addObject("commentList", commentList);
        }
        return mav;
    }

    //게시글 작성폼
    @GetMapping("/writeform")
    public String communityBoardForm() {
        logger.info("Community Board Write Form");
        return "communityBoardWriteForm";
    }

    //게시글 작성
    @PostMapping("/write")
    public String saveCommunityBoard(@RequestParam Map<String, CommunityVO> boardMap) {
        logger.info("Board title={}, content={}", boardMap.get("boardTitle"), boardMap.get("boardContent"));
        communityDao.saveCommunityBoard(boardMap);
        return "redirect:/community/";
    }

    /*
    Author: 전수빈
    Data: 23 Jan
    Feature: Community CRUD
     */
    //게시글 삭제
    @GetMapping("/delete/{boardId}")
    public String deleteCommunityBoard(@PathVariable("boardId") Integer boardId, Model model) {
        logger.info("Deleted board title");
        communityDao.deleteCommunityBoard(boardId);
        model.addAttribute("message", "게시글 삭제가 완료되었습니다.");
        return "redirect:/community/";
    }

    //게시글 수정폼
    @GetMapping("/updateForm/{boardId}")
    public String updateCommunityBoardForm(@PathVariable("boardId") Integer boardId, Model model) {
        logger.info("Update boardId={}", boardId);
        model.addAttribute("boardId", boardId);
        return "communityBoardEditForm";
    }

    /*
    Author: 전수빈
    Data: 24 Jan
    Feature: Community CRUD
    */

    //게시글 수정
    @PostMapping("/update/{boardId}")
    public String updateCommunityBoard(@PathVariable("boardId") Integer boardId,
                                       @RequestParam Map<String, CommunityVO> boardMap) {
        logger.info("Updated board title={}, content={}, boardId={}", boardMap.get("boardTitle"),
                boardMap.get("boardContent"), boardMap.get("boardId"));

        CommunityVO tempBoard = communityDao.getCommunityBoardById(boardId);

        if (tempBoard != null) {
            String newTitle = String.valueOf(boardMap.get("boardTitle"));
            String newContent = String.valueOf(boardMap.get("boardContent"));
            tempBoard.setBoardTitle(newTitle);
            tempBoard.setBoardContent(newContent);

            logger.info("New Title={}, Content={}", tempBoard.getBoardTitle(), tempBoard.getBoardContent());

            communityDao.updateCommunityBoard(tempBoard);
        }
        return "redirect:/community/";
    }

}