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
        .trip_content {border: 1px solid #000; width: 800px; height: 570px;}
        .house_img {width: 200px; height: 100px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
    </style>
    <script>
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let page = param.get('page');
        if(page == null)page = 1;

        $(function(){
            //첫 페이지
            $.ajax({
                url:"/api/booking/list/before?page="+page,
                type:"get",
                success:function(r){
                    console.log(r);
                    let total = r.booking_reserved_TotalCnt
                    let tag = 
                        '<div> 예약현황 : '+ total +'개 <div>'
                    $(".totalcnt").append(tag);
                    makeTripTag(r.booking_reserved_list,".booking_list")
                    makePage(r.booking_reserved_PageCnt,".booking_page","before")
                }
            })

            // 예약된 여행
            $(".reserved_tap").click(function(){
                $(".booking_list").html("");
                $(".booking_page").html("");
                $(".totalcnt").html("");
                let page = 1;
                $.ajax({
                    url:"/api/booking/list/before?page="+page,
                    type:"get",
                    success:function(r){
                        console.log(r);
                        let total = r.booking_reserved_TotalCnt
                        let tag = 
                            '<div> 예약현황 : '+ total +'개 <div>'
                        $(".totalcnt").append(tag);
                        makeTripTag(r.booking_reserved_list,".booking_list");
                        makePage(r.booking_reserved_PageCnt,".booking_page","before");
                    }
                })
            })

            // 체크아웃 여행
            $(".checkout_tap").click(function(){
                $(".booking_list").html("");
                $(".booking_page").html("");
                $(".totalcnt").html("");
                let page = 1;
                $.ajax({
                    url:"/api/booking/list/after?page="+page,
                    type:"get",
                    success:function(r){
                        console.log(r);
                        let total = r.booking_checkout_TotalCnt
                        let tag = 
                            '<div> 체크아웃 현황 : '+ total +'개 <div>'
                        $(".totalcnt").append(tag);
                        makeTripTag(r.booking_checkout_list,".booking_list");
                        makePage(r.booking_checkout_PageCnt,".booking_page","after");
                    }
                })
            })
        })

        function makeTripTag(list,where){
            for(let i=0; i<list.length; i++){
                // 예약현황
                let status = list[i].bi_status;
                let status_tag = "";
                if(status == 0) {
                    status_tag = '<span>승인대기</span>';
                }
                else if(status == 1) {
                    status_tag = '<span>승인</span>';
                }

                // 게스트 인원
                let adult = list[i].adult;
                let child = list[i].child;
                let infant = list[i].infant;
                let dog = list[i].dog;

                let guest = "";
                if(adult != 0) {
                    let tag = '어른'+ adult + '명  ';
                    guest += tag;
                }
                if(child != 0) {
                    let tag = '어린이'+ child + '명  ';
                    guest += tag;
                }
                if(infant != 0) {
                    let tag = '유아'+ infant + '명  ';
                    guest += tag;
                }
                if(dog != 0) {
                    let tag = '반려동물' + dog + '마리';
                    guest += tag;
                }

                let start_date = makeDate(list[i].bi_start_dt)
                let end_date = makeDate(list[i].bi_end_dt)
                let between_date = dateBetween(start_date,end_date);
                let basic = list[i].basic_fee
                let clean = list[i].clean_fee
                let basic_fee = parseInt(list[i].basic_fee*between_date)
                let commission = list[i].service_fee/100
                let service = (basic_fee+clean)*commission
                let total_fee = list[i].total_fee
                let tag=
                    '<div class="trip_content">'+
                        '<p>'+list[i].bi_seq+'</p>'+
                        '<h1 class="house_name">'+
                            list[i].hi_name+
                        '</h1>'+
                        '<div class="img_file">'+
                            '<div class="house_img" style="background-image: url(/img/house/'+list[i].main_img+');"></div>'+
                        '</div>'+
                        '<p class="location">'+
                            list[i].country+","+list[i].city+","+list[i].detail+
                        '</p>'+
                        '<p class="booking_dt">'+
                            '<span>예약일자 : </span>'+
                            '<span class="start_dt">'+start_date+'</span>'+
                            '<span> ~ </span>'+
                            '<span class="end_dt">'+end_date+'</span>'+
                        '</p>'+
                        '<p class="guest">'+guest+'</p>'+
                        '<p class="status">'+
                            status_tag+'<span class="confirm_dt">('+makeDate(list[i].bi_confirm_dt)+')<span>'+
                        '</p>'+
                        '<p class="reservation_dt">'+
                            '예약한 날짜 : '+makeDate(list[i].bi_reg_dt)+
                        '</p>'+
                        '<div class="fee">'+
                            '<p class="basic_fee"><span>&#8361 </span>'+thousands(basic)+' x '+between_date+'박'+
                                '<span> &#8361 </span>'+thousands(basic_fee)+'</p>'+
                            '<p class="cleaning_fee">청소비 <span>&#8361 </span>'+thousands(clean)+'</p>'+
                            '<p class="service_fee">서비스 수수료 <span>&#8361 </span>'+thousands(service)+'</p>'+
                            '<p class="total_fee"> 총 합계 <span>&#8361 </span>'+thousands(total_fee)+'</p>'
                        '</div>'+
                    '</div>';
                $(where).append(tag);
            }
        }

        function makePage(list,where,period){
            $(".booking_page").html("")
            pagelist=new Array();
            for(let i=0; i<list; i++){
                pagelist.push(i+1)
            }
            for(let i=0; i<pagelist.length; i++){
                let tag=
                '<button onClick="'+period+'('+pagelist[i]+')">'+pagelist[i]+'</button>';
                $(where).append(tag);
            }            
        }

        function before(page){
            $(".booking_list").html("")
            $.ajax({
                url:"/api/booking/list/before?page="+page,
                type:"get",
                success:function(r){
                console.log(r);
                makeTripTag(r.booking_reserved_list,".booking_list")
                makePage(r.booking_reserved_PageCnt,".booking_page","before")
                }
            })
        }

        function after(page){
            $(".booking_list").html("")
            $.ajax({
                url:"/api/booking/list/after?page="+page,
                type:"get",
                success:function(r){
                console.log(r);
                makeTripTag(r.booking_checkout_list,".booking_list")
                makePage(r.booking_checkout_PageCnt,".booking_page","after")
                }
            })
        }
    </script>
<body>
    <main>
        <section class="trip_area">
            <button class="reserved_tap"> 예약된 여행</button>
            <button class="checkout_tap"> 체크아웃 여행</button>
            <div class="totalcnt"></div>
            <div>
                <div class="booking_list"></div>
                <div class="booking_page"></div>
            </div>
        </section>
    </main>
</body>
</html>