package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class MsgRoomResponseVO {
    private Integer opponent_seq;
    private String opponent_id;
    private String opponent_name;
    private String opponent_img;
    private Date last_reg_dt;
    private Integer new_msg_cnt;
}
