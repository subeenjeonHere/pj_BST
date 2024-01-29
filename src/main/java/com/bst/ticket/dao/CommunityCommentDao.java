package com.bst.ticket.dao;

import com.bst.ticket.vo.CommunityCommentVO;

import java.util.List;
import java.util.Map;

public interface CommunityCommentDao {
    List<CommunityCommentVO> getCommunityCommentList(Integer boardId);

    void writecomment(Map<String, Integer> cMap);

    void deleteComment(Integer boardId);

    void updateComment(Integer commentId);

}
