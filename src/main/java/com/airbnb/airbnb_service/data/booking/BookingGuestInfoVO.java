package com.airbnb.airbnb_service.data.booking;

import lombok.Data;

@Data
public class BookingGuestInfoVO {
    private Integer bgi_seq;
    private Integer bgi_adult;
    private Integer bgi_child;
    private Integer bgi_infant;
    private Integer bgi_dog;
}
