package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.response.HouseAndReviewCntVO;
import com.airbnb.airbnb_service.data.response.HouseReviewPointVO;
import com.airbnb.airbnb_service.data.response.HouseReviewVO;
import com.airbnb.airbnb_service.data.response.ProfileReviewVO;

@Mapper
public interface ReviewMapper {
    //프로필
    public List<ProfileReviewVO> selectHouseReviewList(Integer member_seq, Integer limit);
    public List<ProfileReviewVO> selectProfileReviewList(Integer member_seq, Integer limit);
    public Integer selectHouseReviewTotalCnt(Integer member_seq);
    public Integer selectProfileReviewTotalCnt(Integer member_seq);

    //숙소상세    
    public List<HouseReviewVO> selectHouseReviewAndReply(Integer house_seq, Integer limit, String keyword);
    public HouseReviewPointVO selectHouseReviewPoint(Integer house_seq);
    public Integer selectHouseReviewCnt(Integer house_seq);
    public HouseAndReviewCntVO selectHouseAndReviewCnt(Integer host_seq);
}
