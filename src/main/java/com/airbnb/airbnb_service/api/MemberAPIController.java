package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        
        resultMap.put("status", true);
        resultMap.put("message", "위시리스트에 등록된 숙소 데이터가 조회되었습니다.");
        return resultMap;
    }

    @PutMapping("/wish")
    public Map<String, Object> putWish(HttpSession session, @RequestParam Integer house_seq) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        Integer order = member_mapper.selectWishOrderMax(user_seq);
        if(order==null){
            order = 1;
        }
        
        member_mapper.insertWish(user_seq, house_seq, order);
        
        resultMap.put("status", true);
        resultMap.put("message", "위시리스트에 추가되었습니다.");
        return resultMap;
    }

    @DeleteMapping("/wish")
    public Map<String, Object> deleteWish(HttpSession session, @RequestParam Integer wish_seq) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();

        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        member_mapper.deleteWish(user_seq,wish_seq);
        
        resultMap.put("status", true);
        resultMap.put("message", "위시리스트에서 삭제되었습니다.");
        return resultMap;
    }
}
