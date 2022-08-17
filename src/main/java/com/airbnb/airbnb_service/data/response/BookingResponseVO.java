package com.airbnb.airbnb_service.data.response;

import java.util.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
public class BookingResponseVO {
    
    @Data
    @Builder
    public static class caseEveryDay {
        private Integer cycle;
        private String optionDate;
        private Integer calculatedPrice;
        private Integer rate;
    }

    @Data
    @Builder
    public static class caseEveryWeek {
        private Integer cycle;
        private String optionDate;
        private Integer calculatedPrice;
        private Integer rate;
        private Integer weekOfOption;
        private String weekOfDay;
    }

    @Data
    @Builder
    public static class caseEveryMonth {
        private Integer cycle;
        private String optionDate;
        private Integer calculatedPrice;
        private Integer rate;
    }

}
