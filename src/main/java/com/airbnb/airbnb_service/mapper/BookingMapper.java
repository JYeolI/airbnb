package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.request.BookingRequest;
import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;
import com.airbnb.airbnb_service.data.response.TripCountPageVO;
import com.airbnb.airbnb_service.data.response.TripResponseVO;

@Mapper
public interface BookingMapper {
    public List<TripResponseVO> selectBookingList(Integer user_seq, Integer period, Integer offset);
    public TripCountPageVO selectBookingCount(Integer seq);
    public TripCountPageVO selectBookingPageCount(Integer seq);

    public HouseFeeVO selectHouseFee(Integer house_seq);
    public List<HouseOptionVO> selectHouseOptionView(Integer house_seq);
    public Integer selectBookingCnt(Integer house_seq, String dt);
    public void insertBookingInfo(BookingRequest.InfoVO info);
    public void insertBookingGuest(BookingRequest.GuestVO guest);
    public void insertBookingFee(BookingRequest.FeeVO fee);
}
