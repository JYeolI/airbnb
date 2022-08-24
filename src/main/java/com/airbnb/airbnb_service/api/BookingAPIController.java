package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.response.TripCountPageVO;
import com.airbnb.airbnb_service.mapper.BookingMapper;

@RestController
@RequestMapping("/api/booking")
public class BookingAPIController {
    @Autowired BookingMapper booking_mapper;

    // 여행 - 예약정보
    @GetMapping("/list/{period}")
    public Map<String, Object> getTripData(HttpSession session, @PathVariable String period, @RequestParam @Nullable Integer page) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;
        // Date today = new Date();

        TripCountPageVO tripPageCnt = booking_mapper.selectBookingPageCount(user_seq);
        Integer afterPageCnt = tripPageCnt.getAfterCnt();
        Integer beforePageCnt = tripPageCnt.getBeforeCnt();

        TripCountPageVO tripTotalCnt = booking_mapper.selectBookingCount(user_seq);
        Integer beforeTotalCnt = tripTotalCnt.getBeforeCnt();
        Integer afterTotalCnt = tripTotalCnt.getAfterCnt();

        if(page == null) page = 1;
        Integer pageCnt = (page-1)*10;

        Integer periodToInt;
        if(period.equalsIgnoreCase("before")) {
            periodToInt=1;
            resultMap.put("booking_reserved_PageCnt", beforePageCnt);
            resultMap.put("booking_reserved_TotalCnt", beforeTotalCnt);
            resultMap.put("booking_reserved_list", booking_mapper.selectBookingList(user_seq, periodToInt, pageCnt));
            return resultMap;
        }
        else if(period.equalsIgnoreCase("after")) { 
            periodToInt=2;
            resultMap.put("booking_checkout_PageCnt", afterPageCnt);
            resultMap.put("booking_checkout_TotalCnt", afterTotalCnt);
            resultMap.put("booking_checkout_list", booking_mapper.selectBookingList(user_seq, periodToInt, pageCnt));
            return resultMap;
        }
        else{            
            resultMap.put("status", false);
            resultMap.put("message", "error");
            return resultMap;
        }
    }
}
