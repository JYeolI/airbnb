package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.booking.TripResponseVO;

@Mapper
public interface BookingMapper {
    public List<TripResponseVO> selectTripResponse(Integer seq);
}
