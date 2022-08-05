package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.category.CategorySortVO;
import com.airbnb.airbnb_service.data.category.CategorybarVO;

@Mapper
public interface CategoryMapper {
    public List<CategorybarVO> SelectMainCatebar();
    public List<CategorySortVO> SelctFilterCateSortList();
    
}
