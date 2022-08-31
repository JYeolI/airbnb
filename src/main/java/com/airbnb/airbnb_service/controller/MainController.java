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
    public String getHouse(@RequestParam Integer house_seq) {
        return "/house";
    }
    //위시리스트 ##세션체크
    @GetMapping("/wish")
    public String getWish() {
        return "/wish";
    }
    //회원정보
    @GetMapping("/profile")
    public String getProfile(@RequestParam Integer member_seq) {
        return "/profile";
    }
    //회원가입 ##세션체크
    @GetMapping("/join")
    public String getJoin() {
        return "/join";
    }
    //호스팅(호스트 시작하기 = 숙소추가)
    @GetMapping("/hosting")
    public String getHosting() {
        return "/hosting";
    }
    //여행(예약정보 확인) ##세션체크
    @GetMapping("/trip")
    public String getTrip() {
        return "/trip";
    }
    //메세지함
    @GetMapping("/msg")
    public String getMsg() {
        return "/msg";
    }
    //로그인 ##세션체크
    @GetMapping("/login")
    public String getHLogin() {
        return "/login";
    }
    //호스트(메인)
    @GetMapping("/host")
    public String getHHost() {
        return "/host";
    }
    //예약
    @GetMapping("/booking")
    public String getBooking() {
        return "/booking";
    }
}
