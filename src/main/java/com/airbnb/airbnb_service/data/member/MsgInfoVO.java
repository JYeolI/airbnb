package com.airbnb.airbnb_service.data.member;

import java.util.Date;

import lombok.Data;

@Data
public class MsgInfoVO {
    private Integer msg_seq;
    private Integer msg_sender_mi_seq;
    private Integer msg_receiver_mi_seq;
    private Integer msg_type;
    private String msg_content;
    private Date msg_reg_dt;

    private String mi_name;
}
