package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class HouseWeeklyOptionVO {
    private Integer hwo_seq;
    private Integer hwo_hi_seq;
    private String hwo_name;
    private Integer hwo_rate;
    private Integer hwo_weekly;
    private Integer hwo_enable;
    private Date hwo_enable_dt;
    private Date hwo_reg_dt;
}
