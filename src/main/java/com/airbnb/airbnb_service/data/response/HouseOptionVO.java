package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class HouseOptionVO {
    private Integer cycle_no;
    private Integer option_seq;
    private Integer house_seq;
    private String option_name;
    private Integer option_rate;
    private Integer option_day;
    private Date option_end_dt;
    private Integer enable;
}