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
@RequestMapping("/api/h")
public class HtempAPIController {
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
<<<<<<< HEAD
=======
        resultMap.put("searchHouseList",mapper.selectSearchHouseList(checkIn, checkOut, keyword, Guest, dog));
>>>>>>> b7e7e5f (test (work1_1 브랜치 삭제 예정))
        


        
        return resultMap;
    }
}
