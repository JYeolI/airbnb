package com.airbnb.airbnb_service.data.temp.Htemp;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewListToHostVO {
    private String hi_name;
    private Date rev_reg_dt;
    private String rev_content;
    private String mimg_file;
    private String mi_name;
    private String cc_content;
    private Date mi_reg_dt;
}
