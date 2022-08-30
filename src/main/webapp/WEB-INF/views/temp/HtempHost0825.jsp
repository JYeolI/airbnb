<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/temp/HtempHeader.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .member_information_area > i {border: 1px solid #ccc; border-radius: 100%; padding: 10px; vertical-align: middle; cursor: pointer; text-align: center;}
        .page_setting_area {display: inline-block; width: 500px;}
        .page_setting_area a {display: inline-block; margin-left: 50px; text-align: center; vertical-align: middle; color: #000; text-decoration: none;}

        section {border: 1px solid #000;}
        .house_info_tag {display: inline-block; padding: 10px; margin: 10px; border: 1px solid #000; width: 100px; height: 50px; border-radius: 10px; text-align: center; text-decoration: none; color: #000;}
        .booking_info_button p {border: 1px solid #ccc; border-radius: 50px; display: inline-block; padding: 10px 15px; margin-left: 10px; cursor: pointer;}
    </style>
    <script>
        $(function() {
            $(".host_page_button").remove();
            $(".lang_choice_button").remove();

            let host_header_tag = 
                '<a href="/h/host"">호스팅 메인</a>'+
                '<a href="/message"">메시지</a>'+
                '<a href="/h/calendar"">달력</a>';
            $(".page_setting_area").append(host_header_tag);
            
            $(".member_info_button").before('<i class="far fa-bell"></i>')

            $(".member_information_area > i").click(function() {
                // 알림 팝업 활성화
            })
            $.ajax({
                url:"/api/h/host", 
                type:"post",
                success:function(r) {
                    console.log(r);
                    for(let i=0; i<r.allHouse.length; i++) {
                        let house_list_tag = 
                            '<a href="/house?house_seq='+r.allHouse[i].hi_seq+'" class="house_info_tag">'+
                                '<p>'+r.allHouse[i].hi_name+'</p>'+
                            '</a>';
                            $(".house_info_wrap").append(house_list_tag);
                    }
                    $("#booking_checkout span").append(r.checkout.length);
                    $("#booking_hosting span").append(r.hostingHouse.length);
                    $("#booking_checkin span").append(r.checkin.length);
                    $("#booking_review span").append(r.reviewMsg.length);
                    $(".booking_info_button p:clicked").css({"border":"1px solid #000", "background-color":"#eee"})
                }
            })
        })
    </script>
</head>
<body>
    <section class="house_info_area">
        <h2>내 숙소</h2>
        <div class="house_info_wrap"></div>
    </section>
    <section class="booking_info_area">
        <h2>예약</h2>
        <div class="booking_info_button">
            <p id="booking_checkout" clicked>체크아웃 예정(<span></span>건)</p>
            <p id="booking_hosting">현재 호스팅 중(<span></span>건)</p>
            <p id="booking_checkin">체크인 예정(<span></span>건)</p>
            <p id="booking_review">작성할 후기(<span></span>건)</p>
        </div>
        <div class="booking_info_wrap"></div>
    </section>
</body>
</html>