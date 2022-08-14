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
        .review {width: 800px; height: 400px; border: 1px solid #000;}
        .member_img {width: 150px; height: 150px; background-position: center; background-repeat: no-repeat; border-radius: 50%;}
        .review_on {font-weight:bold; text-decoration: underline;}
        .guest_review, .host_review{display: none;}
        .on {display: block;}
    </style>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(function() {
            // 파라미터 받아오기
            const urlParams = new URL(location.href).searchParams;
            let member_seq = urlParams.get('member_seq');

            $.ajax({
                url:"/api/member/profile?member_seq="+member_seq,
                type:"get",
                success:function(r) {
                    console.log(r);
                    //정지회원 프로필 블라인드
                    if(r.memberInfo.member_status==1){
                        location.href("/api/member/profile")
                    }

                    // 슈퍼호스트 마크 ##메달 등 다른 페이지랑 공통으로 표시
                    let isSuperHost = '';
                    if(r.memberInfo.host_grade==2) {
                        isSuperHost = '<p id="isSuperHost">슈퍼호스트</p>'
                    }

                    // side section
                    let side_profile_tag =
                        '<img src="/img/member/'+r.memberInfo.profile_img+'">'+
                        isSuperHost+
                        '<p class="review_count">후기 '+(r.profileReviewCnt+r.houseReviewCnt)+'개</p>';
                    $(".profile_side_area").append(side_profile_tag);
                    

                    // first section
                    $(".main_profile_wrap h1 span").html(r.memberInfo.memeber_name);
                    $(".main_profile_wrap p span").html(dateFormatting(r.memberInfo.reg_dt));
                    $(".member_description").html(r.memberInfo.member_desc);
                    $(".member_address span").html(r.memberInfo.country+","+r.memberInfo.city+","+r.memberInfo.member_address);

                    // second section
                    if(r.houseList == null) {
                        $(".hosting_house_wrap").remove();
                    }
                    else {
                        $(".hosting_house_wrap h2 span").html(r.memberInfo.memeber_name);
                        for(let i=0; i<r.houseList.length; i++) {
                            let house_type = "";
                            if(r.houseList[i].type == 1) { house_type = "공간전체"; }
                            else if(r.houseList[i].type == 2) { house_type = "개인실"; }
                            else if(r.houseList[i].type == 3) { house_type = "다인실"; }

                            let total_avg = "";
                            if(r.houseList[i].total_avg==null){
                                total_avg = "New";
                            }
                            else{
                                total_avg = r.houseList[i].total_avg.toFixed(2)
                            }
                            let hosting_house_tag = 
                                '<a href="http://localhost:7777/house/house_seq='+r.houseList[i].house_seq+'" class="hosting_house_info">'+
                                    '<img src="/img/house/'+r.houseList[i].house_img+'">'+
                                    '<p class="review_point_average">'+
                                        '<span id="point_star" style="color: #f00">★</span>'+
                                        '<span id="point_average">'+total_avg+'</span>'+
                                        '<span id="point_count">()</span>'+
                                    '</p>'+
                                    '<p class="house_info">'+
                                        '<span id="house_name">'+r.houseList[i].house_name+'</span>'+
                                        '<span> · </span>'+
                                        '<span id="house_type">'+house_type+'</span>'+
                                        '<span> · </span>'+
                                        '<span id="house_sort">'+r.houseList[i].sort+'</span>'+
                                        '<span> · </span>'+
                                        '<span id="house_detail">'+r.houseList[i].sort_detail+'</span>'+
                                    '</p>'+
                                    '<p class="house_description">'+r.houseList[i].house_desc+'</p>'+
                                '</a>';
                            $(".hosting_house_wrap").append(hosting_house_tag);
                        }
                    }
                    
                    // third section
                    $(".review_count span").append(r.profileReviewCnt+r.houseReviewCnt);
                    $(".review_from_guest span").append(r.houseReviewCnt);
                    $(".review_from_host span").append(r.profileReviewCnt);


                    //리뷰 전환버튼 리뷰수0일시 제거/클릭시 클래스 추가
                    if(r.houseReviewCnt != 0 ) {
                        $(".host_review").addClass("on");
                        $(".on").show();
                    }
                    if(r.houseReviewCnt == 0 || r.profileReviewCnt == 0) {
                        $(".review_button").remove();
                    }
                    $(".swap_btn").click(function(){
                        $(".swap_btn").removeClass("review_on");
                        if($(".host_review").hasClass("on")){
                            $(".host_review").removeClass("on")
                        }
                        else{
                            $(".host_review").addClass("on")
                        } 
                        if($(".guest_review").hasClass("on")){
                            $(".guest_review").removeClass("on")
                        }
                        else{
                            $(".guest_review").addClass("on")
                        }
                        $(this).addClass("review_on");
                    })

                    //후기리스트 조회 태그생성
                    for(let i=0; i<r.reviewListToHost.length; i++) {
                        let write_dt = dateFormatting(r.reviewListToHost[i].write_dt);
                        let writer_seq = r.reviewListToHost[i].writer_seq;
                        let content = r.reviewListToHost[i].rev_content;
                        let writer_img = r.reviewListToHost[i].writer_img;
                        let writer_name = r.reviewListToHost[i].writer_name;
                        let writer_country = r.reviewListToHost[i].writer_country;
                        let join_dt = dateFormatting(r.reviewListToHost[i].join_dt);
                        appendReview(write_dt,writer_seq,content,writer_img,writer_name,writer_country,join_dt,".host_review");
                    }
                    for(let i=0; i<r.reviewListToGuest.length; i++) {
                        let write_dt = dateFormatting(r.reviewListToGuest[i].write_dt);
                        let writer_seq = r.reviewListToGuest[i].writer_seq;
                        let content = r.reviewListToGuest[i].rev_content;
                        let writer_img = r.reviewListToGuest[i].writer_img;
                        let writer_name = r.reviewListToGuest[i].writer_name;
                        let writer_country = r.reviewListToGuest[i].writer_country;
                        let join_dt = dateFormatting(r.reviewListToGuest[i].join_dt);
                        appendReview(write_dt,writer_seq,content,writer_img,writer_name,writer_country,join_dt,".guest_review");
                    }

                    //후기 태그 생성 및 append
                    function appendReview(write_dt,writer_seq,content,writer_img,writer_name,writer_country,join_dt,where){
                        let review_tag = 
                            '<div class="review">'+
                                '<p class="review_reg_dt">'+write_dt+'</p>'+
                                '<p class="review_content">'+content+'</p>'+
                                '<a href="http://localhost:7777/profile?member_seq='+writer_seq+'">'+
                                    '<div class="member_img" style="background-image: url(/img/member/'+writer_img+');"></div>'+
                                '</a>'+
                                '<p class="review_writer_info">'+
                                    '<span id="writer_name">'+writer_name+'님, </span>'+
                                    '<span id="writer_country">'+writer_country+'</span>'+
                                '</p>'+
                                '<p id="writer_reg_dt">'+join_dt+'</p>'+
                            '</div>';
                        $(where).append(review_tag);
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
                    <p class="swap_btn review_from_guest">게스트가 남긴 후기(<span></span>)</p>
                    <p class="swap_btn review_from_host">호스트가 남긴 후기(<span></span>)</p>
                </div>
                <div class="review_info">
                    <div class="host_review"></div>
                    <div class="guest_review"></div>
                </div>
            </div>
            <a href="#" class="profile_report">이 프로필 신고하기</a>
        </section>
    </main>
</body>
</html>