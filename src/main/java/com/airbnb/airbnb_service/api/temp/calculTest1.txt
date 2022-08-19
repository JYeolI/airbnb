package com.airbnb.airbnb_service.api.temp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.airbnb.airbnb_service.mapper.temp.TempMapper;

@RestController
@RequestMapping("/api/cal")
public class calculTest1 {
    @Autowired TempMapper temp_mapper;

    @GetMapping("/test")
    public Map<String, Object> getTest() {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        // 필요출력데이터
        // houseFee 요금정보 기본가격,청소비,서비스비
        // houseOption 옵션정보 옵션seq,옵션이름,옵션시작지정일,할인할증률,주기코드(int),주기정보(str),매일/지정요일/지정일(int)
        // calculator str사용자입력기간날짜,합산할인할증률,계산된가격,적용된day옵션정보seq,적용된week옵션정보seq,적용된month옵션정보seq

        // 0 객체에서 문자열 숫자열 리스트로 분리
        // 1 문자열 날짜로 된 리스트
        // 2 할인할증 값으로 된 리스트
        // 3 기본가격 * 할인할증값 > 할인할증된 가격 

        //겹치는 날짜는 제거
        //할인할증율은 더해서 내보내야 한다 (날짜+할증할인율)
        List<String> dateListA = new ArrayList<String>(Arrays.asList("1","2","3","10","11","12","15","16"));
        List<String> dateListB = new ArrayList<String>(Arrays.asList("1","2","4","28","29","30"));
        List<String> dateListC = new ArrayList<String>(Arrays.asList("1","3","4","33","35"));

        List<Integer> rateListA = new ArrayList<Integer>(Arrays.asList(1,2,3,10,11,12,15,16));
        List<Integer> rateListB = new ArrayList<Integer>(Arrays.asList(1,2,4,28,29,30));
        List<Integer> rateListC = new ArrayList<Integer>(Arrays.asList(1,3,4,33,35));

        List<String> dateListDupABC = new ArrayList<String>();  // listABC  | [1] 
        List<String> dateListDupAB = new ArrayList<String>();   // listAB   | [2] 
        List<String> dateListDupAC = new ArrayList<String>();   // listAC   | [3] 
        List<String> dateListDupBC = new ArrayList<String>();   // listBC   | [4] 
        List<Integer> rateListDupABC = new ArrayList<Integer>();
        List<Integer> rateListDupAB = new ArrayList<Integer>();
        List<Integer> rateListDupAC = new ArrayList<Integer>();
        List<Integer> rateListDupBC = new ArrayList<Integer>();

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

        return resultMap;
    }
}
