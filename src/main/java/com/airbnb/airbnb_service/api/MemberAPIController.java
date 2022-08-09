package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.MemberMapper;

@RestController
@RequestMapping("/api")
public class MemberAPIController {
    @Autowired MemberMapper member_mapper;
    
    //위시리스트 위시리스트 숙소 조회
    @GetMapping("/wish")
    public Map<String, Object> getWishViewData(HttpSession session) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        resultMap.put("wishList", member_mapper.selectWishList(user_seq));

        return resultMap;
    }
}
