$(document).ready(function() {
    initBodyEvent();
    initSide();
    ajax();
});
function ajax() { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/getLikedBs.do",
        data:{mno:alertObj.sender},
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
                        '<td><i class="fas fa-star"></i><span> '+value.eval+'</span> | 리뷰 '+value.count+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="bsaddress">'+value.address+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="bsphone"><i class="fas fa-phone-square-alt"></i>'+value.phone+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td><i class="far fa-heart"></i> 세탁소 찜 <span>123</span></td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td id="kkaekktTag">kkaekkt 가맹점 입니다.</td>'+
                    '</tr>'+
                '</table>'+
            '</div>'+
            '<button class="btn_mark"><i class="fas fa-heart" value='+value.bno+'></i></button>'+
            '<button id="rsvBtn">예약하기</button>'+
        '</div>');
    });
}