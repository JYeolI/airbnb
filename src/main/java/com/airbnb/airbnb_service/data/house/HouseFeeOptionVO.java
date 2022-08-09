package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class HouseFeeOptionVO {
    private Integer hfo_seq;
    private Integer hfo_hi_seq;
    private Integer hfo_rate;
    private Date hfo_start_dt;
    private Date hfo_end_dt;
    private Integer hfo_cycle;
}
