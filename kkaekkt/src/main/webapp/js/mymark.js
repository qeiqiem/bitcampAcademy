$(document).ready(function() {
    initBodyEvent();
    initSide();
    initDataSet();
    // ajax();
});
function initDataSet() {
    console.log('데이터 셋');
    var userData=JSON.parse(userDetail);
    var likedBs=JSON.parse(likedBsList);
    console.log(userData.phone);
    console.log(likedBs[0].bname);
}
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
    $('.content').on('click','.like i.fa-heart',function() {
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
    $('.content').append(
                '<div class="card" id="card'+value.bno+'">'+
                '<div class="bsTagLeft">'+
                    '<div class="tagTop">'+
                        '<div class="like">'+
                            '<i class="fas fa-heart like" value='+value.bno+'></i>'+
                        '</div>'+
                        '<p>'+value.bname+'</p>'+
                    '</div>'+
                    '<div class="tagBottom">'+
                        '<i class="fas fa-map-marker-alt"></i>'+
                        '<span class="address">'+value.address+'</span>'+
                        '<i class="fas fa-phone-alt"></i>'+
                        '<span class="phone">'+value.phone+'</span>'+
                        '<i class="fas fa-star"></i>'+
                        '평점<span class="eval">'+value.eval+'</span>'+
                        '<i class="fas fa-user-edit"></i>'+
                        '리뷰<span class="reviewCount">'+value.count+'</span>'+
                        '<i class="fas fa-heart"></i>'+
                        '좋아요<span class="likeCount">'+value.likedNum+'</span>'+
                    '</div>'+
                '</div>'+
                '<div class="bsTagRight">'+
                    '<button>예약하기</button>'+
                '</div>'+
            '</div>');
    });
}
function initModal() {
    /* 모달 생성 */
    $("#modal_close").click(function(){ //모달 X버튼 누를 때
        modalClose();//모달 닫기
    });
    $("#closeBtn").click(function(event){ //모달 돌아가기 누를 때
        event.preventDefault();
        modalClose();//모달 닫기
    });
    $('#ok').click(function() {
        operate();
    });
}
function openModal(button) {
    $("#mask").show();
    $('#modal_container').show();
    if(button=='cancel'){//취소버튼이 눌려서 모달이 열렸다면
        $('#modal_foot p')[0].innerHTML='정말 취소하시겠습니까?';
        $('#ok')[0].innerHTML='취소하기';
    }else{//완료버튼이 눌려서 모달이 열렸다면
        $('#modal_foot p')[0].innerHTML='정말 완료하시겠습니까?';
        $('#ok')[0].innerHTML='완료하기';
    }
}
function operate() {
    if($('#ok')[0].innerHTML=='취소하기'){//버튼이 취소하기라면,
        cancel();
    }else {//버튼이 완료하기라면
        complete();
    }
}
function modalClose() {
    $('#modal_container').hide();
    $("#mask").hide();
}