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
    let month = dt.getMonth()+1;
    let day = dt.getDate();
    if(10 > month > 0){ month = "0"+month}
    if(10 > day > 0){ day = "0"+day}
    date = year+"-"+month+"-"+day;
    return date;
}

function dateFormatting(dt) {
    return new Date(+new Date(dt) + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
}
//두 날짜 사이의 일수 구하는 코드
function dateBetween(dt1, dt2) {
    date1 = new Date(dt1);
    date2 = new Date(dt2);
    between = date1.getTime() - date2.getTime();
    return Math.abs(between / (1000 * 60 * 60 * 24));
}
//금액 천단위 소수점
function thousands(money){
    return money.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}