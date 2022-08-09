package com.airbnb.airbnb_service.data.member;

import lombok.Data;

@Data
public class MemberReportVO {
    private Integer mrpt_seq;
    private Integer mrpt_from_mi_seq;
    private Integer mrpt_to_mi_seq;
    private Integer mrpt_type;
    private String mrpt_reason;
}
