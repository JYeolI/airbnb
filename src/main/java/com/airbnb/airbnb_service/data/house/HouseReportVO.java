package com.airbnb.airbnb_service.data.house;

import lombok.Data;

@Data
public class HouseReportVO {
    private Integer hrpt_seq;
    private Integer hrpt_from_mi_seq;
    private Integer hrpt_to_hi_seq;
    private Integer hrpt_type;
    private String hrpt_reason;
}
