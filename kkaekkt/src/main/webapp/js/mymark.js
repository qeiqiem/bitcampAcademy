$(document).ready(function() {
    ajax(pageObj);
});
function ajax(obj) {
    $.post({
        url:"/getLikedBs.do",
        data:obj,
        success:function(data) {
            
        }
    });
}