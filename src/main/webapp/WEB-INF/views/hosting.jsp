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
    <style>
        section { border: 1px solid #000; width: 1500px; }
        div { border-bottom: 1px solid #000; width: 1500px; padding: 20px 0;}
        img { width: 50px; }
        .sort_detail { display: none; }
        .on { display: block; }
    </style>
    <c:if test="${user == null}">
        <script>
            $(function() {
                $("body").html("");
                alert("먼저 로그인을 해주세요.");
                location.href = "/";
            })
        </script>
    </c:if>
    
    <script>

        $(function(){
            $.ajax({
                url:"/api/category/hosting",
                type:"get",
                success:function(r){
                    console.log(r)
                    for(let i = 0; i<r.sortList.length; i++){
                        let tag=
                            '<label>'+
                                '<input type="radio" name="sort_button" class="sort" value="'+r.sortList[i].cs_seq+'">'+
                                '<span>'+r.sortList[i].cs_content+'</span>'+
                                '<img src="/img/category/'+r.sortList[i].cs_icon+'">'+
                            '</label>';
                        $(".cate_sort").append(tag);
                    }

                    for(let i = 0; i<r.amenityList.length; i++){
                        let tag=
                            '<label>'+
                                '<input type="checkbox" name="amenity_button" value="'+r.amenityList[i].ca_seq+'">'+
                                '<span>'+r.amenityList[i].ca_content+'</span>'+
                                '<img src="/img/amenity/'+r.amenityList[i].ca_icon+'">'+
                            '</label>';
                        $(".house_amenity").append(tag);
                    }

                    for(let i = 0; i<r.countryList.length; i++){
                        let tag='<option value="'+r.countryList[i].cc_seq+'">'+r.countryList[i].cc_content+'</option>';
                        $("#cate_country").append(tag);
                    }

                    for(let i=0; i<r.sortDetailList.length; i++){
                        let tag=
                        '<label>'+
                            '<input type="radio" name="sort_detail_button" value="'+r.sortDetailList[i].csd_seq+'">'+
                            '<p>'+r.sortDetailList[i].csd_content+'</p>'+
                            '<p>'+r.sortDetailList[i].csd_description+'</p>'+
                        '</label>';
                        $(".sort"+r.sortDetailList[i].csd_cs_seq).append(tag);
                    }

                    //버튼 클릭시 전환
                    $(".sort").click(function(){
                        $(".sort_detail").removeClass("on");
                        $(".sort"+$(this).val()).addClass("on");
                    })
                }
            })
            
            //파일 업로드
            $("#image_file").change(function(){
                let form = $("#img_form");
                let formData = new FormData(form[0]);
                if ($(this).val() == '' || $(this).val() == null) return;
                $.ajax({
                    url:"/img/upload/house",
                    type:"put",
                    data:formData,
                    contentType:false,
                    processData:false,
                    success:function(r){
                        if(!r.status){
                            alert(r.message);
                            return;
                        }
                        let tag =
                            '<label id="'+r.file+'" data="'+r.file+'">'+
                                '<input type="radio" name="himg_main">'+
                                '<div class="images" filename = "'+r.file+'">'+
                                    '<img src="/img/house/'+r.file+'">'+
                                    '<button onclick=deleteImg("'+r.file+'")>&times;</button>'+
                                '</div>'+
                            '</label>';
                        
                        $(".image_list").append(tag);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                })
            })

            //숙소 등록
            $(".save").click(function(){

                let img_list = new Array();       
                for(let i = 0; i<$(".image_list label").length; i++){
                    let img = {
                        himg_file: $(".image_list label").eq(i).attr("data"),
                        himg_main: $(".image_list label input").eq(i).is(":checked")?"1":"0"
                    }
                    img_list.push(img);
                }

                let amenity_list = new Array();
                for(let i = 0; i<$("input[name=amenity_button]:checked").length; i++){
                    amenity_list.push($("input[name=amenity_button]:checked").eq(i).val());
                }

                let data = {
                    house_info:{
                        hi_csd_seq: $('input[name=sort_detail_button]:checked').val(),
                        hi_name: $(".name").val(),
                        hi_type: $('input[name=type]:checked').val(),
                        hi_description: $(".introduce").val(),
                        hi_host_phone: $(".phone").val(),
                        hi_check_in: $(".ckech_in").val(),
                        hi_check_out: $(".ckech_out").val(),
                        hi_rule: $(".rule").val()
                    },
                    address_info: {
                        hai_cc_seq: $('#cate_country option:selected').val(),
                        hai_city: $(".city").val(),
                        hai_detail: $(".detail_address").val()
                    },
                    guest_info: {
                        hgi_guest: $(".guest .count").html(),
                        hgi_bed: $(".bed .count").html(),
                        hgi_bedroom: $(".bedroom .count").html(),
                        hgi_bathroom: $(".bathroom .count").html(),
                        hgi_dog: $('input[name=dog]:checked').val(),
                    },
                    fee_info: {
                        hfi_base_price: $(".house_fee").val()
                    },
                    img_list: img_list,
                    amenity_list: amenity_list
                    
                    
                }
                console.log(data);

                $.ajax({
                    url:"/api/house",
                    type:"put",
                    contentType:"application/json",
                    data:JSON.stringify(data),
                    success:function(r){
                        console.log(r)
                    }
                })
            })

        })
        
        function minus(i){
            let count = parseInt($(".count").eq(i).html())-1;
            if(count<0) return;
            $(".count").eq(i).html(count);
        }
        function plus(i){
            let count = parseInt($(".count").eq(i).html())+1;
            if(count<0) return;
            $(".count").eq(i).html(count);
        }
        function price_plus(){
            let count = parseInt($(".house_fee").val())+1000;
            if(count<0) return;
            $(".house_fee").val(count)
        }
        function price_minus(){
            let count = parseInt($(".house_fee").val())-1000;
            if(count<0) return;
            $(".house_fee").val(count)
        }

        //업로드 파일 삭제
        function deleteImg(filename){
            $.ajax({
                url:"/img/delete/house/"+filename,
                type:"delete",
                success:function(r){
                    $("label[id='"+filename+"']").remove();
                }
            })
        }
    </script>
<body>
    <main>
        <section class="housting">
            <div class="cate_sort">

            </div>
            <div class="cate_sort_detail">
                <div class="sort_detail sort1"></div>
                <div class="sort_detail sort2"></div>
                <div class="sort_detail sort3"></div>
                <div class="sort_detail sort4"></div>
                <div class="sort_detail sort5"></div>
                <div class="sort_detail sort6"></div>
            </div>
            <div class="house_type">
                <label><input type="radio" name="type" value="1">공간 전체</input></label>
                <label><input type="radio" name="type" value="2">개인실</input></label>
                <label><input type="radio" name="type" value="3">다인실</input></label>
            </div>
            <div class="house_address">
                <h3 class="inner_title"> 주소 </h3>
                <select name="contry" id="cate_country">
                    <option value="0" disabled selected>국가</option>
                </select>
                <input type="text" class="city" placeholder="도시">
                <input type="text" style="width: 450px;" class="detail_address" placeholder="상세주소">
            </div>
            <div class="house_guest">
                <p class="guest">
                    <span>게스트</span>
                    <button class="guest_minus" onclick="minus(0)">-</button>
                    <span class="count">0</span>
                    <button class="guset_plus" onclick="plus(0)">+</button>
                </p>
                <p class="bed">
                    <span>침대</span>
                    <button class="bed_minus" onclick="minus(1)">-</button>
                    <span class="count">0</span>
                    <button class="bed_plus" onclick="plus(1)">+</button>
                </p>
                <p class="bedroom">
                    <span>침실</span>
                    <button class="bedroom_minus" onclick="minus(2)">-</button>
                    <span class="count">0</span>
                    <button class="bedroom_plus" onclick="plus(2)">+</button>
                </p>
                <p class="bathroom">
                    <span>욕실</span>
                    <button class="bathroom_minus" onclick="minus(3)">-</button>
                    <span class="count">0</span>
                    <button class="bathroom_plus" onclick="plus(3)">+</button>
                </p>
                <p>
                    <span>애완동물</span>
                    <label><input type="radio" name="dog" value="1">허용</label>
                    <label><input type="radio" name="dog" value="0" checked>허용안함</label>
                </p>
            </div>
            <div class="house_amenity">
            </div>
            <div class="house_img">
                <form id="img_form">
                    <input type="file" id="image_file" name="file" hidden accept="image/gif, image/jpeg, image/png">
                </form>
                <div class="image_list">
                </div>
                <button id="add_image" onclick="document.getElementById('image_file').click()">이미지 추가</button>
            </div>
            <div class="house">
                <p class="house_name">숙소 이름</p>
                <input type="text" class="name">
                <p class="house_introduce">숙소 소개</p>
                <textarea class="introduce"></textarea>
                <p class="house_rule">숙소 규칙</p>
                <textarea class="rule"></textarea>
                <p class="house_ckech_in">체크인</p>
                <input type="text" class="ckech_in">
                <p class="house_ckech_out">체크아웃</p>
                <input type="text" class="ckech_out">
                <p class="phone_number">핸드폰 번호</p>
                <input type="text" class="phone">
            </div>
            <div class="house_price">
                <h3 class="inner_fee"> 숙소 가격 </h3>
                <button class="price_minus" onclick="price_minus(1)">-</button>
                <input type="text" class="house_fee" value="50000"></input>
                <button class="price_plus" onclick="price_plus(1)">+</button>
                <p>/박</p>
            </div>
            <button class="save">숙소 등록하기</button>
        </section>
    </main>
</body>
</html>