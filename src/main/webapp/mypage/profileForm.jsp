<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
  List<Map<String, Object>> memberList = (List)request.getAttribute("memberList");
//  out.print(memberList);
  Map<String, Object> mmap = memberList.get(0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>프로필</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <link rel="stylesheet" href="/css/mypageForm.css">

  <script type="text/javascript">
      const pwCheck = () =>{
          if($('#mbr_pwd').val() != ""){

            if($('#mbr_pwd').val() == $('#check_pwd').val()){
                $('#pwConfirm').text('비밀번호  일치').css('color', 'green')
            }else{
                $('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
            }
          }else{
            $('#pwConfirm').text('비밀번호를 입력하세요').css('color', 'black')
          }
      } //

      const memberInfoUpdate = () =>{
        console.log("저장 클릭");
        document.querySelector("#memberInfoUpdate").submit();
      }

      const memberDelete = () =>{
          alert("memberDelete");
          location.href = "/member/memberDelete?mbr_seq="+<%=mmap.get("mbr_seq")%>;
      }

      const btn_Cancel = () =>{
          location.href = "/reservation/mypageForm?mbr_seq="+<%=mmap.get("mbr_seq")%>;
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
    <h2 class="nav justify-content-center"><%=mmap.get("mbr_nm")%> 프로필</h2>
  </div>
</div>
<div class="profileBody">
  <div class="pofileCircle">
    <%
        if(mmap.get("team_name").equals("없음")){
    %>
    <img src="/images/logo/<%=mmap.get("team_logo")%>.png" style="width: 250px; height: 250px; border-radius: 100%;">
    <%
        }else{
    %>
      <img src="/images/logo/<%=mmap.get("team_logo")%>.png" style="width: 250px; height: 250px; border-radius: 100%;">
    <%
        }
    %>
  </div>
  <form class="memberInfo" id="memberInfoUpdate" action="./memberUpdate" method="post">
    <input type="hidden" name="mbr_seq" value="<%=mmap.get("mbr_seq")%>">
    <table class="table table-striped">
      <thead>
      <tr>
        <th><h3>회원정보</h3></th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>이메일</td>
        <td>
            <input type="text" id="mbr_email" name="mbr_email" value="<%=mmap.get("mbr_email")%>" placeholder="이메일">
        </td>
        <td></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td>
          <input type="password" id="mbr_pwd" name="mbr_pwd"  oninput="pwCheck()" placeholder="비밀번호">
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>비밀번호 확인</td>
        <td>
          <input type="password" id="check_pwd" oninput="pwCheck()" placeholder="비밀번호 확인">
        </td>
        <td>
          <span id="pwConfirm">비밀번호를 입력하세요</span>
        </td>
      </tr>
      <tr>
        <td>이 름</td>
        <td>
            <%=mmap.get("mbr_nm")%>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>전화번호</td>
        <%
          String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
          String phoneNum = mmap.get("mbr_phone").toString().replaceAll(regEx, "$1-$2-$3");
        %>
        <td>
            <input type="text" id="mbr_phone" name="mbr_phone" value="<%=phoneNum%>" placeholder="'-' 없이 입력해주세요">
        </td>
        <td></td>
      </tr>
      <tr>
        <td>나의구단</td>
        <td>
          <select class="form-control" id="team_id" name="team_id">
            <option value="0">없음</option>
            <option value="1">LG</option>
            <option value="2">KT</option>
            <option value="3">SGG</option>
            <option value="4">NC</option>
            <option value="5">두산</option>
            <option value="6">KIA</option>
            <option value="7">롯데</option>
            <option value="8">삼성</option>
            <option value="9">한화</option>
            <option value="10">키움</option>
          </select>
        </td>
        <td>
        </td>
      </tr>
      <script>
          var selectedTeamId = <%=mmap.get("team_id")%>; // 원하는 팀 ID로 변경

          // JavaScript를 사용하여 선택된 값을 설정
          var selectElement = document.getElementById('team_id');
          for (var i = 0; i < selectElement.options.length; i++) {
              if (selectElement.options[i].value == selectedTeamId) {
                  selectElement.options[i].selected = true;
                  break;
              }
          }
      </script>
      </tbody>
      <tfoot>
      <tr>
        <td style="color: #B8B8B9">계정삭제</td>
        <td></td>
        <td>
          <button type="button" class="btn btn-outline-primary"  onclick="memberDelete()" >삭제</button>
        </td>
      </tr>
      </tfoot>
    </table>
  </form>
</div>
<br/>
<div class='footer_btn' style="margin: auto; margin-top: 60px">
  <button class="button" onclick="memberInfoUpdate()">저장</button>
  <button class="button" onclick="btn_Cancel()">취소</button>
</div>


<!--================================= body start ==================================-->

<!--================================= footer start ==================================-->
<%@include file="/include/ticket_footer.jsp" %>
<!--================================== footer end ===================================-->


</body>
</html>