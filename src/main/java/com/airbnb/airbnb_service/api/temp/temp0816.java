package com.airbnb.airbnb_service.api.temp;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/temp")
public class temp0816 {

    @GetMapping("/amenity/all")
    @Transactional
    public Map<String, Object> getHouseAmenityAll(@RequestParam Integer house_seq) {
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();

        return resultMap;
    }



}
