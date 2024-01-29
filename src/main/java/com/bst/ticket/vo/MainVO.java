package com.bst.ticket.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MainVO {

    /*
       작성자 : 한은지
       작성일자 : 24.01.24
       기능 : 검색창(VO)
    */
    private String gm_id;
    private String team_home;
    private String team_away;
    private String gm_date;
    private String std_name;

    /*
       작성자 : 한은지
       작성일자 : 24.01.26
       기능 : 검색창(VO)
    */
    private int ntc_id;
    private String ntc_created;
    private String ntc_updated;
    private String ntc_title;
    private String ntc_content;
    private int mbr_seq;

    @Override
    public String toString() {
        return "MainVO{" +
                "gm_id='" + gm_id + '\'' +
                ", team_home='" + team_home + '\'' +
                ", team_away='" + team_away + '\'' +
                ", gm_date='" + gm_date + '\'' +
                ", std_name='" + std_name + '\'' +
                ", ntc_id=" + ntc_id +
                ", ntc_created='" + ntc_created + '\'' +
                ", ntc_updated='" + ntc_updated + '\'' +
                ", ntc_title='" + ntc_title + '\'' +
                ", ntc_content='" + ntc_content + '\'' +
                ", mbr_seq=" + mbr_seq +
                '}';
    }
}

//    @Override
//    public String toString() {
//        return "MainVO{" +
//                "gm_id='" + gm_id + '\'' +
//                ", team_home='" + team_home + '\'' +
//                ", team_away='" + team_away + '\'' +
//                ", gm_date='" + gm_date + '\'' +
//                ", std_name='" + std_name + '\'' +
//                '}';
//    }
//}