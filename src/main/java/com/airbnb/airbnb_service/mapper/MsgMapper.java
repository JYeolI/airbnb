package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.request.MsgRequestVO;
import com.airbnb.airbnb_service.data.response.MsgContentResponseVO;
import com.airbnb.airbnb_service.data.response.MsgRoomResponseVO;

@Mapper
public interface MsgMapper {
    public List<MsgRoomResponseVO> selectMsgRoomList(Integer user_seq);
    public List<MsgRoomResponseVO> selectNewMsgCnt(Integer user_seq);
    public List<MsgContentResponseVO> selectMsgContentList(Integer user_seq, Integer opponent_seq);
    public void insertMsg(MsgRequestVO data);
}
