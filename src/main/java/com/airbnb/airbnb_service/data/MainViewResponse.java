package com.airbnb.airbnb_service.data;

import lombok.Data;

@Data
public class MainViewResponse {
    private Integer hi_seq;
    private String country;
    private String city;
    private String address;
    private Integer price;
    private Double total_avg;
    private Double wish;
    private Double guest;
    private Double dog;
    private Double booking;
    private Double cate_bar_place;
    private Double main_img;
}
