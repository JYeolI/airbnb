package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.member.MemberInfoVO;
import com.airbnb.airbnb_service.data.member.MemberReportVO;

@Mapper
public interface HtempMapper {
    public MemberInfoVO selectLogin(String id, String pwd);
    public List<String> selectMemberProfileLanguageList(Integer seq);
    public void updateMemberProfile(String mi_description, String mi_company, Integer mi_seq);
    public Boolean isDupChkMemberProfileAddress(Integer mi_seq);
    public List<Integer> isDupChkMemberProfileLanguage(Integer mi_seq);
    public void insertMemberProfileAddress(Integer mi_seq, Integer cc_seq, String mai_city, String mai_detail);
    public void updateMemberProfileAddress(Integer mi_seq, Integer cc_seq, String mai_city, String mai_detail);
    public void insertMemberProfileLanguage(Integer mi_seq, Integer cl_seq);
    public void deleteMemberProfileLanguage(Integer mi_seq, Integer cl_seq);

    public Integer isDupChkMemberReport(Integer mrpt_from_mi_seq, Integer mrpt_to_mi_seq);
    public void insertMemberReport(MemberReportVO data);
}
