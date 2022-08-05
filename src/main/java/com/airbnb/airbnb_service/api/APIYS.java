package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.mapper.CategoryMapper;

@RestController
public class APIYS {
    @Autowired CategoryMapper cate_mapper;
    //카테고리바 값 불러오는 api
    @GetMapping("/ys/cate_bar")
    public Map<String, Object> getCateBarList() {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
            resultMap.put("Cate_bar_list", cate_mapper.SelectMainCatebar());
        return resultMap;
    }
    //cate_sort 값 불러오는 api
    @GetMapping("/ys/cate_sort")
    public Map<String, Object> getCateSortList() {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
            resultMap.put("Cate_sort_list", cate_mapper.SelctFilterCateSortList());
            return resultMap;
    }
}

