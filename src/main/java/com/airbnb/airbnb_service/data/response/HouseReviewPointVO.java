package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class HouseReviewPointVO {
    private Integer clean_avg;
    private Integer correct_avg;
    private Integer communication_avg;
    private Integer location_avg;
    private Integer chechin_avg;
    private Integer cost_avg;
    private Double total_avg;
}
