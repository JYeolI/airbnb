package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.BookingMapper;

@RestController
@RequestMapping("/api/booking")
public class BookingAPIController {
    @Autowired BookingMapper booking_mapper;

    // 여행 - 예약정보
    @GetMapping("/list")
    public Map<String, Object> getTripData(HttpSession session) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        resultMap.put("booking_list", booking_mapper.selectBookingList(user_seq));
        return resultMap;
    }
    
}
