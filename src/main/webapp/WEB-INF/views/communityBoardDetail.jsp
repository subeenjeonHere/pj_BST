<%@ page import="java.util.List" %>
<%@ page import="com.bst.ticket.vo.CommunityVO" %>
<%@ page import="com.bst.ticket.vo.CommunityCommentVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 게시글 페이지</title>
    <%@include file="/common/bootstrap_common.jsp" %>


    <style>
        body {
            padding-top: 60px;
        }

        .page-header {
            padding: 20px;
            border-bottom: 1px solid #e9ecef;
        }

        .details-container {
            margin-top: 20px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
        }

        .card-title {
            color: #007bff;
            align-content: center;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .table {
            width: 100%;
            margin: 0 auto;
        }

        .table th,
        .table td {
            text-align: center;
            padding: 10px;
        }

        .content-container {
            background-color: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 15px;
            margin-top: 15px;
        }

        .comment-list h5 {
            margin-bottom: 10px;
        }

        .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .content-container {
            width: 100%;
            margin: 0 auto;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 15px;
            margin-top: 15px;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-primary-custom {
            background-color: #007bff;
            color: white;
        }

        .comment-form form {
            width: 100%;
        }

        .comment-form textarea::placeholder {
            color: #999;
        }

        .comment-form textarea {
        }

        .comment-form button {
            margin-bottom: 10px;
            align-self: flex-end;
        }
    </style>

    <script>
        function deletePost(boardId) {
            fetch(`/community/delete/${boardId}`, {
                method: 'GET',
            })
                .then(response => {
                    if (response.ok) {
                        // Reload the page or handle success as needed
                        location.reload();
                    } else {
                        console.error('Failed to delete post');
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        function updatePost(boardId) {
            // Redirect to the update form page
            window.location.href = `/community/updateForm/${boardId}`;
        }
    </script>

</head>
<body>
<!--================================= header start ==================================-->
<%@include file="/include/ticket_header.jsp" %>
<!--================================= header end ==================================-->

<!--================================= body start ==================================-->
<!-- 게시글 상세 정보 -->
<%
    CommunityVO communityBoard = (CommunityVO) request.getAttribute("communityBoard");
    List<CommunityCommentVO> commentList = (List<CommunityCommentVO>) request.getAttribute("commentList");
%>

<div class="container mt-5 details-container">
    <div class="card">
        <div class="card-body">
            <div class="title-container bg-light-gray p-3 mb-4">
                <h2 class="card-title mb-0"><%= communityBoard.getBoardTitle() %>
                </h2>
            </div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <th scope="row">작성자</th>
                    <td><%= communityBoard.getMemberName() %>
                    </td>
                </tr>
                <tr>
                    <th scope="row">조회수</th>
                    <td><%= communityBoard.getBoardHit() %>
                    </td>
                </tr>
                <tr>
                    <th scope="row">작성일</th>
                    <td><%= communityBoard.getBoardCreatedAt() %>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="content-container mt-4">
                <p><%= communityBoard.getBoardContent() %>
                </p>
            </div>
            <div class="mt-4">
                <!-- 게시글 삭제 및 수정 버튼 -->
                <button onclick="deletePost(<%= communityBoard.getBoardId() %>)" class="btn btn-danger mr-2">게시글 삭제
                </button>
                <button onclick="updatePost(<%= communityBoard.getBoardId() %>)" class="btn btn-primary-custom">게시글 수정
                </button>
            </div>
        </div>
    </div>

    <!-- 댓글 리스트 -->
    <div class="mt-5">
        <h5 class="card-title mb-4">댓글 목록</h5>
        <ul class="list-group list-group-flush">
            <% for (CommunityCommentVO comment : commentList) { %>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <div>
                    <p><%= comment.getCommentContent() %>
                    </p>
                    <small class="text-muted">작성일: <%= comment.getCommentCreatedAt() %>
                    </small>
                </div>
                <button onclick="deleteComment(<%= comment.getCommentId() %>)" class="btn btn-light">댓글 삭제</button>
            </li>
            <% } %>
        </ul>board
    </div>

    <!-- 댓글 작성 폼 -->
    <div class="comment-form mt-4">
        <form action="<%= request.getContextPath() %>/community/view/<%= communityBoard.getBoardId() %>/writecomment"
              method="post">
            <div class="form-row">
                <div class="form-group col-md-8">
                    <textarea class="form-control" name="commentContent" rows="4" placeholder="댓글을 입력하세요"></textarea>
                </div>
                <div class="form-group col-md-4">
                    <button type="submit" class="btn btn-primary btn-block">댓글 작성</button>
                </div>
            </div>
        </form>
    </div>

</div>

<!--================================= body end ==================================-->
<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->
</body>
</html>