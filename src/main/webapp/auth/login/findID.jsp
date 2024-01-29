<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id = (String) request.getAttribute("findId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>web - 아이디찾기 </title>
    <link rel="stylesheet" href="/css/find.css">
    <%@include file="/common/bootstrap_common.jsp" %>

    <script type="text/javascript">

        const findId = () => {
            console.log("findId");
            document.querySelector("#f_findId").submit();
        };

    </script>

</head>
<body>
<!-- header start -->
<%@include file="/include/ticket_header.jsp" %>
<!-- header end -->

<div class="container-fluid1 d-flex justify-content-center align-items-center">
    <div class="w-400 box1 d-flex justify-content-center align-items-center">
        <div class="find-form-container gap-2 ">
            <h1 class="fs-3 fw-bold text-white ">아이디 찾기</h1>
            <label class="mt-3 fs-7 text-white">아이디를 잊으셨나요?  아래 이름과 이메일 주소를 입력하세요.</label>

            <div class="input-group flex-column gap-2">
                <form id="f_findId" action="/findId" method="post">
                    <label for="mbr_nm" class="mt-3 fs-7 fw-bold text-white">이름</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="mbr_nm"  name="mbr_nm" placeholder="이름 입력">
                    </div>
                    <label for="mbr_email" class="fs-7 mt-3 fw-bold text-white">이메일</label>
                    <div class="input-group">
                        <input type="email" class="form-control" id="mbr_email"  name="mbr_email" placeholder="이메일 입력">
                    </div>
                    <button class="w-100 mt-4 mb-2 btn btn-lg rounded-3 btn btn-dark fw-bold" style="width: 180px;" onclick="findId()">찾기</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->

</body>
</html>