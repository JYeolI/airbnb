package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.airbnb.airbnb_service.data.request.HouseRequestVO;
import com.airbnb.airbnb_service.data.request.SearchRequestVO;
import com.airbnb.airbnb_service.data.response.HouseDetailCntVO;
import com.airbnb.airbnb_service.data.response.HouseDetailVO;
import com.airbnb.airbnb_service.mapper.HouseMapper;
import com.airbnb.airbnb_service.mapper.ReviewMapper;

@RestController
@RequestMapping("/api")
public class HouseAPIController {
    @Autowired HouseMapper house_mapper;
    @Autowired ReviewMapper review_mapper;

    //메인 숙소조회
    @PostMapping("/house/list")
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
    @GetMapping("/house")
    @Transactional
    public Map<String, Object> getHouseDetailData(@RequestParam Integer house_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        HouseDetailVO houseDetail = house_mapper.selectHouseDetail(house_seq);
        Integer host_seq = houseDetail.getHost_seq();

        resultMap.put("houseDetail", houseDetail);        
        
        //null체크는 sql에서 IFNULL 0으로 totalReviewCnt는 group by??? 때문인지 IFNULL안됨
        Integer hostingHouseCnt = house_mapper.selectHostingHouseCnt(host_seq);
        Integer houseReviewCnt = review_mapper.selectHouseReviewCnt(house_seq);
        Integer totalReviewCnt = review_mapper.selectTotalReviewCnt(host_seq);
        if(totalReviewCnt==null) totalReviewCnt=0;
        HouseDetailCntVO houseDetailCnt = HouseDetailCntVO.builder()
                                        .hosting_house_cnt(hostingHouseCnt)
                                        .house_review_cnt(houseReviewCnt)
                                        .total_review_cnt(totalReviewCnt)
                                        .build();
        resultMap.put("houseDetailCnt", houseDetailCnt);
        resultMap.put("imgList", house_mapper.selectHouseImageList(house_seq));
        resultMap.put("langList", house_mapper.selectHostLangList(host_seq));
        resultMap.put("amenityList", house_mapper.selectHouseAmenityList(house_seq));

        resultMap.put("status", true);
        resultMap.put("message", "숙소 상세 항목들이 조회되었습니다.");

        return resultMap;
    }

    //호스팅 숙소 추가
    @PutMapping("/house")
    public Map<String, Object> putHostingSave(@RequestBody HouseRequestVO request, HttpSession session) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;
        request.getHouse_info().setHi_mi_seq(user_seq);

        house_mapper.insertHouseInfo(request.getHouse_info());
        Integer house_seq = request.getHouse_info().getHi_seq();

        request.getAddress_info().setHai_hi_seq(house_seq);
        request.getGuest_info().setHgi_hi_seq(house_seq);
        request.getFee_info().setHfi_hi_seq(house_seq);

        house_mapper.insertHouseImg(house_seq, request.getImg_list());
        house_mapper.insertHouseGuest(request.getGuest_info());
        house_mapper.insertHouseAmenity(house_seq, request.getAmenity_list());
        house_mapper.insertHouseFee(request.getFee_info());
        house_mapper.insertHouseAddress(request.getAddress_info());

        resultMap.put("status", true);
        resultMap.put("message", "숙소가 추가되였습니다.");

        return resultMap;
    }
}
