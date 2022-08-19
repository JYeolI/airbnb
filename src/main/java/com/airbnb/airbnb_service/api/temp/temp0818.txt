package com.airbnb.airbnb_service.api.temp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
@RequestMapping("/api/temp0818")
public class temp0818 {
    @Autowired TempMapper temp_mapper;

    @GetMapping("/test")
    public Map<String, Object> getTest() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        // case 1번 문제사항
        // case 1번 케이스가 2개가 될 수 없도록 할인할증옵션 입력시 Validation필요!!
        // case 1번 케이스 추가 입력시 이미 존재하는 >> 1번 옵션정보 알려주고 수정하도록 권고
        
        // 필요출력데이터
        // 기본정보 기본가격,청소비,서비스비
        // 옵션정보 옵션seq,옵션이름,옵션시작지정일,할인할증률,주기코드(int),주기정보(str),매일/지정요일/지정일(int)
        // str사용자입력기간날짜,합산할인할증률,계산된가격,적용된day옵션정보seq,적용된week옵션정보seq,적용된month옵션정보seq

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
        
        //case1 ABC 세개 다 겹친느 값 1 >>> 1매일2매주3매월
        //case2 AB겹치는 값 2 >>>1매일2매주
        //case3 AC겹치는 값 3 >>>
        //case4 BC겹치는 값 4 >>>
        //배열의 길이는 다 다를 수 있다
        //겹치는 값을 구하고 더해서 내보내야 한다 (날짜+할증할인율)

        List<Integer> listA = new ArrayList<Integer>(Arrays.asList(1,2,3,10,11,12));
        List<Integer> listB = new ArrayList<Integer>(Arrays.asList(1,2,4,8,9));
        List<Integer> listC = new ArrayList<Integer>(Arrays.asList(1,3,4));

        List<Integer> listDupABC = new ArrayList<Integer>();
        List<Integer> listDupAB = new ArrayList<Integer>();
        List<Integer> listDupAC = new ArrayList<Integer>();
        List<Integer> listDupBC = new ArrayList<Integer>();
        //AB체크 겹치는 값을 배열화
        for(Integer intA : listA){
            for(Integer intB : listB){
                if(intA==intB) listDupAB.add(intA);
            }
            for(Integer intC: listC){
                if(intA==intC) listDupAC.add(intA);
            }
        }
        
        for(Integer intB : listB){
            for(Integer intC : listC){
                if(intB==intC) listDupBC.add(intB);    
            }
        }
        //ABC계산
        for(Integer intAB : listDupAB){
            for(Integer intC : listC){
                if(intAB==intC) listDupABC.add(intAB);
            }
        }

        for(Integer intAB : listDupAB){
            for(Integer intABC : listDupABC){
                if(intAB==intABC){
                    
                }
            }
        }
        System.out.println("listAB  | "+listDupAB);
        System.out.println("listAC  | "+listDupAC);
        System.out.println("listBC  | "+listDupBC);
        System.out.println("listABC | "+listDupABC);

        //중복제거
        System.out.println("정렬전");
		System.out.println("-----------------------");
		String[] sArr = {"강호동", "직녀", "견우", "한국", "삼월", "강호동"};
		for(int i=0; i<sArr.length; i++)
			System.out.print(sArr[i] + " ");
		System.out.println();
		System.out.println("-----------------------");
		System.out.println();
		System.out.println();
		
		List<String> list = new ArrayList<String>();
		for(int i=0; i<sArr.length; i++)
			if(!list.contains(sArr[i]))	// list에 포함되어있는지 아닌지 체크
				list.add(sArr[i]);		// 해당 값이 없으면 넣기
		
		Collections.sort(list);
		System.out.println("정렬후");
		System.out.println("-----------------------");
		for(String i : list)
			System.out.print(i + " ");
		System.out.println();
		System.out.println("-----------------------");
        // [출처] [Java/자바] - 배열에서 중복을 제거하고 정렬하기|작성자 주현



