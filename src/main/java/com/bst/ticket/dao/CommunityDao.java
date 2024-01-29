package com.bst.ticket.dao;

import com.bst.ticket.dto.SearchDto;
import com.bst.ticket.vo.CommunityVO;
import org.springframework.core.annotation.MergedAnnotations;

import java.awt.datatransfer.Clipboard;
import java.util.List;
import java.util.Map;

/**
 * Author: 전수빈
 * Date: 23 Jan
 * Feature: Board Dao
 */
public interface CommunityDao {

    /*
    Author: 전수빈
    Date: 24 Jan
    Feature: Pagination
     */

    //게시글 목록 & 페이징
    List<CommunityVO> getCommunityBoardList(SearchDto searchDto);

    int count(SearchDto searchDto);

    //게시글 조회
    CommunityVO getCommunityBoardById(Integer boardId);

    //게시글 조회수
    public void boardHitUpdate(Integer boardId);

    //게시글 작성
    void saveCommunityBoard(Map<String, CommunityVO> boardMap);

    //게시글 삭제
    void deleteCommunityBoard(Integer boardId);

    //게시글 수정
    void updateCommunityBoard(CommunityVO tempBoard);


}
