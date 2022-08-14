package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.request.SearchRequestVO;
import com.airbnb.airbnb_service.data.response.HouseAmenityVO;
import com.airbnb.airbnb_service.data.response.HouseDetailVO;
import com.airbnb.airbnb_service.data.response.MainViewResponseVO;
import com.airbnb.airbnb_service.data.response.ProfileHostingHouseVO;

@Mapper
public interface HouseMapper {
    //메인
    public List<MainViewResponseVO> selectSearchHouseList(SearchRequestVO request, Integer user_seq);
    //프로필
    public List<ProfileHostingHouseVO> selectHouseList(Integer member_seq);
    //숙소상세
    public HouseDetailVO selectHouseDetail(Integer house_seq);
    public List<HouseAmenityVO> selectHouseAmenityList(Integer house_seq, Integer limit);
    public List<String> selectHouseImageList(Integer house_seq);
    public List<String> selectHostLangList(Integer host_seq);
}
