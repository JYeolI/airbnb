package com.airbnb.airbnb_service.controller;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JYController {
    
    @GetMapping("/main")
    public String getMain(
        @RequestParam @Nullable String keyword,        
        @RequestParam @Nullable Integer checkIn,
        @RequestParam @Nullable Integer checkOut,
        @RequestParam @Nullable Integer Guest,
        @RequestParam @Nullable Integer dog
    ) {
        return "/temp/Ytemp";
    }
}
