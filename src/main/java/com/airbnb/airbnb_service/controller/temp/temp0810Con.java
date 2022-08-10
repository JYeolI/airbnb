package com.airbnb.airbnb_service.controller.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class temp0810Con {
    
    @GetMapping("/house")
    public String getHouse() {
        return "/temp/house";
    }
    
}
