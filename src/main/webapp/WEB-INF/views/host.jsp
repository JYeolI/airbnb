<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
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
        .booking_info_button p[clicked="true"] {border: 1px solid #000; background-color: #eee;}
        .booking_info_wrap {height: 200px;}
        .booking_info_wrap i {font-size: 50px; margin-top: 50px;}
        .booking_info_wrap div {border: 1px solid #000; display: inline-block; border-radius: 20px; height: 180px; width: 240px; margin-left: 20px; margin-top: 10px;}
    </style>
    <c:if test="${user == null}">
        <script>
            $(function() {
                $("body").html("");
                alert("먼저 로그인을 해주세요.");
                location.href = "/";
            })
        </script>
    </c:if>
    
    <script>
        let checkout_list = new Array();
        let checkin_list = new Array();
        let hosting_list = new Array();
        let review_list = new Array();
        $(function() {
            $(".host_page_button").remove();
            $(".lang_choice_button").remove();

            let host_header_tag = 
                '<a href="/host"">호스팅 메인</a>'+
                '<a href="/msg"">메시지</a>'+
                '<a href="/calendar"">달력</a>';
            $(".page_setting_area").append(host_header_tag);
            
            $(".member_info_button").before('<i class="far fa-bell"></i>')

            $(".member_information_area > i").click(function() {
                // 알림 팝업 활성화
            })
            $.ajax({
                url:"/api/member/host", 
                type:"post",
                success:function(r) {
                    console.log(r);
                    checkout_list = r.checkout;
                    checkin_list = r.checkin;
                    hosting_list = r.hostingHouse;
                    review_list = r.reviewMsg;
                    
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

                    checkoutInfo();

                    $(".booking_info_button p").click(function() {
                        $(this).parent().children().attr("clicked", false);
                        $(this).attr("clicked", true);
                        $(".booking_info_wrap").html("");
                        if($(this).index() == 0)        { checkoutInfo(); }
                        else if($(this).index() == 1)   { hostingInfo() }
                        else if($(this).index() == 2)   { checkinInfo(); }
                        else if($(this).index() == 3)   { reviewInfo(); }
                    })
                }
            })
        })

        function checkoutInfo() {
            if(checkout_list.length == 0) {
                $(".booking_info_wrap").css({"background-color":"#eee", "text-align": "center"});
                $(".booking_info_wrap").append('<i class="far fa-calendar-check"></i><p>오늘과 내일은 체크아웃하는 게스트가 없습니다.</p>')
            }
            else {
                $(".booking_info_wrap").css({"background-color":"#fff", "text-align": "left"});
                for(let i=0; i<checkout_list.length; i++) {
                    let checkout_tag = 
                        '<div class="booking_checkout_info">'+
                            '<p>'+checkout_list[i].hi_name+'</p>'+
                        '</div>';
                    $(".booking_info_wrap").append(checkout_tag);
                }
            }
        }

        function hostingInfo() {
            if(hosting_list.length == 0) {
                $(".booking_info_wrap").css({"background-color":"#eee", "text-align": "center"});
                $(".booking_info_wrap").append('<i class="far fa-calendar-check"></i><p>현재 숙박 중인 게스트가 없습니다.</p>')
            }
            else {
                $(".booking_info_wrap").css({"background-color":"#fff", "text-align": "left"});
                for(let i=0; i<hosting_list.length; i++) {
                    let hosting_tag = 
                        '<div class="booking_hosting_info">'+
                            '<p>'+hosting_list[i].hi_name+'</p>'+
                        '</div>';
                    $(".booking_info_wrap").append(hosting_tag);
                }
            }
        }

        function checkinInfo() {
            if(checkin_list.length == 0) {
                $(".booking_info_wrap").css({"background-color":"#eee", "text-align": "center"});
                $(".booking_info_wrap").append('<i class="far fa-calendar-check"></i><p>오늘 또는 내일 체크인하는 게스트가 없습니다.</p>')
            }
            else {
                $(".booking_info_wrap").css({"background-color":"#fff", "text-align": "left"});
                for(let i=0; i<checkin_list.length; i++) {
                    let checkin_tag = 
                        '<div class="booking_checkin_info">'+
                            '<p>'+checkin_list[i].hi_name+'</p>'+
                        '</div>';
                    $(".booking_info_wrap").append(checkin_tag);
                }
            }
        }

        function reviewInfo() {
            if(review_list.length == 0) {
                $(".booking_info_wrap").css({"background-color":"#eee", "text-align": "center"});
                $(".booking_info_wrap").append('<i class="far fa-calendar-check"></i><p>작성할 게스트 후기가 없습니다.</p>')
            }
            else {
                $(".booking_info_wrap").css({"background-color":"#fff", "text-align": "left"});
                for(let i=0; i<review_list.length; i++) {
                    let review_tag = 
                        '<div class="booking_review_info">'+
                            '<p>'+review_list[i].mi_name+'</p>'+
                        '</div>';
                    $(".booking_info_wrap").append(review_tag);
                }
            }
        }
        
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
            <p id="booking_checkout" clicked="true">체크아웃 예정(<span></span>건)</p>
            <p id="booking_hosting">현재 호스팅 중(<span></span>건)</p>
            <p id="booking_checkin">체크인 예정(<span></span>건)</p>
            <p id="booking_review">작성할 후기(<span></span>건)</p>
        </div>
        <div class="booking_info_wrap"></div>
    </section>
</body>
</html>