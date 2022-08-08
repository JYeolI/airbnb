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
    <script>
        


        $.ajax({
            url:"/api/category/bar",
            type:"get",
            success:function(r) {
                console.log(r)
                for(let i = 0; i<r.cate_bar_list.length; i++){
                    let tag =   
                    '<button class="category" table_no="'+r.cate_bar_list[i].table_no+'" cate_bar_seq="'+r.cate_bar_list[i].cate_bar_seq+'">'+
                        '<div class="bar_icon">'+
                            r.cate_bar_list[i].cate_bar_icon+
                        '</div>'+
                        '<div class="bar_content">'+
                            r.cate_bar_list[i].cate_bar_content+
                        '</div>'+
                    '</button>';
                    $(".cate_bar").append(tag);
                }
            }
        })

        
        var chk_amenity = new Array();
        var chk_lang = new Array();
        $.ajax({
            url:"/api/category/filter",
            type:"get",
            success:function(r) {
                console.log(r)
                    for(let i = 0; i<r.sort_list.length; i++){
                        let sort_tag =                    
                        '<button class="filter_sort" cs_seq="'+r.sort_list[i].cs_seq+'">'+
                            '<div class="filter_icon">'+
                                r.sort_list[i].cs_icon+
                            '</div>'+
                            '<div class="filter_content">'+
                                r.sort_list[i].cs_content+
                            '</div>'+
                        '</button>';
                        $(".house_sort").append(sort_tag);
                    }

                    for(let i = 0; i<r.amenity_list.length; i++){
                        let amenity_tag = '<input type="checkbox" name="amenity" value="'+r.amenity_list[i].ca_seq+'">'+r.amenity_list[i].ca_content+''
                        $(".house_amenity").append(amenity_tag);
                    }

                    for(let i = 0; i<r.lang_list.length; i++){
                        let lang_tag = '<input type="checkbox" name="lang" value="'+r.lang_list[i].cl_seq+'">'+r.lang_list[i].cl_content+''
                        $(".host_lang").append(lang_tag);
                    }
                    
                    $("#send").click(function(){
                        //초기화
                        //데이터세트 구축하고
                        //포스트로 에이잭스
                        
                        chk_amenity = new Array();
                        for(let i = 0; i<$("input[name=amenity]:checked").length; i++){
                            chk_amenity.push($("input[name=amenity]:checked").eq(i).val());
                        }
                        console.log(chk_amenity);

                        chk_lang = new Array();
                        for(let j = 0; j<$("input[name=lang]:checked").length; j++){
                            chk_lang.push($("input[name=lang]:checked").eq(j).val());
                        }
                        console.log(chk_lang);
                    })


                    
            }
        })

        function search_filter(){
            console.log(chk_amenity);
        }
        
    </script>
</head>
<body>
    <h1>메인페이지</h1>

    //카테고리 헤더 바
    <section style="width: 1200px; border: 1px solid #000;">
        <div class="cate_bar">            
        </div>
    </section>

    //검색필터팝업
    <section style="width: 1200px; border: 1px solid #000;">
        <div class="filter_popup">
            <div class="house_price" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">가격 범위</h1>
                <input type="text" id="price_min" placeholder="가격min">
                <input type="text" id="price_max" placeholder="가격max">
            </div>
            <div class="house_type" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">숙소 유형</h1>
                <input type="radio" name="house_type" value="1">
                    <h3 class="inner_title">공간 전체</h3>
                    <p class="inner_desc">단독으로 사용하는 공간 전체</p>                
                </input>
                <input type="radio" name="house_type" value="2">
                    <h3 class="inner_title">개인실</h3>
                    <p class="inner_desc">집 또는 호텔의 개인실과 일부 공용 공간</p>            
                </input>
                <input type="radio" name="house_type" value="3">
                    <h3 class="inner_title">다인실</h3>
                    <p class="inner_desc">다른 사람들과 함께 사용하는 다인실 및 공용 공간</p>            
                </input> 
            </div>
            <div class="house_geust" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">침실과 침대</h1>
                <h3 class="inner_title">침대</h3>
                <select id="bed_select">
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
                <select id="bedroom_select">
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
                <select id="bathroom_select">
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
            <div class="house_sort" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">건물 유형</h1>
            </div>
            <div class="house_amenity" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">편의시설</h1>
            </div>
            <div class="super_host" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">최고 수준의 숙소</h1>
                <h3 class="inner_title">슈퍼호스트</h3>
                <p class="inner_desc">슈퍼호스트의 숙소에 머물러 보세요.</p>                
                <input type="radio" name="superhost" checked>OFF
                <input type="radio" name="superhost">ON
            </div>            
            <div class="host_lang" style="border-bottom: 1px solid #333;">
                <h1 class="filter_title">호스트 언어</h1>
            </div>
            <div class="filter_btn">
                <button type="submit" id="send">검색</button>
            </div>
        </div>

    </section>



</body>
</html>