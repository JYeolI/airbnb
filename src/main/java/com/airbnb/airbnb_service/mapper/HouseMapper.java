package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.house.HouseAddressInfoVO;
import com.airbnb.airbnb_service.data.house.HouseFeeInfoVO;
import com.airbnb.airbnb_service.data.house.HouseGuestInfoVO;
import com.airbnb.airbnb_service.data.house.HouseImgVO;
import com.airbnb.airbnb_service.data.house.HouseInfoVO;
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
    public List<HouseAmenityVO> selectHouseAmenityList(Integer house_seq);
    public List<String> selectHouseImageList(Integer house_seq);
    public List<String> selectHostLangList(Integer host_seq);
    //호스팅
    public void insertHouseInfo(HouseInfoVO data);
    public void insertHouseImg(Integer house_seq, List<HouseImgVO> img_list);
    public void insertHouseGuest(HouseGuestInfoVO data);
    public void insertHouseAmenity(Integer house_seq, List<Integer> amenity_list);
    public void insertHouseFee(HouseFeeInfoVO data);
    public void insertHouseAddress(HouseAddressInfoVO data);
}
