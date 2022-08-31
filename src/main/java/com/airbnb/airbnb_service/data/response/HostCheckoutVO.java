package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class HostCheckoutVO {
    private Integer bi_seq;
    private Date bi_start_dt;
    private Date bi_end_dt;
    private Integer hi_seq;
    private String hi_name;
    private Integer mi_seq;
    private String mi_name;
}
