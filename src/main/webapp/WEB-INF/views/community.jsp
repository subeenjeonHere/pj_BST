<%@ page import="java.util.List" %>
<%@ page import="com.bst.ticket.vo.CommunityVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 페이지</title>
    <%@include file="/common/bootstrap_common.jsp" %>

    <script type="text/javascript">
    </script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            text-align: center;
        }

        h2 {
            color: #007bff;
            font-size: 28px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .table-container {
            width: 60%;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .board-link {
            color: #007bff;
            text-decoration: none;
            cursor: pointer;
        }

        .board-link:hover {
            text-decoration: underline;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            color: #007bff;
            text-decoration: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        .pagination .active {
            background-color: #007bff;
            color: white;
        }

        .write-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }
    </style>

</head>
<body>
<!--================================= header start ==================================-->
<%@include file="/include/ticket_header.jsp" %>
<!--================================= header end ==================================-->
<!--================================= body start ==================================-->

<%
    List<CommunityVO> communityBoardList = (List<CommunityVO>) request.getAttribute("communityBoardList");
    int totalPages = (int) request.getAttribute("totalPages");
    int currentPage = (int) request.getAttribute("currentPage");
%>
<div class="table-container">
    <table class="table table-striped">
        <thead>
        <tr>
            <h4>커뮤니티 게시판</h4>
        </tr>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (CommunityVO board : communityBoardList) {
        %>
        <tr>
            <td><%= board.getBoardId() %>
            </td>
            <td>
                <a href="<%= request.getContextPath() %>/community/view/<%= board.getBoardId() %>"
                   class="board-link"><%= board.getBoardTitle() %>
                </a>
            </td>
            <td><%= board.getMemberName() %>
            </td>
            <td><%= board.getBoardHit() %>
            </td>
            <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(board.getBoardCreatedAt()) %>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<!-- 게시글 작성 버튼 -->
<div>
    <a href="<%= request.getContextPath() %>/community/writeform" class="btn btn-primary">게시글 작성</a>
</div>


<!--페이지네이션-->
<div class="pagination">
    <% if (currentPage > 1) { %>
    <a href="<%= request.getContextPath() %>/community?page=<%= currentPage - 1 %>">이전</a>
    <% } %>

    <% for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) { %>
    <a href="<%= request.getContextPath() %>/community?page=<%= pageNumber %>"
            <%= (pageNumber == currentPage) ? "class='active'" : "" %>><%= pageNumber %></a>
    <% } %>

    <% if (currentPage < totalPages) { %>
    <a href="<%= request.getContextPath() %>/community?page=<%= currentPage + 1 %>">다음</a>
    <% } %>
</div>

<!--================================= body end ==================================-->

<!--================================= footer start ==================================-->

<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->
</body>
</html>