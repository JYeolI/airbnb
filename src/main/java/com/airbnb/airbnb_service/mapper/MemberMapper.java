package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.house.HouseInfoVO;
import com.airbnb.airbnb_service.data.member.MemberInfoVO;
import com.airbnb.airbnb_service.data.member.MemberReportVO;
import com.airbnb.airbnb_service.data.member.MsgInfoVO;
import com.airbnb.airbnb_service.data.response.HostCheckoutVO;
import com.airbnb.airbnb_service.data.response.ProfileVO;
import com.airbnb.airbnb_service.data.response.WishViewResponseVO;

@Mapper
public interface MemberMapper {    
    //위시리스트
    public List<WishViewResponseVO> selectWishList(Integer user_seq);
    //메인 위시리스트
    public void insertWish(Integer user_seq, Integer house_seq, Integer order);
    public Integer selectWishOrderMax(Integer user_seq);
    public void deleteWish(Integer user_seq, Integer wish_seq);
    //프로필
    public ProfileVO selectMemberProfile(Integer member_seq);
    public Boolean isDupChkId(String id);
    public void insertMember(MemberInfoVO data);
    public MemberInfoVO selectLogin(String id, String pwd);
    //프로필 수정
    public List<String> selectMemberProfileLanguageList(Integer seq);
    public void updateMemberProfile(String mi_description, String mi_company, Integer mi_seq);
    public Boolean isDupChkMemberProfileAddress(Integer mi_seq);
    public List<Integer> isDupChkMemberProfileLanguage(Integer mi_seq);
    public void insertMemberProfileAddress(Integer mi_seq, Integer cc_seq, String mai_city, String mai_detail);
    public void updateMemberProfileAddress(Integer mi_seq, Integer cc_seq, String mai_city, String mai_detail);
    public void insertMemberProfileLanguage(Integer mi_seq, Integer cl_seq);
    public void deleteMemberProfileLanguage(Integer mi_seq, Integer cl_seq);
    //회원 신고
    public Integer isDupChkMemberReport(Integer mrpt_from_mi_seq, Integer mrpt_to_mi_seq);
    public void insertMemberReport(MemberReportVO data);
    //호스트 정보
    public List<HostCheckoutVO> selectHostCheckout(Integer seq);
    public List<HostCheckoutVO> selectHostCheckin(Integer seq);
    public List<HouseInfoVO> selectHostingHouseInfo(Integer seq, Boolean status);
    public List<MsgInfoVO> selectHostReviewMsg(Integer seq);
}
