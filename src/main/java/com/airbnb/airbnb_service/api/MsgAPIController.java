package com.airbnb.airbnb_service.api;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.request.MsgRequestVO;
import com.airbnb.airbnb_service.data.response.MsgRoomResponseVO;
import com.airbnb.airbnb_service.mapper.MsgMapper;

@RestController
@RequestMapping("/api/msg")
public class MsgAPIController {
    @Autowired MsgMapper msg_mapper;

    //메세지 대화방 조회
    @Transactional
    @GetMapping("/room")
    public Map<String, Object> getMsgRoomData(HttpSession session) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 2;
        List<MsgRoomResponseVO> roomList = msg_mapper.selectMsgRoomList(user_seq);
        List<MsgRoomResponseVO> cntList = msg_mapper.selectNewMsgCnt(user_seq);
        for(MsgRoomResponseVO response : roomList){
            for(MsgRoomResponseVO temp : cntList){
                
                temp.getSender_seq();
                temp.getNew_msg_cnt();
            }
        }

        resultMap.put("room_list", roomList);
        resultMap.put("status", true);
        resultMap.put("message", "대화방 정보가 조회되었습니다.");
        return resultMap;
    }
    
    //메세지 컨텐츠 조회
    @GetMapping("/content")
    public Map<String, Object> getMsgContent(HttpSession session, Integer opponent_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 2;
        msg_mapper.selectMsgContentList(user_seq, opponent_seq);

        resultMap.put("status", true);
        resultMap.put("message", "메세지 내용이 조회되었습니다.");
        return resultMap;
    }

    //메세지 전송
    @PutMapping("/asd")
    public Map<String, Object> putHostingSave(HttpSession session, @RequestBody MsgRequestVO request) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 2;
        

        resultMap.put("status", true);
        resultMap.put("message", "숙소가 추가되였습니다.");

        return resultMap;
    }
}
