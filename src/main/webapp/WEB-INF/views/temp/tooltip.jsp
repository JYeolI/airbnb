<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        function makeTooltip(i){
            let tooltip_text = $(".tooltip_text").eq(i).html();
            let tooltip_box = 
                '<div class="tooltip_box">'+
                    '<div>'+tooltip_text+'</div>'+
                    '<button onclick="close_tooltip()">&#88;</button>'+
                '</div>';
            return tooltip_box;
        }
        function removeTooltip(i){
            $(".tooltip_box").remove();
        }
    </script>
</head>
<body>
    <section style="display: none;">        
        <div class="tooltip_text"></div>
        <div class="tooltip_text">호스트가 청구하는 일회성 숙소 청소 비용입니다.</div>
        <div class="tooltip_text">수수료는 플랫폼을 운영하고 연중무휴 고객 지원과 같은 다양한 서비스를 제공하는데 사용됩니다.</div>
        <div class="tooltip_text">호스트가 지급하기로 한 서비스 수수료는 플랫폼을 운영하고 연중무휴 지원 등 다양한 서비스를 제공하는 데 사용됩니다.</div>
    </section>
</body>
</html>