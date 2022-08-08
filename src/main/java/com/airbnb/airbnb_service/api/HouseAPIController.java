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
    @PostMapping("/")
    public Map<String,Object> postMainViewData(@RequestBody SearchRequestVO searchRequest, HttpSession session) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        resultMap.put("houseList", house_mapper.selectSearchHouseList(searchRequest, user_seq));
        System.out.println(searchRequest);
        return resultMap;
    }
}
