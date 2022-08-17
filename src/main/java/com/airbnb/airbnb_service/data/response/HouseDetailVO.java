package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class HouseDetailVO {
    private Integer house_seq;
    private String house_name;
    private String house_sort;
    private String house_sort_detail;
    private String house_description;
    private String house_rule;
    private String house_check_in;
    private String house_check_out;
    private Integer house_refund_day;
    private Integer house_status;
    private String house_country;
    private String house_city;
    private String house_address;
    private Integer house_guest;
    private Integer house_dog;
    private Integer house_bed;
    private Integer house_bedroom;
    private Integer house_bathroom;

    private Integer host_seq;
    private String host_name;
    private String host_description;
    private Date host_reg_dt;
    private Integer super_host;
    private Integer host_status;
    private String host_img;
}
