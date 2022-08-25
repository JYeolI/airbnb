package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class MsgContentResponseVO {
    private Boolean opponent;
    private String content;
    private Boolean msg_receiver_read;
}
