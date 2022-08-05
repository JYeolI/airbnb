package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.MainViewResponse;

@Mapper
public interface JyTempMapper {
    public List<MainViewResponse> selectSearchHouseList();
}
