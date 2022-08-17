package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class HouseFeeVO {
    private Integer basePrice;
    private Integer cleaningFee;
    private Integer serviceFee;
}
