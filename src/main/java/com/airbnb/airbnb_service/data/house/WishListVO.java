package com.airbnb.airbnb_service.data.house;

import java.util.Date;

import lombok.Data;

@Data
public class WishListVO {
    private Integer wish_seq;
    private Integer wish_mi_seq;
    private Integer wish_hi_seq;
    private String wish_title;
    private Integer wish_order;
    private Date wish_reg_dt;
    private String hi_name;
    private String country;
    private String city;
    private String detail;
    private String main_img;
    private Integer guest;
    private Integer bed;
    private Integer bedroom;
    private Integer bathroom;
    private Integer dog;
    private Integer price;
    private Integer total_avg;
}
