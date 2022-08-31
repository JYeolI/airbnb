<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://kit.fontawesome.com/cdba8da8b7.js" crossorigin="anonymous"></script>
    <style>
        header {border: 1px solid #000; overflow: hidden;}
        .main_image_area {width: 200px; height: 50px; float: left; margin: 5px;}
        .main_page_button {background-image: url('/img/etc/airbnb_main.png'); background-position: center; display: inline-block; background-repeat: no-repeat; width: 100px; height: 100%; background-size: contain; padding: 10px; margin: 10px;}
        .member_info_button img {width: 30px;}
        .member_information_area {float: right; overflow: hidden; margin: 10px;}
        .member_information_area p {display: inline-block; padding: 15px;}
        .host_page_button:hover, .lang_choice_button:hover {cursor: pointer; background-color: #80808022; border-radius: 30px;}
        .member_info_button {cursor: pointer; border-radius: 50px; border: 1px solid #ccc; margin: 10px; padding: 5px !important; padding-left: 12px !important;}
        .member_info_button:hover {cursor: pointer; box-shadow: 1px 1px 5px #ccc; background-color: #fff;}
        .member_info_button * {vertical-align: middle;}
        .member_info_button img {border-radius: 100%; margin-left: 10px; width: 30px;}
        .member_info_popup {width: 100px;}
        .member_info_popup > div {border-bottom: 1px solid #ccc;}
        .member_info_popup a {display: block; color: #000; text-decoration: none;}
        .member_info_popup a:hover {text-decoration: underline;}
    </style>
    <script>
        $(function() {
            $(".member_info_button").click(function() {
                if($(this).prop("aria-expanded")) {
                    $(this).prop("aria-expanded", false);
                    $(".member_info_popup").remove();
                }
                else {
                    $(this).prop("aria-expanded", true);
                    let user = '<%=session.getAttribute("user")%>';
                    let user_info_full_tag = '';
                    let user_login_tag = 
                        '<div class="popup_login_wrap">'+
                            '<a href="/h/login">로그인</a>'+
                            '<a href="/join">회원가입</a>'+
                        '</div>';
                    let user_guest_tag = 
                        '<div class="popup_host_wrap">'+
                            '<a href="#">숙소 호스트 되기</a>'+
                            '<a href="#">체험 호스팅 하기</a>'+
                        '</div>';
                    let user_host_tag = 
                        '<div class="popup_host_wrap">'+
                            '<a href="/h/host">숙소 관리</a>'+
                            '<a href="#">체험 관리</a>'+
                            '<a href="#">계정</a>'+
                        '</div>';
                    let user_info_tag = 
                        '<div class="popup_user_wrap">'+
                            '<a href="#">메시지</a>'+
                            '<a href="#">알림</a>'+
                            '<a href="#">여행</a>'+
                            '<a href="#">위시리스트</a>'+
                        '</div>';
                    let user_logout_tag = 
                        '<div class="popup_logout_wrap">'+
                            '<a href="#">로그아웃</a>'+
                        '</div>';
                    if(user == "null") {
                        tag1 = 
                        user_info_full_tag = 
                            '<div class="member_info_popup">'+
                                user_login_tag+
                                user_guest_tag+
                            '</div>';
                    }
                    else {
                        user_info_full_tag = 
                            '<div class="member_info_popup">'+
                                user_info_tag+
                                user_host_tag+
                                user_logout_tag+
                            '</div>';
                        }
                    $(".member_information_area").append(user_info_full_tag);
                    $(".popup_logout_wrap a").click(function() {
                        $.ajax({
                            url:"/api/member/logout",
                            type:"post",
                            success:function(r) {
                                alert(r.message);
                                location.reload();
                            }
                        })
                    })
                }
            })
        })
    </script>
</head>
<body>
    <header>
        <div class="main_image_area">
            <a href="/" class="main_page_button"></a>
        </div>

        <div class="page_setting_area" hidden></div>
        
        <div class="member_information_area">

            <p class="host_page_button">
                <c:if test="${user == null || user.mi_host_grade == 0}">
                    <span>호스트 되기</span>
                </c:if>
                <c:if test="${user != null && user.mi_host_grade != 0}">
                    <span>호스트 모드로 전환</span>
                </c:if>
            </p>

            <p class="lang_choice_button">
                <i class="fas fa-globe"></i>
            </p>

            <p class="member_info_button" aria-expanded="false">
                <i class="fas fa-bars"></i>
                <c:if test="${user == null}">
                    <img src="/img/etc/user_info_logout.png">
                </c:if>
                <c:if test="${user != null}">
                    <img src="/img/etc/user_info_login.png">
                </c:if>
            </p>

        </div>
    </header>
</body>
</html>