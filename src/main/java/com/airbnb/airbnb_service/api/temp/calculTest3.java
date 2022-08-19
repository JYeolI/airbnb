package com.airbnb.airbnb_service.api.temp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.response.CalculatorVO;
import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;
import com.airbnb.airbnb_service.mapper.temp.TempMapper;

@RestController
@RequestMapping("/api/cal3")
public class calculTest3 {
    @Autowired TempMapper temp_mapper;

    @GetMapping("/test")
    public Map<String, Object> getTest() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();

        //TEST입력값
        Integer house_seq = 1;
        String in_dt = "2023-01-01";
        String out_dt = "2023-01-05";
        Boolean sumPrice = true;
        Integer sum_price = 0;

        List<CalculatorVO> calList = new ArrayList<>();
        List<HouseOptionVO> optList = temp_mapper.selectHouseOptionView(house_seq);

        try {   
            calList = makeObjectList(makeCalendar(in_dt),makeCalendar(out_dt));
            // calList = makeDateObjectList(in_date, out_date);
        } catch (Exception e) {
            resultMap.put("status", false); //유효하지 않은 날짜 형식 체크
            resultMap.put("error", "ERR_INVALID_IN_OUT_DATE");
            return resultMap;
        }
        if(calList==null){   //날짜 역전 체크인>체크아웃
            resultMap.put("status", false);
            resultMap.put("error", "ERR_REVERSAL_IN_OUT_DATE");
            return resultMap;
        }

        HouseFeeVO houseFee = temp_mapper.selectHouseFee(house_seq);
        Integer originPrice = houseFee.getBase_price();  
        for(CalculatorVO cal: calList){
            Date dt = cal.getDay_of_duration();
            for(HouseOptionVO opt:optList){
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
    //캘린더 타입으로 변환한 두 날짜를 getTimeInMillis로 숫자로 환산후 계산하여
    //시작날짜부터 1일씩 더해가면서 종료날짜까지 객체에 추가하여 반환
    public List<CalculatorVO> makeObjectList(Calendar in, Calendar out){
        if(in.getTimeInMillis() > out.getTimeInMillis()){return null;}
        List<CalculatorVO> calList =  new ArrayList<>();
        //마지막 날짜(out)도 객체에 추가하기 위해 밀리세컨즈에 1더해줌
        while(in.getTimeInMillis() < out.getTimeInMillis()+1) {
            CalculatorVO cal = new CalculatorVO();
            cal.setDay_of_duration(in.getTime());
            cal.setSum_rate(0);
            in.add(Calendar.DATE, 1);
            calList.add(cal);
        }        
        return calList;
    }
    //Date타이을 캘린더로 변환해서 계산하고 Date로 재변환해서 객체에 담아서 반환
    public List<CalculatorVO> makeDateObjectList(Date in, Date out){
        if(in.after(out)){return null;}
        Calendar calendar = Calendar.getInstance();
        List<CalculatorVO> calList =  new ArrayList<>();
        while(in.equals(out)) {
            CalculatorVO cal = new CalculatorVO();
            cal.setDay_of_duration(in);
            cal.setSum_rate(0);
            
            calendar.setTime(in);
            calendar.add(Calendar.DATE, 1);
            in = new Date(calendar.getTimeInMillis());
            calList.add(cal);   
        }        
        return calList;
    }

}
