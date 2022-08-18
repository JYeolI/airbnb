package com.airbnb.airbnb_service.api.temp;
import java.text.SimpleDateFormat;
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

import com.airbnb.airbnb_service.data.response.BookingResponseVO;
import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;
import com.airbnb.airbnb_service.mapper.temp.TempMapper;

@RestController
@RequestMapping("/api/temp0816")
public class temp0816 {
    @Autowired TempMapper temp_mapper;

    @GetMapping("/test")
    public Map<String, Object> getOptionCalculator() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        // case 1번 문제사항
        // case 1번 케이스가 2개가 될 수 없도록 할인할증옵션 입력시 Validation필요!!
        // case 1번 케이스 추가 입력시 이미 존재하는 >> 1번 옵션정보 알려주고 수정하도록 권고

        // 사용자입력 house_seq = 1 in_dt = 2022-01-01 out_dt = 2022-01-05 
        // DB base_price = 100000
        // 최종출력형태         
        // #1
        // 2022-01-01 80000 -20
        // 2022-01-02 80000 -20
        // 2022-01-03 60000 -40
        // 2022-01-04 80000 -20
        // 2022-01-05 80000 -20
        // 기간 2022-01-01 ~ 2022-01-05 합산 380000

        // #2 날짜별 가격정보 및 할인할증옵션정보      
        // 2022-01-01 80000 -20
        // 2022-01-01 -20 할증옵션1 주기 매일
        // 2022-01-02 80000 -20
        // 2022-01-02 -20 할증옵션1 주기 매일
        // 2022-01-03 60000 -40
        // 2022-01-03 -20 할증옵션1 주기 매일
        // 2022-01-03 -20 할증옵션2 주기 매주
        // 2022-01-04 80000 -20
        // 2022-01-04 -20 할증옵션1 주기 매일
        // 2022-01-05 80000 -20
        // 2022-01-05 -20 할증옵션1 주기 매일

        // #3 현재출력형태로 가능한 표시
        // 2022-01-01 80000 -20 할증옵션1 주기 매일
        // 2022-01-02 80000 -20 할증옵션1 주기 매일
        // 2022-01-03 80000 -20 할증옵션1 주기 매일
        // 2022-01-03 80000 -20 할증옵션2 주기 매주
        // 2022-01-04 80000 -20 할증옵션1 주기 매일
        // 2022-01-05 80000 -20 할증옵션1 주기 매일

        //TEST입력값
        Integer house_seq = 1;
        String in_dt = "2022-08-20";
        String out_dt = "2022-08-27";

        //@RequestBody BookingRequestVO request
        // Integer house_seq = request.getHouse_seq();
        // String in_dt = request.getIn_dt();
        // String out_dt = request.getOut_dt();

        //사용자 입력 날짜간의 날짜들을 배열로 담을 리스트 생성
        List<Date> duration = new ArrayList<>();

        //체크인아웃 날짜 변환 에러처리
        try {
            duration = makeDateList(makeCalendar(in_dt),makeCalendar(out_dt));
        } catch (Exception e) {
            resultMap.put("status", false);
            resultMap.put("error", "ERR_INVALID_IN_OUT_DATE");
            return resultMap;
        }
        
        //DB에서 가격 계산을 위한 요금정보 가져옴
        //(int)originPrice 기본가격
        HouseFeeVO houseFeeInfo = temp_mapper.selectHouseFee(house_seq);
        Integer originPrice = houseFeeInfo.getBase_price();

        //DB에서 옵션 날짜 리스트 가져오고 Null체크
        List<HouseOptionVO> optionList = new ArrayList<>();
        optionList = temp_mapper.selectHouseOption(house_seq);


        
        if(optionList.size()==0){
            resultMap.put("status", true);
            resultMap.put("message", "해당 숙소에 조회된 할인할증정보가 없습니다.");
            return resultMap;
        }

        //최종적으로 resultMap맵에 답을 케이스별 리스트 생성
        //프론트에서 떼어서 쓰기편하려면 일단 VO로 list를 구성해서 값을 넣는다
        List<BookingResponseVO.caseEveryDay> caseEveryDay = new ArrayList<>();
        List<BookingResponseVO.caseEveryWeek> caseEveryWeek = new ArrayList<>();
        List<BookingResponseVO.caseEveryMonth> caseEveryMonth = new ArrayList<>();
        
