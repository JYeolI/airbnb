package com.airbnb.airbnb_service.data;

import java.util.List;

import lombok.Data;

@Data
public class SearchRequestVO {
    private String in_dt;
    private String out_dt;
    private Integer place;
    private List<Integer> lang;
    private List<Integer> amenity;
    private Integer sort;
    private Integer sort_detail;
    private String keyword;
    private Integer guest;
    private Integer dog;
    private Integer price;
    private Integer min;
    private Integer max;
    private Integer type;
    private Integer bed;
    private Integer bedroom;
    private Integer bathroom;
    private Integer superhost;
}
