package com.airbnb.airbnb_service.data.temp.Htemp;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewListToGuestVO {
    private Integer writer_seq;
    private Date grev_reg_dt;
    private String grev_content;
    private String writer_img;
    private String writer_name;
    private String writer_country;
    private Date writer_reg_dt;
}
