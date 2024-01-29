package com.bst.ticket.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchDto {
    /**
     * Author: 전수빈
     * Date: 24 Jan
     * Feature: Board pagination
     * 페이지 번호, 레코드 크기, 페이지 크기, 검색어, 검색 타입 등의 정보 포함
     */
    private int page;
    private int recordSize;
    private int pageSize;
    private String keyword;
    private String searchType;

    public SearchDto() {
        this.page = 1;
        this.recordSize = 10;
        this.pageSize = 10;
    }

    public SearchDto(int page, int recordSize, int pageSize) {
        this.page = page;
        this.recordSize = recordSize;
        this.pageSize = pageSize;
    }

    public int getOffset() {
        return (page - 1) * recordSize;
    }
}
