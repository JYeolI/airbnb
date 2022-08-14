package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.request.SearchRequestVO;
import com.airbnb.airbnb_service.data.response.HouseAndReviewCntVO;
import com.airbnb.airbnb_service.data.response.HouseDetailVO;
import com.airbnb.airbnb_service.mapper.HouseMapper;
import com.airbnb.airbnb_service.mapper.ReviewMapper;

@RestController
@RequestMapping("/api/house")
public class HouseAPIController {
    @Autowired HouseMapper house_mapper;
    @Autowired ReviewMapper review_mapper;

    //메인 숙소조회
    @PostMapping("/list")
    public Map<String,Object> postMainViewData(@RequestBody SearchRequestVO request, HttpSession session) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        resultMap.put("status", true);
        resultMap.put("message", "숙소 데이터가 조회되었습니다.");
        resultMap.put("houseList", house_mapper.selectSearchHouseList(request, user_seq));
        return resultMap;
    }
    
    //숙소상세 숙소정보 호스트정보
    @GetMapping("/")
    @Transactional
    public Map<String, Object> getHouseDetailData(@RequestParam Integer house_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        HouseDetailVO houseDetail = house_mapper.selectHouseDetail(house_seq);
        Integer host_seq = houseDetail.getHost_seq();


        // 날짜 침대 침실 정보 변화 환불날짜 계산
        resultMap.put("houseDeatil", houseDetail);        
        
        Integer houseReviewCnt = review_mapper.selectHouseReviewCnt(house_seq);
        HouseAndReviewCntVO houseDetailCnt =  review_mapper.selectHouseAndReviewCnt(host_seq);
        houseDetailCnt.setHouse_review_cnt(houseReviewCnt);
        resultMap.put("houseDetailCnt", houseDetailCnt);

        resultMap.put("imgList", house_mapper.selectHouseImageList(house_seq));
        resultMap.put("langList", house_mapper.selectHostLangList(host_seq));

        //편의시설 정보 10개 조회 후 
        resultMap.put("amenityList", house_mapper.selectHouseAmenityList(house_seq, 10));

        resultMap.put("status", true);
        resultMap.put("message", "숙소 상세 항목들이 조회되었습니다.");

        return resultMap;
    }

}