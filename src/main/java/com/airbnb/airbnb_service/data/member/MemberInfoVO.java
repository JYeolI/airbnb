package com.airbnb.airbnb_service.data.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberInfoVO {
    private Integer mi_seq;
    private String mi_id;
    private String mi_pwd;
    private String mi_name;
    private Integer mi_gender;
    private String mi_description;
    private String mi_company;
    private String mi_phone;
    private Integer mi_status;
    private Integer mi_host_grade;
    private Date mi_reg_dt;
}
