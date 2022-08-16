package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.member.MemberInfoVO;
import com.airbnb.airbnb_service.data.response.ProfileVO;
import com.airbnb.airbnb_service.data.response.WishViewResponseVO;

@Mapper
public interface MemberMapper {    
    //위시리스트
    public List<WishViewResponseVO> selectWishList(Integer user_seq);
    //메인 위시리스트
    public void insertWish(Integer user_seq, Integer house_seq, Integer order);
    public Integer selectWishOrderMax(Integer user_seq);
    public void deleteWish(Integer user_seq, Integer wish_seq);
    //프로필
    public ProfileVO selectMemberProfile(Integer member_seq);
    public Boolean isDupChkId(String id);
    public void insertMember(MemberInfoVO data);
}
