$(document).ready(function() {
    ajax(pageObj);
});
function ajax(obj) {
    $.post({
        url:"/getLikedList.do",
        data:obj,
        success:function(data) {
            console.log("무야호");
        }
    });
}