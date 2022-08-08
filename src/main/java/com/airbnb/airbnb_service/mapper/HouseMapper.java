package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.house.WishInfoVO;
import com.airbnb.airbnb_service.data.house.WishListVO;

@Mapper
public interface HouseMapper {
    public List<WishListVO> selectWichList(Integer seq);
    public WishInfoVO selectReviewCount(WishInfoVO data);
}
