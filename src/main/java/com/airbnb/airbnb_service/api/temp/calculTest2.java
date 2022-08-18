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

import com.airbnb.airbnb_service.data.response.CalculatorVO;
import com.airbnb.airbnb_service.data.response.HouseFeeVO;
import com.airbnb.airbnb_service.data.response.HouseOption2VO;
import com.airbnb.airbnb_service.data.response.HouseOptionVO;
import com.airbnb.airbnb_service.mapper.temp.TempMapper;

@RestController
@RequestMapping("/api/cal2")
public class calculTest2 {
    @Autowired TempMapper temp_mapper;

    @GetMapping("/test")
    public Map<String, Object> getTest() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        // 필요출력데이터
        //ok// houseFee 요금정보 기본가격,청소비,서비스비
        //ok// houseOption 옵션정보 옵션seq,옵션이름,옵션시작지정일,할인할증률,주기코드(int),주기정보(str),매일/지정요일/지정일(int)
        // calculator str사용자입력기간날짜,합산할인할증률,계산된가격,적용된day옵션정보seq,적용된week옵션정보seq,적용된month옵션정보seq

        // 0 객체에서 문자열 숫자열 리스트로 분리
        // 1 문자열 날짜로 된 리스트
        // 2 할인할증 값으로 된 리스트
        // 3 기본가격 * 할인할증값 > 할인할증된 가격 

        
        //TEST입력값
        Integer house_seq = 1;
        String in_dt = "2022-08-20";
        String out_dt = "2022-08-27";
        
        //사용자 입력 날짜간의 날짜들을 배열로 담을 리스트 생성
        List<Date> duration = new ArrayList<>();
        //체크인아웃 날짜 변환 에러처리
        try {
            duration = makeDateList(makeCalendar(in_dt),makeCalendar(out_dt));
        } catch (Exception e) {
            //유효하지 않은 날짜 형식
            resultMap.put("status", false);
            resultMap.put("error", "ERR_INVALID_IN_OUT_DATE");
            return resultMap;
        }
        if(duration==null){            
            //날짜 역전 체크인>체크아웃
            resultMap.put("status", false);
            resultMap.put("error", "ERR_REVERSAL_IN_OUT_DATE");
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
            resultMap.put("warn", "NOT_FIND_VALID_OPTION_DATA");
            return resultMap;
        }


        List<CalculatorVO> calculatedPriceList = new ArrayList<>();
        List<HouseOption2VO> houseOptionList = new ArrayList<>();
        

        //겹치는 날짜는 제거
        //할인할증율은 더해서 내보내야 한다 (날짜+할증할인율)
        List<String> dateListA = new ArrayList<String>();
        List<String> dateListB = new ArrayList<String>();
        List<String> dateListC = new ArrayList<String>();

