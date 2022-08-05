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
    <script src="/assets/js/temp/Htemp.js"></script>
</head>
<body>
    <h1>ytest page</h1>
<!--     
where 
#검색바 keyword
(c.cc_content like concat('%','구','%') or b.hai_city like concat('%','구','%') or b.hai_detail like concat('%','구','%'))
#검색바 인원
and i.hgi_guest >= 3 and i.hgi_dog = 1 

#카테고리 바 클릭시 넘어오는 tabletype1,3/seq번호
and csd.csd_cs_seq =1
and csd.csd_seq = 1

#검색필터 가격
and d.hfi_base_price between 1000 and 2000
#검색필터 숙소타입(1집전체2개인실3다인실)
and a.hi_type 
#검색필터 침대/침실/욕실  상관없음>파라미터null 조건X
and hgi_bed >= 1 
and hgi_bedroom >= 1
and hgi_bathroom >= 1
#검색필터 슈퍼호스트여부	
and

#검색필터 호스트 언어능력 서브쿼리
select * from member_lang_info mli
    
# 편의시설 제일 답없다`
select hpi_hi_seq,hpi_cp_seq from house_place_info

# category_place검색	
select *, 1 as cate_bar_place
from house_place_info hpi 
where hpi_cp_seq = 1
group by hpi_hi_seq 

    //헤더 검색바 -->
    <section style="width: 1200px; border: 1px solid #000;">
        <input id="keyword" type="text" placeholder="keyword(국가/도시/주소로 검색)">
        <input id="checkIn" type="text" placeholder="in(체크인날짜)">
        <input id="checkOut" type="text" placeholder="out(체크아웃날짜)">
        <select id="adult" placeholder="adult(성인)">성인
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>
        <select id="child" placeholder="child(어린이)">어린이
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>
        <select id="infant" placeholder="infant(유아)">유아
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>
        <select id="dog" placeholder="dog(반려동물)">반려동물
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>
        <button onclick="search()">검색</button>
        
    </section>



</body>
</html>