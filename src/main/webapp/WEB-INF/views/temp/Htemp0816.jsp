<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/temp/HtempHeader.jsp"%>
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
        .mod_profile {font-weight: bold;}
        .mod_lang_list p {display: inline-block; border: 1px solid #aaa; border-radius: 15px; padding: 8px; margin: 8px;}
        .profile_report {cursor: pointer; text-decoration: underline; color: #00f;}
        .report_button:hover {cursor: not-allowed;}
    </style>
    <script>
        let langList = new Array;
        let cateCountryList = new Array;
        let cateLangList = new Array;
        let chkLangList = new Array;
        let state = "";
        let report_type = 0;
        let report_reason = "";
        // 파라미터 받아오기
        const urlParams = new URL(location.href).searchParams;
        let member_seq = urlParams.get('member_seq');
        $(function() {

            $.ajax({
                url:"/api/member/profile?member_seq="+member_seq,
                type:"get",
                success:function(r) {
                    console.log(r);

                    cateCountryList = r.cateCountryList;
                    cateLangList = r.cateLangList;
                    
                    //정지회원 프로필 블라인드
                    if(r.memberInfo.member_status==1){
                        location.href("/api/member/profile")
                    }

                    // 슈퍼호스트 마크 ##메달 등 다른 페이지랑 공통으로 표시
                    let isSuperHost = '';
                    if(r.memberInfo.host_grade==2) {
                        isSuperHost = '<p id="isSuperHost"><i class="fas fa-medal"></i>슈퍼호스트</p>'
                    }

                    // side section
                    let side_profile_tag =
                        '<img src="/img/member/'+r.memberInfo.profile_img+'">'+
                        isSuperHost+
                        '<p class="review_count"><i class="fas fa-star"></i>후기 '+(r.profileReviewCnt+r.houseReviewCnt)+'개</p>';
                    $(".profile_side_area").append(side_profile_tag);

                    // first section
                    $(".main_profile_wrap h1 span").html(r.memberInfo.memeber_name);
                    $(".main_profile_wrap p span").html(dateFormatting(r.memberInfo.reg_dt));
                    $(".member_description").html(r.memberInfo.member_desc);

                    // 거주지
                    state = r.memberInfo.country;
                    if(r.memberInfo.country != null || r.memberInfo.city != null || r.memberInfo.member_address != null) {
                        $(".member_address span").html(r.memberInfo.country+", "+r.memberInfo.city+", "+r.memberInfo.member_address);
                    }
                    else $(".member_address").remove();
                    // 언어
                    let lang = "";
                    for(let i=0; i<r.memberInfo.lang.length; i++) {
                        if(i==0) lang = r.memberInfo.lang[i];
                        else lang += ", "+r.memberInfo.lang[i];
                        langList.push(r.memberInfo.lang[i]);
                    }
                    for(let i=0; i<cateLangList.length; i++) {
                        if(langList.includes(cateLangList[i].cl_content))
                        chkLangList.push(cateLangList[i]);
                    }
                    if(lang != "") $(".member_language span").html(lang);
                    else $(".member_language").remove();
                    // 직장
                    if(r.memberInfo.company != null) $(".member_job span").html(r.memberInfo.company);
                    else $(".member_job").remove();

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
                                '<a href="http://localhost:7777/house?house_seq='+r.houseList[i].house_seq+'" class="hosting_house_info">'+
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
                    appendReview(r.reviewListToHost,".host_review");
                    appendReview(r.reviewListToGuest,".guest_review");

                    //후기 태그 생성 및 append
                    function appendReview(list,where){
                        for(let i=0; i< list.length; i++) {
                            let write_dt = dateFormatting(list[i].write_dt);
                            let writer_seq = list[i].writer_seq;
                            let content = list[i].content;
                            let writer_img = list[i].writer_img;
                            let writer_name = list[i].writer_name;
                            let writer_country = list[i].writer_country;
                            let join_dt = dateFormatting(list[i].join_dt);
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

                    $(".profile_modify").click(function() {
                        let modify_tag = 
                            '<h2>개인정보 수정</h2>'+
                                '<p id=mod_id>'
                            ;
                    })
                }
            })
        })
        
        function dateFormatting(dt) {
            return new Date(+new Date(dt) + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
        }
        function profileModify() {
            // 기존 내용
            let desc = $(".member_description").html();
            let addr = $(".member_address span").html();
            let country = "";
            let country_list_tag = "";
            for(let i=0; i<cateCountryList.length; i++) {
                if(cateCountryList[i].cc_content != state) {
                    country_list_tag += '<option value="'+cateCountryList[i].cc_seq+'">'+cateCountryList[i].cc_content+'</option>';
                }
                else {
                    country_list_tag += '<option value="'+cateCountryList[i].cc_seq+'" selected>'+cateCountryList[i].cc_content+'</option>';
                }
            }
            let city = "";
            let member_address = "";
            if(addr != undefined) {
                country = addr.split(", ")[0];
                city = addr.split(", ")[1];
                member_address = addr.split(", ")[2];
            }
            // let lang = $(".member_language span").html();
            let job = $(".member_job span").html();
            job = job!=undefined?job:"";
            
            // 수정할 내용 비우기
            $(".profile_modify").removeAttr("onclick");
            $(".profile_modify").css({"pointer-event":"none", "cursor":"not-allowed", "color":"#ccc"});
            $(".main_profile_wrap h2").hide();
            $(".member_description").hide();
            $(".member_address").hide();
            $(".member_language").hide();
            $(".member_job").hide();

            // 수정할 내용 입력하기
            let mod_profile_tag = 
                '<p class="mod_profile">소개</p>'+
                '<textarea cols="30" rows="10" id="mod_desc">'+desc+'</textarea>'+
                '<p class="mod_profile">거주지</p>'+
                '<select id="mod_country">'+
                    country_list_tag+
                '</select>'+
                '<input type="text" id="mod_city" value="'+city+'">'+
                '<input type="text" id="mod_address" value="'+member_address+'">'+
                '<p class="mod_profile">구사언어</p>'+
                '<div class="mod_lang_list"></div>'+
                '<p id="mod_lang" onclick="profileLanguage()" style="text-decoration: underline; font-weight: bold; cursor: pointer; display: inline-block;">추가하기</p>'+
                '<p class="mod_profile">직장</p>'+
                '<input type="text" id="mod_job" value="'+job+'">'+
                '<br>'+
                '<p id="mod_profile_cancel" onclick="profileModifyCancel()" style="text-decoration: underline; font-weight: bold; cursor: pointer; display: inline-block;">취소</p>'+
                '<button id="mod_profile_save" onclick="profileModifySave()">저장</button>';
            $(".main_profile_wrap").append(mod_profile_tag);

            // 얘를 cateLangList에서 구성해야된다
            for(let i=0; i<chkLangList.length; i++) {
                $(".mod_lang_list").append('<p id="lang_list'+chkLangList[i].cl_seq+'">'+chkLangList[i].cl_content+'</p>')
            }
            // chkLangList = new Array;
            // for(let i=0; i<cateLangList.length; i++) {
            //     if(langList.includes(cateLangList[i].cl_content)) {
            //         chkLangList.push(cateLangList[i].cl_seq);
            //     }
            // }
        }
        
        // 언어 체크리스트 팝업
        function profileLanguage() {
            $(".main_profile_wrap").append('<div id="language_list_popup" style="border: 1px solid #000"><button onclick="removeLangPopup()">x</button><p>구사언어</p></div>');
            for(let i=0; i<cateLangList.length; i++) {
                let lang_list_tag = 
                    '<input type="checkbox" id="language'+cateLangList[i].cl_seq+'" value="'+cateLangList[i].cl_seq+'">'+
                    '<label for="language'+cateLangList[i].cl_seq+'">'+cateLangList[i].cl_content+'</label>'+
                    '<br>';
                $("#language_list_popup").append(lang_list_tag);
                if(langList.includes(cateLangList[i].cl_content)) {
                    $("#language"+cateLangList[i].cl_seq).attr("checked", true);
                }
            }
            $("#language_list_popup").append('<button class="lang_chk" onclick="profileLanguageCheck()">완료</button>');

            $("#language_list_popup input").click(function() {
                console.log($(this).prop("checked"));
                if(!($(this).prop("checked"))) {
                    $("#lang_list"+$(this).val()).remove();
                }
                else {
                    $(".mod_lang_list").append('<p id="lang_list'+$(this).val()+'">'+$('label[for="language'+$(this).val()+'"]').text()+'</p>')
                }
            })
        }

        function removeLangPopup() {
            $("#language_list_popup").remove();
        }

        function profileLanguageCheck() {
            chkLangList = new Array;
            for(let i=0; i<cateLangList.length; i++) {
                if($("#language"+cateLangList[i].cl_seq).is(":checked")) {
                    chkLangList.push(cateLangList[i].cl_seq);
                }
            }
            $("#language_list_popup").remove();
            console.log(chkLangList);
        }
        
        function profileModifyCancel() {
            if(!confirm("프로필 정보 수정을 취소하시겠습니까?\n(입력한 정보는 저장되지 않습니다.)")) return;
            $(".mod_profile").remove();
            $("#mod_desc").remove();
            $("#mod_country").remove();
            $("#mod_city").remove();
            $("#mod_address").remove();
            $("#mod_lang").remove();
            $(".mod_lang_list").remove();
            $("#mod_job").remove();
            $("#mod_profile_cancel").remove();
            $("#mod_profile_save").remove();
            $(".profile_modify").attr("onclick", "profileModify()");
            $(".profile_modify").css({"pointer-event":"auto", "cursor":"pointer", "color":"#00f"});

            $(".main_profile_wrap h2").show();
            $(".member_description").show();
            $(".member_address").show();
            $(".member_language").show();
            $(".member_job").show();

        }

        function profileModifySave() {
            // 수정 내용 업데이트
            let mod_data = {
                member_desc:$("#mod_desc").val(),
                mai_cc_seq:$("#mod_country").val(),
                city:$("#mod_city").val(),
                member_address:$("#mod_address").val(),
                lang_seq:chkLangList,
                company:$("#mod_job").val()
            }
            console.log(mod_data);

            $.ajax({
                url:"/api/h/profile",
                type:"patch",
                contentType:"application/json",
                data:JSON.stringify(mod_data),
                success:function(r) {
                    location.reload();
                }
            })
        }

        function reportPopup() {
            $(".report_wrap").append('<div class="report_popup" style="border: 1px solid #000;"></div>')
            let report_tag = 
                '<div class="report_descript">'+
                    '<h2>어떤 문제가 있나요?</h2>'+
                    '<p>이 정보는 에어비앤비도 못봅니다.</p>'+
                '</div>'+
                '<div class="report_message" style="margin-top: 50px;">'+
                    '<p><label>사기 또는 스팸 메시지를 보내는 것 같아요<input type="radio" name="report_message" value="1"></label></p>'+
                    '<p><label>불쾌해요<input type="radio" name="report_message" value="2"></label></p>'+
                    '<p><label>호스트가 응답하지 않아요<input type="radio" name="report_message" value="3"></label></p>'+
                    '<p><label>에어비앤비 외부에서 수수료와 보증금을 지급하도록 요청해요<input type="radio" name="report_message" value="4"></label></p>'+
                    '<p><label>호스트가 예약을 취소하라고 요청해요<input type="radio" name="report_message" value="5"></label></p>'+
                    '<p><label>동네에서 호스팅하는 것이 걱정돼요<input type="radio" name="report_message" value="6"></label></p>'+
                    '<p><label>이 페이지 일부가 잘 보이지 않아요<input type="radio" name="report_message" value="7"></label></p>'+
                    '<p><label>기타<input type="radio" name="report_message" value="8"></label></p>'+
                '</div>'+
                '<button class="report_button" onclick="reported()" disabled>확인</button>';
            $(".report_popup").append(report_tag);
            $(".report_message label").click(function() {
                $(".report_button").prop("disabled", false);
                $(".report_button").css({"cursor":"auto"});
            })
        }

        function reported() {
            report_type = $(".report_message input:checked").val();

            $(".report_popup").html("");

            let report_secound_tag = 
            '<div class="report_descript">'+
                    '<h2>어떤 문제가 있는지 설명해주세요</h2>'+
                    '<p>세부 내용을 입력하세요.</p>'+
                '</div>'+
                '<div class="report_message" style="margin-top: 50px;">'+
                    '<textarea cols=30 rows=10></textarea>'+
                '</div>'+
                '<button class="report_button" onclick="reportedFinal()" disabled>제출</button>';
            $(".report_popup").append(report_secound_tag);
            $(".report_message textarea").bind('input propertychange', function() {
                $(".report_button").prop("disabled", false);
                $(".report_button").css({"cursor":"auto"});
                if($(this).val()=="") {
                    $(".report_button").prop("disabled", true);
                }
            })
        }

        function reportedFinal() {
            let report_data = {
                mrpt_to_mi_seq:member_seq,
                mrpt_type:report_type,
                mrpt_reason:$(".report_message textarea").val()
            }

            console.log(report_data);

            $.ajax({
                url:"/api/h/member/report",
                type:"put",
                contentType:"application/json",
                data:JSON.stringify(report_data),
                success:function(r) {
                    if(r.status==-1) {
                        alert(r.message);
                        location.href = "/h/login";
                    }
                    else if(r.status) {
                        alert(r.message);
                        location.reload();
                    }
                    else {
                        if(!alert(r.message)) return;
                        // alert(r.message);
                        // console.log("message");
                    }
                }
            })
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
                
                <!-- 개인정보 수정 -->
                <c:if test="${user.mi_seq == param.member_seq}">
                    <p class="profile_modify" onclick="profileModify()" style="text-decoration: underline; color: #00f; cursor: pointer;">프로필 수정</p>
                    <div class="profile_modify_popup" hidden></div>
                </c:if>
                
                <h2>소개</h2>
                <p class="member_description"></p>
                <p class="member_address"><i class="fas fa-home"></i> 거주지 : <span></span></p>
                <p class="member_language"><i class="fas fa-comment-alt"></i> 구사언어 : <span></span></p>
                <p class="member_job"><i class="fas fa-briefcase"></i> 직장 : <span></span></p>
                
            </div>
            <div class="hosting_house_wrap">
                <h2><span></span>님의 숙소</h2>
            </div>
            <div class="review_wrap">
                <h2 class="review_count">★ 후기 <span></span>개</h2>
                <div class="review_button">
                    <p class="swap_btn review_from_guest review_on">게스트가 남긴 후기(<span></span>)</p>
                    <p class="swap_btn review_from_host">호스트가 남긴 후기(<span></span>)</p>
                </div>
                <div class="review_info">
                    <div class="host_review"></div>
                    <div class="guest_review"></div>
                </div>
            </div>
            <c:if test="${user.mi_seq != param.member_seq}">
                <div class="report_wrap">
                    <p class="profile_report" onclick="reportPopup()">이 프로필 신고하기</p>
                </div>
            </c:if>
        </section>
    </main>
</body>
</html>