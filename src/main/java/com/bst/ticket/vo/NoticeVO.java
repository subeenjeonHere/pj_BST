package com.bst.ticket.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticeVO {
  private int    ntc_id;
  private String ntc_created;
  private String ntc_updated;
  private String ntc_title;
  private String ntc_content;
  private int    mbr_seq;
  
  @Builder
    public NoticeVO(int ntc_id, String ntc_created, String ntc_updated, String ntc_title, String ntc_content, int mbr_seq){
      super();
      this.ntc_id=ntc_id;
      this.ntc_created=ntc_created;
      this.ntc_updated=ntc_updated;
      this.ntc_title=ntc_title;
      this.ntc_content=ntc_content;
      this.mbr_seq=mbr_seq;
    }
  }
