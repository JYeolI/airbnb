package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class HouseDailyOptionVO {
    private Integer hdo_seq;
    private Integer hdo_hi_seq;
    private String hdo_name;
    private Integer hdo_rate;
    private Integer hdo_enable;
    private Date hdo_enable_dt;
    private Date hdo_reg_dt;
}
