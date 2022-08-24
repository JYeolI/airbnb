function makeDateFormat(dt){
    let date = new Date(dt)
    let year = date.getFullYear();
    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    let day = ('0' + date.getDate()).slice(-2);
    let dateString = year + '-' + month  + '-' + day;
    return dateString;
}

function makeDateFormat(date,lastDay){
    let dt =  new Date(date);
    let format;
    if(lastDay){
        dt = new Date(date.getFullYear(),date.getMonth()+1,0);
        format = dt.getFullYear() +
                '-' + ( (dt.getMonth()+1) < 9 ? "0" + (dt.getMonth()+1) : (dt.getMonth()+1) )+
                '-' + ( (dt.getDate()) < 9 ? "0" + (dt.getDate()) : (dt.getDate()) );
    }
    else{
        format = dt.getFullYear() +
                '-' + ( (dt.getMonth()+1) < 9 ? "0" + (dt.getMonth()+1) : (dt.getMonth()+1) )+
                '-' + ( (dt.getDate()) < 9 ? "0" + (dt.getDate()) : (dt.getDate()) );
    }
    return format;
}

function makeFirstDay(date){
    let dt = new Date(date.getFullYear(),date.getMonth(),1);
    let format = dt.getFullYear() +
            '-' + ( (dt.getMonth()+1) < 9 ? "0" + (dt.getMonth()+1) : (dt.getMonth()+1) )+
            '-' + ( (dt.getDate()) < 9 ? "0" + (dt.getDate()) : (dt.getDate()) );
    return format;
}
function makeLastDay(date){
    let dt = new Date(date.getFullYear(),date.getMonth()+1,0);
    let format = dt.getFullYear() +
            '-' + ( (dt.getMonth()+1) < 9 ? "0" + (dt.getMonth()+1) : (dt.getMonth()+1) )+
            '-' + ( (dt.getDate()) < 9 ? "0" + (dt.getDate()) : (dt.getDate()) );
    return format;
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

