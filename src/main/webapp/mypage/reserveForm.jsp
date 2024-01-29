<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%
  List<Map<String, Object>> reserveList = (List) request.getAttribute("reserveList");
//  out.print(reserveList);
  StringBuffer strReservation = new StringBuffer();
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
  LocalDateTime gameDate = null;

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예약내역</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <link rel="stylesheet" href="/css/mypageForm.css">

  <script type="text/javascript">
      /* 자바 스크립트 부분 */
      const reservationDelete = (rsv_id) =>{
        location.href = "/reservation/reservationDelete?rsv_id="+rsv_id;
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
    <h2 class="nav justify-content-center">예약내역</h2>
    <hr/>
  </div>
</div>
<div class="reservationBody">
  <div class="memberInfo">
    <table class="table table-striped">
      <tbody>
      <%--for 문 start--%>
      <%
        if ((reserveList.get(0).get("rsv_id"))!=null){
          for (int i = 0; i < reserveList.size(); i++) {
            Map<String, Object> rsmap = reserveList.get(i);

            gameDate = (LocalDateTime)rsmap.get("gm_date");
            String formattedDate = gameDate.format(formatter);

            strReservation.append(" ")
                    .append(formattedDate)
                    .append(" ")
                    .append(rsmap.get("std_name"));
      %>
      <tr>
        <td><%=rsmap.get("rsv_number")%></td>
        <td><%=strReservation%></td>
        <td>
          <button class="button" type="button" style="text-align: center;width: 100px; height: 40px" onclick="reservationDelete(<%=rsmap.get("rsv_id")%>)">삭제</button>
        </td>
      </tr>
      <%--for 문 end--%>
      <%
          //strReservation 초기화 작업
          strReservation.delete(0,strReservation.length());
          }
        }else{
      %>
      <tr>
        <td>예약내역 없음</td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>
</div>


<!--================================= body start ==================================-->

<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->
</body>
</html>