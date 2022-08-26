<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/temp/HtempHeader.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .member_information_area > i {border: 1px solid #ccc; border-radius: 100%; padding: 10px; vertical-align: middle; cursor: pointer; text-align: center;}
        .page_setting_area {display: inline-block; width: 500px;}
        .page_setting_area a {display: inline-block; margin-left: 50px; text-align: center; vertical-align: middle; color: #000; text-decoration: none;}
    </style>
    <script>
        $(function() {
            $(".host_page_button").remove();
            $(".lang_choice_button").remove();

            let host_header_tag = 
                '<a href="/h/host"">호스팅 메인</a>'+
                '<a href="/message"">메시지</a>'+
                '<a href="/h/calendar"">달력</a>';
            $(".page_setting_area").append(host_header_tag);
            
            $(".member_info_button").before('<i class="far fa-bell"></i>')

            $(".member_information_area > i").click(function() {
                // 알림 팝업 활성화
            })
        })
    </script>
</head>
<body>
    <h1>달력 페이지</h1>
</body>
</html>