        //DB 옵션정보 가져와서 for문으로 하나씩 체크
        for(HouseOptionVO option : optionList){
            //switch문으로 cycle별 분기
            //(int)cycle [0:적용없음 1:매일 2:매주(지정날짜와 같은요일) 3:매달(지정일)]
            //(int)rate 할인할증옵션 비율(음/양의 정수)
            //(int)calculatedPrice 할인할증률을 계산한 가격
            Integer cycle = option.getOption_cycle();
            Integer rate = option.getOption_rate();
            Integer calculatedPrice = (originPrice*(100+rate)/100);
            switch(cycle) {
                case 1: 
                    //주기가 매일인 경우 모든 기간에 항상 적용(중복적용됨) 
                    for(Date dayOfDuration : duration){               
                        //(int)cycle주기정보 (int)rate할인할증율
                        //(str)optionDate 사용자가 입력한 기간 중 조건에 해당하는 날짜
                        //(int)calculatedPrice 할인할증률을 계산한 가격
                        String optionDate = makeFormatDate(dayOfDuration);
                        // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate);
                        BookingResponseVO.caseEveryDay everyDay = BookingResponseVO.caseEveryDay.builder()
                                                                                                .cycle(cycle)
                                                                                                .optionDate(optionDate)
                                                                                                .calculatedPrice(calculatedPrice)
                                                                                                .rate(rate)
                                                                                                .build();
                                                                                                caseEveryDay.add(everyDay);
                    }
                    break;
                case 2:
                    //사용자가 입력한 기간에서 옵션정보의 날짜의 요일을 비교해서 겹치는 날이 있는지 체크
                    for(Date dayOfDuration : duration){
                        //weekOfOption 옵셩정보 개개의 요일값
                        //weekOfDuration 사용자 입력기간 중 하루하루 요일값
                        Integer weekOfOption = option.getOption_date().getDay();
                        Integer weekOfDuration = dayOfDuration.getDay();

                        //사용자 입력기간중 개별 날짜의 요일값과 할증정보의 요일값을 비교 후 겹칠 때
                        if(weekOfDuration==weekOfOption){
                            //(str)optionDate 사용자가 입력한 기간 중 조건에 해당하는 날짜
                            //(int)cycle주기정보 (int)rate할인할증율
                            //(int)weekOfOption옵션의요일정보 (str)weekOfDay요일영어문자열
                            //(int)calculatedPrice 할인할증률을 계산한 가격
                            String weekOfDay = makeToStringWeekOfDay(weekOfOption);
                            String optionDate = makeFormatDate(dayOfDuration);
                            // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate+","+weekOfOption+","+weekOfDay);
                            BookingResponseVO.caseEveryWeek everyWeek = BookingResponseVO.caseEveryWeek.builder()
                                                                                                        .cycle(cycle)
                                                                                                        .optionDate(optionDate)
                                                                                                        .calculatedPrice(calculatedPrice)
                                                                                                        .rate(rate)
                                                                                                        .weekOfOption(weekOfOption)
                                                                                                        .weekOfDay(weekOfDay)
                                                                                                        .build();
                                                                                                        caseEveryWeek.add(everyWeek);
                        }
                    }
                    break;
                case 3:
                    for(Date dayOfDuration : duration){
                        //dateOfOption 옵셩정보 개개의 일자
                        //dateOfDuration 사용자 입력기간 중 하루하루 일자
                        Integer dateOfOption = option.getOption_date().getDate();
                        Integer dateOfDuration = dayOfDuration.getDate();
                        if(dateOfOption==dateOfDuration){
                            //(int)cycle주기정보 (int)rate할인할증율
                            //(str)optionDate 사용자가 입력한 기간 중 조건에 해당하는 날짜
                            //(int)calculatedPrice 할인할증률을 계산한 가격
                            String optionDate = makeFormatDate(dayOfDuration);
                            // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate);
                            BookingResponseVO.caseEveryMonth everyMonth = BookingResponseVO.caseEveryMonth.builder()
                                                                                                        .cycle(cycle)
                                                                                                        .optionDate(optionDate)
                                                                                                        .calculatedPrice(calculatedPrice)
                                                                                                        .rate(rate)
                                                                                                        .build();
                                                                                                        caseEveryMonth.add(everyMonth);
                        }
                    }
                    break;
                default: 
                    resultMap.put("status", false);
                    resultMap.put("error", "ERR_INVALID_CYCLE");
                    break;
            }
        }

        resultMap.put("optionList", optionList);
        resultMap.put("houseFeeInfo", houseFeeInfo);
        resultMap.put("caseEveryDay", caseEveryDay);
        resultMap.put("caseEveryWeek", caseEveryWeek);
        resultMap.put("caseEveryMonth", caseEveryMonth);
        resultMap.put("status", true);
        resultMap.put("message", "해당 기간에 계산된 할인할증정보입니다.");
        return resultMap;
    }
    

    
    //기간계산/날짜비교를 위해 getTimeInMillis로 숫자로 변경하기위해 캘린더타입으로 변환
    public static Calendar makeCalendar(String date){
        Calendar calendar = Calendar.getInstance();
        String[] splitDate = date.split("-");
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
    //시작날짜부터 1일씩 더해가면서 종료날짜까지 배열에 추가하여 배열을 반환
    public static List<Date> makeDateList(Calendar in, Calendar out){
        List<Date> dateList = new ArrayList<>();
        dateList.add(in.getTime());
        while(in.getTimeInMillis() < out.getTimeInMillis()) {
            in.add(Calendar.DATE, 1);
            dateList.add(in.getTime());
        }
        return dateList;
    }
    //Date타입 getDay를 통해 떼어낸 (int)요일값을 (str)문자열로 변환
    //편의성측면에서 같이 보내줌
    public static String makeToStringWeekOfDay(int i){
        String weekOfDay;
        switch(i) {
            case 0: weekOfDay="Sunday"; break;
            case 1: weekOfDay="Monday"; break;
            case 2: weekOfDay="Tuesday"; break;
            case 3: weekOfDay="Wednsday"; break;
            case 4: weekOfDay="Thursday"; break;
            case 5: weekOfDay="Friday"; break;
            default : weekOfDay="Saturday"; break;
        }
        return weekOfDay;
    }
    //Date타입 날짜를 (Str)YYYY-MM-DD형태로 재변환
    public static String makeFormatDate(Date date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
        String strDate = simpleDateFormat.format(date);
        return strDate;
    }
}
