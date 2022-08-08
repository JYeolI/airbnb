package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.MainViewResponseVO;
import com.airbnb.airbnb_service.data.SearchRequestVO;
import com.airbnb.airbnb_service.data.WishViewResponseVO;

@Mapper
public interface HouseMapper {
    public List<MainViewResponseVO> selectSearchHouseList(SearchRequestVO searchRequest, Integer user_seq);
    public List<WishViewResponseVO> selectWishList(Integer user_seq);
}
