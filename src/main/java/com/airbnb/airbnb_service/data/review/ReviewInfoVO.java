package com.airbnb.airbnb_service.data.review;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewInfoVO {
    private Integer rev_seq;
    private Integer rev_hi_seq;
    private Integer rev_mi_seq;
    private Integer rev_rpo_seq;
    private String rev_content;
    private Integer rev_public;
    private Date rev_reg_dt;
}
