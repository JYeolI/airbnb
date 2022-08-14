package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class ProfileHostingHouseVO {
    private Integer house_seq;
    private String house_name;
    private String house_img;
    private Double total_avg;
    private Integer type;
    private String sort;
    private String sort_detail;
    private String house_desc;    
}
