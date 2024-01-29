<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
Map<String, Object> rMap = (Map<String, Object>) request.getAttribute("rMap");
  
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>오픈공지 페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>

  <script type="text/javascript">
    const openNoticeList=()=>{  //목록 버튼 스크립트 기능function
      location.href="/notice/noticeList";
    }



    // next page scrpript 개발 [ 추가 수정부분]
    const nextPage=()=>{
    let ntc_id= <%=(int)rMap.get("ntc_id")%>;
    let   nextPK=null;
    const lastPK=null;
      while(nextPK===null||nextPK<=ntc_id||nextPK<=lastPK){
        nextPK++;
        window.location.href="noticeDetail?ntc_id="+nextPK;
      } 
    }




    </script>
</head>
<body>
<!--================================= header start ==================================-->
	<%@include file="/include/ticket_header.jsp" %>
<!--================================= header start ==================================-->
<!--  -->
<!--================================= body start ==================================-->
<div class="container mt-5">
  <div class="page-header">
    <h2 class="nav justify-content-center">오픈공지</h2>
    <hr />
  </div>
</div>


<%
  if (rMap != null && !rMap.isEmpty()) {
    int ntc_id= (int)rMap.get("ntc_id");
    String ntc_title = (String) rMap.get("ntc_title");
    String ntc_content = (String) rMap.get("ntc_content");
    LocalDateTime ntc_updated_at = (LocalDateTime) rMap.get("ntc_updated_at");
//LocalDateTime  format 한후에  String 처리 출력
    if (ntc_updated_at != null) {
        DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = ntc_updated_at.format(fm);
%>
<div class="container">
  <div class="jumbotron">
    <h1 class="display-8 text-center"><%= ntc_title %></h1>
    <p class="lead margin-right"><%= formattedDate %></p>
    <hr class="my-4">
    <p><%= ntc_content %></p>
    <p class="lead">
      <a class="btn btn-primary btn-lg " onclick="openNoticeList()"    role="button" >목록으로 </a>
      <a class="btn btn-primary btn-lg "onclick="nextPage()" role="button" >다음페이지 </a>

    </p>
  </div>
</div>
<%
}
  }else {
      out.println("Map is null");
  }
%>





<!--================================= body start ==================================-->

<!--================================= footer start ==================================-->
	<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->


</body>
</html>