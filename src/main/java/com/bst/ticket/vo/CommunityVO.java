package com.bst.ticket.vo;

import jakarta.persistence.Column;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.StringJoiner;

@Data
@NoArgsConstructor
public class CommunityVO {

    private Integer boardId;
    private String boardTitle;
    private String boardContent;
    private Date boardCreatedAt;
    private Integer boardHit;
    private Integer memberId;
    private String memberName;

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getBoardContent() {
        return boardContent;
    }

    public void setBoardContent(String boardContent) {
        this.boardContent = boardContent;
    }

    public Date getBoardCreatedAt() {
        return boardCreatedAt;
    }

    public void setBoardCreatedAt(Date boardCreatedAt) {
        this.boardCreatedAt = boardCreatedAt;
    }

    public Integer getBoardHit() {
        return boardHit;
    }

    public void setBoardHit(Integer boardHit) {
        this.boardHit = boardHit;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", CommunityVO.class.getSimpleName() + "[", "]")
                .add("boardId=" + boardId)
                .add("boardTitle='" + boardTitle + "'")
                .add("boardContent='" + boardContent + "'")
                .add("boardCreatedAt=" + boardCreatedAt)
                .add("boardHit=" + boardHit)
                .add("memberId=" + memberId)
                .add("memberName='" + memberName + "'")
                .toString();
    }
}
