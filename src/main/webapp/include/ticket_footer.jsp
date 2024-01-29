<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/footer.css">
<script type="text/javascript">
    function openWindowPop(url, name){
        var popupWidth = 500;
        var popupHeight = 700;

        // 만들 팝업창 width 크기의 1/2 만큼 출력되도록
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        // 만들 팝업창 width 크기의 1/2 만큼 출력되도록
        var popupY= (window.screen.height / 2) - (popupHeight / 2);

        var options = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY
        window.open(url, name, options);
    }
</script>
<footer class="common_footer">
    <div class="footer_menu">
        <ul class="footer_menu_list">
            <li class="footer_menu_item">
                <a href="javascript:;" id="introductionCompany" class="footer_menu_link">회사소개</a>
            </li>
            <li class="footer_menu_item">
                <a href="/popup/pop_service.html" class="footer_menu_link">
                    <span class="text_bold">개인정보 처리방침</span>
                </a>
            </li>
            <li class="footer_menu_item">
                <a class="footer_menu_link" href="javascript:openWindowPop('/popup/pop_agreement.html', '이용약관')">이용약관</a>
            </li>
            <li class="footer_menu_item">
                <a href="#" class="footer_menu_link">고객센터</a>
            </li>
        </ul>
    </div>
    <div class="footer_inner">
        <span class="footer_corp_title">Best Senior Ticket</span>
        <address class="footer_address">
            <p>
                <span class="footer_address_item">주소: 코딩시 코딩구 코딩로 코딩길 777, 코딩빌딩</span>
                <span class="footer_address_item">대표이사: 한코딩</span>
                <span class="footer_address_item">사업자등록번호: 777-77-77777</span>
            </p>
            <p>
                <span class="footer_address_item">1577-7777</span>
                <span class="footer_address_item">bstmembership@bst.co.kr</span>
                <span class="footer_address_item">통신판매업 신고번호: 제 2024-서울강남-77777호</span>
                </span>
                <span class="footer_address_item">개인정보보호 책임자: 한코딩</span>
            </p>
        </address>
        <span class="footer_copyright">Copyright © BST Corporation. All rights reserved.</span>
        <div class="footer_etc">
                        <ul class="footer_sns">
                            <li class="footer_sns_item">
                                <a href="https://www.youtube.com" target="_blank" class="footer_sns_link">
                                <img src="/images/icon/Youtube.png" class="d-block w-100" alt="유튜브아이콘">
                            <span class="common_icon icon_youtube_gray">
                              <span class="blind">유튜브</span>
                            </span>
                                </a>
                            </li>
                            <li class="footer_sns_item">
                                <a href="https://www.facebook.com" target="_blank" class="footer_sns_link">
                                <img src="/images/icon/Facebook.png" class="d-block w-100" alt="페이스북아이콘">
                            <span class="common_icon icon_facebook_gray">
                              <span class="blind">페이스북</span>
                            </span>
                                </a>
                            </li>
                            <li class="footer_sns_item">
                                <a href="https://www.instagram.com" target="_blank" class="footer_sns_link">
                                <img src="/images/icon/Instagram.png" class="d-block w-100" alt="인스타그램아이콘">
                            <span class="common_icon icon_instagram_gray">
                              <span class="blind">인스타그램</span>
                            </span>
                                </a>
                            </li>
                            <li class="footer_sns_item">
                                <a href="https://twitter.com" target="_blank" class="footer_sns_link ">
                                <img src="/images/icon/Twitter.png" class="d-block w-100" alt="트위터아이콘">
                            <span class="common_icon icon_twitter_gray">
                              <span class="blind">트위터</span>
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</footer>