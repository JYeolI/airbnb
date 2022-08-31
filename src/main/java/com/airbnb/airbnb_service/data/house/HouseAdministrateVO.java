package com.airbnb.airbnb_service.data.house;

import java.sql.Date;

import lombok.Data;

@Data
public class HouseAdministrateVO {
    private Integer seq;
    private String name;
    private Integer type;
    private String hi_description;
    private String phone;
    private Integer refund_day;
    private String rule;
    private String check_in;
    private String check_out;
    private String cs_content;
    private String csd_content;
    private String img;
    private String csd_description;
    private Integer guest;
    private Integer bed;
    private Integer bathroom;
    private Integer bedroom;
    private Integer dog;
    private String cc_content;
    private String city;
    private String detail;
    private Integer price;
    private Integer cleaning;
    private Integer service;
    private Integer status;
    private String hdo_name;
    private Integer hdo_rate;
    private Integer hdo_enable;
    private Date hdo_enable_dt;
}
