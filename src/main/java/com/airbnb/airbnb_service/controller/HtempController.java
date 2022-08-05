package com.airbnb.airbnb_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/h")
public class HtempController {
    @GetMapping("/")
    public String getHtemp() {
        return "/temp/Htemp";
    }
}
