package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.SearchRequestVO;
import com.airbnb.airbnb_service.mapper.HTempMapper;

@RestController
@RequestMapping("/api/h")
public class HtempAPIController {
    @Autowired HTempMapper mapper;

    @PostMapping("/main/search")
    public Map<String,Object> postMainViewData(@RequestBody SearchRequestVO searchRequest, HttpSession session) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        
        // mapper.selectSearchHouseList(searchRequest, user.getMi_seq());
        resultMap.put("houseList", mapper.selectSearchHouseList(searchRequest, 1));
        resultMap.put("cateAmenityList", mapper.selectCategoryAmenityList());
        resultMap.put("cateLangList", mapper.selectCategoryLangList());
        
        return resultMap;
    }
}
