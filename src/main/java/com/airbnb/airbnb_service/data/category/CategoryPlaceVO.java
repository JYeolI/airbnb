package com.airbnb.airbnb_service.data.category;

import lombok.Data;

@Data
public class CategoryPlaceVO {
    private Integer cp_seq;
    private Integer cp_type;
    private String cp_content;
    private String cp_description;
    private String cp_icon;
}
