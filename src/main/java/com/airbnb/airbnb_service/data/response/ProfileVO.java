package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class ProfileVO {
    private String memeber_name;
    private String member_desc;
    private String country;
    private String city;
    private String member_address;
    private String profile_img;
    private Integer member_status;
    private Integer host_grade;
    private Date reg_dt;
}
