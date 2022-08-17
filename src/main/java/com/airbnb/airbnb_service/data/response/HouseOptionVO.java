package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class HouseOptionVO {
    private String optionName;
    private Date optionDate;
    private Integer optionRate;
    private Integer optionCycle;
}
