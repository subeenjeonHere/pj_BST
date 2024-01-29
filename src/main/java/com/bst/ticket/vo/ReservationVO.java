package com.bst.ticket.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {
  private Integer rsv_id;
  private String rsv_number;
  private String mbr_id;
  private Integer mbr_seq;
  private int gm_id;
  private boolean isAddOne;


  @Override
  public String toString() {
    return "ReservationVO{" +
            "rsv_id=" + rsv_id +
            ", rsv_number='" + rsv_number + '\'' +
            ", mbr_id='" + mbr_id + '\'' +
            ", mbr_seq=" + mbr_seq +
            ", gm_id=" + gm_id +
            ", isAddOne=" + isAddOne +
            '}';
  }
}
