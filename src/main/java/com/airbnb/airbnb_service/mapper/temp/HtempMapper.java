package com.airbnb.airbnb_service.mapper.temp;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.temp.Htemp.HostingHouseListVO;
import com.airbnb.airbnb_service.data.temp.Htemp.ProfileVO;

@Mapper
public interface HtempMapper {
    public ProfileVO selectMemberProfile(Integer member_seq);
    public HostingHouseListVO selectHouseList(Integer member_seq);
}
