package com.airbnb.airbnb_service.data.category;

import lombok.Data;

@Data
public class CategoryAmenityVO {
    private Integer ca_seq;
    private Integer ca_type;
    private String ca_content;
    private String ca_description;
    private String ca_icon;
}
