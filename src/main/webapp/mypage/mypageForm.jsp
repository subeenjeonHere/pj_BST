<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map, java.time.format.DateTimeFormatter, java.time.LocalDate, java.time.LocalDateTime" %>
<%
  List<Map<String, Object>> reserveList = (List) request.getAttribute("reserveList");
  //생일과 현재 날짜를 비교하여 65세 기준으로 일반회원과 실버회원으로 나누기
  LocalDate currentDate = LocalDate.now();
  Map<String, Object> rsmap = reserveList.get(0);
//  out.print(reserveList);
  String strBirthDate = rsmap.get("mbr_birthdate").toString();
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
  LocalDate birthDate = LocalDate.parse(strBirthDate, formatter);

  //문자열을 나열하기 위해 선언
  StringBuffer strReservation = new StringBuffer();
  LocalDateTime gameDate = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <link rel="stylesheet" href="/css/mypageForm.css">
  <script type="text/javascript">
      /* 자바 스크립트 부분 */
      const profile = () => {
          (async () => {
              const result = await Swal.fire({
                  title: '비밀번호를 입력하세요',
                  input: 'password',

                  inputPlaceholder: '비밀번호 입력',
                  showCancelButton: true,
                  confirmButtonText: '확인',
                  cancelButtonText: '취소',
              });

              if (result.isConfirmed) {
                  console.log(result.value);
                  $.ajax({
                      type: 'POST',
                      url: '/member/checkPwd',
                      data: { inputPassword: result.value, mbr_seq: <%=rsmap.get("mbr_seq")%>},
                      success: function(response) {
                          // 서버로부터의 응답 처리
                          location.href=location.href = "/member/memberProfile?mbr_seq="+<%=rsmap.get("mbr_seq")%>;
                      },
                      error: function(error) {
                          // 오류 처리
                          const result = Swal.fire({
                              icon: 'error',
                              title: '비밀번호가 틀립니다.',
                              text: '비밀번호를 다시 입력해 주세요',
                          });
                      }
                  });
              }
          })();
      }

      const reserveForm = () => {
          console.log("reserve 클릭");
          location.href = "/reservation/reserveForm?mbr_seq=" + <%=rsmap.get("mbr_seq")%>;
      }

      const QnA = () => {
          location.href = "/QnA/QnA.jsp";
      }

      const logout = () =>{
          location.href = "/logout";
      }

  </script>

</head>
<body>
<!--================================= header start ==================================-->
<%@include file="/include/ticket_header.jsp" %>
<!--================================= header start ==================================-->
<!--================================= body start ==================================-->
<div class="container mt-5">
  <div class="page-header">
    <h2 class="nav justify-content-center">마이페이지</h2>
    <hr/>
  </div>
  <div class="page-body">
    <div class="mypageBody">
      <div class="rounded-circle">
        <img src="/images/logo/<%=rsmap.get("team_logo")%>.png" style="width: 150px; height: 150px;">
      </div>
      <div class="userInfo">
        <div class="userText"><%=rsmap.get("mbr_nm")%></div>
        <% //일반회원 실버회원 나이로 확인 하는 코드
          String isSilver = null;
          if (65 >= (currentDate.getYear() - birthDate.getYear())) {
            isSilver = "일반회원";
          } else {
            isSilver = "실버회원";
          }
        %>
        <div style="color: #f5f5f7; background-color: #504f4f; width: 65px;"><%=isSilver%></div>
        <div class="userText"><%=rsmap.get("mbr_email")%></div>
      </div>
      <div>
        <button class="button" onclick="profile()">
          프로필
        </button>
      </div>
    </div>
    <br/>
    <div class="category">
      <div>
        <a href="/notice/noticeList" class="img_text">
          <img class="img_category" src="/images/icon/openNotice.png">
          <p class="category_name">공지사항</p>
        </a>
      </div>
      <div>
        <a href="/community/" class="img_text">
          <img class="img_category" src="/images/icon/Community.png">
          <p class="category_name">커뮤니티</p>
        </a>
      </div>
      <div>
        <a href="/ticket/ticketList" class="img_text">
          <img class="img_category" src="/images/icon/ticketting.png">
          <p class="category_name">티켓팅</p>
        </a>
      </div>
      <div>
        <a href="/reservation/reserveForm" class="img_text">
          <img class="img_category" src="/images/icon/reservation.png">
          <p class="category_name">예약내역</p>
        </a>
      </div>
      <div>
        <a href="/QnA/QnA.jsp" class="img_text">
          <img class="img_category" src="/images/icon/QnA.png">
          <p class="category_name">고객센터</p>
        </a>
      </div>
    </div>
    <br/>
    <div class="reservation">
      <h2>예약 현황</h2>
      <button class="button reservationContent" onclick="reserveForm()">
        <%
          if (rsmap.get("rsv_id") != null){
              gameDate = (LocalDateTime)rsmap.get("gm_date");
              String formattedDate = gameDate.format(formatter2);
              strReservation.append(formattedDate)
                      .append(" ")
                      .append(rsmap.get("std_name"));
        %>
        <h4><%= strReservation %>
        </h4>
        <%
            if (rsmap.get("myteam").equals("없음")) {
        %>
        <h4><%= rsmap.get("team_away") + " vs " + rsmap.get("team_home") %> &gt</h4>
        <%
            } else {
        %>
        <h4><%= rsmap.get("myteam") %> &gt</h4>
        <%
             }
          }else{
        %>
        <h4>예약내역 없음</h4>
        <%
          }
        %>
      </button>
    </div>
  </div>
</div>

<div class='btn footer mx-3'>

  <button class="button" style="background-color: #334CA5;" onclick="QnA()">
    고객센터
  </button>
  <button class="button" style="background-color: #334CA5;" onclick="logout()">
    로그아웃
  </button>
</div>

<!--================================= body start ==================================-->
<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->

</body>
</html>