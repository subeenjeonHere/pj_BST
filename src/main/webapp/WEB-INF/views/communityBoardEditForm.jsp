<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 게시글 수정</title>
    <%@include file="/common/bootstrap_common.jsp" %>

    <style>
        body {
            padding-top: 60px;
        }

        .page-header {
            background-color: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #e9ecef;
        }

        .post-write {
            margin-top: 20px;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
        }

        .form-container form {
            margin-top: 20px;
        }
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
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="page-header">
                <h2>게시글 수정</h2>
                <hr/>
            </div>
        </div>
    </div>
    <!-- 게시글 수정 폼 -->
    <div class="row post-write">
        <div class="col-md-12 form-container">
            <form action="/community/update/${boardId}" method="post">
                <input type="hidden" name="boardId" value="${boardId}">
                <div class="mb-3">
                    <label for="boardTitle" class="form-label">수정할 제목</label>
                    <input type="text" class="form-control" id="boardTitle" name="boardTitle" required>
                </div>
                <div class="mb-3">
                    <label for="boardContent" class="form-label">수정할 내용</label>
                    <textarea class="form-control" id="boardContent" name="boardContent" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">게시글 수정</button>
            </form>
        </div>
    </div>
</div>
<!--================================= body end ==================================-->

<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->
</body>
</html>