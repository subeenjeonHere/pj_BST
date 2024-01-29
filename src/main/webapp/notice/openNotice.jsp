<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    List<Map<String, Object>> listA = (List<Map<String, Object>>) request.getAttribute("listA");
//    out.print(listA);
    int size = 0;
    if (listA != null) {
        size = listA.size(); 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>오픈공지 페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>

  <script type="text/javascript">
    /* 자바 스크립트 부분 */
    const noticeDetail=(ntc_id)=>{ 
      window.location.href="noticeDetail?ntc_id=" +ntc_id;
    }

    const noticeAdmin=()=>{  //관리자 페이지이동
      result=null;
      if(noticeAdmin!=null){
        result=location.href="/notice/noticeAdmin";
        return result;
      }else{alert("이동실페")}
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
    <h2 class="nav justify-content-center">오픈공지</h2>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
      <button class="btn btn-primary me-md-2" type="button" onclick="noticeAdmin()">관리자 페이지</button>
    </div>
    <hr />
  </div>
</div>

<div>
  <%
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  for (int i = 1; i < size; i++) {
      Map<String, Object> pmap = listA.get(i);
      String formattedDate = ((LocalDateTime) pmap.get("ntc_updated_at")).format(formatter);
  %>
  <div style="margin-bottom: 30px;">
      <ul class="nav nav-pills" style="padding-left: 50px; padding-right: 60px; background-color: #E7E4E4; left: 180px; display: flex; align-items: center;">
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal<%=pmap.get("ntc_id")%>" style="margin-right: 120px;" onclick="redirectToDetail(<%=pmap.get("ntc_id")%>)">
              <%=i%>
          </button>
          <li class="nav-item" style="margin-right:  10%;">
              <a class="nav-link" href="javascript:noticeDetail('<%=pmap.get("ntc_id")%>')">
                  <%=pmap.get("ntc_title")%>
              </a>
          </li>
          <li class="nav-item" style="margin-left: 10%;">
              <a class="nav-link" ><%=formattedDate%></a>
          </li>
      </ul>
  </div>
  <%
  }
  %>
  

<!--================================= body start ==================================-->

<!--================================= footer start ==================================-->
	<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->


</body>
</html>