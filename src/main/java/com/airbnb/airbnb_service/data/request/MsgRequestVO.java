package com.airbnb.airbnb_service.data.request;

import lombok.Data;

@Data
public class MsgRequestVO {
    private Integer sender_seq;
    private Integer receiver_seq;
    private String msg_content;
}
