function makeDateFormat(dt){
    let date = new Date(dt)
    let year = date.getFullYear();
    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    let day = ('0' + date.getDate()).slice(-2);
    let dateString = year + '-' + month  + '-' + day;
}


function makeDate(date){
    let dt = new Date(date);
    let year = dt.getFullYear();
    let month = dt.getMonth();
    let day = dt.getDay();
    if(month > 0){ month = "0"+month}
    if(day > 0){ day = "0"+day}
    date = year+"-"+month+"-"+day;
    return date;
}


function dateFormatting(dt) {
    return new Date(+new Date(dt) + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
}


function minus(i){
    let count = parseInt($(".count").eq(i).html())-1;
    if(count<0) return;
    $(".count").eq(i).html(count);
}
function plus(i){
    let count = parseInt($(".count").eq(i).html())+1;
    if(count>16) return;
    $(".count").eq(i).html(count);
}

