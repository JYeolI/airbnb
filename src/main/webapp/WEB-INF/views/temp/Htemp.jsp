<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(function() {
            $("section p").append("<img src='/api/images/get/category/sort1.png'>")
            var num1 = parseInt("1");
            var num2 = parseInt("2");
            alert(num1+num2);
        })
    </script>
</head>
<body>
    <main>
        <section style="border: 1px solid #000; position: relative; height: 100px;">
            <p style="border: 1px solid #000; position: absolute; margin: 15px;"></p>
        </section>
    </main>
</body>
</html>