package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class HouseDetailCntVO {
    private Integer hosting_house_cnt;
    private Integer total_review_cnt;
    private Integer house_review_cnt;
}
