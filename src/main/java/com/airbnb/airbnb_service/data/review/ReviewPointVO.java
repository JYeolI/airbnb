package com.airbnb.airbnb_service.data.review;

import lombok.Data;

@Data
public class ReviewPointVO {
    private Integer rpo_seq;
    private Integer rpo_clean_point;
    private Integer rpo_correct_point;
    private Integer rpo_communication_point;
    private Integer rpo_location_point;
    private Integer rpo_checkin_point;
    private Integer rpo_cost_point;
}
