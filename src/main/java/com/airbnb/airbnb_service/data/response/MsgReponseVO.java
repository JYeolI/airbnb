package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class MsgReponseVO {
    private Integer msg_seq;
    private Integer sender_seq;
    private Integer receiver_seq;
    private Integer sender_id;
    private Integer sender_name;
    private Integer sender_img;
}
