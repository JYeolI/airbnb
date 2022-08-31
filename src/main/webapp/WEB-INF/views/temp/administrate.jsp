<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/assets/js/common/util.js"></script>
    <style>
        section {border: 1px solid #000; width: 1200px; }
        .house_img {width: 200px; height: 200px; background-size: 100%; background-repeat: no-repeat;}
        .house_img_list {width: 200px; height: 200px; background-size: 100%; background-repeat: no-repeat;}
        
    </style>
    <script>
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let seq = param.get('house_seq');
        $(function(){

            if(seq == null) seq = 1;
            $.ajax({
                url:"/api/administrate",
                type:"get",
                success:function(r){
                    console.log(r)
                    for(let i = 0; i<r.house_list.length; i++){
                        let list = r.house_list[i];
                        let basic = list.price;
                        let cleaning = list.price;
                        let service = list.price;
                        let tag = 
                            '<h1>'+list.name+'</h1>'+
                            '<div class="house_img" style="background-image: url(/img/house/'+list.img+')"></div>'+
                            '<div class="country">'+list.cc_content+'</div>'+
                            '<div class="address"> '+list.city+', '+list.detail+'</div>'+
                            '<div class="fee">'+
                                '<div class="basic_fee">기본숙박비 <span> &#8361 </span>'+thousands(basic)+'</div>'+
                            '</div>'+
                            '<div class="check_in_out">체크인아웃 가능 기간'+
                            '<div>'+list.check_in+' ~ '+list.check_out+'</div>'+
                            '<button class="update" data-seq="'+list.seq+'">수정하기</button>'+
                            '<button class="delete" data-seq="'+list.seq+'">삭제하기</button>'
                        $(".house_list").append(tag);
                    }
                    $(".update").click(function(){
                        seq = $(this).attr("data-seq")
                        $.ajax({
                            url:"/api/administrate?house_seq="+seq,
                            type:"get",
                            success:function(r){
                                console.log(r)
                                $(".cate_update").html("");
                                $(".house_update").html("");
                                $(".house_daily_update").html("");
                                let tag = 
                                    '<div class="cate_sort">'+r.house_info.cs_content+'</div>'+
                                    '<div class="cate_sort_detail">'+r.house_info.csd_content+'</div>'
                                $(".cate_update").append(tag);

                                let type = r.house_info.type
                                if(type == 1) {type = "공간전체"}
                                if(type == 2) {type = "개인실"}
                                if(type == 3) {type = "다인실"}
                                
                                let status = r.house_info.status
                                if(status == 0) {status = "정상"}
                                if(status == 1) {status = "블라인드"}

                                for(let i = 0; i<r.img_list.length; i++){
                                    let list = r.img_list[i];
                                    console.log(list)
                                    let tag = 
                                        '<div class="house_img_list" style="background-image: url(/img/house/'+list.himg_file+')"></div>'
                                    $(".house_update").append(tag);
                                }

                                tag =
                                    '<span> 숙소이름 </span>'+
                                    '<input type="text" class="house_name" value="'+r.house_info.name+'"></input>'+
                                    '<div class="house_type"> 숙소타입 '+type+'</div>'+
                                    '<span> 숙소소개 </span>'+
                                    '<input type="text" class="house_description" value="'+r.house_info.hi_description+'"></input>'+
                                    '<div class="house_status"> 숙소상태 '+status+'</div>'+
                                    '<span> 숙소전화번호 </span>'+
                                    '<input type="text" class="house_phone" value="'+r.house_info.phone+'"></input>'+
                                    '<br><span> 숙소환불일 </span>'+
                                    '<input type="text" class="house_refund" value="'+r.house_info.refund_day+'"></input>'+
                                    '<br><span> 숙소규칙 </span>'+
                                    '<input type="text" class="house_rule" value="'+r.house_info.rule+'"></input>'+
                                    '<br><span> 숙소체크인 </span>'+
                                    '<input type="text" class="house_check_in" value="'+r.house_info.check_in+'"></input>'+
                                    '<br><span> 숙소체크아웃 </span>'+
                                    '<input type="text" class="house_check_out" value="'+r.house_info.check_out+'"></input>'
                                $(".house_update").append(tag);

                                tag =
                                    '<span> 할인할증 </span>'+
                                    '<input type="text" class="reservation_name" value="'+r.house_info.hdo_name+'"></input>'+
                                    '<br><span> 할인율 </span>'+
                                    '<input type="text" class="reservation_rate" value="'+r.house_info.hdo_rate+'"></input>'+
                                    '<br><span> 할인상태 </span>'+
                                    '<input type="text" class="reservation_enable" value="'+r.house_info.hdo_enable+'"></input>'+
                                    '<br><span> 할인기간 </span>'+
                                    '<input type="text" class="reservation_enable_dt" value="'+r.house_info.hdo_enable_dt+'"></input>'
                                $(".house_daily_update").append(tag);
                            }
                        })
                    })
                }
            })
        })
    </script>
<body>
    <main>
        <section class="administrate">
            <button class="check_out_expected">체크아웃 예정</button>
            <button class="current_hosting">현재 호스팅 중</button>
            <button class="check_in_expected">체크인 예정</button>
            <div class="house_list"></div>
        </section>
        <section class="cate_update"> </section>
        <section class="house_update"> </section>
        <section class="house_daily_update"> </section>
        <section class="house_weekly_update"> </section>
        <section class="house_monthly_update"> </section>
        <!-- <section class="cate_update"> </section> -->
    </main>
</body>
</html>