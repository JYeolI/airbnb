package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class WishInfoVO {
    private Integer wish_seq;
    private Integer wish_mi_seq;
    private Integer wish_hi_seq;
    private Integer wish_order;
    private Date wish_reg_dt;
}
