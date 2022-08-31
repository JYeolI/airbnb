package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class HouseMonthlyOptionVO {
    private Integer hmo_seq;
    private Integer hmo_hi_seq;
    private String hmo_name;
    private Integer hmo_rate;
    private Integer hmo_monthly;
    private Integer hmo_enable;
    private Date hmo_enable_dt;
    private Date hmo_reg_dt;
}
