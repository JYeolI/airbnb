package com.airbnb.airbnb_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airbnb.airbnb_service.data.MainViewResponse;

@Mapper
public interface JyTempMapper {
<<<<<<< HEAD
    public List<MainViewResponse> selectSearchHouseList(
        Integer user_seq, String in_dt, String out_dt,
        Integer cate_place, Integer lang,
        Integer amenity, Integer guest, Integer dog,
        Integer min, Integer max, Integer type,
        Integer bed, Integer bedroom, Integer bathroom, 
        Integer superhost
    );
=======
    public List<MainViewResponse> selectSearchHouseList(Integer start_dt, Integer end_dt, String keyword, Integer guest, Integer dog);
>>>>>>> b7e7e5f (test (work1_1 브랜치 삭제 예정))
}
