package com.airbnb.airbnb_service.data.request;

import lombok.Data;

@Data
public class HouseReportRequestVO {
    private Integer user_seq;
    private Integer house_seq;
    private Integer type;
    private String reason;
}
