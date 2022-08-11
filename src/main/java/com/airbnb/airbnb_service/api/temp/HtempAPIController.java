package com.airbnb.airbnb_service.api.temp;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.temp.Htemp.HostingHouseListVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ProfileVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ReviewListToGuestVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ReviewListToHostVO;
import com.airbnb.airbnb_service.mapper.temp.HtempMapper;

@RestController
@RequestMapping("/api/h")
public class HtempAPIController {
    @Autowired HtempMapper H_mapper;
    @GetMapping("/profile")
    public Map<String, Object> getHProfile(@RequestParam Integer member_seq) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        // 조회할 회원
        ProfileVO member = H_mapper.selectMemberProfile(member_seq);
        // 회원 null 이미지 처리
        if(member.getMimg_file() == null) { member.setMimg_file("default.png"); }

        // 호스트 숙소 리스트
        List<HostingHouseListVO> houseList = H_mapper.selectHouseList(member_seq);

        // 후기 리스트
        List<ReviewListToHostVO> reviewListToHosts = H_mapper.selectReviewListGuestToHost(member_seq);
        List<ReviewListToGuestVO> reviewListToGuests = H_mapper.selectReviewListHostToGuest(member_seq);
        for(int i=0; i<reviewListToHosts.size(); i++) {
            if(reviewListToHosts.get(i).getMimg_file() == null) { reviewListToHosts.get(i).setMimg_file("default.png"); }
        }
        for(int i=0; i<reviewListToGuests.size(); i++) {
            if(reviewListToGuests.get(i).getWriter_img() == null) { reviewListToGuests.get(i).setWriter_img("default.png"); }
        }
        if(member.getMi_host_grade() == 1 && member.getMi_host_grade() == 2) {
            resultMap.put("houseList", houseList);
        }
        resultMap.put("profileList", member);
        
        resultMap.put("reviewCountToHost", H_mapper.selectReviewCountGuestToHost(member_seq));
        resultMap.put("reviewCountToGuest", H_mapper.selectReviewCountHostToGuest(member_seq));
        resultMap.put("reviewListToHost", reviewListToHosts);
        resultMap.put("reviewListToGuest", reviewListToGuests);
        return resultMap;
    }
}
