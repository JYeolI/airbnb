package com.airbnb.airbnb_service.data.response;

import lombok.Data;

@Data
public class MsgRoomResponseVO {
    private Integer msg_seq;
    private Integer sender_seq;
    private String sender_id;
    private String sender_name;
    private String sender_img;
    private Integer new_msg_cnt;
}
