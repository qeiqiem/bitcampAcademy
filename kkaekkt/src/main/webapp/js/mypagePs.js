$(document).ready(function() {
    ajax(pageObj); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
    $('.rsvList').on("click",".detailBtn",function() { // 버블링으로 생성된 주문에 클릭 이벤트 활성화
        $('#detail'+$(this).val()).toggleClass('none');
    });
    $('.nav2 div').click(function() { // 완료된 주문 출력
        if($(this).index()==0){
            pageObj.state=1;
            pageObj.currentPageNum=1;
            ajax(pageObj);
        }else{
            pageObj.currentPageNum=1;
            pageObj.state=3;
            ajax(pageObj);
        }
    });
});
function initPageBtn() {
    if(pageObj.isNextExist) {
        
    }
}
function initPageObj(data) {
    pageObj.blockLastPageNum=data.blockLastPageNum;
    pageObj.blockFirstPageNum=data.blockFirstPageNum;
    pageObj.isNextBlockExist=data.isNextBlockExist;
    pageObj.isNextExist=data.isNextExist;
    pageObj.isPrevBlockExist=data.isPrevBlockExist;
    pageObj.isPrevExist=data.isPrevExist;
}
function ajax(pageObj) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"ajax.do",
        data:pageObj,
        success: function(data) {
            var rsv=JSON.parse(data);
            var list=rsv.rsvList;
            printlist(list);
            initPageObj(rsv);
            console.log('ajax 완료');
        }
    });
}
function printlist(list) {
    $('.rsvList').children().remove();
    $.each(list, function(key,value) {
        $('.rsvList').append(
            '<div class="rsvBox">' +
                '<table class="rsvTable">'+
                    '<tr>'+
                        '<th colspan="2">'+value.bname+'</th>'+
                        '<td><i class="fas fa-heart like"></i></td>'+
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
                    '<button>리뷰쓰기</button>'+
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