        return resultMap;
    }


    
    @GetMapping("/test2")
    public Map<String, Object> getTest2() {
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
        
        //case1 ABC 세개 다 겹친느 값 1 >>> 1매일2매주3매월
        //case2 AB겹치는 값 2 >>>1매일2매주
        //case3 AC겹치는 값 3 >>>
        //case4 BC겹치는 값 4 >>>
        //배열의 길이는 다 다를 수 있다
        //겹치는 값을 구하고 더해서 내보내야 한다 (날짜+할증할인율)

        List<Integer> listA = new ArrayList<Integer>(Arrays.asList(1,2,3,10,11,12));
        List<Integer> listB = new ArrayList<Integer>(Arrays.asList(1,2,4,28,29));
        List<Integer> listC = new ArrayList<Integer>(Arrays.asList(1,3,4,33));

        List<Integer> listDupAB = new ArrayList<Integer>();
        List<Integer> listDupAC = new ArrayList<Integer>();
        List<Integer> listDupBC = new ArrayList<Integer>();
        List<Integer> listDupABC = new ArrayList<Integer>();

        for(int i=0; i<listA.size(); i++){
            //A와 B에는 있고 C에는 없는 값 >> listDupAB
            if( listB.contains(listA.get(i)) && !listC.contains(listA.get(i)) ){
                listDupAB.add(listA.get(i)); // listAB  | [2] 
            }
            //A와 C에는 있고 B에는 없는 값 >> listDupAC
            else if( listC.contains(listA.get(i)) && !listB.contains(listA.get(i)) ){
                listDupAC.add(listA.get(i)); // listAC  | [3] 
            }
            //A와 B와 C에 모두 있는 값 >> listDupABC
            else if( listB.contains(listA.get(i)) && listC.contains(listA.get(i)) ){
                listDupABC.add(listA.get(i)); // listABC  | [1] 
            }
        }
        
        for(int i=0; i<listB.size(); i++){
            //B와 C에는 있고 A에는 없는 값 >> listDupBC
            if( listC.contains(listB.get(i)) && !listA.contains(listB.get(i)) ){
                listDupBC.add(listB.get(i)); // listBC  | [4] 
            }
        }

        System.out.println("listAB  | "+listDupAB);
        System.out.println("listAC  | "+listDupAC);
        System.out.println("listBC  | "+listDupBC);
        System.out.println("listABC | "+listDupABC);

        return resultMap;
    }

    
    //temp0816 복제 객체로 담기전에 배열 상태에서 뗴어오기
    @GetMapping("/test3")
    public Map<String, Object> getTest3() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();

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
            duration = temp0816.makeDateList(temp0816.makeCalendar(in_dt),temp0816.makeCalendar(out_dt));
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

        //중복 제거용 list구성 날짜,
        List<String> dateListOfCaseDay = new ArrayList<>();
        List<Integer> rateListOfCaseDay = new ArrayList<>();
        List<String> dateListOfCaseWeek = new ArrayList<>();
        List<Integer> rateListOfCaseWeek = new ArrayList<>();
        List<String> dateListOfCaseMonth = new ArrayList<>();
        List<Integer> rateListOfCaseMonth = new ArrayList<>();
        

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
                        String optionDate = temp0816.makeFormatDate(dayOfDuration);
                        // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate);
                        dateListOfCaseDay.add(optionDate);
                        rateListOfCaseDay.add(rate);
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
                            String weekOfDay = temp0816.makeToStringWeekOfDay(weekOfOption);
                            String optionDate = temp0816.makeFormatDate(dayOfDuration);
                            // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate+","+weekOfOption+","+weekOfDay);
                            dateListOfCaseWeek.add(optionDate);
                            rateListOfCaseWeek.add(rate);
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
                            String optionDate = temp0816.makeFormatDate(dayOfDuration);
                            // System.out.println(cycle+","+optionDate+","+calculatedPrice+","+rate);
                            dateListOfCaseMonth.add(optionDate);
                            rateListOfCaseMonth.add(rate);
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
        Map<String, List<Integer> > dateMap = new LinkedHashMap<String, List<Integer> >();
        dateMap = makeIntersectionOfDate(dateListOfCaseDay,dateListOfCaseWeek,dateListOfCaseMonth);
        List<Integer> listDupAB = dateMap.get("listDupAB");
        List<Integer> listDupAC = dateMap.get("listDupAC");
        List<Integer> listDupBC = dateMap.get("listDupBC");
        List<Integer> listDupABC = dateMap.get("listDupABC");
        
        
        
        resultMap.put("listDupAB", dateMap.get("listDupAB"));
        resultMap.put("listDupAC", dateMap.get("listDupAC")); 
        resultMap.put("listDupBC", dateMap.get("listDupBC"));
        resultMap.put("listDupABC", dateMap.get("listDupABC"));

        System.out.println(dateListOfCaseDay);
        System.out.println(dateListOfCaseWeek);
        System.out.println(dateListOfCaseMonth);

        // resultMap.put("optionList", optionList);
        // resultMap.put("houseFeeInfo", houseFeeInfo);
        // resultMap.put("caseEveryDay", caseEveryDay);
        // resultMap.put("caseEveryWeek", caseEveryWeek);
        // resultMap.put("caseEveryMonth", caseEveryMonth);
        resultMap.put("status", true);
        resultMap.put("message", "해당 기간에 계산된 할인할증정보입니다..");
        return resultMap;
    }
    
    // 3개의 List<Integer>에서 교집합AB AC BC ABC를 구해라 
    // 하지만 반환값은 원래 배열에서의 인덱스번호값만!!!!
    public Map<String, List<Integer> > makeIntersectionOfDate( List<String> listA, List<String> listB, List<String> listC ){
        Map<String, List<Integer> > resultMap = new LinkedHashMap<String, List<Integer> >();
        
        List<Integer> listDupAB = new ArrayList<Integer>();
        List<Integer> listDupAC = new ArrayList<Integer>();
        List<Integer> listDupBC = new ArrayList<Integer>();
        List<Integer> listDupABC = new ArrayList<Integer>();

        for(int i=0; i<listA.size(); i++){
            //A와 B에는 있고 C에는 없는 값 >> listDupAB
            if( listB.contains(listA.get(i)) && !listC.contains(listA.get(i)) ){
                listDupAB.add(i); // listAB  | [2] 
            }
            //A와 C에는 있고 B에는 없는 값 >> listDupAC
            else if( listC.contains(listA.get(i)) && !listB.contains(listA.get(i)) ){
                listDupAC.add(i); // listAC  | [3] 
            }
            //A와 B와 C에 모두 있는 값 >> listDupABC
            else if( listB.contains(listA.get(i)) && listC.contains(listA.get(i)) ){
                listDupABC.add(i); // listABC  | [1] 
            }
        }
        
        for(int i=0; i<listB.size(); i++){
            //B와 C에는 있고 A에는 없는 값 >> listDupBC
            if( listC.contains(listB.get(i)) && !listA.contains(listB.get(i)) ){
                listDupBC.add(i); // listBC  | [4] 
            }
        }
        resultMap.put("listDupAB", listDupAB);
        resultMap.put("listDupAC", listDupAC);
        resultMap.put("listDupBC", listDupBC);
        resultMap.put("listDupABC", listDupABC);
        return resultMap;
    }
}
