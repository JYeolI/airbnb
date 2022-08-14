package com.airbnb.airbnb_service.data.house;

import lombok.Data;

@Data
public class HouseFeeInfoVO {
    private Integer hfi_seq;
    private Integer hfi_hi_seq;
    private Integer hfi_base_price;
    private Integer hfi_cleaning_fee;
    private Integer hfi_service_fee;
}
