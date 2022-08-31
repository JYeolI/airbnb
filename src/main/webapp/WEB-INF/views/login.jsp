<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(function() {
            $("#login_access").click(function() {
                let id = $("#login_id").val();
                let pwd = $("#login_pwd").val();
                $.ajax({
                    url:"/api/member/login?id="+id+"&pwd="+pwd,
                    type:"get",
                    success:function(r) {
                        alert(r.message);
                        if(r.status) {
                            history.back();
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
    <main>
        <div class="main_area">
            <h1>로그인 페이지</h1>
            <div class="login_area">
                <p>
                    <i class="fas fa-user"></i>
                    <input type="text" id="login_id" placeholder="아이디">
                </p>
                <p>
                    <i class="fas fa-key"></i>
                    <input type="password" id="login_pwd" placeholder="비밀번호">
                </p>
            </div>
            <div class="button_area">
                <button id="login_access">로그인</button>
                <a href="/join">회원가입</a>
            </div>
        </div>
    </main>
</body>
</html>