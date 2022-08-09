package com.airbnb.airbnb_service.api.temp;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.temp.tempTripMapper;

@RestController
@RequestMapping("/api")
public class APIYS {
    @Autowired tempTripMapper temp_mapper;
    // 여행 예약
    @GetMapping("/trip_response")
    public Map<String, Object> getTripResponse(HttpSession session) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
            // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
            // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;
            resultMap.put("trip_list", temp_mapper.selectTripResponse(user_seq));
        return resultMap;
    }
}

