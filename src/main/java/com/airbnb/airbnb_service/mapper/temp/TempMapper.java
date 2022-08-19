package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;

@Mapper
public interface TempMapper {
    public HouseFeeVO selectHouseFee(Integer house_seq);
    public List<HouseOptionVO> selectHouseWeeklyOption(Integer house_seq);
    public List<HouseOptionVO> selectHouseDailyOption(Integer house_seq);
    public List<HouseOptionVO> selectHouseMonthlyOption(Integer house_seq);
    public List<HouseOptionVO> selectHouseOptionView(Integer house_seq);
}
