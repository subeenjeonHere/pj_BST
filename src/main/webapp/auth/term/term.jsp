<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/term.css">
  <title>약관동의 페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <script type="text/javascript">

    function selectAll(selectAll)  {
      const checkboxes = document.getElementsByName('allAgree');

      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
      })
    }

    // 체크박스 상태 변경 시 호출되는 함수
    function handleCheckboxChange() {
      const termAgree1 = document.getElementById('termAgree1');
      const termAgree2 = document.getElementById('termAgree2');
      const nextButton = document.getElementById('target');

      // 두 체크박스 모두 체크되어 있을 때만 버튼 활성화
      nextButton.disabled = !(termAgree1.checked && termAgree2.checked);
    }

    // 페이지 로드 시 초기화
    document.addEventListener('DOMContentLoaded', function() {
      // 체크박스에 대한 체크 상태 변경 이벤트 리스너 등록
      const termAgreeAll  = document.getElementById('allAgree');
      const termAgree1 = document.getElementById('termAgree1');
      const termAgree2 = document.getElementById('termAgree2');


      termAgreeAll.addEventListener('change', handleCheckboxChange);
      termAgree1.addEventListener('change', handleCheckboxChange);
      termAgree2.addEventListener('change', handleCheckboxChange);

      // 초기 상태에서 버튼 비활성화
      handleCheckboxChange();
    });

  const next =()=>{
    location.href = "./registPage"
  }

  function openWindowPop(url, name){
    var options = 'top=100, left=300, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}
  </script>
</head>
<body>
  <%@include file="/include/ticket_header.jsp" %>
  <div class="container-custom">
    <div class="inner-container">
      <div class="welcome-text">고객님 <br/><br/>환영합니다.</div>
      <br>
      <img class="img-fluid" src="/images/icon/ticketting.png" alt="Placeholder Image" />
    </div>

    <div class="checkbox-section">
      <div class="checkbox-container">
        <input type="checkbox" id="allAgree" name="allAgree" value='selectall' onclick='selectAll(this)'/>
        <label class="checkbox-label" type="checkbox-label" >
          약관 전체동의</label>
      </div>
    </div>

    <br>

    <div class="checkbox-section">
      <div class="checkbox-container">
        <input type="checkbox" name="allAgree" id="termAgree1">
        <a class="checkbox-label"  href="javascript:openWindowPop('/popup/pop_agreement.html', 'popup')">
          이용약관 동의(필수) ></a>
      </div>
    </div>


    <div class="checkbox-section">
      <div class="checkbox-container">
        <input type="checkbox" name="allAgree" id="termAgree2">
        <a class="checkbox-label" href="javascript:openWindowPop('/popup/pop_service.html', 'popup');">
          개인정보 수집 및 이용동의(필수)></a>
      </div>
    </div>

    <br>
    <br>
    <div class="button-container">
      <button class="custom-button"  id="target" onclick="next()"  >
          다 음
      </button>
    </div>
  </div>

  <%@include file="/include/ticket_footer.jsp" %>
</body>
</html>