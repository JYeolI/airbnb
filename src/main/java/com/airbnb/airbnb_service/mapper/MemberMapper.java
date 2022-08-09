package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.response.WishViewResponseVO;

@Mapper
public interface MemberMapper {    
    public List<WishViewResponseVO> selectWishList(Integer user_seq);
}
