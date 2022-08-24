package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class HouseReviewVO {
    private Integer guest_seq;
    private String guest_review;
    private String guest_rev_dt;
    private String guest_name;
    private String guest_img;
    private Integer host_seq;
    private String host_reply;
    private String host_name;
    private String host_img;
    private Date host_rpl_dt;
}
