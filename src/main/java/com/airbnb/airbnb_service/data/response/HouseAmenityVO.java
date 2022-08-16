package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class HouseAmenityVO {
    private Integer amenity_type;
    private String amenity_content;
    private String amenity_description;
    private String amenity_icon;
}
