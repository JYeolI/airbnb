package com.airbnb.airbnb_service.data.review;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReplyVO {
    private Integer rpl_seq;
    private Integer rpl_mi_seq;
    private Integer rpl_rev_seq;
    private String rpl_content;
    private Date rpl_reg_dt;
}
