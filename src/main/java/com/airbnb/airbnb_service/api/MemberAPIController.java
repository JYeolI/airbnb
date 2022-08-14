package com.airbnb.airbnb_service.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.member.MemberInfoVO;
import com.airbnb.airbnb_service.data.response.ProfileHostingHouseVO;
import com.airbnb.airbnb_service.data.response.ProfileReviewVO;
import com.airbnb.airbnb_service.data.response.ProfileVO;
import com.airbnb.airbnb_service.mapper.HouseMapper;
import com.airbnb.airbnb_service.mapper.MemberMapper;
import com.airbnb.airbnb_service.mapper.ReviewMapper;

@RestController
@RequestMapping("/api/member")
public class MemberAPIController {
    @Autowired MemberMapper member_mapper;
    @Autowired ReviewMapper review_mapper;
    @Autowired HouseMapper house_mapper;

    //위시리스트 위시리스트 숙소 조회
    @GetMapping("/wish")
    public Map<String, Object> getWishViewData(HttpSession session) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        resultMap.put("wishList", member_mapper.selectWishList(user_seq));
        
        resultMap.put("status", true);
        resultMap.put("message", "위시리스트에 등록된 숙소 데이터가 조회되었습니다.");
        return resultMap;
    }

    //위시리스트 추가(하트클릭)
    @PutMapping("/wish")
    public Map<String, Object> putWish(HttpSession session, @RequestParam Integer house_seq) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        Integer order = member_mapper.selectWishOrderMax(user_seq);
        if(order==null){
            order = 1;
        }
        
        member_mapper.insertWish(user_seq, house_seq, order+1);
        
        resultMap.put("status", true);
        resultMap.put("message", "위시리스트에 추가되었습니다.");
        return resultMap;
    }

    //위시리스트 삭제(하트클릭)
    @DeleteMapping("/wish")
    public Map<String, Object> deleteWish(HttpSession session, @RequestParam Integer wish_seq) {
        Map<String,Object> resultMap=new LinkedHashMap<String, Object>();

        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 1;

        member_mapper.deleteWish(user_seq,wish_seq);
        
        resultMap.put("status", true);
        resultMap.put("message", "위시리스트에서 삭제되었습니다.");
        return resultMap;
    }

    //프로필(회원정보)
    @GetMapping("/profile")
    public Map<String, Object> getProfileData(@RequestParam Integer member_seq) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        // 조회할 회원 ##mi_status확인하고 내보내줘야함
        ProfileVO memberInfo = member_mapper.selectMemberProfile(member_seq);

        Integer status = memberInfo.getMember_status();
        if(status == 0){
            resultMap.put("memberInfo", memberInfo);
        }
        else if(status == 1){
            resultMap.put("memberInfo", "블라인드 된 회원입니다.");
        }

        // 호스트 등급 확인후 숙소조회 (0 호스트 아님)
        Integer grade = memberInfo.getHost_grade();
        if(grade == 1 ||grade == 2) {
            List<ProfileHostingHouseVO> houseList = house_mapper.selectHouseList(member_seq);
            resultMap.put("houseList", houseList);
        }

        // 후기 리스트 최신순 10개 먼저 조회 - 모두보기 클릭시 전체조회
        // houseReview - 내 숙소를 이용한 게스트들이 남긴 숙소후기 모아보기
        // profileReview - 내가 숙소를 이용하고 난 뒤 숙소의 호스트가 내 프로필에 남긴 후기
        Integer limit = 10;
        List<ProfileReviewVO> houseReviewList = review_mapper.selectHouseReviewList(member_seq,limit);
        List<ProfileReviewVO> profileReviewList = review_mapper.selectProfileReviewList(member_seq,limit);
        Integer house_rev_total_cnt = review_mapper.selectHouseReviewTotalCnt(member_seq);
        Integer profile_rev_total_cnt = review_mapper.selectProfileReviewTotalCnt(member_seq);
        
        resultMap.put("reviewListToHost", houseReviewList);
        resultMap.put("reviewListToGuest", profileReviewList);        
        resultMap.put("house_rev_total_cnt", house_rev_total_cnt);
        resultMap.put("profile_rev_total_cnt", profile_rev_total_cnt);
        
        // ##처리 이미지파일api쪽에서 겟할떄
        // if(member.getMimg_file() == null) { member.setMimg_file("default.png"); }
        // for(int i=0; i<reviewListToHosts.size(); i++) {
        //     if(reviewListToHosts.get(i).getWriter_img() == null) { reviewListToHosts.get(i).setMimg_file("default.png"); }
        // }
        // for(int i=0; i<reviewListToGuests.size(); i++) {
        //     if(reviewListToGuests.get(i).getWriter_img() == null) { reviewListToGuests.get(i).setWriter_img("default.png"); }
        // }
        
        resultMap.put("status", true);
        resultMap.put("message", "프로필 정보가 조회되었습니다.");
        return resultMap;
    }
    

    //회원가입시 아이디 중복검사
    @GetMapping("/join/chk")
    public Boolean getDupChkId(@RequestParam String id) {
        return member_mapper.isDupChkId(id);
    }

    //회원가입
    @PutMapping("/join")
    public Map<String, Object> putMemberJoinData(@RequestBody MemberInfoVO data) throws Exception {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        // data.setAi_pwd(AESAlgorithm.Encrypt(data.getAi_pwd()));        
        member_mapper.insertMember(data);
        resultMap.put("status", true);
        resultMap.put("message", "회원가입이 정상적으로 완료되었습니다.");
        return resultMap;
    }
    
}
