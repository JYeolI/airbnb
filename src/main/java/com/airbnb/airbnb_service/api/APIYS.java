package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.house.WishInfoVO;
import com.airbnb.airbnb_service.mapper.BookingMapper;
import com.airbnb.airbnb_service.mapper.HouseMapper;

@RestController
@RequestMapping("/api")
public class APIYS {
    @Autowired BookingMapper book_mapper;
    @Autowired HouseMapper house_mapper;
    // 여행 예약
    @GetMapping("/trip_response")
    public Map<String, Object> getTripResponse(@RequestParam Integer seq) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
            resultMap.put("trip_list", book_mapper.selectTripResponse(seq));
        return resultMap;
    }
    // 위시리스트
    @GetMapping("/wish")
    public Map<String, Object> getWishList(@RequestParam Integer seq, WishInfoVO data) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
            resultMap.put("wish_list", house_mapper.selectWichList(seq));
            resultMap.put("rev_cnt", house_mapper.selectReviewCount(data));
        return resultMap;
    }
}

