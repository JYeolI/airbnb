package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;

@Mapper
public interface temp0817 {
    public List<HouseOptionVO> selectHouseOption(Integer house_seq);
    public HouseFeeVO selectHouseFee(Integer house_seq);
}
