package com.airbnb.airbnb_service.mapper.temp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.request.BookingRequest;
import com.airbnb.airbnb_service.data.request.HouseReportRequestVO;
import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;

@Mapper
public interface TempMapper {
    public HouseFeeVO selectHouseFee(Integer house_seq);
    public List<HouseOptionVO> selectHouseWeeklyOption(Integer house_seq);
    public List<HouseOptionVO> selectHouseDailyOption(Integer house_seq);
    public List<HouseOptionVO> selectHouseMonthlyOption(Integer house_seq);
    public List<HouseOptionVO> selectHouseOptionView(Integer house_seq);
    public Integer selectBookingCnt(Integer house_seq, String dt);

    public void insertHouseReport(HouseReportRequestVO request);
    public Boolean selectHouseReportCnt(Integer user_seq, Integer house_seq);

    public void insertBookingInfo(BookingRequest.InfoVO info);
    public void insertBookingGuest(BookingRequest.GuestVO guest);
    public void insertBookingFee(BookingRequest.FeeVO fee);
}
