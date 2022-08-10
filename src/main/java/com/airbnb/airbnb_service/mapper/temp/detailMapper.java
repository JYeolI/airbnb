package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.temp.detail.HouseAmenityVO;
import com.airbnb.airbnb_service.data.temp.detail.HouseAndReviewCntVO;
import com.airbnb.airbnb_service.data.temp.detail.HouseDetailVO;
import com.airbnb.airbnb_service.data.temp.detail.HouseReviewPointVO;
import com.airbnb.airbnb_service.data.temp.detail.HouseReviewVO;

@Mapper
public interface detailMapper {
    public HouseDetailVO selectHouseDetail(Integer house_seq);
    public List<HouseReviewVO> selectHouseReview(Integer house_seq, String keyword);
    public List<HouseAmenityVO> selectHouseAmenityList(Integer house_seq);
    public HouseReviewPointVO selectHouseReviewPoint(Integer house_seq);
    public HouseAndReviewCntVO selectHouseAndReviewCnt(Integer house_seq);
    public List<String> selectHouseImageList(Integer house_seq);
    public List<String> selectHostLangList(Integer house_seq);
}
