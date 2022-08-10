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
        section {border: 1px solid #000; width: 1200px; height: 900px;}
        .profile_main_area {height: 3000px;}
        section > div {border: 1px solid #000; width: 1170px; height: 500px; margin: 10px;}
        .hosting_house_info {border: 1px solid #000; width: 400px; height: 400px; margin: 10px;}
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

                    let isSuperHost = '';
                    if(r.profileList.mi_host_grade==2) { isSuperHost = '<p id="isSuperHost">슈퍼호스트</p>' }
                    let side_profile_tag =
                        '<img src="/img/member/'+r.profileList.mimg_file+'">'+
                        isSuperHost;
                    $(".profile_side_area").append(side_profile_tag);

                    $(".main_profile_wrap h1 span").html(r.profileList.mi_name);
                    $(".main_profile_wrap p span").html(dateFormatting(r.profileList.mi_reg_dt));
                    $(".member_description").html(r.profileList.mi_description);
                    $(".member_address span").html(r.profileList.mai_city+", "+r.profileList.cc_content);

                    $(".hosting_house_wrap h2 span").html(r.profileList.mi_name);
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
                <div class="hosting_house_info"></div>
            </div>
            <div class="review_wrap"></div>
        </section>
    </main>
</body>
</html>