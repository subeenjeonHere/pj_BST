package com.bst.ticket.oauth;

public interface OAuth2UserInfo {
    String getProviderId();
    String getProvider();
    String getEmail();
    String getName();
    String getBirthyear();
    String getBirthday();

}
