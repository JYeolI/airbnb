package com.airbnb.airbnb_service.data.category;

import lombok.Data;

@Data
public class CategorySortDetailVO {
    private Integer csd_seq;
    private Integer csd_cs_seq;
    private String csd_content;
    private String csd_description;
    private String csd_icon;
}
