package com.airbnb.airbnb_service.data.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MsgRequestVO {
    private Integer user_seq;
    private Integer receiver_seq;
    private Integer type;
    private String msg_content;
}
