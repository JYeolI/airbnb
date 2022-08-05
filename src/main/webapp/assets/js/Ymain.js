
$(function(){
    $.ajax({
        url:"/api/main/search?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog,
        type:"get",
        success:function(r) {
            console.log(r);
        }
    })
    
})

function search(){
    var keyword = $("#keyword").val();
    var checkIn = $("#checkIn").val();
    var checkOut = $("#checkOut").val();
    var guest = parseInt($("#adult option:selected").val()) + parseInt($("#child option:selected").val()) + parseInt($("#infant option:selected").val());
    var dog = parseInt($("#dog option:selected").val()) > 0 ? 1:0;
    
    console.log(keyword,checkIn,checkOut,guest,dog)
    $.ajax({
        url:"/api/main/search?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog,
        type:"get",
        success:function(r) {
            console.log(r);
            location.href = "/main?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog;
        }
    })
    


}
