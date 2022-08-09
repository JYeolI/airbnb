<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        // 여행 예약
        $(function(){
            $.ajax({
                // url:"/api/trip_response?seq="+$(this).attr("date-seq"),
                url:"/api/trip_response?seq="+1,
                type:"get",
                success:function(r){
                    console.log(r);
                    for(let i=0; i<r.trip_list.length; i++){
                        $(".trip").append("<div class=trip_response>"+r.trip_list[i].adult+"</div>")
                        
                    }
                }
            })
        })
        // 위시리스트
        $(function(){
            $.ajax({
                // url:"/api/trip_response?seq="+$(this).attr("date-seq"),
                url:"/api/wish?seq="+1,
                type:"get",
                success:function(r){
                    console.log(r);
                    for(let i=0; i<r.wish_list.length; i++){
                        // $(".wish").append("<div class=wish_list>"+r.wish_list[i]+"</div>")
                        let tag=
                            '<div class="wish">'+
                                '<h1 class="wish_title">'+r.wish_list[i].wish_title+'</h1>'+
                                '<div class="wish_heart">'+r.wish_list[i].wish_order+'</div>'+
                                '<h3 class="house_name">'+r.wish_list[i].hi_name+'</h3>'+
                                // '<dis class="main_img">'+r.wish_list[i].main_img+'</dis>'+
                                '<p class="house_user_id">'+r.wish_list[i].wish_mi_seq+'</p>'+
                                '<div class="wish_guest">'+
                                    '<span>최대인원</span><span class="guest_count">'+r.wish_list[i].guest+'</span><span>명</span>'+
                                    '<span>침대</span><span class="bed">'+r.wish_list[i].bed+'</span><span>개</span>'+
                                    '<span>침실</span><span class="bedroom">'+r.wish_list[i].bedroom+'</span><span>개</span>'+
                                    '<span>공동 사용 욕실</span><span class="bathroom">'+r.wish_list[i].bathroom+'</span><span>개</span>'+
                                '</div>'+
                                '<div class="review">'+
                                    '<p class="total_avg">'+r.wish_list[i].total_avg+'</p>'+
                                    '<span>(후기</span><span class="review_count">'+r.wish_list[i].wish_mi_seq+'</span><span>개)</span>'+
                                '</div>'+
                                '<div class="price">'+
                                    '<span>$</span><span class="house_price">'+r.wish_list[i].price+'</span><span>/박</span>'+
                                '</div>'+
                            '</div>'
                            $(".wish").append(tag);
                    }
                    
                }
            })
        })
    </script>
</head>
<body>
    <main>
        <!-- 여행예약 -->
        <section style="width: 1200px; border: 1px solid #000" >
            <div class="trip">
                <h1 class=""></h1>
                <h3 class="house_name"></h3>
                <p class=""></p>
                <p class="review_star"></p>
            </div>
        </section>
        <!-- 위시리스트 -->
        <section style="width: 1200px; border: 1px solid #000" >
            <div class="wish">
                <h1 class="wish_title"></h1>
                <div class="wish_heart"></div>
                <h3 class="house_name"></h3>
                <!-- <dis class="main_img"></dis> -->
                <p class="house_user_id"></p>
                <div class="wish_guest">
                    <span>최대인원</span><span class="guest_count"></span><span>명</span>
                    <span>침대</span><span class="bed"></span><span>개</span>
                    <span>침실</span><span class="bedroom"></span><span>개</span>
                    <span>공동 사용 욕실</span><span class="bathroom"></span><span>개</span>
                </div>
                <div class="review">
                    <p class="total_avg"></p>
                    <span>(후기</span><span class="review_count"></span><span>개)</span>
                </div>
                <div class="price">
                    <span>$</span><span class="house_price"></span><span>/박</span>
                </div>
            </div>
        </section>
    </main>
</body>
</html>