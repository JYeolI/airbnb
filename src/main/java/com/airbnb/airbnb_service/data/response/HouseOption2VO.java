package com.airbnb.airbnb_service.data.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class HouseOption2VO {
    // 옵션seq,옵션이름,옵션시작지정일,할인할증률,주기코드(int)
    private Integer option_seq;
    private String option_name;
    private String option_date;
    private Integer option_rate;
    private Integer option_cycle;    
    // (str)주기정보
    // [매일/매주/매월]
    private String option_cycle_desc;
    // (int)null/요일/지정일
    // [null][0-6]/[1~31]
    private Integer option_day;

}
