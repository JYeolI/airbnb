package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.temp.TripResponseVO;

@Mapper
public interface tempTripMapper {
    public List<TripResponseVO> selectTripResponse(Integer seq);
    
}
