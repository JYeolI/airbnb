<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        //카테고리 값 불러오는 js
        $(function(){
            $.ajax({
                url:"/ys/cate_bar",
                type:"get",
                success:function(r){
                    console.log(r.Cate_bar_list);
                    for(let i=0; i<r.Cate_bar_list.length; i++){
                        // $("main").append("<a href='#'>"+r.Cate_bar_list[i].cate_bar_content+"</a>")
                        $(".1").append("<button class=cate_bar data-seq="+r.Cate_bar_list[i].cate_bar_seq+">"+r.Cate_bar_list[i].cate_bar_content+"</a>")
                    }
                }
            })
        })
        //cate_sort 값 가져오는 js
        $(function(){
            $.ajax({
                url:"/ys/cate_sort",
                type:"get",
                success:function(r){
                    console.log(r.Cate_sort_list);
                    for(let i=0; i<r.Cate_sort_list.length; i++){
                        // $("main").append("<a href='#'>"+r.Cate_bar_list[i].cate_bar_content+"</a>")
                        $(".2").append("<button class=cate_sort data-seq="+r.Cate_sort_list[i].cs_seq+">"+r.Cate_sort_list[i].cs_content+"</button>")
                    }
                }
            })
        })
    </script>
</head>
<body>
    <main>
        <div class="1" style="padding-bottom: 20px;"></div>
        <div class="2" ></div>
    </main>
</body>
</html>