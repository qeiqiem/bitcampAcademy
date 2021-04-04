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
        // '<div class="card" id="card'+value.bno+'">'+
        //     '<div class="info">'+
        //         '<p class="bsname" id="bno'+value.bno+'">'+value.bname+'</p>'+
        //         '<table>'+
        //             '<tr>'+
        //                 '<td><i class="fas fa-star"></i><span> '+value.eval+'</span> | 리뷰 '+value.count+'</td>'+
        //             '</tr>'+
        //             '<tr>'+
        //                 '<td class="bsaddress">'+value.address+'</td>'+
        //             '</tr>'+
        //             '<tr>'+
        //                 '<td class="bsphone"><i class="fas fa-phone-square-alt"></i>'+value.phone+'</td>'+
        //             '</tr>'+
        //             '<tr>'+
        //                 '<td><i class="far fa-heart"></i> 세탁소 찜 <span>123</span></td>'+
        //             '</tr>'+
        //             '<tr>'+
        //                 '<td id="kkaekktTag">kkaekkt 가맹점 입니다.</td>'+
        //             '</tr>'+
        //         '</table>'+
        //     '</div>'+
        //     '<button class="btn_mark"><i class="fas fa-heart" value='+value.bno+'></i></button>'+
        //     '<button id="rsvBtn">예약하기</button>'+
        // '</div>');
    //     '<div class="card">'+
    //     '<div class="bsTagLeft">'+
    //         '<div class="tagTop">'+
    //             '<div class="like">'+
    //                 '<i class="fas fa-heart" value='+value.bno+'></i>'+
    //             '</div>'+
    //             '<p>'+value.bname+'</p>'+
    //         '</div>'+
    //         '<div class="tagBody"> '+
    //             '<i class="fas fa-map-marker-alt"></i>'+
    //             '<span>'+value.address+'</span>'+
    //         '</div>'+
    //         '<div class="tagBottom">'+
    //             '<i class="fas fa-phone-alt"></i>'+
    //             '<span>'+value.phone+'</span>'+
    //         '</div>'+
    //     '</div>'+
    //     '<div class="bsTagRight">'+
    //         '<div class="bsData">'+
    //             '<i class="fas fa-star"></i> '+
    //             '리뷰<span> '+value.count+' </span> | '+
    //             '<i class="fas fa-heart"></i> '+
    //             '찜 <span>123</span>'+
    //         '</div>'+
    //         '<button>예약하기</button>'+
    //     '</div>'+
    // '</div>');
                '<div class="card">'+
                '<div class="bsTagLeft">'+
                    '<div class="tagTop">'+
                        '<div class="like">'+
                            '<i class="fas fa-heart like"></i>'+
                        '</div>'+
                        '<p>'+value.bname+'</p>'+
                    '</div>'+
                    '<div class="tagBottom">'+
                        '<i class="fas fa-map-marker-alt"></i>'+
                        '<span class="address">'+value.address+'</span>'+
                        '<i class="fas fa-phone-alt"></i>'+
                        '<span class="phone">'+value.phone+'</span>'+
                        '<i class="fas fa-star"></i>'+
                        '평점<span class="eval">2.4</span>'+
                        '<i class="fas fa-user-edit"></i>'+
                        '리뷰<span class="reviewCount">2,345</span>'+
                        '<i class="fas fa-heart"></i>'+
                        '좋아요<span class="likeCount">123</span>'+
                    '</div>'+
                '</div>'+
                '<div class="bsTagRight">'+
                    '<button>예약하기</button>'+
                '</div>'+
            '</div>');
    });
}