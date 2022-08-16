package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.member.MemberInfoVO;
import com.airbnb.airbnb_service.data.temp.Htemp.HostingHouseListVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ProfileVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ReviewListToGuestVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ReviewListToHostVO;

@Mapper
public interface HtempMapper {
    public ProfileVO selectMemberProfile(Integer member_seq);
    public List<HostingHouseListVO> selectHouseList(Integer member_seq);
    public Integer selectReviewCountGuestToHost(Integer member_seq);
    public Integer selectReviewCountHostToGuest(Integer member_seq);
    public List<ReviewListToHostVO> selectReviewListGuestToHost(Integer member_seq);
    public List<ReviewListToGuestVO> selectReviewListHostToGuest(Integer member_seq);

    public Boolean isDupChkId(String id);
    public void insertMemberJoin(MemberInfoVO data);
}
