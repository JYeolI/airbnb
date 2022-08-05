package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.MainViewResponse;
import com.airbnb.airbnb_service.mapper.JyTempMapper;

@RestController
@RequestMapping("/api")
public class JYAPIController {
    @Autowired JyTempMapper mapper;


    // 메인화면 숙소 검색조회
    @GetMapping("/main/search")
    public Map<String,Object> getMainViewData(
        @RequestParam @Nullable String in_dt, 
        @RequestParam @Nullable String out_dt,
        @RequestParam @Nullable Integer cate_place, 
        @RequestParam @Nullable Integer lang,
        @RequestParam @Nullable Integer amenity, 
        @RequestParam @Nullable Integer guest, 
        @RequestParam @Nullable Integer dog,
        @RequestParam @Nullable Integer min, 
        @RequestParam @Nullable Integer max, 
        @RequestParam @Nullable Integer type,
        @RequestParam @Nullable Integer bed, 
        @RequestParam @Nullable Integer bedroom, 
        @RequestParam @Nullable Integer bathroom, 
        @RequestParam @Nullable Integer superhost
    ) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
<<<<<<< HEAD
=======
        resultMap.put("searchHouseList",mapper.selectSearchHouseList(checkIn, checkOut, keyword, Guest, dog));
        

>>>>>>> b7e7e5f (test (work1_1 브랜치 삭제 예정))

        //임시회원번호
        Integer user_seq =1;
        List<MainViewResponse> list = mapper.selectSearchHouseList(
            user_seq, in_dt, out_dt, cate_place, lang, amenity, 
            guest, dog, min, max, type, bed, bedroom, bathroom, superhost
        );
        resultMap.put("searchHouseList",list);
        
        return resultMap;
    }
}
