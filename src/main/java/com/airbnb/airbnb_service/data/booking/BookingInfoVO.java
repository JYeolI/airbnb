package com.airbnb.airbnb_service.data.booking;

import java.util.Date;

import lombok.Data;

@Data
public class BookingInfoVO {
    private Integer bi_seq;
    private Integer bi_mi_seq;
    private Integer bi_hi_seq;
    private Integer bi_bgi_seq;
    private Integer bi_bfi_seq;
    private Date bi_start_dt;
    private Date bi_end_dt;
    private String bi_guest_phone;
    private Date bi_reg_dt;
    private Date bi_cancel_dt;
    private Integer bi_status;
    private Date bi_confirm_dt;
}
