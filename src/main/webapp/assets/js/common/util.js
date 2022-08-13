function makeDateFormat(dt){
    let date = new Date(dt)
    let year = date.getFullYear();
    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    let day = ('0' + date.getDate()).slice(-2);
    let dateString = year + '-' + month  + '-' + day;
}