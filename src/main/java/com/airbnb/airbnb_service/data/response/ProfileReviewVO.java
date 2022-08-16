package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class ProfileReviewVO {
    private Integer writer_seq;
    private Date write_dt;
    private String content;
    private String writer_img;
    private String writer_name;
    private String writer_country;
    private Date join_dt;    
}
