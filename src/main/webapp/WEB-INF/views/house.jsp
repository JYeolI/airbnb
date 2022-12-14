<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
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
        .profile_img {width: 100px; height: 100px; background-position: center; background-size: 100%; background-repeat: no-repeat; border-radius: 50%;}
        .profile_img_small {width: 50px; height: 50px; background-position: center; background-size: 100%; background-repeat: no-repeat; border-radius: 50%;}
        .house_main, .house_desc, .house_room, .house_amenity, .booking_info, .host_info, .house_rule, .review_info {border-bottom: 1px solid #333;}
        .superhost, .safety_amenity {display: none;}
        .superhost_on, .amenity_on {display: block;}
        .review_popup {display: none;}
        .guest_popup {display: none;}
        .input_area_wrap {width: 400px; border: 1px solid #333;}
        .like_input_box {width: 400px; border: 1px solid #333;}
        .review, .reply {width: 800px; border: 1px solid #333;}
        .dog_valid_msg {display: none;}
        .msg_popup {display: none;}
        .call_tooltip {text-decoration: underline; cursor: pointer;}
        .count {display: inline-block;}
        .report_popup {display: none;}
    </style>
    <script>
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let house_seq = param.get('house_seq');
        let host_seq = "";

        $("document").ready(function(){
            
            $.ajax({
                url:"/api/house/?house_seq="+house_seq,
                type:"get",
                success:function(r){
                    sessionStorage.setItem("houseInfoItem",JSON.stringify(r.houseDetail));
                    sessionStorage.setItem("totalReviewCnt",JSON.stringify(r.houseDetailCnt.total_review_cnt));
                    sessionStorage.setItem("houseImg",JSON.stringify(r.imgList[0]));

                    console.log(r)
                    host_seq = r.houseDetail.host_seq;
                    //?????? ??????
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

                    //?????? ??????2 ????????????????????? ??????????????????????????? ??????
                    $(".guest").html(r.houseDetail.house_guest);
                    $(".bedroom").html(r.houseDetail.house_bedroom);
                    $(".bed").html(r.houseDetail.house_bed);
                    $(".bathroom").html(r.houseDetail.house_bathroom);
                    let desc_title = r.houseDetail.host_name + " ?????? ??????????????? " + r.houseDetail.house_sort_detail;
                    let desc_content = r.houseDetail.house_description;
                    $(".desc_title").html(desc_title);
                    $(".desc_content").html(desc_content);

                    //?????? ????????????
                    let bed = r.houseDetail.house_bed;
                    let bedroom = r.houseDetail.house_bedroom;
                    let bathroom = r.houseDetail.house_bathroom;

                    //?????? ??????
                    for(let i = 0; i < bedroom; i++){
                        let tag = 
                            "<div>"+
                                '<div id="room_icon_wrap'+i+'">'+
                                '</div>'+
                                '<div>'+
                                    '<h3>??????'+(i+1)+'</h3>'+
                                    '<p id="bed_desc'+i+'"></p>'+
                                '</div>'+
                            '</div>';
                        $(".house_room").append(tag);
                    }
                    //?????? ????????? ?????? - ?????????????????? ?????? ????????????
                    for(let i = 0, j = 0; i < bedroom, j < bed; i++, j++){
                        if(i==bedroom)i=0;
                        let room_icon = '<div class="room_icon" style="background-image: url(/img/common/single_bed.png);"></div>';
                        $("#room_icon_wrap"+i).append(room_icon);
                    }
                    //?????? ?????? ?????? ?????? - ????????? ?????? ?????? ???????????? ????????? ????????????
                    for(let i = 0; i < bedroom; i++){
                        $("#bed_desc"+i).html("?????? ?????? "+$("#room_icon_wrap"+i+" > .room_icon").length+"???");
                    }
                    //?????? ??????
                    for(let i = 0; i < bathroom; i++){
                        let bathroom_tag = 
                            "<div>"+
                                '<div class="room_icon_wrap">'+
                                    '<div class="room_icon" style="background-image: url(/img/common/bathroom_1.png);"></div>'+
                                    '<div class="room_icon" style="background-image: url(/img/common/bathroom_2.png);"></div>'+
                                    '<div class="room_icon" style="background-image: url(/img/common/bathroom_3.png);"></div>'+
                                '</div>'+
                                '<div>'+
                                    '<h3>??????</h3>'+
                                    '<p>????????? ????????????</p>'+
                                '</div>'+
                            '</div>';
                        $(".house_room").append(bathroom_tag);
                    }

                    //?????? ????????????                    
                    //?????? ???????????? 10??? ???????????? ???????????? 10??? ???????????? 10?????? ?????????????????? ?????? ???????????? ?????? ?????? ??????
                    let limit = r.amenityList.length;
                    //???????????? 10??? ???????????? ???????????? ?????? ?????? ??????
                    if(limit>1){
                        let tag = '<button id="show_amenity_all">???????????? <span id="amenity_cnt">'+limit+'</span>??? ?????? ??????</button>';
                        $(".more_amenity").append(tag);
                    }
                    //???????????? 10??? ???????????? limit 10?????? 10??? ?????? ?????? ??????
                    if(limit>10) limit = 10;
                    for(let i = 0; i<limit; i++){
                        let amenity_tag =
                        '<div>'+
                            '<div class="amenity_icon_wrap">'+
                                '<div class="amenity_icon" style="background-image: url(/img/amenity/'+r.amenityList[i].amenity_icon+');"></div>'+
                            '</div>'+
                            '<p>'+r.amenityList[i].amenity_content+'</p>'+
                        '</div>';
                        $(".amenity_content").append(amenity_tag);

                        //?????? ???????????????(59~63) ????????? ?????? ???????????? ?????? ##?????? ?????? ?????? ??????
                        for(let j = 59; j<64; j++) {
                            if(r.amenityList[i].amenity_seq == j){
                                $("#amenity"+j).addClass("amenity_on");
                            }
                        }
                    }
                    //?????? ?????? ???????????? ?????? ?????? ??????
                    $("#show_amenity_all").click( function(){
                        for(let i = 0; i<r.amenityList.length; i++){
                            let amenity_tag =
                                '<div>'+
                                    '<div class="amenity_icon_wrap">'+
                                        '<div class="amenity_icon" style="background-image: url(/img/amenity/'+r.amenityList[i].amenity_icon+');"></div>'+
                                    '</div>'+
                                    '<p>'+r.amenityList[i].amenity_content+'</p>'+
                                    '<div onclick="closeAmenityPopup()">&#88;</div>'
                                '</div>';
                            $(".amenity_popup").append(amenity_tag);
                        }
                        $(".amenity_popup").css({"display":"block"});
                    })

                    //?????? ???????????????
                    $(".host_name").html(r.houseDetail.host_name);
                    let host_img_tag = 
                    '<a href="http://localhost:7777/profile?member_seq='+host_seq+'">'+
                        '<div class="profile_img" style="background-image: url(/img/member/'+r.houseDetail.host_img+');"></div>'+
                    '</a>';
                    let host_img_small = 
                    '<div class="profile_img_small" style="background-image: url(/img/member/'+r.houseDetail.host_img+');"></div>';
                    $(".host_img").append(host_img_tag);
                    $(".host_img_small").append(host_img_small);
                    $(".host_reg_dt").html(dateFormatting(r.houseDetail.host_reg_dt));
                    
                    //?????? count ??????
                    let rev_cnt = r.houseDetailCnt.house_review_cnt;           
                    $(".rev_cnt").html(rev_cnt);
                    $(".host_desc").html(r.houseDetail.host_description);
                    $(".hosting_cnt").html(r.houseDetailCnt.hosting_house_cnt);
                    if(r.houseDetail.super_host==2){
                        $(".superhost").addClass("superhost_on");
                    }
                    $(".total_rev_cnt").html(r.houseDetailCnt.total_review_cnt);
                    for(let i = 0; i<r.langList.length; i++){
                        let tag = '<span>'+r.langList[i]+'</span>';
                        $(".lang_content").append(tag);
                    }

                    //????????? ?????? ?????? ?????? ?????? ??????
                    //?????????????????? ????????? div(more_review)?????????
                    let more_rev_cnt = r.houseDetailCnt.total_review_cnt-r.houseDetailCnt.house_review_cnt;
                    if(more_rev_cnt>0){
                        $(".more_rev_cnt").html(more_rev_cnt);
                        $(".review_href").attr("href","http://localhost:7777/profile?member_seq="+host_seq);
                    }
                    else{
                        $(".more_review").html("");
                    }

                    //???????????? ##date ??????
                    $(".refund_dt").html(r.houseDetail.house_refund_day);

                    //?????? ??????????????? ??? ??????
                    $(".check_in").html(r.houseDetail.house_check_in);
                    $(".check_out").html(r.houseDetail.house_check_out);
                    $(".additional_rule").html(r.houseDetail.house_rule);
                    
                    //?????? ???????????? ????????? ?????? validation
                    //????????? ?????? ????????? 1?????? ??????????????????????????? but 3??? ??? ???????????? ???????????????
                    //???????????? ?????? ????????? 1?????? ??????X
                    //guest_cnt 3??? ????????? ??????????????????. ????????? 1 
                    // ##?????????????????? ????????? ??? ???????????? ??????
                    $(".plus").click(function(){                        
                        let guest_cnt = $(".guest_cnt").html();
                        if(guest_cnt==r.houseDetail.house_guest){return;}
                        let each_count = $(this).siblings("p").html();
                        $(this).siblings("p").html(Number(each_count)+1);
                        $(".guest_cnt").html(Number(guest_cnt)+1);

                    })
                    $(".minus").click(function(){
                        let each_count = $(this).siblings("p").html();
                        if(each_count==0){return;}
                        $(this).siblings("p").html(Number(each_count)-1);
                        let guest_cnt = $(".guest_cnt").html();
                        $(".guest_cnt").html(Number(guest_cnt)-1);
                    })
                    //????????? ???????????? ?????? ????????? ???????????? ?????? ??????
                    if(r.houseDetail.house_dog==0){
                        $(".dog_counter button").attr("disabled",true);
                        $(".dog_wrap").hover(function(){
                            $(this).attr("title","??? ????????? ??????????????? ???????????? ?????? ???????????????.");
                            $(this).tooltip();
                        })
                        $(".dog_valid_msg").css({"display":"block"});
                    }
                }
            })

            //?????? 10??? ????????????
            $.ajax({
                url:"/api/review/list?house_seq="+house_seq+"&limit="+10,
                type:"get",
                success:function(r){                    
                    sessionStorage.setItem("reviewPointItem",JSON.stringify(r.reviewPoint));
                    console.log(r);

                    //?????? ????????? reviewNullMsg?????? ?????? ??? return;
                    if(r.reviewNullMsg!=null){
                        $(".total_avg").html("New");
                        $(".null_msg").html(r.reviewNullMsg);
                        return;
                    }

                    $(".total_avg").html(r.reviewPoint.total_avg.toFixed(2));

                    //?????? ????????????
                    let limit = r.reviewList.length;
                    //?????? 10??? ???????????? ???????????? ?????? ?????? ??????
                    if(limit>1){
                        let tag = '<button onclick="showReviewAll()">?????? ?????? <span id="amenity_cnt">'+limit+'</span>??? ?????? ??????</button>';
                        $(".more_button").append(tag);
                    }
                    
                    //?????? 10??? ?????? ??????
                    if(limit>10) limit = 10;
                    for(let i = 0; i<limit; i++){
                        let review_tag = 
                            '<div class="review">'+
                                '<div class="guest_img">'+
                                    '<a href="http://localhost:7777/profile?member_seq='+r.reviewList[i].guest_seq+'">'+
                                        '<div class="profile_img" style="background-image: url(/img/member/'+r.reviewList[i].guest_img+');"></div>'+
                                    '</a>'+
                                '</div>'+
                                '<div class="guest_review">'+
                                    '<h5 id="guest_name">'+r.reviewList[i].guest_name+'</h5>'+
                                    '<p class="reg_dt">'+dateFormatting(r.reviewList[i].guest_rev_dt)+'</p>'+
                                    '<p class="content">'+r.reviewList[i].guest_review+'</p>'+
                                '</div>'+
                            '</div>';
                        $(".review_content").append(review_tag);
                        if(r.reviewList[i].host_seq != null){
                            let reply_tag =
                                '<div class="reply">'+
                                    '<div class="rpl_host_img">'+
                                        '<a href="http://localhost:7777/profile?member_seq='+r.reviewList[i].host_seq+'">'+
                                            '<div class="profile_img" style="background-image: url(/img/member/'+r.reviewList[i].host_img+');"></div>'+
                                        '</a>'+
                                    '</div>'+
                                    '<div class="host_reply">'+
                                        '<h5 id="host_name">'+r.reviewList[i].host_name+'</h5>'+
                                        '<p class="reg_dt">'+dateFormatting(r.reviewList[i].host_rpl_dt)+'</p>'+
                                        '<p class="content">'+r.reviewList[i].host_reply+'</p>'+
                                    '</div>'+
                                '</div>';
                            $(".review_content").append(reply_tag);
                        }
                    }
                }
            })
            
            
            let in_dt = $("#in_dt").val();
            let today = new Date();
            let data = {
                house_seq:house_seq,
                in_dt:makeFirstDay(today),
                out_dt:makeLastDay(today)
            };
            console.log(data);
            //?????? ????????? 1?????? ??????
            $.ajax({
                url:"/api/booking/calendar",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),           
                success:function(r) {
                    console.log(r);
                    //?????? ?????????
                    $(".check_in_dt").html(in_dt);
                }
            })
            

        })

        //?????? ????????? ?????? ?????? ?????? ##???????????? ?????????????????? ????????????
        function showReviewAll(){
            $(".review_popup_content").html("");
            $(".review_popup").css({"display":"block"})
            let keyword = $("input[name=keyword]").val();
            if(keyword!=null){keyword = "&keyword="+keyword;}
            $.ajax({
                url:"/api/review/list?house_seq="+house_seq+keyword,
                type:"get",
                success:function(r){
                    console.log(r);
                    
                    for(let i = 0; i<r.reviewList.length; i++) {
                        let review_tag = 
                            '<div class="review">'+
                                '<div class="guest_img">'+
                                    '<a href="http://localhost:7777/profile?member_seq='+r.reviewList[i].guest_seq+'">'+
                                        '<div class="profile_img" style="background-image: url(/img/member/'+r.reviewList[i].guest_img+');"></div>'+
                                    '</a>'+
                                '</div>'+
                                '<div class="guest_review">'+
                                    '<h5 id="guest_name">'+r.reviewList[i].guest_name+'</h5>'+
                                    '<p class="reg_dt">'+dateFormatting(r.reviewList[i].guest_rev_dt)+'</p>'+
                                    '<p class="content">'+r.reviewList[i].guest_review+'</p>'+
                                '</div>'+
                            '</div>';
                        $(".review_popup_content").append(review_tag);
                        if(r.reviewList[i].host_seq != null){
                            let reply_tag =
                                '<div class="reply">'+
                                    '<div class="rpl_host_img">'+
                                        '<a href="http://localhost:7777/profile?member_seq='+r.reviewList[i].host_seq+'">'+
                                            '<div class="profile_img" style="background-image: url(/img/member/'+r.reviewList[i].host_img+');"></div>'+
                                        '</a>'+
                                    '</div>'+
                                    '<div class="host_reply">'+
                                        '<h5 id="host_name">'+r.reviewList[i].host_name+'</h5>'+
                                        '<p class="reg_dt">'+dateFormatting(r.reviewList[i].host_rpl_dt)+'</p>'+
                                        '<p class="content">'+r.reviewList[i].host_reply+'</p>'+
                                    '</div>'+
                                '</div>';
                            $(".review_popup_content").append(reply_tag);
                        }
                    }
                }
            })
        }

        //?????? ?????? ????????????
        function openGuestPopup(){
            $(".guest_popup").css({"display":"block"});
        }
        function closeGuestPopup(){
            $(".guest_popup").css({"display":"none"});
        }
        //## Validation/Null/WhiteSpace??????
        function requestBooking(){
            let in_dt = $("#in_dt").val();
            let out_dt = $("#out_dt").val();
            let adult = $(".adult_counter .count").html();
            let child = $(".child_counter .count").html();
            let infant = $(".infant_counter .count").html();
            let dog = $(".dog_counter .count").html();
            let data = {
                house_seq:house_seq,
                in_dt:in_dt,
                out_dt:out_dt
            };
            console.log(data);
            //????????? ???????????? ?????? ??????
            $.ajax({
                url:"/api/booking/calendar",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),           
                success:function(r) {
                    console.log(r);
                    $(".base_price").html(r.houseFee.base_price);
                    $(".duration").html(r.calculatedPrice.length);
                    $(".check_in_dt").html(in_dt);

                    //???????????? ???????????? ??????
                    for(let i = 0; i<r.calculatedPrice.length; i++){
                        let one_day_price_tag = 
                            '<div class="one_day_price">'+
                                '<span>'+r.calculatedPrice[i].day_of_duration+'</span> '+
                                '<span>&#8361</span>'+
                                '<span>'+r.calculatedPrice[i].calculated_price+'</span>'+
                            '</div>';
                        $(".one_day").append(one_day_price_tag);
                        //???????????? ???????????? ????????????
                        for(let j = 0; j<r.optionList.length; j++){
                            if(r.optionList[j].cycle_no==1&&r.calculatedPrice[i].day_option_seq==r.optionList[j].option_seq){
                                let option_tag = 
                                    '<div class="option_price">'+
                                        '<span>'+r.optionList[j].option_name+'</span>'+
                                        '<span>'+r.optionList[j].option_rate+'</span>'+
                                        '<span>%</span>'+
                                        '<span>&#8361</span>'+
                                        '<span>'+(r.optionList[j].option_rate/100*r.houseFee.base_price)+'</span>'+
                                    '</div>';
                                    $(".one_day").append(option_tag);
                            }
                            if(r.optionList[j].cycle_no==2&&r.calculatedPrice[i].week_option_seq==r.optionList[j].option_seq){
                                let option_tag = 
                                    '<div class="option_price">'+
                                        '<span>'+r.optionList[j].option_name+'</span>'+
                                        '<span>'+r.optionList[j].option_rate+'</span>'+
                                        '<span>%</span>'+
                                        '<span>&#8361</span>'+
                                        '<span>'+(r.optionList[j].option_rate/100*r.houseFee.base_price)+'</span>'+
                                    '</div>';
                                    $(".one_day").append(option_tag);
                            }
                            if(r.optionList[j].cycle_no==3&&r.calculatedPrice[i].month_option_seq==r.optionList[j].option_seq){
                                let option_tag = 
                                    '<div class="option_price">'+
                                        '<span>'+r.optionList[j].option_name+'</span>'+
                                        '<span>'+r.optionList[j].option_rate+'</span>'+
                                        '<span>%</span>'+
                                        '<span>&#8361</span>'+
                                        '<span>'+(r.optionList[j].option_rate/100*r.houseFee.base_price)+'</span>'+
                                    '</div>';
                                    $(".one_day").append(option_tag);
                            }
                        }
                    }
                    
                    let cleaning_fee = r.houseFee.cleaning_fee;
                    let service_fee = r.houseFee.base_price*r.houseFee.service_fee/100;
                    let sum_price = (r.houseFee.sum_price*(100+r.houseFee.service_fee)/100)+r.houseFee.cleaning_fee
                    let full_price_tag=
                            '<div class="full_price">'+
                                '<span>?????????</span>'+
                                '<span>&#8361</span>'+
                                '<span>'+cleaning_fee+'</span>'+
                                '<span>????????????</span>'+
                                '<span>&#8361</span>'+
                                '<span>'+service_fee+'</span>'+'<span>('+r.houseFee.service_fee+'%)</span>'+
                                '<span>?????????</span>'+
                                '<span>&#8361</span>'+
                                '<span>'+sum_price+'</span>'+
                            '</div>';
                    $(".full_price").append(full_price_tag);

                    if(confirm("????????? ?????????????????????????")){
                        let bookingRequest = {
                            host_seq:host_seq,
                            house_seq:house_seq,
                            in_dt:in_dt,
                            out_dt:out_dt,
                            adult:adult,
                            child:child,
                            infant:infant,
                            dog:dog,
                            r:r
                        }
                        sessionStorage.setItem("bookingRequestItem",JSON.stringify(bookingRequest));
                        location.href="/booking";
                    }
                }
            })
        }

        //????????? ??????
        function openMsgPopup(){
            $(".msg_popup").css({"display":"block"});
        }
        function closeMsgPopup(){
            $(".msg_popup").css({"display":"none"});
        }
        function closeAmenityPopup(){
            $(".amenity_popup").css({"display":"none"});
        }
        function postMsg(){
            let data = {
                receiver_seq: host_seq,
                msg_content: $("#msg").val()
            };
            $.ajax({
                url:"/api/msg/normal",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),
                success:function(r) {
                    console.log(r);
                    $("#msg").val("");
                }
            })
        }

        //???????????? ??????
        function openReportPopup(){
            $(".report_popup").css({"display":"block"});
        }
        function closeReportPopup(){
            $(".report_popup").css({"display":"none"});
        }
        function reportHouse(){
            let data = {
                house_seq:house_seq,
                type: $("select[name=report_type] option:selected").val(),
                reason:$("#report_reason").val()
            }            
            $.ajax({
                url:"/api/house/report",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),           
                success:function(r) {
                    console.log(r);
                    if(!r.status){
                        alert(r.message);
                    }
                }
            })

        }

    </script>
