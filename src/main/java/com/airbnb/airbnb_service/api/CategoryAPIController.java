package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.airbnb.airbnb_service.mapper.CategoryMapper;


@RestController
@RequestMapping("/api/category")
public class CategoryAPIController {
    @Autowired CategoryMapper cate_mapper;
    
    //카테고리바 /api/category/bar
    //테이블넘버 1(위치특징cate_place)  3(상세유형cate_sort_detail)
    @GetMapping("/bar")
    public Map<String, Object> getCateBarList() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
            resultMap.put("cate_bar_list", cate_mapper.selectMainCatebar());
        return resultMap;
    }

    //카테고리 검색필터 /api/category/filter
    //sort_list  cs_seq, cs_content, cs_icon 숙소유형 아파트/주택/호텔/별채/독특한숙소/B&B
    //amenity_list ca_seq,ca_type,ca_content 편의시설
    //lang_list cl_seq,cl_content 호스트 언어능력
    @GetMapping("/filter")
    public Map<String, Object> getCateSortList() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
            resultMap.put("sort_list", cate_mapper.selectFilterCateSortList());
            resultMap.put("amenity_list", cate_mapper.selectFilterCateAmenityList());
            resultMap.put("lang_list", cate_mapper.selectFilterCateLangList());
            return resultMap;
    }
    
}