package com.airbnb.airbnb_service.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.airbnb.airbnb_service.data.category.CategorybarVO;
import com.airbnb.airbnb_service.mapper.CategoryMapper;

@Controller
public class YS {
    @Autowired CategoryMapper cate_mapper;
    @GetMapping("/ys")
    public String getYS(Model model, CategorybarVO data){
        // model.addAttribute("Cate_bar_list", cate_mapper.SelectMainCatebar());
        return "/temp/YS";
    }
}
