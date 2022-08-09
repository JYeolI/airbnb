package com.airbnb.airbnb_service.data.booking;

import lombok.Data;

@Data
public class BookingFeeInfoVO {
    private Integer bfi_seq;
    private Integer bfi_basic_fee;
    private Integer bfi_cleaning_fee;
    private Integer bfi_service_fee;
}
