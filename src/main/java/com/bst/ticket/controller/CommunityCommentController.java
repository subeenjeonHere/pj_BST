package com.bst.ticket.controller;

import com.bst.ticket.dao.CommunityCommentDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpRequest;
import java.util.Map;

@Controller
@RequestMapping("/community")
public class CommunityCommentController {
    Logger logger = LoggerFactory.getLogger(CommunityController.class);

    @Autowired
    private CommunityCommentDao communityCommentDao;

    public CommunityCommentController(CommunityCommentDao communityCommentDao) {
        this.communityCommentDao = communityCommentDao;
    }

    /**
     * Author: 전수빈
     * Date: 24 Jan
     * Feature: Community Board Comment
     */
    // 댓글 작성
    @PostMapping("/view/{boardId}/writecomment")
    public String writeComment(@PathVariable("boardId") Integer boardId,
                               @RequestParam Map<String, Integer> cMap) {

        if (cMap.get("commentContent") != null) {
            cMap.put("boardId", boardId);
            communityCommentDao.writecomment(cMap);
        }

        return "redirect:/community/view/" + boardId;
    }

    // 댓글 삭제
    @GetMapping("/view/{boardId}/{commentId}/deletecomment")
    public String deleteComment(@PathVariable("boardId") Integer boardId) {
        logger.info("Delete comment boardId={}", boardId);
        communityCommentDao.deleteComment(boardId);
        return "redirect:/community/view/" + boardId;
    }

    // 댓글 수정
    @PostMapping("/view/{boardId}/{commentId}/updatecomment")
    public String updateComment(@PathVariable("boardId") Integer boardId, @PathVariable("commentId") Integer commentId, Model model) {
        logger.info("Update comment");
        communityCommentDao.updateComment(commentId);
        return "redirect:/community/view" + boardId;
    }
}
