package com.airbnb.airbnb_service.data.review;

import java.util.Date;

import lombok.Data;

@Data
public class GuestReviewInfoVO {
    private Integer grev_seq;
    private Integer grev_mi_seq;
    private Integer grev_grpo_seq;
    private String grev_content;
    private Integer gev_public;
    private Date grev_reg_dt;
}
