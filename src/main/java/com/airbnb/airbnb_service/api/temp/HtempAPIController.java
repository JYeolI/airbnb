package com.airbnb.airbnb_service.api.temp;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.temp.Htemp.ProfileVO;
import com.airbnb.airbnb_service.mapper.temp.HtempMapper;

@RestController
@RequestMapping("/api/h")
public class HtempAPIController {
    @Autowired HtempMapper H_mapper;
    @GetMapping("/profile")
    public Map<String, Object> getHProfile(@RequestParam Integer member_seq) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        ProfileVO member = H_mapper.selectMemberProfile(member_seq);
        if(member.getMimg_file() == null) { member.setMimg_file("default.png"); }
        resultMap.put("profileList", member);
        return resultMap;
    }
}
