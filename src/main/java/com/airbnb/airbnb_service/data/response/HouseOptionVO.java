package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class HouseOptionVO {
    private Integer option_seq;
    private String option_name;
    private Date option_date;
    private Integer option_rate;
    private Integer option_cycle;
}
