# ⚾️ BST: Best Senior Ticket

- 팀 프로젝트 종료 후 Refactoring

노년층을 위한 특별한 야구 티켓 예매 플랫폼 팀 프로젝트 입니다. 어르신들을 타겟으로 야구 경기를 쉽고 편하게 예매할 수 있도록 복잡한 예매 과정을 단순화한 티켓 예매 사이트입니다.
</br></br>


### 🧾 프로젝트 개요/Project Overview

| 기사 발췌 |
| --- |
| ![image](https://github.com/subeenjeonHere/pj_BST/assets/145312273/d212bb7a-06d5-4eb0-a8d5-47e895d2a0ed) |
| ![image](https://github.com/subeenjeonHere/pj_BST/assets/145312273/3fe408a5-db8b-4e8e-8b53-8ff95281df1d) |

> 2023년 KBO 한국 야구시리즈는 모두 온라인에서만 사전 예매를 받았고, 취소표 조차도 온라인에 먼저 풀리며 현장에서 티켓을 구매하고자 한 어르신들은 구매가 불가능하여 발걸음을 돌렸단 소식이 이슈가 된 적이 있습니다.
원인은 노인들은 온라인 예매가 익숙치 않았기 때문이었습니다. BST 팀 프로젝트에선 ‘디지털 소외’ 문제로 거론되는 것을 ‘개발'로 해결해 볼 수 없을까?에 착안하여 시작하였습니다.


</br></br>


### 👥 개발 기간 및 멤버 구성/Development Period and Development Team

- Backend 5명

</br></br>


### 🧰 개발 환경/Development Environment

| Backend | Frontend | Database | IDEA | Collaboration |
| --- | --- | --- | --- | --- |
| ![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) ![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white) ![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black) | ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white) | MyBatis ![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white) | ![IntelliJ IDEA](https://img.shields.io/badge/IntelliJIDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white) ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white) | ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white) ![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white) ![Jira](https://img.shields.io/badge/jira-%230A0FFF.svg?style=for-the-badge&logo=jira&logoColor=white) ![Canva](https://img.shields.io/badge/Canva-%2300C4CC.svg?style=for-the-badge&logo=Canva&logoColor=white) |




</br></br>

### 📜 아키텍처/Architecture

</br></br>

### 📍 프로젝트 구조/Project Structure
<details>
<summary>Detail</summary>
<div markdown="1">

```jsx
└── main
    ├── java
    │   └── com
    │       └── bst
    │           └── ticket
    │               ├── DatabaseConfiguration.java
    │               ├── ServletInitializer.java
    │               ├── TickettingApplication.java
    │               ├── auth
    │               │   ├── PrincipalDetailService.java
    │               │   └── PrincipalDetails.java
    │               ├── config
    │               │   ├── LocalDateTimeSerializer.java
    │               │   └── SecurityConfig.java
    │               ├── controller
    │               │   ├── CommunityCommentController.java
    │               │   ├── CommunityController.java
    │               │   ├── LoginController.java
    │               │   ├── MainController.java
    │               │   ├── MemberContoller.java
    │               │   ├── NoticeController.java
    │               │   ├── RegistController.java
    │               │   ├── ReservationController.java
    │               │   └── TicketController.java
    │               ├── dao
    │               │   ├── CommunityCommentDao.java
    │               │   ├── CommunityDao.java
    │               │   ├── LoginDao.java
    │               │   ├── MainDao.java
    │               │   ├── MemberDao.java
    │               │   ├── NoticeDao.java
    │               │   ├── RegistDao.java
    │               │   ├── ReservationDao.java
    │               │   ├── TicketDao.java
    │               │   └── impl
    │               │       ├── CommunityCommentDaoImpl.java
    │               │       ├── CommunityDaoImpl.java
    │               │       ├── LoginDaoImpl.java
    │               │       ├── MainDaoImpl.java
    │               │       ├── MemberDaoImpl.java
    │               │       ├── NoticeDaoImpl.java
    │               │       ├── RegistDaoImpl.java
    │               │       ├── ReservationDaoImpl.java
    │               │       └── TicketDaoImpl.java
    │               ├── dto
    │               │   └── SearchDto.java
    │               ├── oauth
    │               │   ├── GoogleUserInfo.java
    │               │   ├── KakaoUserInfo.java
    │               │   ├── NaverUserInfo.java
    │               │   ├── OAuth2UserInfo.java
    │               │   └── PrincipalOauth2UserService.java
    │               ├── service
    │               │   ├── CommunityService.java
    │               │   ├── LoginService.java
    │               │   ├── MainService.java
    │               │   ├── MemberService.java
    │               │   ├── NoticeService.java
    │               │   ├── RegistService.java
    │               │   ├── ReservationService.java
    │               │   ├── TicketService.java
    │               │   └── impl
    │               │       ├── CommunityServiceImpl.java
    │               │       ├── LoginServiceImpl.java
    │               │       ├── MainServiceImpl.java
    │               │       ├── MemberServiceImpl.java
    │               │       ├── NoticeServiceImpl.java
    │               │       ├── RegistServiceImpl.java
    │               │       ├── ReservationServiceImpl.java
    │               │       └── TickeServiceImpl.java
    │               └── vo
    │                   ├── CommunityCommentVO.java
    │                   ├── CommunityVO.java
    │                   ├── GameVO.java
    │                   ├── MainVO.java
    │                   ├── MemberVO.java
    │                   ├── NoticeVO.java
    │                   └── ReservationVO.java
    ├── resources
```

</div>
</details>


</br></br>

### 📉 ERD
![image](https://github.com/subeenjeonHere/pj_BST/assets/145312273/1c979543-3026-4f62-be2f-0dc614e2a548)



</br></br>
### 📑 API 명세서


</br></br>

### 🎨 Use Case Diagram & Flow Chart
<details>
<summary>Use Case Diagram</summary>
<div markdown="1">
    
| 커뮤니티 게시판 | 메인 페이지 | 마이 페이지 | 티켓 예매 페이지 |
| --- | --- | --- | --- |
| ![커뮤니티 게시판](https://github.com/subeenjeonHere/pj_BST/assets/145312273/57ed8237-4872-40c9-a025-27fe33595718) | ![메인 페이지](https://github.com/subeenjeonHere/pj_BST/assets/145312273/f72c1126-5a2e-4d70-b21c-a795decdedde) | ![마이 페이지](https://github.com/subeenjeonHere/pj_BST/assets/145312273/8df7ed54-c86b-40e6-a497-08fe5fd32a3b) | ![티켓 예매 페이지](https://github.com/subeenjeonHere/pj_BST/assets/145312273/e4ee47f5-1c9a-4246-9fb9-da9acd00d5c3) |

</div>
</details>

</br>

<details>
<summary>Flow Chart</summary>
<div markdown="1">
    
| 커뮤니티 게시판 | 티켓 예매 | 로그인 | 회원가입 | 메인 페이지 | 티켓 오픈 공지 |
| --- | --- | --- | --- | --- | --- |
| ![커뮤니티 게시판](https://github.com/subeenjeonHere/pj_BST/assets/145312273/8a9f98e5-033c-4fbd-9e37-66390d6a33f1) | ![티켓 예매](https://github.com/subeenjeonHere/pj_BST/assets/145312273/6842d3e7-5ffc-4302-b21d-89245b51d3e7) | ![로그인](https://github.com/subeenjeonHere/pj_BST/assets/145312273/74602d13-fe6c-47bd-9b4b-8fcbb0af99a1) | ![회원가입](https://github.com/subeenjeonHere/pj_BST/assets/145312273/0ef4cb58-6396-4791-ac53-04d7792bb562) | ![메인 페이지](https://github.com/subeenjeonHere/pj_BST/assets/145312273/16b19684-dc19-413d-aa27-374119b9b2a7) | ![티켓 오픈 공지](https://github.com/subeenjeonHere/pj_BST/assets/145312273/e6cae41a-ef12-4370-b9c2-d7dd2f3ead5a) |

</div>
</details>
</br></br>



### 🔑 주요 기능/Key Features

- 회원가입 및 로그인
    - 카카오, 구글, 네이버 OAuth2 로그인
- 커뮤니티 게시판
- 티켓 예매
- 마이 페이지
- 오픈 공지사항
- 메인 페이지

</br></br>

# 👩🏻‍💻 개인 내용

### ✓ 담당한 주요 기능

| 카테고리 | 내용 |
| --- | --- |
| 데이터 베이스 | 프로젝트 데이터 베이스 설계 및 구축 |
| 개발 | 커뮤니티 CRUD 게시판 구현 |
| 협업 | 팀 주간 회의록 작성 |

</br></br>

### 📗 학습한 내용

| Index | 데이터 베이스 | 개발 |
| --- | --- | --- |
| 1 | [설계 과정 1](https://subeenjeonhere.github.io/projectjourney/%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%84%A4%EA%B3%84(1)/) |  |
| 2 | [설계 과정 2](https://subeenjeonhere.github.io/projectjourney/%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%84%A4%EA%B3%84-(2)/) |  |
| 3 | [설계 과정 3](https://subeenjeonhere.github.io/projectjourney/%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%84%A4%EA%B3%84-(3)/) |  |
| 4 | [설계 과정 4](https://subeenjeonhere.github.io/projectjourney/%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%84%A4%EA%B3%84-(4)/) |  |
| 5 |  |  |


</br></br>

### ◼︎ 회고

</br></br>

# 🚀 Refactor
