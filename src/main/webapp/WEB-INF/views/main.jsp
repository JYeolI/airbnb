<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css" integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css" integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        section {width: 1200px; border: 1px solid #000;}
        .type_content {width: 200px; border: 1px solid #000;}
        .filter_block {border-bottom: 1px solid #999;}
        .icon {width: 50px; height: 50px; background-position: center; background-size: 50%; background-repeat: no-repeat;}
        .wish_heart {width: 20px; height: 20px;}
        
        .house_img_wrap {width: 300px; height: 300px;}
        .house_img {width: 280px; height: 280px; background-position: center; background-size: 100%; background-repeat: no-repeat;}

        .house_content { border: 1px solid #000; }
        .house_content > * { text-decoration: none; color: #000;}
        .heart {
            background-size: 100%; width: 20px; height: 20px; color: #000; background-repeat: no-repeat;
            background-image: url(img/common/heart.png);
        }
        .heart_on {
            background-image: url(img/common/red_heart.png);
        }
        .count {display: inline-block;}
    </style>
    <script>
        $(function(){
            search();
            //카테고리바 태그작성
            $.ajax({
                url:"/api/category/bar",
                type:"get",
                success:function(r) {
                    console.log(r)
                    for(let i = 0; i<r.cateBarList.length; i++){
                        let tag =   
                        '<button class="category" onclick="search('+r.cateBarList[i].table_no+','+r.cateBarList[i].cate_bar_seq+')">'+
                            '<div class="bar_icon">'+
                                '<div class="icon" style="background-image: url(/img/category/'+r.cateBarList[i].cate_bar_icon+');"></div>'+
                            '</div>'+
                            '<div class="bar_content">'+
                                r.cateBarList[i].cate_bar_content+
                            '</div>'+
                        '</button>';
                        $(".cate_bar").append(tag);
                    }
                }
            })

            //검색필터 내부 태그작성
            $.ajax({
                url:"/api/category/filter",
                type:"get",
                success:function(r) {
                    console.log(r)
                    
                    for(let i = 0; i<r.sortList.length; i++){
                        let sort_tag =   
                        '<input type="checkbox" name="sort" id="amenity'+i+'" value="'+r.sortList[i].cs_seq+'">'+
                        '<label for="amenity'+i+'">'+
                            '<div class="filter_icon">'+
                                '<div class="icon" style="background-image: url(/img/category/'+r.sortList[i].cs_icon+');">'+
                                '</div>'+
                            '</div>'+
                            '<div class="filter_content">'+
                                r.sortList[i].cs_content+
                            '</div>'+
                        '</label>';

                        $(".house_sort").append(sort_tag);
                    }

                    for(let i = 0; i<r.amenityList.length; i++){
                        let amenity_tag = 
                            '<input type="checkbox" name="amenity" id="amenity'+i+'" value="'+r.amenityList[i].ca_seq+'">'+
                            '<label for="amenity'+i+'">'+r.amenityList[i].ca_content+'</label>';

                        $(".house_amenity").append(amenity_tag);
                    }

                    for(let i = 0; i<r.langList.length; i++){
                        let lang_tag = 
                            '<input type="checkbox" name="lang" id="lang'+i+'" value="'+r.langList[i].cl_seq+'">'+
                            '<label for="lang'+i+'">'+r.langList[i].cl_content+'</label>';

                        $(".host_lang").append(lang_tag);
                    }    
                    
                }
            })

        })

        function minus(i){
            let count = parseInt($(".count").eq(i).html())-1;
            if(count<0) return;
            $(".count").eq(i).html(count);
        }
        function plus(i){
            let count = parseInt(parent.$(".count").eq(i).html())+1;
            if(count>16) return;
            $(".count").eq(i).html(count);
        }

        let chk_sort = new Array();
        let chk_amenity = new Array();
        let chk_lang = new Array();
        //검색버튼(검색바/카테고리바/검색필터)
        function search(table_no,cate_bar_seq){

            //검색바
            //위치keyword
            let keyword = $("#keyword").val();
            if(keyword=="") keyword=null;
            //기간 체크인 체크아웃 둘중하나로도 공백일시 null
            let in_dt = $("#in_dt").val();
            let out_dt = $("#out_dt").val();
            if(in_dt==""||out_dt=="") {in_dt=null; out_dt=null;}
            //인원
            let guest = parseInt($(".adult_counter .count").html())+parseInt($(".child_counter .count").html())+parseInt($(".infant_counter .count").html());
            let dog =  parseInt($(".dog_counter .count").html())>0?1:0;

            //카테고리바
            let cate_place = null;
            let cate_sort_detail = null;
            if(table_no==1){cate_place = cate_bar_seq;}
            if(table_no==3){cate_sort_detail = cate_bar_seq;}

            //검색필터
            //가격범위
            let min = $("#price_min").val();
            let max = $("#price_max").val();
            //숙소유형
            let type = $("input[name=house_type]:selected").val();
            //침실과침대
            let bed = $("select[name=bed_select] option:selected").val();
            let bedroom = $("select[name=bedroom_select] option:selected").val();
            let bathroom = $("select[name=bathroom_select] option:selected").val();

            //건물유형
            chk_sort = new Array();
            for(let i = 0; i<$("input[name=sort]:checked").length; i++){
                chk_sort.push($("input[name=sort]:checked").eq(i).val());
            }
            //편의시설
            chk_amenity = new Array();
            for(let i = 0; i<$("input[name=amenity]:checked").length; i++){
                chk_amenity.push($("input[name=amenity]:checked").eq(i).val());
            }
            //슈퍼호스트
            let superhost = $("input[name=superhost]:checked").val();
            //언어 seq리스트
            chk_lang = new Array();
            for(let i = 0; i<$("input[name=lang]:checked").length; i++){
                chk_lang.push($("input[name=lang]:checked").eq(i).val());
            }
            
            let data = {
                //검색바  !!keyword 공백일시 검색제외 in_dt out_dt ""일시 검색제외 guest0일시 검색제외
                keyword: keyword,   in_dt: in_dt,           out_dt: out_dt,
                guest: guest,       dog: dog,
                
                //카테고리바
                cate_place: cate_place,     cate_sort_detail: cate_sort_detail,

                //검색필터 !!컨트롤러 amenity lang 배열길이 0일시 체크해서 검색제외
                min:min,            max:max,                type:type,  
                bed:bed,            bedroom:bedroom,        bathroom:bathroom,
                sort:chk_sort,      amenity: chk_amenity,   superhost:superhost,
                lang: chk_lang
            };

            console.log(data);
            
            $.ajax({
                url:"/api/house/list",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),           
                success:function(r) {
                    console.log(r);
                    showHouseList(r);
                }
            })
        }

        //숙소조회 후 태크 배치
        function showHouseList(r) {
            $(".house_list").html("");

            let wish_tag="";
            let super_host_tag=""; 

            for(let i = 0; i<r.houseList.length; i++){   
                if(r.houseList[i].wish==1){
                    wish_tag = '<div class="heart heart_on" id="heart'+r.houseList[i].house_seq+'" onclick="wish('+r.houseList[i].wish_seq+','+r.houseList[i].house_seq+')"></div>';
                }
                else{
                    wish_tag = '<div class="heart" id="heart'+r.houseList[i].house_seq+'" onclick="wish('+r.houseList[i].wish_seq+','+r.houseList[i].house_seq+')"></div>';
                }
                if(r.houseList[i].super_host==1){
                    super_host_tag = '<i class="super_host">슈퍼호스트</i>';
                }
                
                //평점이 널 = 후기없음 평점에 New표기
                let total_avg="";
                if(r.houseList[i].total_avg==null){
                    total_avg = "New";
                }
                else{
                    total_avg = r.houseList[i].total_avg.toFixed(2);
                }
                let house_tag=
                    '<div class="house_content">'+
                        '<a href="/house?house_seq='+r.houseList[i].house_seq+'">'+
                            '<div class="house_img_wrap">'+
                                '<div class="house_img" style="background-image: url(img/house/'+r.houseList[i].main_img+');"></div>'+
                            '</div>'+
                            '<div>'+
                                wish_tag+
                            '</div>'+
                            '<div class="super_host_mark">'+
                                super_host_tag+
                            '</div>'+
                            '<div class="house_text_wrap">'+
                                '<h1 class="address">'+r.houseList[i].country+','+r.houseList[i].city+','+r.houseList[i].address+'</h1>'+
                                '<p class="house_name">'+r.houseList[i].house_name+'</p>'+
                                '<h3 class="price">'+r.houseList[i].price+'</h3>'+
                            '</div>'+
                            '<div class="house_point_wrap">'+
                                '<p>'+
                                    '<span class="star">★</span>'+
                                    '<span class="point">'+total_avg+'</span>'+
                                '</p>'+
                            '</div>'+
                        '</a>'+
                    '</div>';
                $(".house_list").append(house_tag);
            }
        }

        //하트 클릭  ##로그인페이지 연결
        function wish(wish_seq,house_seq) {
            if(wish_seq==null) {
                alert("위시리스트에 추가하시려면 로그인이 필요합니다.");
                return;
            }

            //위시리스트 삭제 
            if($("#heart"+house_seq+"").hasClass("heart_on")){
                $("#heart"+house_seq+"").removeClass("heart_on");

                $.ajax({
                    url:"/api/member/wish?wish_seq="+wish_seq,
                    type:"delete",
                    success:function(r){
                        console.log(r);
                        return;
                    }
                })
            }
            //위시리스트 추가
            else{
                $("#heart"+house_seq+"").addClass("heart_on");
                
                $.ajax({
                    url:"/api/member/wish?house_seq="+house_seq,
                    type:"put",
                    success:function(r){
                        console.log(r);
                        return;
                    }
                })
            }
            
        }
        
    </script>
</head>

<body>    
    <section>
        //검색바
        <div class="search_bar">
            <div class="place">
                <input type="text" name="" id="keyword" placeholder="keyword">
            </div>
            <div class="check_in">
                <input type="text" name="" id="in_dt" placeholder="check_in">
            </div>
            <div class="check_out">
                <input type="text" name="" id="out_dt" placeholder="check_out">
            </div>
            <div class="guest">
                <div class="adult_wrap">
                    <h3 class="inner_title">성인</h3>
                    <p class="inner_desc">만 13세 이상</p>
                    <div class="adult_counter">
                        <button class="minus" onclick="minus(0)">-</button>
                        <p class="count">0</p>
                        <button class="plus" onclick="plus(0)">+</button>
                    </div>
                </div>
                
                <div class="child_wrap">
                    <h3 class="inner_title">어린이</h3>
                    <p class="inner_desc">만 2~12세</p>
                    <div class="child_counter">
                        <button class="minus" onclick="minus(1)">-</button>
                        <p class="count">0</p>
                        <button class="plus" onclick="plus(1)">+</button>
                    </div>
                </div>

                <div class="infant_wrap">
                    <h3 class="inner_title">유아</h3>
                    <p class="inner_desc">만 2세 미만</p>
                    <div class="infant_counter">
                        <button class="minus" onclick="minus(2)">-</button>
                        <p class="count">0</p>
                        <button class="plus" onclick="plus(2)">+</button>
                    </div>
                </div>

                <div class="dog">
                    <h3 class="inner_title">반려동물</h3>
                    <p class="inner_desc">보조동물 보조동물은 반려동물이 아니므로 여기에 추가할 필요가 없습니다.</p>                   
                    <div class="dog_counter">
                        <button class="minus" onclick="minus(3)">-</button>
                        <div class="count">0</div>
                        <button class="plus" onclick="plus(3)">+</button>                    
                    </div>
                </div>

                <div class="search_bar_btn">
                    <button type="submit" id="send" onclick="search()">검색</button>
                </div>

            </div>
        </div>
    </section>

    
    <section>
        //카테고리 헤더 바
        <div class="cate_bar">            
        </div>
    </section>

    
    <section>
        //검색필터팝업
        <div class="filter_popup">            
            <div class="house_price filter_block">
                <h1 class="filter_title">가격 범위</h1>
                <input type="text" id="price_min" placeholder="가격min">
                <input type="text" id="price_max" placeholder="가격max">
            </div>

            <div class="house_type filter_block">
                <h1 class="filter_title">숙소 유형</h1> 
                <div class="type_content">
                    <input type="radio" name="house_type" id="full_house" value="1">
                    <label for="full_house">
                        <h3 class="inner_title">공간 전체</h3>
                        <p class="inner_desc">단독으로 사용하는 공간 전체</p>   
                    </label>
                </div>           
                <div class="type_content">
                    <input type="radio" name="house_type" id="single" value="2">              
                    <label for="single">
                        <h3 class="inner_title">개인실</h3>
                        <p class="inner_desc">집 또는 호텔의 개인실과 일부 공용 공간</p>  
                    </label>
                </div>
                <div class="type_content">
                    <input type="radio" name="house_type" id="domitory" value="3">                
                    <label for="domitory">
                        <h3 class="inner_title">다인실</h3>
                        <p class="inner_desc">다른 사람들과 함께 사용하는 다인실 및 공용 공간</p>
                    </label>
                </div>
            </div>

            <div class="house_geust filter_block">
                <h1 class="filter_title">침실과 침대</h1>
                <h3 class="inner_title">침대</h3>
                <select name="bed_select">
                    <option value="0">상관없음</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8+</option>
                </select>
                <h3 class="inner_title">침실</h3>
                <select name="bedroom_select">
                    <option value="0">상관없음</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8+</option>
                </select>
                <h3 class="inner_title">욕실</h3>
                <select name="bathroom_select">
                    <option value="0">상관없음</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8+</option>
                </select>
            </div>

            <div class="house_sort filter_block">
                <h1 class="filter_title">건물 유형</h1>
            </div>

            <div class="house_amenity filter_block">
                <h1 class="filter_title">편의시설</h1>
            </div>

            <div class="super_host filter_block">
                <h1 class="filter_title">최고 수준의 숙소</h1>
                <h3 class="inner_title">슈퍼호스트</h3>
                <p class="inner_desc">슈퍼호스트의 숙소에 머물러 보세요.</p>                
                <input type="radio" name="superhost" id="superhost_on" value="0" checked>
                <label for="superhost_on">OFF</label>
                <input type="radio" name="superhost" id="superhost_off"value="1">
                <label for="superhost_off">ON</label>
            </div>            
            <div class="host_lang filter_block">
                <h1 class="filter_title">호스트 언어</h1>
            </div>
            <div class="filter_btn">
                <button type="submit" id="send" onclick="search()">검색</button>
            </div>
        </div>

    </section>

    
    <section>
        //숙소리스트
        <div class="house_list">
            <div class="house_content">
                <div class="house_img_wrap">
                    <div class="house_img" style="background-image: url();"></div>
                </div>
                <div class="wish_heart">
                    <div class="heart" style="background-image: url();"></div>
                </div>
                <div class="super_host_mark">
                    <i class="super_host">슈퍼호스트</i>
                </div>
                <div class="house_text_wrap">
                    <h1 class="address"></h1>
                    <p class="house_name"></p>
                    <p></p>
                    <h3 class="price"></h3>
                </div>
                <div class="house_point_wrap">
                    <p>
                        <span class="star">★</span>
                        <span class="point">점수</span>
                    </p>
                </div>
            </div>


        </div>
    </section>



</body>
</html>