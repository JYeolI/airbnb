package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.request.SearchRequestVO;
import com.airbnb.airbnb_service.data.response.MainViewResponseVO;

@Mapper
public interface HouseMapper {
    public List<MainViewResponseVO> selectSearchHouseList(SearchRequestVO searchRequest, Integer user_seq);
}
