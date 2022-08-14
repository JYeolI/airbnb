package com.airbnb.airbnb_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
    //메인
    @GetMapping("/")
    public String getMain() {
        return "/main";
    }
    //숙소상세
    @GetMapping("/house")
    public String getHouse() {
        return "/house";
    }
    //위시리스트
    @GetMapping("/wish")
    public String getWish() {
        return "/wish";
    }
    //회원정보
    @GetMapping("/profile")
    public String getProfile(@RequestParam Integer member_seq) {
        return "/profile";
    }
    //회원가입
    @GetMapping("/join")
    public String getJoin() {
        return "/join";
    }
    
}
