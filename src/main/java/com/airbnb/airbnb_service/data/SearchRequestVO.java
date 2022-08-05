package com.airbnb.airbnb_service.data;

import lombok.Data;

@Data
public class SearchRequestVO {
    private String in_dt;
    private String out_dt;
    private Integer cate_place;
    private Integer lang;
    private Integer amenity;
    private Integer guest;
    private Integer dog;
    private Integer min;
    private Integer max;
    private Integer type;
    private Integer bed;
    private Integer bedroom;
    private Integer bathroom;
    private Integer superhost;
}
