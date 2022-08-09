package com.airbnb.airbnb_service.data.request;

import java.util.List;

import lombok.Data;

@Data
public class SearchRequestVO {
    //헤더 검색바
    private String keyword;
    private String in_dt;
    private String out_dt;
    private Integer guest;
    private Integer dog;
    //카테고리바
    private Integer cate_place;
    private Integer cate_sort_detail;
    //검색필터
    private Integer min;
    private Integer max;
    private Integer type;
    private Integer bed;
    private Integer bedroom;
    private Integer bathroom;
    private Integer sort;
    private List<Integer> amenity;
    private Integer superhost;
    private List<Integer> lang;
}
