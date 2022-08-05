package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.MainViewResponse;
import com.airbnb.airbnb_service.data.SearchRequestVO;
import com.airbnb.airbnb_service.mapper.JyTempMapper;

@RestController
@RequestMapping("/api")
public class JYAPIController {
    @Autowired JyTempMapper mapper;


    // 메인화면 숙소 검색조회
    @PostMapping("/main/search")
    public Map<String,Object> getMainViewData(
        SearchRequestVO searchRequest
    ) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
<<<<<<< HEAD
=======
        resultMap.put("searchHouseList",mapper.selectSearchHouseList(checkIn, checkOut, keyword, Guest, dog));
        

>>>>>>> b7e7e5f (test (work1_1 브랜치 삭제 예정))

        //임시회원번호
        Integer user_seq =1;
        List<MainViewResponse> list = mapper.selectSearchHouseList(searchRequest, user_seq);        
        resultMap.put("searchList",list);
        
        return resultMap;
    }
}
