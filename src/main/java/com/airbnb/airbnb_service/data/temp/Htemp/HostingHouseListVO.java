package com.airbnb.airbnb_service.data.temp.Htemp;

import lombok.Data;

@Data
public class HostingHouseListVO {
    private Integer hi_seq;
    private String hi_name;
    private String himg_file;
    private Double total_avg;
    private Integer hi_type;
    private String cs_content;
    private String csd_content;
    private String hi_description;
}
