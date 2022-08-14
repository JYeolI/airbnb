package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.category.CategoryAmenityVO;
import com.airbnb.airbnb_service.data.category.CategoryCountryVO;
import com.airbnb.airbnb_service.data.category.CategoryLangVO;
import com.airbnb.airbnb_service.data.category.CategorySortDetailVO;
import com.airbnb.airbnb_service.data.category.CategorySortVO;
import com.airbnb.airbnb_service.data.response.CategoryBarResponseVO;


@Mapper
public interface CategoryMapper {
    public List<CategoryBarResponseVO> selectCategoryBar();
    
    public List<CategoryAmenityVO> selectCateAmenityList();
    public List<CategoryLangVO> selectrCateLangList();
    public List<CategorySortVO> selectCateSortList();
    public List<CategorySortDetailVO> selectCateSortDetailList();
    public List<CategoryCountryVO> selectCateCountryList();
    
}
