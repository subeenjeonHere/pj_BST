<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter, java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.*" %>
<%
	List<Map<String,Object>> ticketList = (List)request.getAttribute("ticketList");
  LocalDateTime  gameDate =null;
//  out.print(ticketList);
  Map<String,Object> tmap ;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>티켓팅 페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <link rel="stylesheet" href="/css/ticket.css">
  <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <%@include file="/include/ticket_header.jsp" %>
  <script type="text/javascript">
      function getCurrentDateTime(gm_date) {
          return moment(gm_date).format('YYYY-MM-DD HH:mm:ss');
      }
      /* 자바 스크립트 부분 */
      //콤보박스의 option 값을 가지고 옴
      function handleDateSelectChange(){
          let selectedOption = document.getElementById('dateSelect').options[document.getElementById('dateSelect').selectedIndex];
          let selectedValue = selectedOption.innerText;
          // Do something with the selected value
          console.log(selectedValue);

          $.ajax({
              url: "/ticket/ticketDateList",
              type: 'GET',
              data: {gm_date:selectedValue+"%"},
              dataType: 'json',
              success: function(response){
                  console.log(response)

                  // HTML 문자열로 변환
                  let htmlString = "";
                  response.forEach(function (item) {
                      let formattedDate = getCurrentDateTime(item.gm_date);
                      let remainingSeats = (item.gm_total - item.gm_reserve)
                      htmlString += `
                    <div class="card mb-3" onclick="selectTicket(\${item.gm_id})">
                      <div class="row g-0" >
                        <div class="col-md-4" style="margin: auto">
                          <h2>\${item.team_away}</h2>
                          <h2>vs</h2>
                          <h2>\${item.team_home}</h2>
                        </div>
                        <div class="col-md-8">
                          <div class="card-body">
                            <h5 class="card-title">\${item.team_away} vs \${item.team_home}</h5>
                            <p class="card-text">\${item.std_name}</p>
                            <p class="card-text">\${formattedDate}</p>
                            <p class="card-text" style="text-align: right;">잔여좌석 :<small class="text-muted">\${remainingSeats}</small></p>
                          </div>
                        </div>
                      </div>
                    </div>
                    `; // item에 있는 속성에 따라 변경
                  });


                  // ticketDateList의 내용을 HTML 문자열로 변경
                  let ticketDateList = document.querySelector("#ticketDateList");
                  ticketDateList.innerHTML = htmlString;

                  let divHidden = document.querySelector("#divHidden");
                  // 스타일 변경 예시
                  divHidden.style.display = "none";

              },
              error: function(error) {
                  // 오류 처리
                  alert("에러입니다");
              }
          })
      }
      const selectTicket = (gm_id) =>{
          console.log("ticket클릭" + gm_id);
          document.querySelector("#mbr_id").value = '<%=username%>'; //세션적용시켜 나타낼 예정
          document.querySelector("#gm_id").value = gm_id;

          $.ajax({
              url: "/ticket/ticketDateList",
              type: 'GET',
              data: {gm_id:gm_id},
              dataType: 'json',
              success: function(response){
                  console.log(response)
                  let formattedDate = getCurrentDateTime(response[0].gm_date);
                  let remainingSeats = (response[0].gm_total - response[0].gm_reserve)

                  document.querySelector("#gm_team").value =  response[0].team_away + 'vs' + response[0].team_home;
                  document.querySelector("#std_name").value = response[0].std_name;
                  document.querySelector("#gm_date").value = formattedDate;
                  document.querySelector("#remainingSeats").innerHTML = remainingSeats;


              },
              error: function(error) {
                  // 오류 처리
                  alert("에러입니다");
              }
          })
      }
      const publicReservation = () =>{
          location.href="https://ticket.interpark.com/Contents/Sports/Bridge/baseball";
      }

      const silberReservation = () =>{
          let mbr_id = document.querySelector("#mbr_id").value;
          let gm_id = document.querySelector("#gm_id").value;
          if (mbr_id!=null || mbr_id!==""||gm_id!=null){
              document.querySelector("#f_reservation").submit();
          }else{
              alert("다시시도 하여 주세요.");
          }
      }

  </script>
</head>
<body>
<!--================================= header start ==================================-->

<!--================================= header start ==================================-->

