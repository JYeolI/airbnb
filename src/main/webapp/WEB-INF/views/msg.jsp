<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/assets/js/common/util.js"></script>
    <script>
        $(function() {
            getRoom(1);
        })

        function getRoom(page){
            $.ajax({
                url:"/api/msg/room?page="+page,
                type:"get",
                success:function(r) {
                    console.log(r);
                    let room_tag="";
                    for(let i=0; i<r.room_list.length; i++){
                        room_tag+=
                        '<div class="room_wrap" id="room'+r.room_list[i].opponent_seq+'" onclick=getContent('+r.room_list[i].opponent_seq+',1)>'+
                            '<div class="img_wrap">'+
                                '<div class="opponent_img">'+r.room_list[i].opponent_img+'</div>'+
                            '</div>'+
                            '<h3>'+
                                '<span class="opponent_name">'+r.room_list[i].opponent_name+'</span>님'+
                                '(<sapn class="opponent_id">'+r.room_list[i].opponent_id+'</sapn>)'+
                            '</h3>'+
                            '<div class="new_msg_img">'+
                                '<p class="new_msg_cnt">'+r.room_list[i].new_msg_cnt+'</p>'+
                            '</div>'+
                            '<div onclick=deleteRoom('+r.room_list[i].opponent_seq+')>X</div>'+
                        '</div>';
                    }
                    $(".room_list").append(room_tag);
                    
                    //페이저
                    $(".more_room").html("");
                    if(r.total_cnt > 10&&r.total_cnt>(page*10)){
                        let more_tag = '<button onclick="getRoom('+(page+1)+')">more 10 room</button>';
                        $(".more_room").append(more_tag);
                    }
                }
            })
        }
        function getContent(opponent_seq,page){
            if(page==1) $(".content_list").html("");
            $.ajax({
                url:"/api/msg/content?opponent_seq="+opponent_seq+"&page="+page,
                type:"get",
                success:function(r) {
                    console.log(r);
                    let content_tag="";
                    for(let i=0; i<r.content_list.length; i++){
                        if(!r.content_list[i].opponent) content_tag+= '<div class="my_msg content_wrap">';
                        else content_tag+= '<div class="content_wrap">';
                        
                        content_tag+= '<p class="content">'+r.content_list[i].content+'</p>';
                        
                        if(r.content_list[i].msg_receiver_read)content_tag+='<p class="new">읽음</p>';
                        
                        content_tag+=
                            '<p class="reg_dt">'+r.content_list[i].msg_reg_dt+'</p>'+
                        '</div>';
                    }
                    $(".content_list").prepend(content_tag);
                                        
                    //페이저
                    $(".more_content").html("");
                    if(r.total_cnt > 20&&r.total_cnt>(page*20)){
                        let more_tag = '<button onclick="getContent('+opponent_seq+','+(page+1)+')">more 20 content</button>';
                        $(".more_content").append(more_tag);
                    }

                    $(".post_area").html("");
                    let post_tag = 
                        '<input id="msg" type="textarea" style="width: 600px; height: 100px;">'+
                        '<button onclick="postMsg('+opponent_seq+')">전송</button>';
                    $(".post_area").append(post_tag);

                }
            })
        }
        function deleteRoom(opponent_seq){
            if(!confirm("대화방을 삭제하시겠습니까? 삭제한 대화내용은 다시 확인 할 수 없습니다."))return;
            $.ajax({
                url:"/api/msg/room?opponent_seq="+opponent_seq,
                type:"delete",
                success:function(r) {
                    console.log(r);                    
                    $("#room"+opponent_seq).hide();
                    //api통신안하고 지운 컨텐츠 숨기는 건 했는데 10개에서 9개되는순간 다음 컨텐츠 깔기는 불가능
                }
            })
        }
        function postMsg(opponent_seq){
            let data = {
                receiver_seq: opponent_seq,
                msg_content: $("#msg").val()
            };
            $.ajax({
                url:"/api/msg/normal",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),
                success:function(r) {                    
                    console.log(r);
                    $("#msg").val("");
                }
            })
            
        }
    </script>
    <style>
        section {width: 1200px; border: 1px solid #000;}
        .room_wrap {width: 200px; border: 1px solid #000;}
        .content_wrap {padding-left: 500px;}
        .my_msg {padding-left: 0px;}
    </style>
<body>
    <section>
        <div class="room_list"></div>
        <div class="more_room"></div>
    </section>
    <section>
        <div class="more_content"></div>
        <div class="content_list"></div>
        <div class="post_area">
        </div>
    </section>
</body>
</html>