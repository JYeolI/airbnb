package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.request.MsgRequestVO;
import com.airbnb.airbnb_service.data.response.MsgContentResponseVO;
import com.airbnb.airbnb_service.data.response.MsgRoomResponseVO;
import com.airbnb.airbnb_service.mapper.MsgMapper;

@RestController
@RequestMapping("/api/msg")
public class MsgAPIController {
    @Autowired MsgMapper msg_mapper;

    //메세지 대화방 조회
    @Transactional
    @GetMapping("/room")
    public Map<String, Object> getMsgRoomData(HttpSession session, @Nullable Integer page) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 10;
        if(page==null)page=1;
        Integer offset = (page-1)*10;
        List<MsgRoomResponseVO> roomList = msg_mapper.selectMsgRoomList(user_seq, offset);
        Integer totalCnt = msg_mapper.selectMsgRoomTotalCnt(user_seq);

        resultMap.put("room_list", roomList);
        resultMap.put("current_page", page);
        resultMap.put("total_page",Math.ceil((double)totalCnt/10));
        resultMap.put("total_cnt", totalCnt);
        resultMap.put("status", true);
        resultMap.put("message", "대화방 정보가 조회되었습니다.");
        return resultMap;
    }
    
    //메세지 컨텐츠 조회
    @Transactional
    @GetMapping("/content")
    public Map<String, Object> getMsgContentData(HttpSession session, Integer opponent_seq, @Nullable Integer page) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 10;
        if(page==null)page=1;
        Integer offset = (page-1)*20;
        List<MsgContentResponseVO> contentList = msg_mapper.selectMsgContentList(user_seq, opponent_seq, offset);
        Integer totalCnt = msg_mapper.selectMsgContentTotalCnt(user_seq, opponent_seq);

        resultMap.put("content_list", contentList);
        resultMap.put("current_page", page);
        resultMap.put("total_page",Math.ceil((double)totalCnt/20));
        resultMap.put("total_cnt", totalCnt);
        resultMap.put("status", true);
        resultMap.put("message", "메세지 내용이 조회되었습니다.");
        return resultMap;
    }

    //메세지 전송
    @Transactional
    @PostMapping("/{type}")
    public Map<String, Object> postMsgContent(HttpSession session, @PathVariable String type, @RequestBody MsgRequestVO request) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 10;

        if(type.equals("normal")){request.setType(1);}
        request.setUser_seq(user_seq);
        msg_mapper.insertMsg(request);

        resultMap.put("status", true);
        resultMap.put("message", "메세지가 전송되었습니다.");

        return resultMap;
    }

    //메세지 삭제(현재 대화방에 표시된 대화내용 전체)
    //soft delete방식이라서 실제로는 patch-update
    @Transactional
    @DeleteMapping("/room")
    public Map<String, Object> deleteMsgRoomData(HttpSession session, @RequestParam Integer opponent_seq) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 10;
                
        msg_mapper.deleteMsgSendContent(user_seq, opponent_seq);
        msg_mapper.deleteMsgReceiveContent(user_seq, opponent_seq);
        resultMap.put("status", true);
        resultMap.put("message", "대화방과 대화내용이 삭제되었습니다.");
        return resultMap;        
    }
}
