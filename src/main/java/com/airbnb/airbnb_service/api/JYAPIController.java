package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.JyTempMapper;

@RestController
@RequestMapping("/api")
public class JYAPIController {
    @Autowired JyTempMapper mapper;

    @GetMapping("/main/search")
    public Map<String,Object> getMainViewData(
        @RequestParam @Nullable String keyword,        
        @RequestParam @Nullable Integer checkIn,
        @RequestParam @Nullable Integer checkOut,
        @RequestParam @Nullable Integer Guest,
        @RequestParam @Nullable Integer dog
    ) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        resultMap.put("searchHouseList",mapper.selectSearchHouseList());
        


        
        return resultMap;
    }
}
