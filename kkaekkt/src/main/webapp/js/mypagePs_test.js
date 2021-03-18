$(document).ready(function() {
    initSide();
    initEvent();
    initModal();
});
function initEvent() {
    $('.rsvList').on("click",".detailBtn",function() { // 버블링으로 생성된 주문에 클릭 이벤트 활성화
        if(!$('.comments').eq($(this).val()).hasClass('none')){ //만약, 상세보기가 열려있다면
            $('.comments').eq($(this).val()).addClass('none');
        }
        $('.detail').eq($(this).val()).toggleClass('none');
    });
    $('.rsvList').on("click",".commentBtn",function() {
        if(!$('.detail').eq($(this).val()).hasClass('none')){ //만약, 상세보기가 열려있다면
            $('.detail').eq($(this).val()).addClass('none');
        }
        $(".comments").eq($(this).val()).toggleClass('none');
    });
    $('.rsvList').on("keyup",".commentBox",function() {
        if($(this).val().length>=3000) {
            alert("3000자 까지 입력할 수 있습니다.");
            $(this)[0].value=$(this).val().substr(0,3000);
        }
        $('.comments_header span:nth-child(1)')[0].innerHTML=$(this).val().length;
    });
}
function initModal() {
    /* 모달 생성 */
    $(".rsvList").on("click",".comments_bottom button",function(){ 
        $("#modal_container").show();
    });
    $("#modal_close").click(function(){ 
        $("#modal_container").hide(); 
    });
    /* 평점 받기 */
    $(".rating__input").click(function(){ 
        var starVal = $(this).attr('value'); 
        $("#starVal").val(starVal);
    });
}
function initSide() {
    $('.side_sub').css('display','unset');
    $('.side button').eq(0).addClass("side_select");
    $('.side_sub button').eq(0).addClass("side_sub_select");

    $('.side_sub button').click(function(){
        $(this).addClass("side_sub_select");
        $(this).siblings().removeClass("side_sub_select");
    });
}
function printlist(list) {
    var btnText;
    if(list[0].state=='세탁 중') {
		$('.content_header')[0].innerHTML='진행중 주문';
        btnText='주문취소';
    } else {
        btnText='리뷰쓰기';
		$('.content_header')[0].innerHTML='완료된 주문';
    }
    $('.rsvList').children().remove();
    $.each(list, function(key,value) {
        $('.rsvList').append(
            '<div class="rsvBox">' +
                '<table class="rsvTable">'+
                    '<tr>'+
                        '<th colspan="2">'+value.bname+'</th>'+
                        '<td><i class="'+(value.like==1?'fas':'far')+' fa-heart like" value='+key+'></i></td>'+
                    '</tr>'+
                    '<tr>' +
                        '<td class="column">주문일시</td>' +
                        '<td>'+value.rsvDate+'</td>' +
                    '</tr>'+
                    '<tr>'+
                        '<td class="column">예약번호</td>'+
                        '<td>'+value.rsvNum+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="column">전화번호</td>'+
                        '<td>'+value.phone+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="column">주문항목</td>'+
                        '<td><span>'+value.laundryList[0].laundry+'</span> 외 <span>'+value.count+'</span>개</td>'+
                    '</tr>'+
                '</table>'+
                '<div class="btnDiv">'+
                    '<button>채팅상담</button>'+
                    '<button class="detailBtn" value="'+key+'">상세보기</button>'+
                    (value.timeOut==0&&btnText=='주문취소'?'<button disabled>':'<button>')+btnText+'</button>'+
                '</div>'+
                '<div class="detail none" id="detail'+key+'">'+
                '<hr>'+
                '<div1-1>'+
                    '<table class="receipt" id="receipt'+key+'">'+
                        '<tr class="column">'+
                            '<th class="laundry">품목</th>'+
                            '<th class="count">개수</th>'+
                            '<th class="price">가격</th>'+
                        '</tr>'+
                    '</table>'+
                '<hr>'+
                '<table class="result">'+
                    '<th>결제금액</th>'+
                    '<td>&nbsp;&nbsp;</td>'+
                    '<td><span>'+value.totalPrice+'</span> 원</td>'+
                '</table>'+
        '</div1-1>'+
        '</div>'+
    '</div>'
        );
    });
    for(var i=0;i<list.length;i++) {//각 주문 별 상세 물품 목록 붙이기
        $.each(list[i].laundryList,function(key,value) {
            $('#receipt'+i).append(
                '<tr>'+
                    '<td class="laundry">'+value.laundry+'</td>'+
                    '<td class="count">'+value.count+'개</td>'+
                    '<td class="price">'+value.price+'</td>'+
                '</tr>'
            );
        });
    }
}