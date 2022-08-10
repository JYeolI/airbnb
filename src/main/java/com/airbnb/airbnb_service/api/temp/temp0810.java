package com.airbnb.airbnb_service.api.temp;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.temp.detailMapper;

@RestController
@RequestMapping("/api/temp")
public class temp0810 {
    @Autowired detailMapper detail_mapper;
    
    @GetMapping("/detail")
    public Map<String, Object> getHouseDetailData(@RequestParam Integer house_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        resultMap.put("status", true);
        resultMap.put("message", "숙소 상세 항목들이 조회되었습니다.");
        resultMap.put("houseDeatil", detail_mapper.selectHouseDetail(house_seq));
        resultMap.put("imgList", detail_mapper.selectHouseImageList(house_seq));
        resultMap.put("langList", detail_mapper.selectHostLangList(house_seq));
        resultMap.put("amenityList", detail_mapper.selectHouseAmenityList(house_seq));

        return resultMap;
    }

    //숙소 후기 숙소 점수 호스트 전체후기개수
    @GetMapping("/review/list")
    public Map<String, Object> getHouseReviewData(@RequestParam Integer house_seq, @RequestParam @Nullable String keyword) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        if(keyword==null)keyword="";
        resultMap.put("status", true);
        resultMap.put("message", "숙소 후기 및 점수가 조회되었습니다.");
        resultMap.put("reviewPoint", detail_mapper.selectHouseReviewPoint(house_seq));
        resultMap.put("houseDeatil", detail_mapper.selectHouseReview(house_seq, keyword));
        resultMap.put("houseAndReviewCnt", detail_mapper.selectHouseAndReviewCnt(house_seq));

        return resultMap;
    }
}
