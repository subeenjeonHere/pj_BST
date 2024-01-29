package com.bst.ticket.oauth;

import lombok.AllArgsConstructor;

import java.util.Map;

@AllArgsConstructor
public class KakaoUserInfo implements OAuth2UserInfo{

    private Map<String, Object> attributes;

    @Override
    public String getProviderId() {
        // Long 타입이기 때문에 toString으로 변호나
        return attributes.get("id").toString();
    }

    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getEmail() {
        // kakao_account라는 Map에서 추출
        return (String) ((Map) attributes.get("kakao_account")).get("email");
    }

    @Override
    public String getName() {
        // kakao_account라는 Map에서 추출
        return (String) ((Map) attributes.get("properties")).get("nickname");
    }

    @Override
    public String getBirthyear() {
        // 년도 권한 없을 때 :  상수로 지정
        return "1992";
//        년도 권한 있을 때
//        return (String) ((Map) attributes.get("kakao_account")).get("birthyear");
    }

    @Override

    public String getBirthday() {
        //  생년월일 권한 있을 때
        return "0627";
//        생년월일 권한 있을 때
//        return (String) ((Map) attributes.get("kakao_account")).get("birthday");
    }


}
