package com.airbnb.airbnb_service.api.temp;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.temp.detail.HouseAndReviewCntVO;
import com.airbnb.airbnb_service.data.temp.detail.HouseDetailVO;
import com.airbnb.airbnb_service.data.temp.detail.HouseReviewPointVO;
import com.airbnb.airbnb_service.mapper.temp.detailMapper;

@RestController
@RequestMapping("/api/temp")
public class temp0810 {
    @Autowired detailMapper detail_mapper;
    
    //숙소 상세정보 호스트정보
    @GetMapping("/detail")
    @Transactional
    public Map<String, Object> getHouseDetailData(@RequestParam Integer house_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();

        HouseDetailVO houseDetail = detail_mapper.selectHouseDetail(house_seq);
        Integer host_seq = houseDetail.getHost_seq();


        // 날짜 침대 침실 정보 변화 환불날짜 계산
        resultMap.put("houseDeatil", houseDetail);        
        
        Integer houseReviewCnt = detail_mapper.selectHouseReviewCnt(house_seq);
        HouseAndReviewCntVO houseDetailCnt =  detail_mapper.selectHouseAndReviewCnt(host_seq);
        houseDetailCnt.setHouse_review_cnt(houseReviewCnt);
        resultMap.put("houseDetailCnt", houseDetailCnt);

        resultMap.put("imgList", detail_mapper.selectHouseImageList(house_seq));
        resultMap.put("langList", detail_mapper.selectHostLangList(host_seq));

        //편의시설 정보 10개 조회 후 
        resultMap.put("amenityList", detail_mapper.selectHouseAmenityList(house_seq, 10));

        resultMap.put("status", true);
        resultMap.put("message", "숙소 상세 항목들이 조회되었습니다.");

        return resultMap;
    }




    //숙소 후기 숙소 점수 호스트 전체후기개수
    @GetMapping("/review/list")
    @Transactional
    public Map<String, Object> getHouseReviewData(@RequestParam Integer house_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        //검색기능 없이 6개만 먼저 조회
        Integer limit = 6;
        String keyword = null;
        HouseReviewPointVO reviewPoint = detail_mapper.selectHouseReviewPoint(house_seq);
        if(reviewPoint==null){
            resultMap.put("reviewNullMsg", "아직 첫번째 후기가 등록되지 않았습니다.");

            resultMap.put("status", true);
            resultMap.put("message", "숙소 후기가 없습니다.");
            return resultMap;
        }
        else{
            resultMap.put("reviewPoint", reviewPoint);
            resultMap.put("reviewList", detail_mapper.selectHouseReview(house_seq, limit, keyword));

            resultMap.put("status", true);
            resultMap.put("message", "숙소 후기 6개 및 점수가 조회되었습니다.");
            return resultMap;
        }
    }

    //후기 모두보기 클릭시 동작
    @GetMapping("/review/all")
    public Map<String, Object> getHouseReviewAllData(@RequestParam Integer house_seq, @RequestParam @Nullable String keyword) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        Integer limit = 6;
        if(keyword == null) keyword = "";

        resultMap.put("reviewList", detail_mapper.selectHouseReview(house_seq, limit, keyword));
        resultMap.put("status", true);
        resultMap.put("message", "숙소 후기 전체가 조회되었습니다.");
        
        return resultMap;
    }
    
}
