package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.request.SearchRequestVO;
import com.airbnb.airbnb_service.mapper.HouseMapper;

@RestController
@RequestMapping("/api/house")
public class HouseAPIController {
    @Autowired HouseMapper house_mapper;

    //메인 숙소조회
    @PostMapping("/list")
    public Map<String,Object> postMainViewData(@RequestBody SearchRequestVO request, HttpSession session) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        resultMap.put("status", true);
        resultMap.put("message", "숙소 데이터가 조회되었습니다.");
        resultMap.put("houseList", house_mapper.selectSearchHouseList(request, user_seq));
        return resultMap;
    }
}
