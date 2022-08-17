package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class MainViewResponseVO {
    private Integer house_seq;
    private Integer host_seq;
    private String house_name;
    private String country;
    private String city;
    private String address;
    private Integer price;
    private Double total_avg;
    private String main_img;
    private Integer super_host;
    private Integer wish;
    private Integer wish_seq;
}
