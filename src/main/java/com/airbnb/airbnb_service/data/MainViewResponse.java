package com.airbnb.airbnb_service.data;

import lombok.Data;

@Data
public class MainViewResponse {
    private Integer hi_seq;
    private Integer hi_mi_seq;
    private Integer hi_type;
    private Integer hi_status;
    private String country;
    private Integer cate_sort;
    private Integer cate_sort_detail;
    private String city;
    private String address;
    private Integer price;
    private Double total_avg;
    private String main_img;
    private Integer guest;
    private Integer dog;
    private Integer bed;
    private Integer bedroom;
    private Integer bathroom;
    private Integer super_host;
}
