package com.airbnb.airbnb_service.data.request;

import lombok.Data;

@Data
public class BookingRequest {
    private InfoVO infoVO;
    private GuestVO guestVO;
    private FeeVO feeVO;

    @Data
    public static class InfoVO {
        private Integer bi_seq;
        private Integer guest_seq;
        private Integer house_seq;
        private String in_dt;
        private String out_dt;
        private String guest_phone;
    }

    @Data
    public static class GuestVO {
        private Integer booking_seq;
        private Integer adult;
        private Integer child;
        private Integer infant;
        private Integer dog;
    }

    @Data
    public static class FeeVO {
        private Integer booking_seq;
        private Integer basic_fee;
        private Integer cleaning_fee;
        private Integer service_fee;
        private Integer total_fee;
    }
}
