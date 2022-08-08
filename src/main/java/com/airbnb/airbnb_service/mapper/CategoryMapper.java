package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.category.CategoryAmenityVO;
import com.airbnb.airbnb_service.data.category.CategoryBarVO;
import com.airbnb.airbnb_service.data.category.CategoryLangVO;
import com.airbnb.airbnb_service.data.category.CategorySortVO;


@Mapper
public interface CategoryMapper {
    public List<CategoryBarVO> selectMainCatebar();
    
    public List<CategoryAmenityVO> selectFilterCateAmenityList();
    public List<CategoryLangVO> selectFilterCateLangList();
    public List<CategorySortVO> selectFilterCateSortList();
    
}
