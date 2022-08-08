package com.airbnb.airbnb_service.data.booking;

import java.util.Date;

import lombok.Data;

@Data
public class TripResponseVO {
    private Integer bi_seq;
    private Date bi_start_dt;
    private Date bi_end_dt;
    private Date bi_reg_dt;
    private Integer bi_status;
    private Date bi_confirm_dt;
    private Integer adult;
    private Integer child;
    private Integer infant;
    private Integer dog;
    private Integer hi_seq;
    private String hi_name;
    private String country;
    private String city;
    private String detail;
    private String main_img;
    private Integer wish_seq;
}