<!--================================= body start ==================================-->
<div class="container mt-5">
  <div class="page-header">
    <h2 class="nav justify-content-center">티켓팅</h2>
    <hr />
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col">
      <div>
<%---------------------------------   select option     -------------------------------------------%>
        <select id="dateSelect" onchange="handleDateSelectChange()" class="form-select" aria-label="Default select example" style="width: 250px; margin-left: 30px" >
          <option selected>경기날짜를 선택하세요</option>
          <%
            //set/Hashset 고유값데이터를 출력 한다
            Set<LocalDateTime> uniqueDates = new HashSet<>();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            for (int i = 0; i < ticketList.size(); i++) {
              tmap = ticketList.get(i);
              gameDate = (LocalDateTime)tmap.get("gm_date");
              if (gameDate != null && uniqueDates.add(gameDate)) {
                String formattedDate = gameDate.format(formatter);
          %>
          <option value="<%=i%>"><%=formattedDate%></option>
          <%
              }
            }
          %>
        </select>
  <%---------------------------------   select option     -------------------------------------------%>
      </div>

      <%--   경기날짜 선택 했을 때 동적으로 생성되는 화면단   --%>
      <div class="ticketDateList" id="ticketDateList">

      </div>
      <%---------------------------------   티켓 전체 조회하는 화면     -------------------------------------------%>
      <div class="hidden" id="divHidden" >
        <%
          DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
          int remainingSeats = 0;

          // 날짜에 따라 티켓 리스트 정렬
          Collections.sort(ticketList, Comparator.comparing(t -> (LocalDateTime) t.get("gm_date")));

          for (int i = 0; i < ticketList.size(); i++) {
            tmap = ticketList.get(i);
            gameDate = (LocalDateTime)tmap.get("gm_date");
            String formattedDate = gameDate.format(formatter2);
            remainingSeats = (Integer) tmap.get("gm_total") - (Integer)tmap.get("gm_reserve");
        %>
        <div class="card mb-3" onclick="selectTicket(<%=tmap.get("gm_id")%>)">
          <div class="row g-0" >
            <div class="col-md-4" style="margin: auto">
              <h2><%=tmap.get("team_away")%></h2>
              <h2>vs</h2>
              <h2><%=tmap .get("team_home")%></h2>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title"><%=tmap.get("team_away")%> vs <%=tmap.get("team_home")%></h5>
                <p class="card-text"><%=tmap.get("std_name")%></p>
                <p class="card-text"><%=formattedDate%></p>
                <p class="card-text" style="text-align: right;">잔여좌석 :<small class="text-muted"> <%=remainingSeats%></small></p>
              </div>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>
      <%---------------------------------   티켓 전체 조회하는 화면 end     -------------------------------------------%>
    </div>
    <%---------------------------------   티켓 예약하는 화면    -------------------------------------------%>
    <div class="col" >
      <div class="card mb-3" style="max-width: 600px; height: 500px; margin-left: 16%; margin-top: 10.5%; border-radius: 30px">
        <div class="container" style="margin: auto">
          <form id="f_reservation" method="get" action="/reservation/ticketReservation">
            <input type="hidden" id="mbr_id" name="mbr_id" value="">
            <input type="hidden" id="gm_id" name="gm_id" value="">
            <div class="input-group mt-3 mb-5">
              <span class="input-group-text" >경기팀</span>
              <input type="text" id="gm_team" class="form-control" disabled>
            </div>
            <div class="input-group mb-5">
              <span class="input-group-text" >경기장</span>
              <input type="text" id="std_name" class="form-control" disabled>
            </div>
            <div class="input-group mb-5">
              <span class="input-group-text" >경기시간</span>
              <input type="text" id="gm_date" class="form-control" disabled>
            </div>
            <p class="card-text" style="text-align: right;" >잔여좌석 : <small class="text-muted" id="remainingSeats"><%=remainingSeats%></small></p>
          </form>
            <div class="container" style="text-align: center;">
            <button class="button" type="button" onclick="publicReservation()">일반예약</button>
            <button class="button" type="button" onclick="silberReservation()">실버예약</button>
          </div>
        </div>
      </div>
    </div>
    <%---------------------------------   티켓 예약하는 화면 end    -------------------------------------------%>
  </div>
</div>
<!--================================= body start ==================================-->

<!--================================= footer start ==================================-->
	<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->


</body>
</html>