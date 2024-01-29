<%--
  Created by IntelliJ IDEA.
  User: jeonsubeen
  Date: 1/22/24
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 게시글 페이지</title>
    <%@include file="/common/bootstrap_common.jsp" %>

    <style>

    </style>

    <script type="text/javascript">
        /* 자바 스크립트 부분 */

    </script>
</head>
<body>
<!--================================= header start ==================================-->
<%@include file="/include/ticket_header.jsp" %>
<!--================================= header end ==================================-->

<!--================================= body start ==================================-->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="page-header">
                <h2 class="text-center">게시글 상세보기</h2>
                <hr/>
            </div>
        </div>
    </div>

    <!-- 게시글 상세 정보 -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>${communityBoard.boardTitle}</h3>
                <p>작성자: ${communityBoard.memberName}</p>
                <p>조회수: ${communityBoard.boardHit}</p>
                <p>${communityBoard.boardContent}</p>
            </div>
        </div>
    </div>

    <!-- 댓글 리스트 -->
    <div class="row mt-3">
        <div class="col-md-12">
            <h3>[댓글 리스트]</h3>
            <%--            <ul>--%>
            <%--                <c:forEach var="comment" items="${commentList}">--%>
            <%--                    <li>${comment.commentContent} - 작성자: ${comment.memberName}</li>--%>
            <%--                </c:forEach>--%>
            <%--            </ul>--%>
        </div>
    </div>
</div>


<!--================================= body end ==================================-->

<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->
</body>
</html>
