package com.airbnb.airbnb_service.api.temp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.airbnb.airbnb_service.data.request.BookingRequest;
import com.airbnb.airbnb_service.data.request.CalendarRequestVO;
import com.airbnb.airbnb_service.data.request.HouseReportRequestVO;
import com.airbnb.airbnb_service.data.response.CalculatorVO;
import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;
import com.airbnb.airbnb_service.mapper.temp.TempMapper;

@RestController
public class calculator {
    @Autowired TempMapper temp_mapper;

    @PostMapping("/api/booking/calendar")
    public Map<String, Object> postBookinCalendar(@RequestBody CalendarRequestVO request) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();

        Integer house_seq = request.getHouse_seq();
        String in_dt = request.getIn_dt();
        String out_dt = request.getOut_dt();
        Integer sum_price = 0;

        List<CalculatorVO> calList = new ArrayList<>();
        List<HouseOptionVO> optList = temp_mapper.selectHouseOptionView(house_seq);
        
        try {   
            Calendar in = makeCalendar(in_dt);
            Calendar out= makeCalendar(out_dt);
            resultMap.put("1", in);
            resultMap.put("2", out);
            
            if(in.getTimeInMillis() > out.getTimeInMillis()){
                resultMap.put("status", false);
                resultMap.put("error", "ERR_REVERSAL_IN_OUT_DATE");
                return resultMap;
            }
            //마지막 날짜(out)도 객체에 추가하기 위해 밀리세컨즈에 1더해줌
            while(in.getTimeInMillis() < out.getTimeInMillis()+1) {
                CalculatorVO cal = new CalculatorVO();
                cal.setDay_of_duration(in.getTime());
                cal.setSum_rate(0);
                Integer bookingCnt = temp_mapper.selectBookingCnt(house_seq, in_dt); //예약현황(특정일 예약 수)
                cal.setBooking_cnt(bookingCnt);
                in.add(Calendar.DATE, 1);
                calList.add(cal);
            }
        } catch (Exception e) {
            resultMap.put("status", false); //유효하지 않은 날짜 형식 체크
            resultMap.put("error", "ERR_INVALID_IN_OUT_DATE");
            return resultMap;
        }

        HouseFeeVO houseFee = temp_mapper.selectHouseFee(house_seq);
        Integer originPrice = houseFee.getBase_price();  
        for(CalculatorVO cal: calList){
            Date dt = cal.getDay_of_duration();
            Integer bookingCnt = cal.getBooking_cnt();
            for(HouseOptionVO opt:optList){
                if(bookingCnt != 0) break;
                if(dt.after(opt.getOption_end_dt())){ break; }  //할인할증종료일이 체크중일 날짜보다 후면 이 옵션 건너뛰기
                switch(opt.getCycle_no()) {
                    case 1: //DailyOption
                        cal.setSum_rate(opt.getOption_rate());
                        cal.setDay_option_seq(opt.getOption_seq());
                        break;
                    case 2: //WeeklyOption
                        if(dt.getDay()==opt.getOption_day()){  //할증할인률 적용은 중복될수있으니 더해줌
                            cal.setSum_rate(cal.getSum_rate()+opt.getOption_rate());
                            cal.setWeek_option_seq(opt.getOption_seq());
                        }
                        break;
                    case 3: //MonthlyOption
                        if(dt.getDate()==opt.getOption_day()){  //할증할인률 적용은 중복될수있으니 더해줌
                            cal.setSum_rate(cal.getSum_rate()+opt.getOption_rate());
                            cal.setMonth_option_seq(opt.getOption_seq());
                        }
                        break;
                    default: //cycle 오류값 체크 정상값[1,2,3]
                        resultMap.put("status", false);
                        resultMap.put("error", "ERR_INVALID_CYCLE_NUMBER");
                        return resultMap;
                }    
            }            
            //할인할증률 계산이 끝나고 가격계산
            Integer calculatedPrice = originPrice*(100+cal.getSum_rate())/100;
            cal.setCalculated_price(calculatedPrice);
            sum_price += calculatedPrice;
        }
        houseFee.setSum_price(sum_price);
        resultMap.put("houseFee", houseFee);
        resultMap.put("optionList", optList);
        resultMap.put("calculatedPrice", calList);
        resultMap.put("status", true);
        resultMap.put("message", "입력 기간에 대한 숙소 가격 정보입니다.");

        return resultMap;
    }
    
    //String을 Calendar타입으로
    public Calendar makeCalendar(String strDt){
        Calendar calendar = Calendar.getInstance();
        String[] splitDate = strDt.split("-");
        calendar.set(Calendar.YEAR, Integer.parseInt(splitDate[0]));
        calendar.set(Calendar.MONTH, Integer.parseInt(splitDate[1])-1);
        calendar.set(Calendar.DATE, Integer.parseInt(splitDate[2]));
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        
        return calendar;
    }

    
    @Transactional
    @PostMapping("/api/booking")
    public Map<String, Object> postBooking(
            HttpSession session,
            @RequestBody BookingRequest request
        ) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        
        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 2;

        request.getInfoVO().setGuest_seq(user_seq);

        temp_mapper.insertBookingInfo(request.getInfoVO());

        //generated key 받아와서 세팅
        Integer booking_seq = request.getInfoVO().getBi_seq();
        request.getFeeVO().setBooking_seq(booking_seq);
        request.getGuestVO().setBooking_seq(booking_seq);
        System.out.println(booking_seq);

        temp_mapper.insertBookingFee(request.getFeeVO());
        temp_mapper.insertBookingGuest(request.getGuestVO());

        return resultMap;
    }

    
    @PostMapping("/api/house/report")
    public Map<String, Object> postHouseReport(HttpSession session, @RequestBody HouseReportRequestVO request) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        // MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        // Integer user_seq = user.getMi_seq();
        Integer user_seq = 2;
        Integer house_seq = request.getHouse_seq();

        //중복 신고 여부 확인
        Boolean dupReport = temp_mapper.selectHouseReportCnt(user_seq, house_seq);
        if(!dupReport){
            resultMap.put("status", false);
            resultMap.put("error", "ERR_DUPLICATED_HOUSE_REPORT");
            resultMap.put("message", "이미 신고한 숙소입니다.");
            return resultMap;
        }

        request.setUser_seq(user_seq);
        temp_mapper.insertHouseReport(request);

        resultMap.put("status", true);
        resultMap.put("message", "숙소신고가 완료되었습니다.");
        return resultMap;
    }
}
