package com.airbnb.airbnb_service.data.response;

import java.util.Date;

import lombok.Data;

@Data
public class CalculatorVO {
    private Date day_of_duration; //str사용자입력기간날짜
    private Integer sum_rate; //합산할인할증률
    private Integer calculated_price; //계산된가격
    private Integer day_option_seq; //적용된day옵션정보seq
    private Integer week_option_seq; //적용된week옵션정보seq
    private Integer month_option_seq; //적용된month옵션정보seq
}
