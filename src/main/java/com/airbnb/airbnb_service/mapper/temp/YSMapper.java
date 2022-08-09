package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.temp.TripResponseVO;

@Mapper
public interface YSMapper {
    public List<TripResponseVO> selectTripResponse(Integer user_seq);
}
