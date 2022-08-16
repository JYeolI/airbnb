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
        .house_img {width: 200px; height: 100px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
    </style>
    <script>
        $(function(){
            $.ajax({
                url:"/api/booking/list",
                type:"get",
                success:function(r){
                    $(".trip_list").html("");
                    console.log(r);
                    for(let i=0; i<r.booking_list.length; i++){
                        // ##여행 예정(status 0/1 날짜 안지남) // 이미 갔다온 여행(status 1 날짜 지남) // 승인거부된 여행(status 2)

                        // 예약 시작날자 ##10-12월 체크
                        let start_date = new Date(r.booking_list[i].bi_start_dt);
                        let start_year = start_date.getFullYear();
                        let start_month = start_date.getMonth();
                        let start_day = start_date.getDay();
                        if(start_month > 0){ start_month = "0"+start_month;}
                        if(start_day > 0){ start_day = "0"+start_day;}
                        let start_date_tag = start_year+"-"+start_month+"-"+start_day;

                        // 예약 끝날자 ##10-12월 체크
                        let end_date = new Date(r.booking_list[i].bi_end_dt);
                        let end_year = end_date.getFullYear();
                        let end_month = end_date.getMonth();
                        let end_day = end_date.getDay();
                        if(end_month > 0){ end_month = "0"+end_month;}
                        if(end_day > 0){ end_day = "0"+end_day;}
                        let end_date_tag = end_year+"-"+end_month+"-"+end_day;

                        // 예약현황
                        let status = r.booking_list[i].bi_status
                        let status_tag = "";
                        if(status == 0) {
                            status_tag = '<span>승인대기</span>';
                        }
                        else if(status == 1) {
                            status_tag = '<span>승인</span>';
                        }

                        // 게스트 인원
                        let adult = r.booking_list[i].adult;
                        let child = r.booking_list[i].child;
                        let infant = r.booking_list[i].infant;
                        let dog = r.booking_list[i].dog;

                        let guest = "";
                        if(adult != 0) {
                            let tag = '어른'+ adult + '명, ';
                            guest += tag;
                        }
                        if(child != 0) {
                            let tag = '어린이'+ child + '명, ';
                            guest += tag;
                        }
                        if(infant != 0) {
                            let tag = '유아'+ infant + '명, ';
                            guest += tag;
                        }
                        if(dog != 0) {
                            let tag = '반려동물' + dog + '마리';
                            guest += tag;
                        }

                        let tag=
                            '<div class="trip_content">'+
                                '<p class="bi_seq">'+
                                    r.booking_list[i].bi_seq+
                                '</p>'+
                                '<h1 class="house_name">'+
                                    r.booking_list[i].hi_name+
                                '</h1>'+
                                '<div class="img_file">'+
                                    '<div class="house_img" style="background-image: url(/img/house/'+r.booking_list[i].main_img+');"></div>'+
                                '</div>'+
                                '<p class="location">'+
                                    r.booking_list[i].country+","+r.booking_list[i].city+","+r.booking_list[i].detail+
                                '</p>'+
                                '<p class="booking_dt">'+
                                    '<span>예약일자 : </span>'+
                                    '<span class="start_dt">'+start_date_tag+'</span>'+
                                    '<span>~</span>'+
                                    '<span class="end_dt">'+end_date_tag+'</span>'+
                                '</p>'+
                                '<p class="guest">'+guest+'</p>'+
                                '<p class="status">'+
                                    status_tag+
                                '</p>'+
                                '<p class="confirm_dt">'+
                                    r.booking_list[i].confirm_dt+
                                '</p>'+
                                '<div class="fee">'+
                                    '<p class="basic_fee">기본 요금</p>'+
                                    '<p class="service_fee">청소비</p>'+
                                    '<p class="cleaning_fee">서비스 요금</p>'+
                                '</div>'+
                            '</div>';
                        $(".trip_list").append(tag);
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
                    <p class="bi_seq">예약번호</p>
                    <h1 class="hi_name">숙소이름</h1>
                    <p class="img_file">이미지파일</p>
                    <p class="location">
                        국가,도시,상세
                    </p>
                    <p class="booking_dt">
                        <span>예약일자 : </span>
                        <span class="start_dt">시작일</span>
                        <span>~</span>
                        <span class="end_dt">끝일</span>
                    </p>
                    <p class="guest">
                    </p>
                    <p class="status">예약상황</p>
                    <div class="fee">
                        <p class="basic_fee">기본 요금</p>
                        <p class="service_fee">청소비</p>
                        <p class="cleaning_fee">서비스 요금</p>
                        <p class="trip_total_fee">총요금</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>