<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head><meta charset="UTF-8">
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
</head>
<style>
    .like_link {text-decoration: underline; font-weight: 700;}
    .img_wrap div {width: 50px; height: 50px; background-position: center; background-size: 100%; background-repeat: no-repeat;}
</style>
<script>
    let sessionItem = JSON.parse(sessionStorage.getItem("bookingRequestItem"));
    let request = sessionItem.request;
    let r = sessionItem.r;      
    $(function() {        
        $(".in_dt").html(request[1]);
        $(".out_dt").html(request[2]);
        $(".adult").html(request[3]);
        $(".child").html(request[4]);
        $(".infant").html(request[5]);
        $(".dog").html(request[6]);
        $(".stay").html(r.calculatedPrice.length);

        for(let i = 0; i<r.calculatedPrice.length; i++){
            let one_day_price_tag = 
                '<div class="one_day_price">'+
                    '<span>'+r.calculatedPrice[i].day_of_duration+'</span> '+
                    '<span>&#8361</span>'+
                    '<span>'+r.calculatedPrice[i].calculated_price+'</span>'+
                '</div>';
            $(".one_day").append(one_day_price_tag);
            //예약기간 하루하루 옵션정보
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
                    '<span>청소비</span>'+
                    '<span>&#8361</span>'+
                    '<span>'+cleaning_fee+'</span>'+
                    '<span>서비스료</span>'+
                    '<span>&#8361</span>'+
                    '<span>'+service_fee+'</span>'+'<span>('+r.houseFee.service_fee+'%)</span>'+
                    '<span>총가격</span>'+
                    '<span>&#8361</span>'+
                    '<span>'+sum_price+'</span>'+
                '</div>';
        $(".full_price").append(full_price_tag);

    })

</script>
<body>
    <section>
        <div class="section_title">
            <h1>예약요청</h1>
        </div>
        <div class="">
            <h3>예약요청</h3>
            <div class="">
                <h3>날짜</h3>
                <p>
                    <span class="in_dt"></span>~
                    <span class="out_dt"></span>
                    (<span class="stay"></span>박)
                </p>
                <!-- <p class="like_link">수정</p> -->
            </div>
            <div class="">
                <h3>게스트</h3>
                <p>어른 <span class="adult"></span>명 어린이 <span class="child"></span>명 유아 <span class="infant"></span>명</p>
                <p>반려동물 <span class="dog"></span>마리</p>
                <!-- <p class="like_link">수정</p> -->
            </div>
        </div>
        <div class="price_info">
            <h3>결제요금</h3>
            <div class="full_price"></div>
            <div class="one_day"></div>
        </div>
        <div class="">
            <h3>결제수단</h3>
            <select name="select_card" >
                <option value="" checked>신용카드 또는 체크카드</option>
            </select>
            <div class="">
                <input type="text" name="" placeholder="카드번호">
            </div>
            <div class="">
                <input type="text" name="" placeholder="만료일">
                <input type="text" name="" placeholder="CVV">
            </div>
            <div class="">
                <input type="text" name="" placeholder="우편번호">
            </div>
            <div class="">
                <select name="select_card" placeholder="국가/지역">
                    <option value="" checked>한국</option>
                </select>
            </div>
        </div>
        <div class="">
            <h3>필수입력정보</h3>
            <div class="">
                <h5>호스트에게 메세지 보내기</h5>
                <p>호스트에게 여행 목적과 도착 예정 시간을 알려주세요.</p>
                <button>추가</button>
            </div>
            <div class="">
                <h5>전화번호</h5>
                <p>여행 업데이트를 받으려면 전화번호를 입력하고 인증해주세요.</p>
                <p>
                    <select name="phone_prefix">
                        <option value="010">010</option>
                        <option value="010">011</option>
                        <option value="010">016</option>
                        <option value="010">018</option>
                    </select>
                    - <input type="text" style="width: 50px;"> - <input type="text" style="width: 50px;">
                </p>
            </div>
        </div>
        <div class="">
            <h3>환불 정책</h3>
            <p><span class="refund_dt">##컨트롤러에서날짜계산필요##</span> 오후 12시전에 취소하면 전액 환불을 받으실 수 있습니다.</p>
            <p><span class="in_dt"></span> 오후 12시전에 취소하면 부분 환불을 받으실 수 있습니다.</p>
            <div class="additional_desc">
                <p>전액 환불: 결제하신 금액이 100% 환불됩니다.</p>
                <p>부분 환불: 전체 숙박 요금의 50%를 환불받으실 수 있습니다. 서비스 수수료는 전액 환불됩니다.</p>
            </div>
        </div>
        <div class="">
            <div class="img_wrap">
                <div style="background-image: url(/img/common/schedule.png);"></div>
            </div>
            <h5>호스트가 24시간 이내 예약 요청을 수락하기 전까지는 예약이 아직 확정된 것이 아닙니다.
                예약 확정 전까지는 요금이 청구되지 않습니다.</h5>
            <p>예약 확정 전까지는 요금이 청구되지 않습니다.</p>
        </div>
        <button>예약요청</button>
    </section>
    <section>
        //어사이드 현재 예약하는 숙소정보
        <div class="aside_wrap">
            <div class="house_info">
                <div class="left_img">
                    <div class="house_img" style="background-image: url(/img/house?default.png);"></div>
                </div>
                <div class="right_desc">
                    <p>house_sort 펜션</p>
                    <p>house_name 네발친구</p>
                    <p>
                        <div class="star_icon" style="background-image: url(/img/common?star.png);"></div>
                        <span>5.00</span>
                        <span>(후기 <span>9</span> 개)</span>
                        <span> • </span>
                        <span>슈퍼호스트</span>
                    </p>
                </div>
            </div>
        </div>
    </section>
</body>
</html>