package com.airbnb.airbnb_service.data.request;

import java.util.List;

import com.airbnb.airbnb_service.data.house.HouseAddressInfoVO;
import com.airbnb.airbnb_service.data.house.HouseFeeInfoVO;
import com.airbnb.airbnb_service.data.house.HouseGuestInfoVO;
import com.airbnb.airbnb_service.data.house.HouseImgVO;
import com.airbnb.airbnb_service.data.house.HouseInfoVO;

import lombok.Data;

@Data
public class HouseRequestVO {
    private HouseInfoVO house_info;
    private List<Integer> amenity_list;
    private HouseAddressInfoVO address_info;
    private HouseGuestInfoVO guest_info;
    private List<HouseImgVO> img_list;
    private HouseFeeInfoVO fee_info;
}
