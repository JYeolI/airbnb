package com.airbnb.airbnb_service.data.response;

import java.util.List;

import lombok.Data;

@Data
public class PriceCalculatorResponseVO {
    private HouseFeeVO house_fee;
    private List<CalculatorVO> price_per_day;
    private List<HouseOption2VO> house_option;
}
