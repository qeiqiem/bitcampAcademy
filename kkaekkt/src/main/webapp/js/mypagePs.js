function ajax(member) { //ajax로 리스트 받아오기
    console.log('ajax 출발');
    $.post({
        url:"ajax.do",
        data:member,
        success: function(data) {
            var rsv=JSON.parse(data);
            var list=rsv.rsvList;
            console.log(list);
            printlist(list);
            console.log('ajax 완료');
        }
    });
}
function printlist(list) {
    console.log('리스트출력');
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