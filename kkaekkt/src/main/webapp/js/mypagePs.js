$(document).ready(function() {
    $('.nav2 div').click(function() {
        if($(this).index()==1) {
            var dd={mno:${sessionScope.member.mno}};
            $.post({
                url:"ajax.do",
                data:dd,
                success: function(data) {
                    var test=JSON.parse(data);
                    console.log(test.mno);
                }
            });
        }
    });
});