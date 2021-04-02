$(document).ready(function() {
    initBodyEvent();
    initSide();
    ajax();
});
function ajax() { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/getLikedBs.do",
        data:{mno:mno},
        success: function(data) {
            var list=JSON.parse(data);
            printList(list);
            console.log('ajax 완료');
        }
    });
}
function initBodyEvent() {
    $('.content').on('click','i.fa-heart',function() {
        var bno=Number($(this).attr("value"));
        likeObj.bno=bno;
        likeOff(likeObj);
    })
}
function likeOff(likeObj) {
    $.post({
        url:"/likeOff.do",
        data:likeObj,
        success:function() {
            $('#card'+likeObj.bno).remove();
            delete likeObj.bno;//초기화
        }
    })
}
function initSide() {
    $('.side button').eq(1).addClass("side_select");
    $('.side').css({'position':'fixed','float':'none'});
}
function printList(list) {
    $('.card').remove();
    $.each(list,function(key,value){
        console.log(key+'..반복문 돌아가는중');
    $('.content').append(
        '<div class="card" id="card'+value.bno+'">'+
            '<div class="info">'+
                '<p class="bsname" id="bno'+value.bno+'">'+value.bname+'</p>'+
                '<table>'+
                    '<tr>'+
                        '<td><span>'+value.eval+'<i class="fas fa-star"></i></span>'+ ' | 리뷰 '+value.count+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="bsaddress">'+value.address+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td><span class="bsschedule">영업시간</span><span>대표스케쥴</span></td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="bsphone">'+value.phone+'<button class="btn_detail">상세보기</button></td>'+
                    '</tr>'+
                '</table>'+
            '</div>'+
            '<button class="btn_mark"><i class="fas fa-heart" value='+value.bno+'></i></button>'+
        '</div>');
    });
}