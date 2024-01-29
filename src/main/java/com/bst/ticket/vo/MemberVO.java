package com.bst.ticket.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.userdetails.User;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class MemberVO{

  private int mbr_seq ;
  private  String mbr_id="";
  private  String mbr_pwd="";
  private  String mbr_nm="";
  private LocalDate mbr_birthdate;
  private  String mbr_phone="";
  private  String mbr_address="";
  private  String mbr_postalcode="";
  private  String mbr_email="";
  private String mbr_role ="";
  private  int team_id =0;
  private  String mbr_provider ="";
  private  String mbr_providerId ="";

  @Builder
  public MemberVO(int mbr_seq, String mbr_id, String mbr_pwd,
                  String mbr_nm, LocalDate mbr_birthdate, String mbr_phone,
                  String mbr_address, String mbr_postalcode, String mbr_email,
                  String mbr_role, int team_id, String mbr_provider,  String mbr_providerId){
    super();
    this.mbr_seq = mbr_seq;
    this.mbr_id = mbr_id;
    this.mbr_pwd = mbr_pwd;
    this.mbr_nm = mbr_nm;
    this.mbr_birthdate = mbr_birthdate;
    this.mbr_phone = mbr_phone;
    this.mbr_address = mbr_address;
    this.mbr_postalcode = mbr_postalcode;
    this.mbr_email = mbr_email;
    this.mbr_role = mbr_role;
    this.team_id = team_id;
    this.mbr_provider = mbr_provider;
    this.mbr_providerId = mbr_providerId;
  }
}
