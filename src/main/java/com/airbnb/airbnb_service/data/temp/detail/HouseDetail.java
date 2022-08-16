package com.airbnb.airbnb_service.data.temp.detail;

import java.util.Date;

import lombok.Data;

@Data
public class HouseDetail {
    
    @Data
    public class InfoResponseVO {
        private Integer house_seq;
        private String house_name;
        private String house_sort;
        private String house_sort_detail;
        private String house_description;
        private String house_rule;
        private Integer house_refund_day;
        private Integer house_status;
        private String house_country;
        private String house_city;
        private String house_address;
        private Integer house_guest;
        private Integer house_bed;
        private Integer house_bedroom;
        private Integer house_bathroom;
        private Integer house_lastroom;

        private Integer host_seq;
        private String host_name;
        private String host_description;
        private Date host_reg_dt;
        private Integer super_host;
        private Integer host_status;
        private String host_img;
    }
    
    @Data
    public class CntResponseVO {
        private Integer hosting_house_cnt;
        private Integer total_review_cnt;
        private Integer house_review_cnt;
    }

    @Data
    public class AmenityResponseVO {
        private Integer amenity_type;
        private String amenity_content;
        private String amenity_description;
        private String amenity_icon;
    }

    @Data
    public class ReviewVO {

        private Integer guest_seq;
        private String guest_review;
        private String guest_rev_dt;
        private String guest_name;
        private String guest_img;
        private String host_reply;
        private Date host_rpl_dt;
    }

    @Data
    public class ReviewPointVO {
        private Integer clean_avg;
        private Integer correct_avg;
        private Integer communication_avg;
        private Integer location_avg;
        private Integer chechin_avg;
        private Integer cost_avg;
        private Double total_avg;
    }

}
