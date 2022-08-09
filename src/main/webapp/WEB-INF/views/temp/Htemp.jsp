<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        section {border: 1px solid #000; width: 1200px; }
        .trip_content {border: 1px solid #000; width: 800px; height: 400px;}
        img {width: 50px;}
    </style>
    <script>
        // 여행 예약
        $(function(){
            $.ajax({
                // url:"/api/trip_response?seq="+$(this).attr("date-seq"),
                url:"/api/trip_response",
                type:"get",
                success:function(r){
                    $(".trip_list").html("");
                    console.log(r);
                    for(let i=0; i<r.trip_list.length; i++){
                        // 예약 시작날자
                        let start_date = new Date(r.trip_list[i].bi_start_dt);
                        let start_year = start_date.getFullYear();
                        let start_month = start_date.getMonth();
                        let start_day = start_date.getDay();
                        if(start_month > 0){ start_month = "0"+start_month}
                        if(start_day > 0){ start_day = "0"+start_day}
                        let start_dateTag = start_year+"-"+start_month+"-"+start_day;
                        // 예약 끝날자
                        let end_date = new Date(r.trip_list[i].bi_end_dt);
                        let end_year = end_date.getFullYear();
                        let end_month = end_date.getMonth();
                        let end_day = end_date.getDay();
                        if(end_month > 0){ end_month = "0"+end_month}
                        if(end_day > 0){ end_day = "0"+end_day}
                        let end_dateTag = end_year+"-"+end_month+"-"+end_day;
                        // 예약현황
                        let status = r.trip_list[i].bi_status
                        if(status == 1) {statusTag = '<span>승인대기</span>'}
                        if(status == 2) {statusTag = '<span>승인완료</span>'}
                        // 게스트 인원
                        let adult = parseInt(r.trip_list[i].adult);
                        let child = parseInt(r.trip_list[i].child);
                        let infant = parseInt(r.trip_list[i].infant);
                        let dog = parseInt(r.trip_list[i].dog);
                        let adultTag = "";
                        let childTag = "";
                        let infantTag = "";
                        let dogTag = "";
                        if(adult != 0) {adultTag = '<span>어른</span><span class="adult">'+adult+'</span><span>명, </span>'}
                        if(child != 0) {childTag = '<span>어린이</span><span class="child">'+r.trip_list[i].child+'</span><span>명, </span>'}
                        if(infant != 0) {infantTag = '<span>유아</span><span class="infant">'+r.trip_list[i].infant+'</span><span>명, </span>'}
                        if(dog != 0) {dogTag = '<span>애완동물</span><span class="dog">'+r.trip_list[i].dog+'</span><span>마리</span>'}
                        let tag=
                            '<div class="trip_content">'+
                                '<p class="bi_seq">'+
                                    r.trip_list[i].bi_seq+
                                '</p>'+
                                '<h1 class="hi_name">'+
                                    r.trip_list[i].hi_name+
                                '</h1>'+
                                '<p class="img_file">이미지파일</p>'+
                                '<p class="location">'+
                                    '<span class="country">'+r.trip_list[i].country+'</span>,<span class="city">'+r.trip_list[i].city+'</span>,<span class="detail">'+r.trip_list[i].detail+'</span>'+
                                '</p>'+
                                '<p class="bookingday">'+
                                    '<span>예약일자 : </span>'+
                                    '<span class="bi_start_dt">'+start_dateTag+'</span>'+
                                    '<span>~</span>'+
                                    '<span class="bi_end_dt">'+end_dateTag+'</span>'+
                                '</p>'+
                                '<p class="guest">'+
                                    adultTag+childTag+infantTag+dogTag+
                                '</p>'+
                                '<p class="bi_status">'+
                                    statusTag+
                                '</p>'+
                                '<div class="fee">'+
                                    '<p class="trip_fee">할증 전 요금</p>'+
                                    '<p class="trip_premium_fee">할증 요금</p>'+
                                    '<p class="trip_total_fee">총요금</p>'+
                                '</div>'
                            '</div>';
                        $(".trip_list").append(tag)
                    }
                }
            })
        })
    </script>
<body>
    <main>
        <section class="trip_area">
                <div class="trip_list">
                    <div class="trip_content">
                        <p class="bi_seq">숙소번호</p>
                        <h1 class="hi_name">숙소이름</h1>
                        <p class="img_file">이미지파일</p>
                        <p class="location">
                            <span class="country">나라이름</span>,<span class="city">도시이름</span>,<span class="detail">상세주소</span>
                        </p>
                        <p class="bookingday">
                            <span>예약일자 : </span>
                            <span class="bi_start_dt">시작일</span>
                            <span>~</span>
                            <span class="bi_end_dt">끝일</span>
                        </p>
                        <p class="guest">
                            <span>어른</span><span class="adult"></span><span>명, </span>
                            <span>어린이</span><span class="child"></span><span>명, </span>
                            <span>유아</span><span class="infant"></span><span>명, </span>
                            <span>애완동물</span><span class="dog"></span><span>마리</span>
                        </p>
                        <p class="bi_status">예약상황</p>
                        <div class="fee">
                            <p class="trip_fee">할증 전 요금</p>
                            <p class="trip_premium_fee">할증 요금</p>
                            <p class="trip_total_fee">총요금</p>
                        </div>
                    </div>;
                </div>
        </section>
    </main>
</body>
</html>