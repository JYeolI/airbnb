package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.house.HouseAdministrateVO;
import com.airbnb.airbnb_service.data.house.HouseAmenityInfoVO;
import com.airbnb.airbnb_service.data.house.HouseImgVO;
import com.airbnb.airbnb_service.data.house.HouseMonthlyOptionVO;
import com.airbnb.airbnb_service.data.house.HousePlaceInfoVO;
import com.airbnb.airbnb_service.data.house.HouseWeeklyOptionVO;


@Mapper
public interface AdministrateMapper {
    public List<HouseAdministrateVO> selectHouseAdministrate(Integer user_seq);    
    public HouseAdministrateVO selectHouseInfo(Integer user_seq, Integer house_seq);    
    public List<HouseImgVO> selectHouseImg(Integer house_seq);
    public List<HousePlaceInfoVO> selecthousePlace(Integer house_seq);
    public List<HouseMonthlyOptionVO> selectHouseMonthly(Integer house_seq);
    public List<HouseWeeklyOptionVO> selectHouseWeekly(Integer house_seq);
    public List<HouseAmenityInfoVO> selectHouseAmenity(Integer house_seq);
}
