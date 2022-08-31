package com.airbnb.airbnb_service.controller.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdministrateController {
    @GetMapping("/administrate")
    public String getManagement(){
        return "/temp/administrate";
    }
}
