package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.response.HouseReviewPointVO;
import com.airbnb.airbnb_service.mapper.ReviewMapper;

@RestController
@RequestMapping("/api/review")
public class ReviewAPIController {
    @Autowired ReviewMapper review_mapper;
    
    //숙소상세 후기 숙소 점수 호스트 전체후기개수
    @GetMapping("/list")
    @Transactional
    public Map<String, Object> getHouseReviewData(@RequestParam Integer house_seq, @Nullable Integer limit, @Nullable String keyword) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        //limit null일시 전체조회
        HouseReviewPointVO reviewPoint = review_mapper.selectHouseReviewPoint(house_seq);
        if(reviewPoint==null){
            resultMap.put("reviewNullMsg", "아직 첫번째 후기가 등록되지 않았습니다.");

            resultMap.put("status", true);
            resultMap.put("message", "숙소 후기가 없습니다.");
            return resultMap;
        }
        else{
            resultMap.put("reviewPoint", reviewPoint);
            resultMap.put("reviewList", review_mapper.selectHouseReviewAndReply(house_seq, limit, keyword));

            resultMap.put("status", true);
            if(keyword != null){
                resultMap.put("keyword", keyword);
            }
            if(limit != null){
                resultMap.put("message", "숙소 후기 "+limit+"개 및 점수가 조회되었습니다.");
            }
            else {
                resultMap.put("message", "숙소 후기 전체 및 점수가 조회되었습니다.");
            }
            return resultMap;
        }
    }    
}
