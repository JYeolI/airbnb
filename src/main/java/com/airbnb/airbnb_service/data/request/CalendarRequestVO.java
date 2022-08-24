package com.airbnb.airbnb_service.data.request;

import lombok.Data;

@Data
public class CalendarRequestVO {
    Integer house_seq;
    String in_dt;
    String out_dt;
}
