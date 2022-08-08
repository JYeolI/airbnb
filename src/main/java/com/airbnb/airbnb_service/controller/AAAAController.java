package com.airbnb.airbnb_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AAAAController {
    
    @GetMapping("/main")
    public String getAAAAMain() {
        return "/temp/Ytemp";
    }
}
