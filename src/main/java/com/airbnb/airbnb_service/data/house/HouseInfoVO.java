package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class HouseInfoVO {
    private Integer hi_seq;
    private Integer hi_mi_seq;
    private Integer hi_csd_seq;
    private Integer hi_hai_seq;
    private Integer hi_hgi_seq;
    private Integer hi_hfi_seq;
    private String hi_name;
    private Integer hi_type;
    private String hi_description;
    private Integer hi_status;
    private String hi_host_phone;
    private Integer hi_refund_day;
    private String hi_rule;
    private Date hi_reg_dt;
}
