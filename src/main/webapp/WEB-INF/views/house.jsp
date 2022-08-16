<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/assets/js/common/util.js"></script>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css" integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css" integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        section {width: 1200px; border: 1px solid #000;}
        .amenity_icon, .room_icon {width: 50px; height: 50px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
        .icon {width: 50px; height: 50px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
        .main_img > div {width: 400px; height: 400px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
        .sub_img > div {width: 100px; height: 100px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
        .profile_img {width: 100px; height: 100px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
        .house_main, .house_desc, .house_room, .house_amenity, .booking_info, .host_info, .house_rule, .review_info {border-bottom: 1px solid #333;}
    </style>
    <script>

        let query = window.location.search;
        let param = new URLSearchParams(query);
        let house_seq = param.get('house_seq');

        $(function(){
            $.ajax({
                url:"/api/house/?house_seq="+house_seq,
                type:"get",
                success:function(r){
                    console.log(r)


                    //섹션 메인
                    let house_title = r.houseDetail.house_name
                    $(".house_title").html(house_title);
                    let house_address = r.houseDetail.house_country +","+ r.houseDetail.house_city +","+ r.houseDetail.house_address;
                    $(".house_address").html(house_address);
                    let main_img = '<div style="background-image: url(/img/house/'+r.imgList[0]+');"></div>';
                    $(".main_img").append(main_img);
                    if(r.imgList.length > 1){
                        for(let i = 1; i < r.imgList.length; i++){
                            let sub_img_tag = '<div style="background-image: url(/img/house/'+r.imgList[i]+');"></div>';
                            $(".sub_img").append(sub_img_tag);
                        }
                    }

                    //섹션 메인2 호스트이미지는 호스트정보섹션에서 같이
                    $(".guest").html(r.houseDetail.house_guest);
                    $(".bedroom").html(r.houseDetail.house_bedroom);
                    $(".bed").html(r.houseDetail.house_bed);
                    $(".bathroom").html(r.houseDetail.house_bathroom);
                    let desc_title = r.houseDetail.host_name + " 님이 호스팅하는 " + r.houseDetail.house_sort_detail;
                    let desc_content = r.houseDetail.house_description;
                    $(".desc_title").html(desc_title);
                    $(".desc_content").html(desc_content);

                    //섹션 숙박장소
                    let bed = r.houseDetail.house_bed;
                    let bedroom = r.houseDetail.house_bedroom;
                    let lastroom = r.houseDetail.house_lastroom;
                    let bathroom = r.houseDetail.house_bathroom;

                    //침실 생성
                    for(let i = 0; i < bedroom; i++){
                        let tag = 
                            "<div>"+
                                '<div id="room_icon_wrap'+i+'">'+
                                '</div>'+
                                '<div>'+
                                    '<h3>침실'+(i+1)+'</h3>'+
                                    '<p id="bed_desc'+i+'"></p>'+
                                '</div>'+
                            '</div>';
                        $(".house_room").append(tag);
                    }
                    //침대 아이콘 생성 - 침실순서대로 침대 집어넣기
                    for(let i = 0, j = 0; i < bedroom, j < bed; i++, j++){
                        if(i==bedroom)i=0;
                        let room_icon = '<div class="room_icon" style="background-image: url(/img/common/single_bed.png);"></div>';
                        $("#room_icon_wrap"+i).append(room_icon);
                    }
                    //요와 이불 문구 생성 - 아이콘 개수 세서 개수만큼 침실에 집어넣기
                    for(let i = 0; i < bedroom; i++){
                        $("#bed_desc"+i).html("요와 이불 "+$("#room_icon_wrap"+i+" > .room_icon").length+"개");
                    }
                    //욕실 생성
                    for(let i = 0; i < bathroom; i++){
                        let bathroom_tag = 
                            "<div>"+
                                '<div class="room_icon_wrap">'+
                                    '<div class="room_icon" style="background-image: url(/img/common/bathroom_1.png);"></div>'+
                                    '<div class="room_icon" style="background-image: url(/img/common/bathroom_2.png);"></div>'+
                                    '<div class="room_icon" style="background-image: url(/img/common/bathroom_3.png);"></div>'+
                                '</div>'+
                                '<div>'+
                                    '<h3>욕실</h3>'+
                                    '<p>욕조와 샤워부스</p>'+
                                '</div>'+
                            '</div>';
                        $(".house_room").append(bathroom_tag);
                    }

                    //센션 편의시설
                    for(let i = 0; i<r.amenityList.length; i++){
                        let amenity_tag =                             
                        '<div>'+
                            '<div class="amenity_icon_wrap">'+
                                '<div class="amenity_icon" style="background-image: url(/img/amenity/'+r.amenityList[i].amenity_icon+');"></div>'+
                            '</div>'+
                            '<p>'+r.amenityList[i].amenity_content+'</p>'+
                        '</div>';
                        $(".amenity_content").append(amenity_tag);
                    }
                    //섹션 편의시설 팝업 버튼 생성
                    if(r.amenityList.length>10){
                        let tag = '<button>편의시설 <span id="amenity_cnt"></span>개 모두 보기</button>';
                        $(".more_amenity").append(tag);
                    }

                    //섹션 호스트정보 ##서버 연결시 URL변경필요
                    $(".host_name").html(r.houseDetail.host_name);
                    let hose_profile_tag = 
                    '<a href="http://localhost:7777/profile?member_seq=+'+r.houseDetail.host_seq+'">'+
                        '<div class="profile_img" style="background-image: url(/img/member/'+r.houseDetail.host_img+');"></div>'+
                    '</a>';
                    $(".host_img").append(hose_profile_tag);
                    $(".reg_dt").html(dateFormatting(r.houseDetail.host_reg_dt));
                    let rev_cnt = r.houseDetailCnt.house_review_cnt;
                    if(rev_cnt==null) rev_cnt=0;
                    $(".rev_cnt").html(rev_cnt);
                    $(".host_desc").html(r.houseDetail.host_description);
                    $(".hosting_cnt").html(r.houseDetailCnt.hosting_house_cnt);
                    if(".super_host"==0){
                        $(".superhost").hide();
                    }
                    $(".total_rev_cnt").html(r.houseDetailCnt.total_review_cnt);
                    for(let i = 0; i<r.langList.length; i++){
                        let tag = '<span>'+r.langList[i]+'</span>';
                        $(".lang_content").append(tag);
                    }

                    //호스트 다른 숙소 후기
                    let more_rev_cnt = r.houseDetailCnt.total_review_cnt-r.houseDetailCnt.house_review_cnt;
                    $(".more_rev_cnt").html(more_rev_cnt);

                    //환불정책 ##백에서 계산해서 내주기
                    $(".refund_dt").html(r.houseDetail.house_refund_day);
                    
                    
                }
            })

            $.ajax({
                url:"/api/review/list?house_seq="+house_seq,
                type:"get",
                success:function(r){
                    console.log(r)

                    //섹션 후기정보
                    let total_avg = "";
                    if(r.reviewPoint==null){
                        total_avg = "New";
                        $(".null_msg").html(r.reviewNullMsg);
                    }
                    else{
                        total_avg = r.reviewPoint.total_avg.toFixed(2);
                    }
                    $(".total_avg").html(total_avg);
                    
                    for(let i = 0; i<r.reviewList.length; i++){
                        let review_tag = 
                                '<div class="review">'+
                                    '<div class="guest_img">'+
                                        '<a href="http://localhost:7777/profile?member_seq='+r.reviewList[i].guest_seq+'">'+
                                            '<div class="profile_img" style="background-image: url(/img/member/'+r.reviewList[i].guest_img+');"></div>'+
                                        '</a>'+
                                    '</div>'+
                                    '<div class="guest_review">'+
                                        '<h5 id="guest_name">'+r.reviewList[i].guest_name+'</h5>'+
                                        '<p class="reg_dt">'+r.reviewList[i].guest_rev_dt+'</p>'+
                                        '<p class="content">'+r.reviewList[i].guest_review+'</p>'+
                                    '</div>'+
                                '</div>';
                        $(".review_content").append(review_tag);   
                        if(r.reviewList[i].host_seq != null){
                            let reply_tag =
                                    '<div class="reply">'+
                                        '<div class="host_img">'+
                                            '<a href="http://localhost:7777/profile?member_seq='+r.reviewList[i].host_seq+'">'+
                                                '<div class="profile_img" style="background-image: url(/img/member/'+r.reviewList[i].host_img+');"></div>'+
                                            '</a>'+
                                        '</div>'+
                                        '<div class="host_reply">'+
                                            '<h5 id="host_name">'+r.reviewList[i].host_name+'</h5>'+
                                            '<p class="reg_dt">'+r.reviewList[i].host_rpl_dt+'</p>'+
                                            '<p class="content">'+r.reviewList[i].host_reply+'</p>'+
                                        '</div>'+
                                    '</div>';
                            $(".review_content").append(reply_tag);
                        }
                    }

                }
            })
        })
        


    </script>
</head>
<body>


<section>
    <div class="house_main">
        <h1 class = house_title></h1>
        <h3 class="house_address"></h3>
        <p>
            <span>★</span> 
            <span class="total_avg"></span>
            <span> · 후기</span>
            <span class="rev_cnt"></span>
            <span>개</span>
        </p>
        <p class="superhost">
            <i class="fa-solid fa-medal"></i> 
            <span>슈퍼호스트</span>
        </p>
        <div class="house_img">
            <div class="main_img">

            </div>
            <div class="sub_img">
                
            </div>
        </div>
    </div>
    <div class="house_desc">
        <h2 class="desc_title"></h2>
        <div class="host_img">
            
        </div>
        <p clasee="house_guest">
            <span>최대인원</span> 
            <span class="guest"></span>
            <span> · 침실</span>
            <span class="bedroom"></span>
            <span>개</span>
            <span> · 침대</span>
            <span class="bed"></span>
            <span>개</span>
            <span> · 욕실</span>
            <span class="bathroom"></span>
            <span>개</span>
        </p>
        <p class="house_achievement">
            house_achievement 구현 미정
        </p>
        <p class="desc_content"></p>
    </div>
    <div class="house_room">

    </div>
    <div class="house_amenity">
        <h3 class="inner_title">편의시설</h3>
        <div class="amenity_content">
            
        </div>
        <div class="more_amenity"></div>
    </div>
    <div class="booking_info">
        #####
    </div>
    <div class="review_info">
        <h3 class="inner_title">후기</h3>
        <div class="more_review">
            <div class="icon" style="background-image: url(img/common/star.png);"></div>
            <p>이 호스트의 다른 숙소에 대한 후기가
                <span class="more_rev_cnt"></span> 개 있습니다.
                <a href="#">다른 숙소 후기 보기</a>
            </p>
        </div>
        <div class="public_msg">
            <div class="icon" style="background-image: url(img/common/public_msg.png);"></div>
            <p>여행에 차질이 없도록 최선을 다해 도와드리겠습니다. 모든 예약은 에어비앤비의 게스트 환불 정책에 따라 보호를 받습니다.</p>
        </div>
        <div class="review_content">
            <h3 class="null_msg"></h3>
        </div>
    </div>
    <div class="host_info">
        <div class="host_img">
            
        </div>
        <h3 class="inner_title">호스트 : <span class="host_name"></span></h3>
        <p class="reg_dt"></p>
        <p>
            <span>★</span> 
            <span class="total_avg"></span>
            <span> · 후기</span>
            <span class="total_rev_cnt"></span>
            <span>개</span>
            <span> · 호스팅 중인 숙소</span>
            <span class="hosting_cnt"></span>
            <span>개</span>
        </p>
        <p class="superhost">
            <i class="fa-solid fa-medal"></i> 
            <span>슈퍼호스트</span>
        </p>
        <p class="host_desc">

        </p>
        <div class="superhost_desc">

        </div>
        <div class="superhost_desc">
            <h3><span class="host_name"></span>님은 슈퍼호스트입니다.</h3>
            <p>슈퍼호스트는 풍부한 경험과 높은 평점을 자랑하며 게스트가 숙소에서 편안히 머무를 수 있도록 최선을 다하는 호스트입니다.</p>
        </div>
        <div class="host_lang">
            <p>언어: </p>
            <p class="lang_content"></p>
        </div>
    </div>
    <div class="house_rule">
        <h3 class="inner_title">알아두어야 할 사항</h3>
        <div class="">
            <h3>숙소 이용규칙</h3>
            <div>
                <div class="icon" style="background-image: url(/img/common/timer.png);"></div>
                <p>체크인 : <span class="check_in"></span></p>
            </div>
            <div>
                <div class="icon" style="background-image: url(/img/common/timer.png);"></div>
                <p>체크아웃 : <span class="check_out"></span></p>
            </div>
        </div>
        <div class="">
            <h3>건강과 안전</h3>
            <div class="safety_content">
                <div id="amenity59">
                    <div class="amenity_icon_wrap">
                        <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_1.png);"></div>
                    </div>
                    <p>화재 경보기</p>
                </div>            
                <div id="amenity60">
                    <div class="amenity_icon_wrap">
                        <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_2.png);"></div>
                    </div>
                    <p>일산화탄소 경보기</p>
                </div>
                <div id="amenity61">
                    <div class="amenity_icon_wrap">
                        <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_3.png);"></div>
                    </div>
                    <p>소화기</p>
                </div>
                <div id="amenity62">
                    <div class="amenity_icon_wrap">
                        <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_4.png);"></div>
                    </div>
                    <p>구급상자</p>
                </div>
                <div id="amenity63">
                    <div class="amenity_icon_wrap">
                        <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_5.png);"></div>
                    </div>
                    <p>숙소 내 보안카메라</p>
                </div>
            </div>
        </div>
        <div class="">
            <h3>환불 정책</h3>
            <p><span class="refund_dt">##컨트롤러에서날짜계산필요##</span> 오후 12시전에 취소하면 부분 환불을 받으실 수 있습니다.</p>
            <p class="additional_desc">부분 환불: 전체 숙박 요금의 50%를 환불받으실 수 있습니다. 서비스 수수료는 전액 환불됩니다.</p>
        </div>
    </div>

</section>



</body>
</html>