<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/regist.css">
  <title>회원가입 페이지</title>
  <%@include file="/common/bootstrap_common.jsp" %>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">

      const memberInsert = () => {
        // 양식 전체 유효성을 확인한 후 폼을 제출합니다.
        if (validateForm()) {
          // 유효성 검사 성공 시, 폼을 제출합니다.
          alert("회원가입 완료!");
          document.querySelector("#f_member").submit();
        } else {
          // 유효성 검사 실패 시, 오류 메시지를 표시하거나 적절한 조치를 취합니다.
          alert("회원가입 양식을 올바르게 입력해주세요.");
        }
      }

        const back=()=> {
          location.href = "./term/term.jsp";
        }

    </script>
</head>
<body>
	<%@include file="/include/ticket_header.jsp" %>
    <div class="container-custom">
  <div class="memberContainer">
    <img class="img-fluid" src="/images/icon/ticketting.png" alt="Placeholder Image" />
    <br>
      <h5 class="text-center mb-10">베스트 시니어 티켓 회원가입</h5>
    <form id="f_member" method="post" action="/auth/regist">
      <div class="form-group mb-3 mt-3">
        <label for="mbr_id">아이디 <span class="text-danger">*</span>
          <span id="id" class="text-danger" style="display:none" > 4~12글자 영어나 숫자로 입력하세요 </span>
          <span id="idd" class="text-danger" style="display:none" > 중복된 아이디 입니다. </span>

        </label>
        <input type="text" class="form-control" id="mbr_id" name="mbr_id" onblur="validateId()"  placeholder="아이디를 입력하세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_pw">비밀번호 <span class="text-danger">*</span>
          <span id="pw" class="text-danger" style="display:none"> 대소문자와 숫자 4~12자리로 입력하세요.</span></label>
        <input type="password" class="form-control" id="mbr_pw" name="mbr_pw"  onblur="validatePassword()"   placeholder="비밀번호를 입렵하세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_pwd">비밀번호 확인 <span class="text-danger">*</span>
          <span id="pwd" class="text-danger" style="display:none">비밀번호가 일치하지않습니다.</span> </label>
        <input type="password" class="form-control" id="mbr_pwd" name="mbr_pwd" onblur="validatePassword2()" placeholder="비밀번호를 재입력하세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_nm">이름 <span class="text-danger">*</span>
          <span id="nm" class="text-danger" style="display:none">2~5글자로 입력해주세요.</span> </label>
        <input type="text" class="form-control" id="mbr_nm" name="mbr_nm" onblur="validateName()"  placeholder="이름을 입력해주세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_birthdate">생년월일 <span class="text-danger">*</span>
          <span id="date" class="text-danger" style="display:none"  >생년월일 형식이 아닙니다.</span> </label>
        <input type="date" class="form-control" id="mbr_birthdate"  name="mbr_birthdate" onblur="validateBirthdate()">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_phone">전화번호 <span class="text-danger">*</span>
          <span id="number" class="text-danger" style="display:none"  >전화번호 형식이 아닙니다.</span> </label>
        <input type="tel" class="form-control" id="mbr_phone" name="mbr_phone" onblur="validatePhone()" placeholder="전화번호를 입력해주세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_email">이메일 <span class="text-danger">*</span>
          <span id="email" class="text-danger" style="display:none"  >이메일형식이 아닙니다.</span> </label>
        <input type="email" class="form-control" id="mbr_email" name="mbr_email" onblur="validateEmail()" placeholder="이메일을 입력해주세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_address">주소(선택사항)</label>
        <div class="input-group">
          <input type="text" class="form-control" id="mbr_postalcode" name="mbr_postalcode" placeholder="우편번호" aria-describedby="search-btn">
          <div class="input-group-append">
            <button class="btn btn-success" type="button" id="search-btn" onclick="openZipcode()">검색</button>
          </div>
        </div>
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="mbr_postalcode">상세주소</label>
        <input type="text" class="form-control" id="mbr_address" name="mbr_address" placeholder="상세주소를 입력해주세요.">
      </div>

      <div class="form-group mb-3 mt-3">
        <label for="team_id">구단(선택사항)</label>
        <select class="form-control" id="team_id" name="team_id">
          <option value="0" selected>구단을 선택해주세요.</option>
          <option value="1">LG</option>
          <option value="2">KT</option>
          <option value="3">NC</option>
          <option value="4">SSG</option>
          <option value="5">두산</option>
          <option value="6">기아</option>
          <option value="7">롯데</option>
          <option value="8">삼성</option>
          <option value="9">한화</option>
          <option value="10">키움</option>
          <!-- Add more options as needed -->
        </select>
      </div>
    </form>
      <div class="memberfooter">
        <input
                type="button"
                class="btn btn-secondary"
                onclick="back()"
                value="뒤로가기"
        />
        <input
                type="button"
                class="btn btn-primary"
                onclick="memberInsert()"
                value="회원가입"
        />
      </div>
      <script>
          //회원가입 우편번호찾기
          // 여기배포햇나? -head에 위치 - 호이스팅이슈
          // 단-DOM 읽혀진 이후에만 접근이 가능하다 - undefined - 배포위치 고려해본다 -기준
          const openZipcode = () => {
              new daum.Postcode({//Postcode객체 생성하기  - 생성하자마자 내부에 구현하기가 전기해고있다
                  oncomplete: function(data) {//완료되었을때 - 요청에 대한 응답이 완료되었을때 -이벤트처리
                      let addr = '';
                      if (data.userSelectedType === 'R') {
                          addr = data.roadAddress;//도로명
                      } else {
                          addr = data.jibunAddress;//지번
                      }
                      console.log(data);
                      console.log(addr);
                      //console.log(post.postNum);
                      //setPost({...post, zipcode:data.zonecode, addr:addr}) ;
                      // document.querySelector("#mem_zipcode").value = data.zonecode;//우편번호
                      // document.querySelector("#mem_address").value = addr;//주소
                      document.getElementById("mbr_address").value = addr;//주소
                      document.getElementById("mbr_postalcode").value =  data.zonecode;//우
                      //document.getElementById("postDetail").focus();
                  }
              }).open();
          }

          // 정규표현식 패턴 상수 선언
          //아이디 정규식표현
          const expIdText = /^[A-Za-z0-9]{4,12}$/;
          //비밀번호 정규식표현
          const expPwText = /^[A-Za-z0-9]{4,12}$/;
          //이름 정규식표현
          const expNameText = /^[가-힣]{2,5}$/;
          //핸드폰 정규식표현
          const expPhoneText = /^\d{3}-\d{3,4}-\d{4}$/;
          //생년월일 정규식표현
          const expDateText = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
          //이메일 정규실표현
          const expEmailText = /^[a-zA-Z0-9._+=-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;



          const validateForm = () => {
            // 각 입력 필드에 대한 개별 유효성 검사 함수를 호출합니다.
            const isIdValid = validateId();
            const isPasswordValid = validatePassword();
            const isNameValid = validateName();
            const isBirthdateValid = validateBirthdate();
            const isPhoneValid = validatePhone();
            const isEmailValid = validateEmail();
            const isPassword2Valid = validatePassword2();


            // 모든 검사가 통과되면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
            return isIdValid && isPasswordValid && isNameValid && isBirthdateValid && isPhoneValid && isEmailValid && isPassword2Valid;
          }

          // 개별 유효성 검사 함수
          const validateId = () => {
            const idSpan = document.getElementById('id');
            const id2 = document.getElementById('idd');
            const mbrIdInput = document.getElementById('mbr_id');

            const id = document.getElementById('mbr_id').value;
            const isValid = expIdText.test(mbrIdInput.value);

            if (isValid) {
              id2.style.display = 'none';
              $.ajax({
                type: 'POST',
                url: '/auth/checkId',
                data: {id : id },
                success: function(cnt) {
                  // 서버로부터의 응답 처리
                  if (cnt == 0){
                    idSpan.style.display = 'none';
                  }else{
                    id2.style.display = 'inline';
                  }
                },
                error: function(error) {
                  // 오류 처리
                  alert("에러입니다");
                }
              });
            } else {
              id2.style.display = 'none';
              idSpan.style.display = 'inline';
            }
            return isValid;
          }

          const validatePassword = () => {
            const pwSpan = document.getElementById('pw');
            const mbrPwInput = document.getElementById('mbr_pw');
            const isValid = expPwText.test(mbrPwInput.value);

            if (isValid) {
              pwSpan.style.display = 'none';
            } else {
              pwSpan.style.display = 'inline';
            }

            return isValid;
          }
            const validatePassword2 = () => {
            const pwdSpan = document.getElementById('pwd');
            const mbrPwdInput = document.getElementById('mbr_pwd');
            const mbrPwInput = document.getElementById('mbr_pw');
            const isValid = mbrPwdInput.value;


            if (mbrPwdInput.value == mbrPwInput.value) {
              pwdSpan.style.display = 'none';
            } else {
              pwdSpan.style.display = 'inline';
            }

            return isValid;
          }

          const validateName = () => {
            const nmSpan = document.getElementById('nm');
            const mbrNmInput = document.getElementById('mbr_nm');
            const isValid = expNameText.test(mbrNmInput.value);

            if (isValid) {
              nmSpan.style.display = 'none';
            } else {
              nmSpan.style.display = 'inline';
            }

            return isValid;
          }

          const validateBirthdate = () => {
            const dateSpan = document.getElementById('date');
            const mbrBirthdateInput = document.getElementById('mbr_birthdate');
            const isValid = expDateText.test(mbrBirthdateInput.value);

            if (isValid) {
              dateSpan.style.display = 'none';
            } else {
              dateSpan.style.display = 'inline';
            }

            return isValid;
          }

          const validatePhone = () => {
            const numberSpan = document.getElementById('number');
            const mbrPhoneInput = document.getElementById('mbr_phone');
            const isValid = expPhoneText.test(mbrPhoneInput.value);

            if (isValid) {
              numberSpan.style.display = 'none';
            } else {
              numberSpan.style.display = 'inline';
            }

            return isValid;
          }

          const validateEmail = () => {
            const emailSpan = document.getElementById('email');
            const mbrEmailInput = document.getElementById('mbr_email');
            const isValid = expEmailText.test(mbrEmailInput.value);

            if (isValid) {
              emailSpan.style.display = 'none';
            } else {
              emailSpan.style.display = 'inline';
            }

            return isValid;
          }

    </script>
    </div>
    </div>
        <%@include file="/include/ticket_footer.jsp" %>
</body>
</html>