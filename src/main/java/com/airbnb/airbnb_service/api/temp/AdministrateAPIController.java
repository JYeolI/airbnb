package com.airbnb.airbnb_service.api.temp;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.temp.AdministrateMapper;

@RestController
@RequestMapping("/api")
public class AdministrateAPIController {
    @Autowired AdministrateMapper mana_mapper;
    @GetMapping("/administrate")
    public Map<String, Object> getHouseAdministrate(
        @RequestParam @Nullable Integer house_seq
        ) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;
        if(house_seq == null) house_seq = 1;
        resultMap.put("house_list",mana_mapper.selectHouseAdministrate(user_seq));

        //수정하기버튼 눌렀을 때 동작
        resultMap.put("house_info",mana_mapper.selectHouseInfo(user_seq,house_seq));
        resultMap.put("img_list",mana_mapper.selectHouseImg(house_seq));
        resultMap.put("place_list",mana_mapper.selecthousePlace(house_seq));
        resultMap.put("monthly_list",mana_mapper.selectHouseMonthly(house_seq));
        resultMap.put("weekly_list",mana_mapper.selectHouseWeekly(house_seq));
        resultMap.put("amenity_list",mana_mapper.selectHouseAmenity(house_seq));

        return resultMap;
    }
}
