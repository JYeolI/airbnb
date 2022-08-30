package com.airbnb.airbnb_service.api.temp;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.airbnb_service.data.member.MemberInfoVO;
import com.airbnb.airbnb_service.data.member.MemberReportVO;
import com.airbnb.airbnb_service.data.response.ProfileVO;
import com.airbnb.airbnb_service.mapper.HtempMapper;
import com.airbnb.airbnb_service.mapper.MemberMapper;

@RestController
@RequestMapping("/api/h")
public class Htemp0816APIController {
    @Autowired HtempMapper temp_mapper;
    @GetMapping("/login")
    public Map<String, Object> getHLogin(HttpSession session, @RequestParam String id, @RequestParam String pwd) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        MemberInfoVO user = temp_mapper.selectLogin(id, pwd);
        if(user == null) {
            resultMap.put("status", false);
            resultMap.put("message", "아이디 또는 비밀번호가 틀렸습니다.");
            return resultMap;
        }
        session.setAttribute("user", user);
        // resultMap.put("user", user);
        resultMap.put("status", true);
        resultMap.put("message", "로그인 되었습니다.");
        return resultMap;
    }
    @PostMapping("/logout")
    public Map<String, Object> postLogout(HttpSession session) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        session.setAttribute("user", null);
        resultMap.put("message", "로그아웃 되었습니다.");
        return resultMap;
    }

    @Autowired MemberMapper member_mapper;
    @PatchMapping("/profile")
    public Map<String, Object> patchProfile(HttpSession session, @RequestBody ProfileVO data) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        MemberInfoVO user = (MemberInfoVO)session.getAttribute("user");
        System.out.println(data);
        // System.out.println(temp_mapper.isDupChkMemberProfileCategory("member_address_info", "mai_mi_seq", user.getMi_seq()));
        // System.out.println(temp_mapper.isDupChkMemberProfileCategory("member_lang_info", "mli_mi_seq", user.getMi_seq()));

        temp_mapper.updateMemberProfile(data.getMember_desc(), data.getCompany(), user.getMi_seq());
        if(temp_mapper.isDupChkMemberProfileAddress(user.getMi_seq())) {
            temp_mapper.updateMemberProfileAddress(user.getMi_seq(), data.getMai_cc_seq(), data.getCity(), data.getMember_address());
        }
        else {
            temp_mapper.insertMemberProfileAddress(user.getMi_seq(), data.getMai_cc_seq(), data.getCity(), data.getMember_address());
        }
        List<Integer> isDupLang = temp_mapper.isDupChkMemberProfileLanguage(user.getMi_seq());
        System.out.println("추가할거 : "+data.getLang_seq());
        System.out.println("원래 있던거 : "+isDupLang);
        
        for(int i=0; i<isDupLang.size(); i++) {
            if(!(data.getLang_seq().contains(isDupLang.get(i)))) {
                System.out.println("삭제할거 : "+isDupLang.get(i));
                temp_mapper.deleteMemberProfileLanguage(user.getMi_seq(), isDupLang.get(i));
            }
        }
        for(int i=0; i<data.getLang_seq().size(); i++) {
            if(!(isDupLang.contains(data.getLang_seq().get(i)))) {
                System.out.println("추가할거 : "+data.getLang_seq().get(i));
                temp_mapper.insertMemberProfileLanguage(user.getMi_seq(), data.getLang_seq().get(i));
            }
        }

        return resultMap;
    }

    @PutMapping("/member/report")
    public Map<String, Object> putMemberReport(HttpSession session, @RequestBody MemberReportVO data) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        MemberInfoVO user = (MemberInfoVO)(session.getAttribute("user"));
        if(user == null) {
            resultMap.put("status", -1);
            resultMap.put("message", "먼저 로그인 해주세요.");
            return resultMap;
        }
        
        Integer user_seq = user.getMi_seq();

        int dupChk = temp_mapper.isDupChkMemberReport(user_seq, data.getMrpt_to_mi_seq());
        if(dupChk == 0) {
            data.setMrpt_from_mi_seq(user_seq);
            temp_mapper.insertMemberReport(data);
            resultMap.put("status", true);
            resultMap.put("message", "신고되었습니다.");
        }
        else {
            resultMap.put("status", false);
            resultMap.put("message", "이미 신고한 회원입니다.");
        }

        return resultMap;
    }

    @PostMapping("/calendar")
    public Map<String, Object> postHostCalendar() {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        return resultMap;
    }

    @PostMapping("/host")
    public Map<String, Object> postHostCheckout(HttpSession session) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        // MemberInfoVO host = (MemberInfoVO)session.getAttribute("user");
        // Integer host_seq = host.getMi_seq();
        Integer host_seq = 2;

        resultMap.put("allHouse", temp_mapper.selectHostingHouseInfo(host_seq, false));
        resultMap.put("checkout", temp_mapper.selectHostCheckout(host_seq));
        resultMap.put("checkin", temp_mapper.selectHostCheckin(host_seq));
        resultMap.put("hostingHouse", temp_mapper.selectHostingHouseInfo(host_seq, true));
        resultMap.put("reviewMsg", temp_mapper.selectHostReviewMsg(host_seq));
        
        return resultMap;
    }
}
