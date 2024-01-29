package com.bst.ticket.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.StringJoiner;

@Data
@NoArgsConstructor
public class CommunityCommentVO {

    private Integer commentId;
    private Integer memberId;
    private String commentContent;
    private Date commentCreatedAt;
    private Integer boardId;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentCreatedAt() {
        return commentCreatedAt;
    }

    public void setCommentCreatedAt(Date commentCreatedAt) {
        this.commentCreatedAt = commentCreatedAt;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", CommunityCommentVO.class.getSimpleName() + "[", "]")
                .add("commentId=" + commentId)
                .add("memberId=" + memberId)
                .add("commentContent='" + commentContent + "'")
                .add("commentCreatedAt=" + commentCreatedAt)
                .add("boardId=" + boardId)
                .toString();
    }
}
