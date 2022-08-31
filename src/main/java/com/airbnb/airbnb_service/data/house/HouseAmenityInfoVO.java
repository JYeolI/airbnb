package com.airbnb.airbnb_service.data.house;

import lombok.Data;

@Data
public class HouseAmenityInfoVO {
    private Integer ham_seq;
    private Integer ham_hi_seq;
    private Integer ham_ca_seq;
    //category_amenity
    private Integer ca_type;
    private String ca_content;
    private String ca_icon;
}
