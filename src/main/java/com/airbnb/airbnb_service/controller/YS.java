package com.airbnb.airbnb_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class YS {
    @GetMapping("/ys")
    public String getMain() {
        return "/temp/Htemp";
    }
}
