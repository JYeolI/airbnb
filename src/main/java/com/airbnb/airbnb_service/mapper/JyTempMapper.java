package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.MainViewResponse;
import com.airbnb.airbnb_service.data.SearchRequestVO;
import com.airbnb.airbnb_service.data.category.CategoryAmenityVO;
import com.airbnb.airbnb_service.data.category.CategoryLangVO;

@Mapper
public interface JyTempMapper {

    public List<MainViewResponse> selectSearchHouseList(SearchRequestVO searchRequest, Integer user_seq);
    public List<CategoryAmenityVO> selectCategoryAmenityList();
    public List<CategoryLangVO> selectCategoryLangList();



}
