
$(function(){
    var keyword = 0;
    var checkIn = 0;
    var checkOut = 0;
    var guest = 0;
    var dog = 0;
    search(keyword, checkIn, checkOut, guest, dog);
    keyword = $("#keyword").val();
    checkIn = $("#checkIn").val();
    checkOut = $("#checkOut").val();
    guest = parseInt($("#adult option:selected").val()) + parseInt($("#child option:selected").val()) + parseInt($("#infant option:selected").val());
    dog = parseInt($("#dog option:selected").val()) > 0 ? 1:0;
    $("button").click(function() {
        location.href = "/main?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog;
    })
})

function search(keyword, checkIn, checkOut, guest, dog){
    
    console.log(keyword,checkIn,checkOut,guest,dog)
    $.ajax({
        url:"/api/h/main/search?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog,
        type:"get",
        success:function(r) {
            console.log(r);
        }
    })
    


}
