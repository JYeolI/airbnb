package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class MsgContentResponseVO {
    private Boolean opponent;
    private String content;
    private Boolean msg_receiver_read;
    private Date msg_reg_dt;
}