        List<Integer> rateListA = new ArrayList<Integer>();
        List<Integer> rateListB = new ArrayList<Integer>();
        List<Integer> rateListC = new ArrayList<Integer>();

        
        //DB 옵션정보 가져와서 for문으로 하나씩 체크
        for(HouseOptionVO option : optionList){
            Integer optionSeq = option.getOption_seq();
            String optionName = option.getOption_name();
            //switch문으로 cycle별 분기
            //(int)cycle [0:적용없음 1:매일 2:매주(지정날짜와 같은요일) 3:매달(지정일)]
            //(int)rate 할인할증옵션 비율(음/양의 정수)
            //(int)calculatedPrice 할인할증률을 계산한 가격
            Integer cycle = option.getOption_cycle();
            Integer rate = option.getOption_rate();
            // Integer calculatedPrice = (originPrice*(100+rate)/100);
            switch(cycle) {
                case 1: 
                    //주기가 매일인 경우 모든 기간에 항상 적용(중복적용됨) 
                    for(Date dayOfDuration : duration){               
                        //(int)cycle주기정보 (int)rate할인할증율
                        //(str)optionDate 사용자가 입력한 기간 중 조건에 해당하는 날짜
                        //(int)calculatedPrice 할인할증률을 계산한 가격
                        String optionDate = makeFormatDate(dayOfDuration);
                        // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate);
                        dateListA.add(optionDate); rateListA.add(rate);
                        HouseOption2VO vo = HouseOption2VO.builder()
                            .option_seq(optionSeq)  .option_name(optionName)    .option_date(optionDate)
                            .option_rate(rate)      .option_cycle(cycle)        .option_cycle_desc("매일")
                            .option_day(null)       .build();
                            houseOptionList.add(vo);
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
                            dateListB.add(optionDate); rateListB.add(rate);
                            HouseOption2VO vo = HouseOption2VO.builder()
                                .option_seq(optionSeq)  .option_name(optionName)    .option_date(optionDate)
                                .option_rate(rate)      .option_cycle(cycle)        .option_cycle_desc("매주")
                                .option_day(weekOfOption)   .build();
                                houseOptionList.add(vo);
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
                            dateListC.add(optionDate); rateListC.add(rate);
                            HouseOption2VO vo = HouseOption2VO.builder()
                                .option_seq(optionSeq)  .option_name(optionName)    .option_date(optionDate)
                                .option_rate(rate)      .option_cycle(cycle)        .option_cycle_desc("매월")
                                .option_day(dateOfOption)   .build();
                                houseOptionList.add(vo);
                        }
                    }
                    break;
                default: 
                    // cycle오류값제거 정상값[1,2,3] 0은 SQL에서 제외
                    resultMap.put("status", false);
                    resultMap.put("error", "ERR_INVALID_CYCLE");
                    return resultMap;
            }
        }


        List<String> dateListDupABC = new ArrayList<>();  // listABC  | [1] 
        List<String> dateListDupAB = new ArrayList<>();   // listAB   | [2] 
        List<String> dateListDupAC = new ArrayList<>();   // listAC   | [3] 
        List<String> dateListDupBC = new ArrayList<>();   // listBC   | [4] 
        List<Integer> rateListDupABC = new ArrayList<>();
        List<Integer> rateListDupAB = new ArrayList<>();
        List<Integer> rateListDupAC = new ArrayList<>();
        List<Integer> rateListDupBC = new ArrayList<>();

        for(int i=0; i<dateListA.size(); i++){
            String str = dateListA.get(i);
            // int a = dateListA.indexOf(str);
            // int b = dateListB.indexOf(str);
            // int c = dateListC.indexOf(str);
            // int rateA = rateListA.get(a);
            // int rateB = rateListB.get(b);
            // int rateC = rateListC.get(c);
            
            //A와 B에는 있고 C에는 없는 값 >> listDupAB
            if( dateListB.contains(str) && !dateListC.contains(str) ){;
                int a = dateListA.indexOf(str);
                int b = dateListB.indexOf(str);                
                int rateA = rateListA.get(a);
                int rateB = rateListB.get(b);
                dateListDupAB.add(str); // listAB  | [2] 
                rateListDupAB.add(rateA+rateB); 
            }
            // A와 C에는 있고 B에는 없는 값 >> listDupAC
            else if( dateListC.contains(str) && !dateListB.contains(str) ){
                int a = dateListA.indexOf(str);
                int c = dateListC.indexOf(str);
                int rateA = rateListA.get(a);
                int rateC = rateListC.get(c);
                dateListDupAC.add(str); // listAC  | [3] 
                rateListDupAC.add(rateA+rateC); 
                
            }
            //A와 B와 C에 모두 있는 값 >> listDupABC
            else if( dateListB.contains(str) && dateListC.contains(str) ){
                int a = dateListA.indexOf(str);
                int b = dateListB.indexOf(str);
                int c = dateListC.indexOf(str);
                int rateA = rateListA.get(a);
                int rateB = rateListB.get(b);
                int rateC = rateListC.get(c);
                dateListDupABC.add(str); // listABC  | [1] 
                rateListDupABC.add(rateA+rateB+rateC); 
            }
        }        
        for(int i=0; i<dateListB.size(); i++){       
            String str = dateListB.get(i);
            //B와 C에는 있고 A에는 없는 값 >> listDupBC
            if( dateListC.contains(str) && !dateListA.contains(str) ){
                int b = dateListB.indexOf(str);
                int c = dateListC.indexOf(str);
                int rateB = rateListB.get(b);
                int rateC = rateListC.get(c);
                dateListDupBC.add(str); // listBC  | [4] 
                rateListDupBC.add(rateB+rateC);
            }
        }

        System.out.println("listAB  | "+dateListDupAB+" | "+rateListDupAB+" | "+"calculatedPrice");
        System.out.println("listAC  | "+dateListDupAC+" | "+rateListDupAC+" | "+"calculatedPrice");
        System.out.println("listBC  | "+dateListDupBC+" | "+rateListDupBC+" | "+"calculatedPrice");
        System.out.println("listABC | "+dateListDupABC+" | "+rateListDupABC+" | "+"calculatedPrice");

        resultMap.put("houseFeeInfo", houseFeeInfo);
        resultMap.put("houseOptionList", houseOptionList);
        resultMap.put("calculatedPriceList", calculatedPriceList);
        resultMap.put("status", true);
        resultMap.put("message", "해당 기간에 계산된 할인할증정보입니다..");
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
        if(in.getTimeInMillis() > out.getTimeInMillis()){return null;}
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
