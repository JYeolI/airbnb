package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class HouseFeeVO {
    private Integer base_price;
    private Integer cleaning_fee;
    private Integer service_fee;
    private Integer sum_price;
}
