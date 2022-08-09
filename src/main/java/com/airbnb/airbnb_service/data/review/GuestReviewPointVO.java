package com.airbnb.airbnb_service.data.review;

import lombok.Data;

@Data
public class GuestReviewPointVO {
    private Integer grpo_seq;
    private Integer grpo_clean_point;
    private Integer grpo_correct_point;
    private Integer grpo_communication_point;
}
