package com.airbnb.airbnb_service.data.temp.Htemp;

import java.util.Date;

import lombok.Data;

@Data
public class ProfileVO {
    private Integer mi_host_grade;
    private String mi_name;
    private String mi_description;
    private String cc_content;
    private String mai_city;
    private String mimg_file;
    private Date mi_reg_dt;
}
