<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
List<Map<String, Object>> listB = (List<Map<String, Object>>) request.getAttribute("listB");
  int size = 0; 
  if (listB != null) {
      size = listB.size(); 
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>오픈공지 페이지{WEB_INF}</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
    //  ajax 사용 delete  {delete 구현 기능 미완성}
    const deleteList = (ntc_id) => {
    let url = "/notice/noticeAdmin/" + ntc_id;
    $.ajax({
        url: url,
        type: "DELETE",
        success: function(response) {
            console.log("delete성공");
            // window.location.href = openNotice;
        },
        error: function(error) {
            console.error("delete 실패");
        }
    });
}



  //  ajax 사용 insert {}
  const insertList = () => {
  const url = "/notice/noticeAdminInsert";

  let ntc_title = $("#inputTitle").val();
  let ntc_content = $("#inputContent").val();

  if (!ntc_title || !ntc_content) {
    console.error("내용작성해주세요");
    return;
  }

  let dataObject = {
    ntc_title: ntc_title,
    ntc_content: ntc_content
  };

  $.ajax({
    url: url,
    type: "GET",
    data: dataObject,
    success: function (data) {
      console.log("success");
      location.reload();
    },
    error: function (error) {
      console.error("error message");
    }
  });
}


  //MODAL OPEN
  function openInsert() {
    $('#noticeInsert').show();
  }

  //MODAL CLOSE
  function closeInsert() {
    $('#noticeInsert').hide();
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
    <h2 class="nav justify-content-center">오픈공지WEB-INF</h2>
    <hr />
  </div>
</div>

<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-7">
    <div class="table-responsive" align="center">
      <br/>  <br/>  <br/>
      <h3 align="center">관리자모드 ListCheck </h3>
      <%
      for (int i = 1; i < size; i++) {
        Map<String, Object> pmap = listB.get(i);
      %>
	<table class="table" align="center">
		<tr>
      <td><%=i%></td>
			<td><%=pmap.get("ntc_title")%></td>
			<td><%=pmap.get("ntc_updated_at")%></td>
		<td> <a href="javascript:deleteList('<%=pmap.get("ntc_id")%>')">삭제</a><td>
		</tr>
	</table>
  <%
  }
  %>
</div>
	

	<input type="button" class="btn btn-primary btn-lg btn-block" value="글추가" onclick="openInsert()">
  </div>

<!--================================= body start ==================================-->

<!--================================= footer start ==================================-->
	<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->




<!-- ========================== [[ 공지사항 입력 Modal ]] ========================== -->
<div class="modal" id="noticeInsert">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">공지사항작성</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="myForm">
          <input type="text" name="title"id="inputTitle" class="myForm-control" placeholder="타이틀">
      <hr>
          <input type="text" name="content"id="inputContent"   class="myForm-control"   clplaceholder="내용">
        </form>
      </div>


      <!-- Modal footer -->
      <div class="modal-footer">
        <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="insertList()"  value="저장">
        <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기" onclick="closeInsert()">
      </div>



    </div>
  </div>
</div>


</body>
</html>

