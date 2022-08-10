<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css" integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css" integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        section {width: 1200px; border: 1px solid #000;}
        
        .amenity_icon_wrap {width: 80px; height: 80px;}
        .amenity_icon_wrap > div {width: 50px; height: 50px; background-position: center; background-size: 50%; background-repeat: no-repeat;}
    </style>
    <script>
        
        $(function(){
            $.ajax({
                url:"/api/temp/detail?house_seq="+house_seq,
                type:"get",
                success:function(r){
                    console.log(r)
                }
            })
            $.ajax({
                url:"/api/temp/review/list?house_seq="+house_seq,
                type:"get",
                success:function(r){
                    console.log(r)
                }
            })
        })
    </script>
</head>
<body>


<section>
    
    //섹션1
    <div class="house_main">
        <h1 class = house_title></h1>
        <div class="house_img">
            <div class="main_img">

            </div>
            <div class="sub_img">

            </div>
        </div>
    </div>
    <div class="house_desc">
        <h2 class="desc_title"></h2>
        <p class="desc_content">

        </p>
    </div>
    <div class="house_room">


    </div>
    <div class="booking_info">


    </div>
    <div class="host_info">
        <div class="host_img">

        </div>
        <h2 class="host_name"></h2>
        <p class="reg_dt"></p>
        <p>
            <span>★ 후기</span>
            <span></span>
            <span>개</span>
        </p>
        <p class="superhost"> 슈퍼호스트 </p>
        <div class="host_desc">

        </div>
        <div class="superhost_desc">

        </div>
    </div>
    <div class="house_rule">
        <div class="">
            <h3 clss="inner_title">숙소이용규칙</h3>
            <p></p>
        </div>
        <div class="">
            <h3 clss="inner_title">건강과 안전</h3>
            <div id="amenity59">
                <div class="amenity_icon_wrap">
                    <div id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_1.png);"></div>
                </div>
                <p>화재 경보기</p>
            </div>            
            <div id="amenity60">
                <div class="amenity_icon_wrap">
                    <div id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_2.png);"></div>
                </div>
                <p>일산화탄소 경보기</p>
            </div>
            <div id="amenity61">
                <div class="amenity_icon_wrap">
                    <div id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_3.png);"></div>
                </div>
                <p>소화기</p>
            </div>
            <div id="amenity62">
                <div class="amenity_icon_wrap">
                    <div id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_4.png);"></div>
                </div>
                <p>구급상자</p>
            </div>
            <div id="amenity63">
                <div class="amenity_icon_wrap">
                    <div id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_5.png);"></div>
                </div>
                <p>숙소 내 보안카메라</p>
            </div>
        </div>
        <div class="">
            <h3 calss="inner_title">환불정책</h3>
            <p><span>8월 13일</span> 오후 12시전에 취소하면 부분 환불을 받으실 수 있습니다.</p>
            <p class="additional_desc">부분 환불: 전체 숙박 요금의 50%를 환불받으실 수 있습니다. 서비스 수수료는 전액 환불됩니다.</p>
        </div>
    </div>

</section>



</body>
</html>