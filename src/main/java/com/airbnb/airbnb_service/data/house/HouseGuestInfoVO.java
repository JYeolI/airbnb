package com.airbnb.airbnb_service.data.house;

import lombok.Data;

@Data
public class HouseGuestInfoVO {
    private Integer hgi_seq;
    private Integer hgi_guest;
    private Integer hgi_bed;
    private Integer hgi_bedroom;
    private Integer hgi_bathroom;
    private Integer hgi_dog;
}