</head>
<body>
    <section>
        <div class="house_main">
            <h1 class = house_title></h1>
            <h3 class="house_address"></h3>
            <p>
                <span>???</span> 
                <span class="total_avg"></span>
                <span> ?? </span>
                <a onclick="showReviewAll()" href="#">
                    <span> ??????</span>
                    <span class="rev_cnt"></span>
                    <span>???</span>
                </a>
            </p>
            <p class="superhost">
                <i class="fa-solid fa-medal"></i> 
                <span>???????????????</span>
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
                <span>????????????</span> 
                <span class="guest"></span>
                <span> ?? ??????</span>
                <span class="bedroom"></span>
                <span>???</span>
                <span> ?? ??????</span>
                <span class="bed"></span>
                <span>???</span>
                <span> ?? ??????</span>
                <span class="bathroom"></span>
                <span>???</span>
            </p>
            <p class="house_achievement">
                ##house_achievement ?????? ??????##
            </p>
            <p class="desc_content"></p>
        </div>
        <div class="house_room">

        </div>
        <div class="house_amenity">
            <h3 class="inner_title">????????????</h3>
            <div class="amenity_content">
                
            </div>        
            <div class="more_amenity"></div>
        </div>
        <div class="booking_info">
            
        </div>
        <div class="review_info">
            <h3 class="inner_title">??????</h3>
            <div class="more_review">
                <div class="icon" style="background-image: url(img/common/star.png);"></div>
                <p>??? ???????????? ?????? ????????? ?????? ?????????
                    <span class="more_rev_cnt"></span> ??? ????????????.
                    <a class="review_href" href="">?????? ?????? ?????? ??????</a>
                </p>
                <div class="more_button"></div>
            </div>
            <div class="public_msg">
                <div class="icon" style="background-image: url(img/common/public_msg.png);"></div>
                <p>????????? ????????? ????????? ????????? ?????? ????????????????????????. ?????? ????????? ?????????????????? ????????? ?????? ????????? ?????? ????????? ????????????.</p>
            </div>
            <div class="review_content">
                <h3 class="null_msg"></h3>
            </div>
        </div>
        <div class="host_info">
            <div class="host_img">
                
            </div>
            <h3 class="inner_title">????????? : <span class="host_name"></span></h3>
            <p class="host_reg_dt"></p>
            <p>
                <span>???</span>
                <span class="total_avg"></span>
                <span> ?? ??????</span>
                <span class="total_rev_cnt"></span>
                <span>???</span>
                <span> ?? ????????? ?????? ??????</span>
                <span class="hosting_cnt"></span>
                <span>???</span>
            </p>
            <p class="superhost">
                <i class="fa-solid fa-medal"></i> 
                <span>???????????????</span>
            </p>
            <p class="host_desc">

            </p>
            <div class="superhost">
                <h3><span class="host_name"></span>?????? ????????????????????????.</h3>
                <p>?????????????????? ????????? ????????? ?????? ????????? ???????????? ???????????? ???????????? ????????? ????????? ??? ????????? ????????? ????????? ??????????????????.</p>
            </div>
            <div class="host_lang">
                <p>??????: <span class="lang_content"></span></p>                
            </div>
            <div class="reply_calculate">
                <p>?????????: <span class="reply_rate">##???????????????##</span></p>
                <p>?????? ??????: <span class="reply_time">##??????????????????##</span></p>
            </div>
            <div class="msg_to_host">
                <button onclick="openMsgPopup()">??????????????? ????????????</button>
            </div>
        </div>
        <div class="house_rule">
            <h3 class="inner_title">??????????????? ??? ??????</h3>
            <div class="">
                <h3>?????? ????????????</h3>
                <div>
                    <div class="icon" style="background-image: url(/img/common/timer.png);"></div>
                    <p>????????? : <span class="check_in"></span></p>
                </div>
                <div>
                    <div class="icon" style="background-image: url(/img/common/timer.png);"></div>
                    <p>???????????? : <span class="check_out"></span></p>
                </div>
                <div>
                    <div class="icon" style="background-image: url(/img/common/public_msg.png);"></div>
                    <p class="additional_rule"></p>
                </div>
            </div>
            <div>
                <h3>????????? ??????</h3>
                <div class="safety_content">
                    <div id="amenity59" class="safety_amenity">
                        <div class="amenity_icon_wrap">
                            <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_1.png);"></div>
                        </div>
                        <p>?????? ?????????</p>
                    </div>            
                    <div id="amenity60" class="safety_amenity">
                        <div class="amenity_icon_wrap">
                            <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_2.png);"></div>
                        </div>
                        <p>??????????????? ?????????</p>
                    </div>
                    <div id="amenity61" class="safety_amenity">
                        <div class="amenity_icon_wrap">
                            <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_3.png);"></div>
                        </div>
                        <p>?????????</p>
                    </div>
                    <div id="amenity62" class="safety_amenity">
                        <div class="amenity_icon_wrap">
                            <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_4.png);"></div>
                        </div>
                        <p>????????????</p>
                    </div>
                    <div id="amenity63" class="safety_amenity">
                        <div class="amenity_icon_wrap">
                            <div class="amenity_icon" id="amenity_icon59" style="background-image: url(/img/amenity/amenity7_5.png);"></div>
                        </div>
                        <p>?????? ??? ???????????????</p>
                    </div>
                </div>
            </div>
            <div>
                <h3>?????? ??????</h3>
                <p><span class="refund_dt">##????????????????????????????????????##</span> ?????? 12????????? ???????????? ?????? ????????? ????????? ??? ????????????.</p>
                <p><span class="check_in_dt"></span> ?????? 12????????? ???????????? ?????? ????????? ????????? ??? ????????????.</p>
                <div class="additional_desc">
                    <p>?????? ??????: ???????????? ????????? 100% ???????????????.</p>
                    <p>?????? ??????: ?????? ?????? ????????? 50%??? ??????????????? ??? ????????????. ????????? ???????????? ?????? ???????????????.</p>
                </div>
            </div>
            <div class="report">
                <button onclick="openReportPopup()">?????? ????????????</button>
            </div>
        </div>

    </section>
    <section>
        <div class="amenity_popup">
            //???????????? ??????
        </div>
    </section>
    <section>
        <div class="review_popup">
            //?????? ???????????? ??????
            <div class="search_box">
                <input type="text" name="keyword">
                <button onclick="showReviewAll()">??????</button>
            </div>
            <div class="review_popup_content"></div>
        </div>
    </section>

    <section>
        <aside>
            //?????? ????????????
            <div class="input_area_wrap">
                <div class="like_input_box" style="width: 50%; display: inline-block; border: 0; border-right: 1px solid #000;">
                    <p>?????????<input style="display: block; border: 0;" type="text" id="in_dt"></p>
                </div>
                <div class="like_input_box" style="width: 47%; display: inline-block; border: 0;">
                    <p>????????????<input style="display: block; border: 0;" type="text" id="out_dt"></p>
                </div>
                <div class="like_input_box" onclick="openGuestPopup()">
                    <p style="display: inline-block;">??????</p>
                    <p style="display: inline-block;">?????????<span class="guest_cnt">1</span></p>
                </div>
                <div class="request_booking">
                    <button onclick="requestBooking()">????????????</button>
                    <p>?????? ?????? ????????? ????????? ???????????? ????????????.</p>
                </div>
                <div class="price_area">
                    <div>
                        <div>&#8361<span class="base_price"></span>x<span class="duration"></span>???</div>
                        <div class="one_day"></div>  
                    </div>
                    <div class="full_price">

                    </div>
                </div>
            </div>
            <div class="guest_popup">
                <div class="adult_wrap">
                    <h3 class="inner_title">??????</h3>
                    <p class="inner_desc">??? 13??? ??????</p>
                    <div class="adult_counter counter">
                        <button class="minus">-</button>
                        <p class="count">1</p>
                        <button class="plus">+</button>
                    </div>
                </div>
                <div class="child_wrap">
                    <h3 class="inner_title">?????????</h3>
                    <p class="inner_desc">??? 2~12???</p>
                    <div class="child_counter counter">
                        <button class="minus">-</button>
                        <p class="count">0</p>
                        <button class="plus">+</button>
                    </div>
                </div>
                <div class="infant_wrap">
                    <h3 class="inner_title">??????</h3>
                    <p class="inner_desc">??? 2??? ??????</p>
                    <div class="infant_counter counter">
                        <button class="minus">-</button>
                        <p class="count">0</p>
                        <button class="plus">+</button>
                    </div>
                </div>    
                <div class="dog_wrap">
                    <h3 class="inner_title">????????????</h3>
                    <p class="inner_desc">???????????? ??????????????? ??????????????? ???????????? ????????? ????????? ????????? ????????????.</p>                   
                    <div class="dog_counter">
                        <button onclick="minus(3)">-</button>
                        <div class="count">0</div>
                        <button onclick="plus(3)">+</button>
                    </div>
                </div>
                <p>??? ????????? ?????? ?????? ????????? <span class="guest"></span>???(?????? ??????)?????????. </p>
                <p class="dog_valid_msg">???????????? ????????? ???????????? ????????????.</p>
                <a onclick="closeGuestPopup()">??????</a>
            </div>
        </aside>
    </section>

    <section>
        <div class="msg_popup">
            //????????? ??????
            <div class="msg_title">
                <div class="host_img_small"></div>
                <h3 class="inner_title"><span class="host_name"></span>????????? ????????????</h3>
                <p>?????? <span class="reply_time"> ##??????????????????## </span>?????? ????????? ??????</p>
            </div>
            <div class="msg_desc">
                <h3 class="inner_title">???????????? ???????????? ??????</h3>
                <h5>????????????</h5>
                <p>????????? : <span class="check_in"></span></p>
                <p>???????????? : <span class="check_out"></span></p>
                <h5>?????? ?????? ?????? ??? ?????? ??????</h5>
                <p class="additional_rule"></p>
            </div>
            <div class="msg_content">
                <h3 class="inner_title">????????? ??? ???????????????? ??????????????? ???????????? ?????? ???????????????.</h3>
                <input id="msg" type="textarea" style="width: 600px; height: 100px;">
                <button onclick="postMsg()">????????? ????????????</button>
            </div>
            <button onclick="closeMsgPopup()">&#88;</button>
        </div>
    </section>

    <section>
        <div class="booking_calendar">

        </div>
    </section>

    <section>
        <div class="report_popup">
            <h3 class="inner_title">??????</h3>
            <select name="report_type">                
                <option value="1">?????????????????? ?????? ???????????????</option>
                <option value="2">?????? ????????? ????????????</option>
                <option value="3">???????????????</option>
                <option value="4">???????????????</option>
                <option value="5">??? ????????? ????????? ??? ????????? ?????????</option>
                <option value="6">???????????? ?????? ????????? ????????????</option>
                <option value="7">??????????????? ????????? ????????? ?????????</option>
                <option value="8">????????? ?????? ????????? ?????????</option>
                <option value="9">??? ???????????? ?????? ????????? ???????????? ????????????.</option>
                <option value="0">??????</option>
            </select>
            <input id="report_reason" type="textarea" style="width: 600px; height: 100px;">
            <button onclick="reportHouse()">????????????</button>
            <button onclick="closeReportPopup()">??????</button>
        </div>
    </section>
</body>
</html>
