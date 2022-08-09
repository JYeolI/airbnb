
// $(function(){
//     var keyword = 0;
//     var checkIn = 0;
//     var checkOut = 0;
//     var guest = 0;
//     var dog = 0;
//     search(keyword, checkIn, checkOut, guest, dog);
//     keyword = $("#keyword").val();
//     checkIn = $("#checkIn").val();
//     checkOut = $("#checkOut").val();
//     guest = parseInt($("#adult option:selected").val()) + parseInt($("#child option:selected").val()) + parseInt($("#infant option:selected").val());
//     dog = parseInt($("#dog option:selected").val()) > 0 ? 1:0;
//     $("button").click(function() {
//         location.href = "/main?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog;
//     })
// })

// function search(keyword, checkIn, checkOut, guest, dog){
    
//     console.log(keyword,checkIn,checkOut,guest,dog)
//     $.ajax({
//         url:"/api/h/main/search?keyword="+keyword+"&checkIn="+checkIn+"&checkOut="+checkOut+"&guest="+guest+"&dog="+dog,
//         type:"get",
//         success:function(r) {
//             console.log(r);
//         }
//     })
    


// }

$(function() {
    let data = {
        in_dt:"2022-08-01",
        out_dt:"2022-08-10",
        cate_place:'1',
        lang:null,
        amenity:null,
        guest:null,
        dog:null,
        min:null,
        max:null,
        type:null,
        bed:'0',
        bedroom:'0',
        bathroom:'0',
        superhost:'0'
    };
    $.ajax({
        url:"/api/h/main/search",
        type:"post",
        contentType:"application/json",
        data:JSON.stringify(data),
        success:function(r) {
            console.log(r);
            for(let i=0; i<r.cateAmenityList.length; i++) {
                // 없는 이미지 디폴트처리
                if(r.cateAmenityList[i].ca_icon=='') {r.cateAmenityList[i].ca_icon = "default.png"}
                
                $(".category_list_area").append(
                    '<img src="/api/images/get/category/'+r.cateAmenityList[i].ca_icon+'">'
                );
            }
        }
        
    })
    
})