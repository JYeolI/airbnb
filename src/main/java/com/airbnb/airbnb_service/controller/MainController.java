package com.airbnb.airbnb_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @GetMapping("/")
    public String getMain() {
        return "/main";
    }
    @GetMapping("/wish")
    public String getWish() {
        return "/wish";
    }
}
