package com.airbnb.airbnb_service.data.response;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProfileVO {
    private Integer mi_seq;
    private Integer mai_cc_seq;

    private String memeber_name;
    private String member_desc;
    private String country;
    private String company;
    private String city;
    private String member_address;
    private String profile_img;
    private Integer member_status;
    private Integer host_grade;
    private Date reg_dt;

    private List<String> lang;
    private List<Integer> lang_seq;
}
