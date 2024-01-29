<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id = (String) request.getAttribute("findId");
    if (id != null) {
        out.println("<script>alert('고객님의 id값은  " + id + "  입니다');</script>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 로그인 </title>
    <link rel="stylesheet" href="/css/login.css">
    <%@include file="/common/bootstrap_common.jsp" %>

    <script type="text/javascript">

        const login = (event) => {
            // alert("로그인 호출");
            document.getElementById("f_login").submit();  // form 에 있는 action="loginProcess"실행
        };
        const loginG = () => {
            console.log("구글로그인 호출");
            location.href="/oauth2/authorization/google";
        };
        const loginK = () => {
            console.log("카카오 호출");
            location.href="/oauth2/authorization/kakao";
        };
        const loginN = () => {
            console.log("네이버 호출");
            location.href="/oauth2/authorization/naver";
        };
        const findId = () => {
            console.log("findId");
            document.querySelector("#f_findId").submit();
        };
        const findPW = () => {
            console.log("findPW");
            // controller로 입력받은 값 넘기기
        };
        const regist = () =>{
            location.href='/auth/termPage';
        }
    </script>

</head>
<body>
<!-- header start -->
<%@include file="/include/ticket_header.jsp" %>
<!-- header end -->

<div class="container-fluid1 d-flex justify-content-center align-items-center">
    <div class="box1 d-flex justify-content-center align-items-center">
        <div class="login-form-container">
            <div class="fs-4 fw-bold text-white">베스트 시니어 티켓</div>
            <div class="fs-6 text-white">로그인 하세요~~</div>



            <div class="input-group flex-column gap-1">
                <form id="f_login" action="/loginProcess" method="post">

                    <label for="mbr_id" class="fs-7 fw-bold text-white">아이디</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="mbr_id"  name="mbr_id" placeholder="아이디 입력">
                    </div>

                    <label for="mbr_pwd" class="fs-7 fw-bold text-white">비밀번호</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="mbr_pwd"  name="mbr_pwd" placeholder="비밀번호 입력">
                    </div>
                </form>
            </div>


            <div class="d-flex gap-3">
                <button class="btn btn-light border fw-bold" style="width: 180px;" onclick="login()">로그인</button>
                <button class="btn btn-dark fw-bold" style="width: 180px;" onclick="regist()">회원가입</button>
            </div>

            <div class="d-flex gap-3">
                <%--                <button type="button" class="btn btn-secondary btn-sm"  data-bs-toggle="modal" data-bs-target="#findID">--%>
                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/find'">
                    아이디 찾기
                </button>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#findPW">
                    비밀번호 찾기
                </button>
            </div>
        </div>

        <div class="social-login-container">
            <div class="mb-3 fs-5 fw-bold text-white">간편로그인</div>
            <div class="d-flex gap-5">
                <img src="/images/ko/iconKakao.png" onclick="loginK()">
                <img src="/images/ko/iconNaver.png" onclick="loginN()">
                <img src="/images/ko/iconGoogle.png" onclick="loginG()">
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

<!-- ========================== [[ find PW Modal Start ]] ========================== -->
<div class="modal " id="findPW">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">비밀번호 찾기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <%--                <form id="findID" method="get" action="/컨트롤러메소드?">--%>
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="floatingPW_id" placeholder="ID">
                        <label for="floatingPW_id">아이디 입력</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3 " id="floatingPW_email" placeholder="name@example.com">
                        <label for="floatingPW_email">이메일주소 입력</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit"  style="background-color: #334CA5;" onclick="findPW()">찾기</button>
                    <small class="text-body-secondary">입력하신 이메일로 임시비밀번호를 보내드립니다.</small>

                </form>
            </div>
        </div>
    </div>
</div>
<!-- ========================== [[ find PW Modal End ]] ========================== -->
</body>
</html>