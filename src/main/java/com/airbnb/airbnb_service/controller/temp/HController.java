package com.airbnb.airbnb_service.controller.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/h")
public class HController {
    @GetMapping("/profile")
    public String getHProfile() {
        return "/temp/HJYtemp";
    }
    @GetMapping("/join")
    public String getHJoin() {
        return "/temp/HtempMemberJoin";
    }
}
