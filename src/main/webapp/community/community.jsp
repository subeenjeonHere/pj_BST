<%@ page import="java.util.List" %>
<%@ page import="com.bst.ticket.vo.CommunityVO" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>커뮤니티 페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>

  <style>
    .search-bar {
      margin-top: 10px;
    }

    .search-input {
      max-width: 150px;
    }
  </style>

  <script type="text/javascript">

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
        <h2 class="text-center">커뮤니티</h2>
        <hr/>
      </div>
    </div>
  </div>
  <!-- 게시글 목록 -->
  <div class="row">
    <div class="col-md-12">
      <!-- 게시글 리스트 테이블 -->
      <table class="table">
        <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">작성자</th>
          <th scope="col">조회수</th>
          <th scope="col">작성일</th>
        </tr>
        </thead>
        <tbody>

        <!-- 여러 게시글을 반복하여 표시 -->
        <!-- 게시글 리스트 출력 -->
        <div id="communityBoardList">
          <% if (communityBoardList != null) { %>
          <% for (CommunityVO board : communityBoardList) { %>
          <div class="board">
            <p><strong><%= board.getBoardId() %></strong></p>
            <p><%= board.getBoardTitle() %></p>
          </div>
          <% } %>
          <% } else { %>
          <p>No community boards available.</p>
          <% } %>
        </div>


        </tbody>
      </table>
    </div>
  </div>

  <!-- 검색 기능 및 글쓰기 버튼 -->
  <div class="row mt-3">
    <div class="col-md-6 text-right">
      <div class="search-bar">
        <div class="input-group">
          <input type="text" class="form-control search-input" placeholder="검색어를 입력하세요"
                 aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button">검색</button>
            <a href="/community/writeform" class="btn btn-secondary btn-lg active" role="button"
               aria-pressed="true">글쓰기</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 페이지네이션 -->
  <div class="row mt-3">
    <div class="col-md-12 text-center">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <c:if test="${totalPages > 1}">
            <!-- Previous Button -->
            <li class="page-item <c:if test="${currentPage eq 1}">disabled</c:if>">
              <a class="page-link"
                 href="<c:url value='/community'><c:param name='page' value='${currentPage - 1}'/></c:url>"
                 aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>

            <!-- Page Numbers -->
            <c:forEach var="pageNumber" begin="1" end="${totalPages}">
              <li class="page-item <c:if test="${pageNumber eq currentPage}">active</c:if>">
                <a class="page-link"
                   href="<c:url value='/community'><c:param name='page' value='${pageNumber}'/></c:url>">${pageNumber}</a>
              </li>
            </c:forEach>

            <!-- Next Button -->
            <li class="page-item <c:if test="${currentPage eq totalPages}">disabled</c:if>">
              <a class="page-link"
                 href="<c:url value='/community'><c:param name='page' value='${currentPage + 1}'/></c:url>"
                 aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </c:if>
        </ul>
      </nav>
    </div>
  </div>
  <!--================================= body end ==================================-->

  <!--================================= footer start ==================================-->

  <%@include file="/include/ticket_footer.jsp" %>
  <!--================================== footer end ===================================-->
</body>
</html>