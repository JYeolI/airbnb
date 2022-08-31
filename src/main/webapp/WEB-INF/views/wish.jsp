<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css" integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css" integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        section {width: 1200px; border: 1px solid #000;}
        .wish_list > div {width: 800px; border: 1px solid #000;}
        .star {color: red;}
        .wish_heart {width: 20px; height: 20px;}
        .img {width: 400px; height: 400px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
        .heart {
            background-size: 100%; width: 20px; height: 20px; color: #000; background-repeat: no-repeat;
            background-image: url(img/common/heart.png);
        }
        .heart_on {
            background-image: url(img/common/red_heart.png);
        }
    </style>
    <script>
        
        $(function(){

            //위시리스트 조회
            showWishList();

        })

        // 위시리스트 조회
        function showWishList(){
            $.ajax({
                url:"/api/member/wish",
                type:"get",
                success:function(r){
                    console.log(r);
                    $(".wish_list").html("");
                    for(let i=0; i<r.wishList.length; i++){

                        //리뷰개수가 없으면 리뷰개수 0, 평점 New표시
                        let total_avg = "";
                        let rev_cnt = "";
                        if(r.wishList[i].rev_cnt==0){
                            total_avg = "New";
                            rev_cnt = 0;
                        }
                        else{
                            total_avg = r.wishList[i].total_avg.toFixed(2);
                            rev_cnt = r.wishList[i].rev_cnt;
                        }

                        let tag = 
                            '<div id="wish_content'+r.wishList[i].wish_seq+'">'+
                                '<div onclick="clickHeart('+r.wishList[i].wish_seq+')" class="wish_heart">'+
                                    '<div class="heart heart_on" id="heart'+r.wishList[i].wish_seq+'"></div>'+
                                '</div>'+
                                '<p class="house_address">'+r.wishList[i].country+", "+r.wishList[i].city+", "+r.wishList[i].detail+'</p>'+
                                '<dis class="img_wrap">'+
                                    '<div class="img" style="background-image: url(img/house/'+r.wishList[i].main_img+');"></div>'+
                                '</dis>'+
                                '<h1 class="house_name">'+r.wishList[i].hi_name+'</h1>'+
                                '<div class="wish_guest">'+
                                    '<span>최대인원</span><span class="guest_count">'+r.wishList[i].guest+'</span><span>명</span>'+
                                    '<span>침대</span><span class="bed">'+r.wishList[i].bed+'</span><span>개</span>'+
                                    '<span>침실</span><span class="bedroom">'+r.wishList[i].bedroom+'</span><span>개</span>'+
                                    '<span>공동 사용 욕실</span><span class="bathroom">'+r.wishList[i].bathroom+'</span><span>개</span>'+
                                '</div>'+
                                '<div class="review">'+
                                    '<p>'+
                                        '<span class="star">★</span>'+'<span>'+total_avg+'</span>'+
                                        '<span>(후기 </span><span>'+rev_cnt+'</span><span>개)</span>'+
                                    '</p>'+
                                '</div>'+
                                '<div class="price">'+
                                    '<span>&#8361</span><span class="house_price">'+r.wishList[i].price+'</span><span>/박</span>'+
                                '</div>'+
                            '</div>';
                        $(".wish_list").append(tag);
                    }
                }
            })
        }

        //하트 클릭시 위시리스트 제거 및 아이디로 숨기기
        function clickHeart(wish_seq) {
            //위시리스트 삭제 
            $.ajax({
                url:"/api/member/wish?wish_seq="+wish_seq,
                type:"delete",
                success:function(r){
                    console.log(r);
                    $("#wish_content"+wish_seq).hide();
                    return;
                }
            })
        }

    </script>
</head>
<body>
    <main>

        <section>
            //위시리스트
            <div class="wish_list">
                <div class="wish_content">
                    <div class="wish_heart">
                        <div class="heart" style="background-image: url(img/common/heart.png);"></div>
                    </div>
                    <h3 class="house_name"></h3>
                    <dis class="img_wrap">
                        <div class="img" style="background-image: url();"></div>
                    </dis>
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
                        <span>&#8361</span><span class="house_price"></span><span>/박</span>
                    </div>
                </div>
            </div>
        </section>
        
    </main>
</body>
</html>