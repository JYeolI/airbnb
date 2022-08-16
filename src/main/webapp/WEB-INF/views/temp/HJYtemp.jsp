<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        section {border: 1px solid #000; width: 1200px;}
        section > div {border: 1px solid #000; width: 1170px; margin: 10px;}
        .hosting_house_info {border: 1px solid #000; width: 400px; margin: 10px;}
        .review_list {border: 1px solid #000; width: 400px; margin: 10px;}
    </style>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(function() {
            // 파라미터 받아오기
            const urlParams = new URL(location.href).searchParams;
            let member_seq = urlParams.get('member_seq');

            $.ajax({
                url:"/api/h/profile?member_seq="+member_seq,
                type:"get",
                success:function(r) {
                    console.log(r);

                    // 슈퍼 호스트 처리
                    let isSuperHost = '';
                    if(r.profileList.mi_host_grade==2) {
                        isSuperHost = '<p id="isSuperHost">슈퍼호스트</p>'
                    }

                    // side section
                    let side_profile_tag =
                        '<img src="/img/member/'+r.profileList.mimg_file+'">'+
                        isSuperHost+
                        '<p class="review_count">후기 '+(r.reviewCountToHost+r.reviewCountToGuest)+'개</p>';
                    $(".profile_side_area").append(side_profile_tag);

                    // first section
                    $(".main_profile_wrap h1 span").html(r.profileList.mi_name);
                    $(".main_profile_wrap p span").html(dateFormatting(r.profileList.mi_reg_dt));
                    $(".member_description").html(r.profileList.mi_description);
                    $(".member_address span").html(r.profileList.mai_city+", "+r.profileList.cc_content);

                    // second section
                    console.log(r.houseList);
                    if(r.houseList == undefined) {
                        $(".hosting_house_wrap").remove();
                    }
                    else {
                        $(".hosting_house_wrap h2 span").html(r.profileList.mi_name);
                        for(let i=0; i<r.houseList.length; i++) {
                            let house_type = "";
                            if(r.houseList[i].hi_type == 1) { house_type = "공간전체"; }
                            else if(r.houseList[i].hi_type == 2) { house_type = "개인실"; }
                            else if(r.houseList[i].hi_type == 3) { house_type = "다인실"; }
                            let hosting_house_tag = 
                                // url주소 제대로 적을 것
                                '<a href="#?='+r.houseList[i].hi_seq+'" class="hosting_house_info">'+
                                    '<img src="/img/house/'+r.houseList[i].himg_file+'">'+
                                    '<p class="review_point_average">'+
                                        '<span id="point_star" style="color: #f00">★</span>'+
                                        '<span id="point_average">'+r.houseList[i].total_avg.toFixed(2)+'</span>'+
                                        '<span id="point_count">()</span>'+
                                    '</p>'+
                                    '<p class="house_info">'+
                                        '<span id="house_name">'+r.houseList[i].hi_name+'</span>'+
                                        '<span> · </span>'+
                                        '<span id="house_name">'+house_type+'</span>'+
                                        '<span> · </span>'+
                                        '<span id="house_name">'+r.houseList[i].cs_content+'</span>'+
                                        '<span> · </span>'+
                                        '<span id="house_name">'+r.houseList[i].csd_content+'</span>'+
                                    '</p>'+
                                    '<p class="house_description">'+r.houseList[i].hi_description+'</p>'+
                                '</a>';
                            $(".hosting_house_wrap").append(hosting_house_tag);
                        }
                    }

                    // third section
                    $(".review_count span").append(r.reviewCountToHost+r.reviewCountToGuest);
                    $(".review_to_guest span").append(r.reviewCountToGuest);
                    $(".review_to_host span").append(r.reviewCountToHost);
                    if(r.reviewCountToHost+r.reviewCountToGuest == r.reviewCountToHost || r.reviewCountToHost+r.reviewCountToGuest == r.reviewCountToGuest) {
                        $(".review_button").remove();
                    }
                    // 게스트가 남긴 후기
                    function reviewListToHost() {
                        for(let i=0; i<r.reviewListToHost.length; i++) {
                            let review_tag = 
                                '<div class="review_list">'+
                                    '<p class="review_reg_dt">'+dateFormatting(r.reviewListToHost[i].rev_reg_dt)+'</p>'+
                                    '<p class="review_content">'+r.reviewListToHost[i].rev_content+'</p>'+
                                    '<a href="#?='+r.reviewListToHost[i].mi_seq+'"><img src="/img/member/'+r.reviewListToHost[i].mimg_file+'"></a>'+
                                    '<p class="review_writer_info">'+
                                        '<span id="writer_name">'+r.reviewListToHost[i].mi_name+'님, </span>'+
                                        '<span id="writer_country">'+r.reviewListToHost[i].cc_content+'</span>'+
                                    '</p>'+
                                    '<p id="writer_reg_dt">'+dateFormatting(r.reviewListToHost[i].mi_reg_dt)+'</p>'+
                                '</div>';
                            $(".review_info").append(review_tag);
                        }
                    }
                    // 호스트가 남긴 후기
                    function reviewListToGuest() {
                        for(let i=0; i<r.reviewListToGuest.length; i++) {
                            let review_tag = 
                                '<div class="review_list">'+
                                    '<p class="review_reg_dt">'+dateFormatting(r.reviewListToGuest[i].grev_reg_dt)+'</p>'+
                                    '<p class="review_content">'+r.reviewListToGuest[i].grev_content+'</p>'+
                                    '<a href="#?='+r.reviewListToGuest[i].writer_seq+'"><img src="/img/member/'+r.reviewListToGuest[i].writer_img+'"></a>'+
                                    '<p class="review_writer_info">'+
                                        '<span id="writer_name">'+r.reviewListToGuest[i].writer_name+'님, </span>'+
                                        '<span id="writer_country">'+r.reviewListToGuest[i].writer_country+'</span>'+
                                    '</p>'+
                                    '<p id="writer_reg_dt">'+dateFormatting(r.reviewListToGuest[i].writer_reg_dt)+'</p>'+
                                '</div>';
                            $(".review_info").append(review_tag);
                        }
                    }
                    $(".review_to_host").click(function() {
                        $(".review_to_guest").css({"font-weight":"normal", "text-decoration":"none"});
                        $(this).css({"font-weight":"bold", "text-decoration":"underline"});
                        $(".review_info").html("");
                        reviewListToHost();
                    })
                    $(".review_to_guest").click(function() {
                        $(".review_to_host").css({"font-weight":"normal", "text-decoration":"none"});
                        $(this).css({"font-weight":"bold", "text-decoration":"underline"});
                        $(".review_info").html("");
                        reviewListToGuest();
                    })
                    
                    if(r.reviewListToHost[0] != null) {
                        $(".review_to_host").css({"font-weight":"bold", "text-decoration":"underline"});
                        reviewListToHost();
                    }
                    else {
                        reviewListToGuest();
                    }
                }
            })
        })

        function dateFormatting(dt) {
            return new Date(+new Date(dt) + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
        }
    </script>
</head>
<body>
    <main>
        <section class="profile_side_area"></section>
        <section class="profile_main_area">
            <div class="main_profile_wrap">
                <h1>안녕하세요. 저는 <span></span>입니다.</h1>
                <p>회원가입:<span></span></p>
                <h2>소개</h2>
                <p class="member_description"></p>
                <p class="member_address">거주지:<span></span></p>
                
            </div>
            <div class="hosting_house_wrap">
                <h2><span></span>님의 숙소</h2>
            </div>
            <div class="review_wrap">
                <h2 class="review_count">★ 후기 <span></span>개</h2>
                <div class="review_button">
                    <p class="review_to_host">게스트가 남긴 후기(<span></span>)</p>
                    <p class="review_to_guest">호스트가 남긴 후기(<span></span>)</p>
                </div>
                <div class="review_info"></div>
            </div>
            <a href="#" class="profile_report">이 프로필 신고하기</a>
        </section>
    </main>
</body>
</html>