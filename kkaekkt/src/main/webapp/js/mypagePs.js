$(document).ready(function () {
    $("#detailBtn").click(function () {
        console.log("dd");
        $(".detail").toggle(".none");
    });
    $(".like").click(function () {
        $(this).toggleClass("fas");
        $(this).toggleClass("far");
    });
    $('.nav2 div').click(function() {
        if($(this).index()==1) {
            var memberNum='<%=(String)model.getAttribute("mno")%>';
            var stateNum=3;
            
        }
    });
});