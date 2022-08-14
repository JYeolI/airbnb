<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .input_form {
            background-color: #fff;
        }
        .msg {
            display: none;
            color: red;
            font-weight: 300;
            font-size: 14px;
        }
    </style>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        let duplicate = true;
        $(function() {
            // 입력 오류 확인
            $("#mi_id").keyup(function() {
                if(isEmpty($(this).val())) {
                    $("#mi_id~.not_valid").css("display", "block");
                }
                else {
                    $("#mi_id~.not_valid").css("display", "none");
                }
            })
            $("#mi_id").change(function() {
                $.ajax({
                    url:"/api/h/idchk?id="+$(this).val(),
                    type:"get",
                    success:function(r) {
                        if(r) {
                            $(".duplicate").css("display", "block");
                        }
                        else {
                            $(".duplicate").css("display", "none");
                        }
                    }
                })
            })
            $("#mi_pwd").keyup(function() {
                if(isEmpty($(this).val())) {
                    $("#mi_pwd~.not_valid").css("display", "block");
                }
                else {
                    $("#mi_pwd~.not_valid").css("display", "none");
                }
            })
            $("#mi_pwd_confirm").keyup(function() {
                if($(this).val() != $("#mi_pwd").val()) {
                    $("#mi_pwd_confirm~.not_match").css("display", "block");
                }
                else {
                    $("#mi_pwd_confirm~.not_match").css("display", "none");
                }

                if(isEmpty($(this).val())) {
                    $("#mi_pwd_confirm~.not_valid").css("display", "block");
                }
                else {
                    $("#mi_pwd_confirm~.not_valid").css("display", "none");
                }
            })
            $("#mi_name").keyup(function() {
                if(isEmpty($(this).val(), false)) {
                    $("#mi_name~.err_msg").css("display", "block");
                }
                else {
                    $("#mi_name~.err_msg").css("display", "");
                }
            })
            $(".mi_gen").change(function() {
                $(".mi_gen~.err_msg").css("display", "");
            })
            $("#join").click(function() {
                let accept = true;
                if(isEmpty($("#mi_id").val())) {
                    $("#mi_id~.not_valid").css("display", "block");
                    accept = false;
                    console.log("1");
                }
                else {
                    $("#mi_id~.not_valid").css("display", "none");
                }
                if(isEmpty($("#mi_pwd").val())) {
                    $("#mi_pwd~.not_valid").css("display", "block");
                    accept = false;
                    console.log("2");
                }
                else $("#mi_pwd~.not_valid").css("display", "");
                
                if($("#mi_pwd_confirm").val() != $("#mi_pwd").val()) {
                    $("#mi_pwd_confirm~.not_match").css("display", "block");
                    accept = false;
                    console.log("3");
                }
                else $("#mi_pwd_confirm~.not_match").css("display", "");
                
                if(isEmpty($("#mi_pwd_confirm").val())) {
                    $("#mi_pwd_confirm~.not_valid").css("display", "block");
                    accept = false;
                    console.log("4");
                }
                else $("#mi_pwd_confirm~.not_valid").css("display", "");
                
                if(isEmpty($("#mi_name").val(), false)) {
                    $("#mi_name~.err_msg").css("display", "block");
                    accept = false;
                    console.log("5");
                }
                else {
                    $("#mi_name~.err_msg").css("display", "");
                }
                
                if($(".mi_gen:checked").val() != 1 && $(".mi_gen:checked").val() != 2 ) {
                    $(".mi_gen~.err_msg").css("display", "block");
                    accept = false;
                    console.log("6");
                }
                else $(".mi_gen~.err_msg").css("display", "");

                if(!accept) return;
                if(!confirm("회원가입 하시겠습니까?")) return;

                let data = {
                    mi_id:$("#mi_id").val(),
                    mi_pwd:$("#mi_pwd").val(),
                    mi_name:$("#mi_name").val(),
                    mi_gender:$(".mi_gen:checked").val(),
                }
                console.log(JSON.stringify(data));
                $.ajax({
                    url:"/api/h/join",
                    type:"put",
                    data:JSON.stringify(data),
                    contentType:"application/json",
                    success:function(r) {
                        alert(r.message);
                        // location.href = "/account/login"
                    }
                })
            })
        })
        function isEmpty(str, wscheck=true) {
            // 아무것도 입력하지 않았는지 체크
            if(str == '') return true;
            // 공백만 입력되었는지 체크
            let whitespace = /^\s|\s+$/g;
            if(str.replace(whitespace, '') == "") return true;
            if(str.match(/\s/g) && wscheck) return true;
            return false;
        }
    </script>
</head>
<body>
    <div class="join_header">
        <h1>회원가입 페이지</h1>
    </div>
    <div class="input_form">
        <div class="data_cell">
            <p class="data_title">아이디</p>
            <input type="text" id="mi_id">
            <p class="msg not_valid">아이디를 올바르게 입력해주세요.</p>
            <p class="msg err_msg">필수 정보입니다.</p>
            <p class="msg duplicate">이미 사용 중인 아이디 입니다.</p>
        </div>
        <div class="data_cell">
            <p class="data_title">비밀번호</p>
            <input type="password" id="mi_pwd">
            <p class="msg err_msg">필수 정보입니다.</p>
            <p class="msg not_valid">비밀번호를 올바르게 입력해주세요.</p>
        </div>
        <div class="data_cell">
            <p class="data_title">비밀번호 확인</p>
            <input type="password" id="mi_pwd_confirm">
            <p class="msg err_msg">필수 정보입니다.</p>
            <p class="msg not_match">비밀번호가 일치하지 않습니다.</p>
            <p class="msg not_valid">비밀번호를 올바르게 입력해주세요.</p>
        </div>
        <div class="data_cell">
            <p class="data_title">이름</p>
            <input type="text" id="mi_name">
            <p class="msg err_msg">필수 정보입니다.</p>
        </div>
        <div class="data_cell">
            <p class="data_title">성별</p>
            <input type="radio" class="mi_gen" name="mi_gen" id="mi_gen1" value="1">
            <label for="mi_gen1">남</label>
            <input type="radio" class="mi_gen" name="mi_gen" id="mi_gen2" value="2">
            <label for="mi_gen2">여</label>
            <p class="msg err_msg">필수 정보입니다.</p>
        </div>
        <button id="join">가입하기</button>
    </div>
</body>
</html>