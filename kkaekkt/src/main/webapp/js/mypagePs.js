$(document).ready(function() {
    initSide();
    initEvent();
	initModal();
    initCommObj();
    ajax(pageObj); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
});
function initEvent() {
	var idx;
    $('.rsvList').on("click",".detailBtn",function() { // 버블링으로 생성된 주문에 클릭 이벤트 활성화
		idx=$(this).val();
        if(!$('.comments').eq(idx).hasClass('none')){ //만약, 상세보기가 열려있다면
            $('.comments').eq(idx).addClass('none');
        }
        $('.detail').eq(idx).toggleClass('none');
    });
    $('.rsvList').on("click",".commentBtn",function() {
		idx=$(this).val();
        if(!$('.detail').eq(idx).hasClass('none')){ //만약, 상세보기가 열려있다면
            $('.detail').eq(idx).addClass('none');
        }
        $(".comments").eq(idx).toggleClass('none');
    });
    $('.rsvList').on("keyup",".commBox",function() {
		idx=JSON.parse($(this).attr("id").substr(2,3));
        if($(this).val().length>=3000) {
            alert("3000자 까지 입력할 수 있습니다.");
            $(this)[0].value=$(this).val().substr(0,3000);
        }
        $('.comments_header span:nth-child(1)')[idx].innerHTML=$(this).val().length;
    });
    $('.side_sub button').click(function() { // 완료된 주문 출력
        if($(this).index()==0){ //진행중인 주문
            pageObj.state=1;
            pageObj.currentPageNum=1;
            ajax(pageObj);
        }else{ //완료된 주문
            pageObj.currentPageNum=1;
            pageObj.state=3;
            ajax(pageObj);
        }
    });
    $('.page_next').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum+=1;
            ajax(pageObj);
        }
    });
    $('.page_prev').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum-=1;
            ajax(pageObj);
        }
    });
    $('.page_prevBlock').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum=pageObj.blockFirstPageNum-1;
            ajax(pageObj);
        }
    });
    $('.page_nextBlock').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum=pageObj.blockLastPageNum+1;
            ajax(pageObj);
        }
    });
    $('.page_btn').on("click",".page_list",function() {
        if(pageObj.currentPageNum!=JSON.parse($(this).html())) {
            pageObj.currentPageNum=JSON.parse($(this).html());
            ajax(pageObj);
        }
    });
    $('.rsvList').on('click','i.fa-heart',function() {
        var rno=JSON.parse($('.rsvTable tr:nth-child(3) td:nth-child(2)')[$(this).attr("value")].innerHTML);
        likeObj.rsvNum=rno;
        if($(this).hasClass('fas')) {
            $(this).removeClass('fas');
            $(this).addClass('far');
            likeObj.like=0;
            like(likeObj);
        }else {
            $(this).addClass('fas');
            $(this).removeClass('far');
            likeObj.like=1;
            like(likeObj);
        }
    });

}
function like(likeObj) {
    $.post({
        url:"/like.do",
        data:likeObj,
        success:function() {
        	ajax(pageObj);
        }
    });
}
function initPageBtn() {
    if(pageObj.isNextExist) {
        $('.page_next').removeClass('no');
    }else {
        $('.page_next').addClass('no');
    }
    if(pageObj.isNextBlockExist) {
        $('.page_nextBlock').removeClass('no');
    }else {
        $('.page_nextBlock').addClass('no');
    }
    if(pageObj.isPrevExist) {
        $('.page_prev').removeClass('no');
    }else {
        $('.page_prev').addClass('no');
    }
    if(pageObj.isPrevBlockExist) {
        $('.page_prevBlock').removeClass('no');
    }else {
        $('.page_prevBlock').addClass('no');
    }
    $('.page_btn .page_list').remove(); //페이지 리스트 초기화
    for(var i=pageObj.blockLastPageNum;i>=pageObj.blockFirstPageNum;i--) {
        if(i==pageObj.currentPageNum) {
            $("<li class='page_list curPage'>"+i+"</li>").insertAfter($('.page_prev')).trigger("create");
        } else {
            $("<li class='page_list'>"+i+"</li>").insertAfter($('.page_prev'));
        }
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
        url:"/getRsvListPs.do",
        data:pageObj,
        success: function(data) {
            var rsv=JSON.parse(data);
            var list=rsv.rsvListRno;
            printlist(list);
            initPageObj(rsv);
            initPageBtn();
            console.log('ajax 완료');
        }
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
function initModal() {
    /* 모달 생성 */
    $(".rsvList").on("click",".comments_bottom button",function(){ 
        idx=$(this).val();
        commObj.content=$('#ta'+idx).val();
        var rno=JSON.parse($('.rsvTable tr:nth-child(3) td:nth-child(2)')[idx].innerHTML);
        commObj.rsvNum=rno;
        commObj.bno=JSON.parse($('.rsvTable tr:nth-child(1) span')[idx].innerHTML.replace('#',''));
        $("#modal_container").show();
    });
    $("#modal_close").click(function(){ 
        $("#modal_container").hide(); 
    });
    $("#closeBtn").click(function() {
        $("#modal_container").hide();
    });
    /* 평점 받기 */
    $(".rating__input").click(function(){ 
        var starVal = $(this).attr('value'); 
        $("#starVal").val(starVal);
    });
}
function initCommObj() {
    commObj.mno=pageObj.mno;
    commObj.depth=0;
}
function regit() {
    commObj.eval=$('#starVal').val();
    $.post({
        url:'/regitComm.do',
        data:commObj,
        success:function() {
            alert("리뷰가 정상적으로 등록되었습니다.");
            $("#modal_container").hide();
            viewChange();
        }
    });
}
function viewChange() {
    
}
function printlist(list) {
    var btnText;
    var btnClass;
    if(list[0].state=='세탁 중') {
		$('.content_header')[0].innerHTML='진행중 주문';
        btnText='주문취소';
        btnClass='cancelBtn';
    } else {
        btnText='리뷰쓰기';
        btnClass='commentBtn';
		$('.content_header')[0].innerHTML='완료된 주문';
    }
    $('.rsvList').children().remove();
    $.each(list, function(key,value) {
        console.log(key+"번째 - " + value.commList.length);
        $('.rsvList').append(
            '<div class="rsvBox">' +
                '<table class="rsvTable">'+
                    '<tr>'+
                        '<th colspan="2">'+value.bname+'<span>#'+value.bno+'</span></th>'+
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
                    (value.timeOut==0&&btnText=='주문취소'?
                    '<button disabled>':
                    '<button class="'+btnClass+'" value='+key+'>')+btnText+'</button>'+
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
                (btnText=='주문취소'?'':                
                '<div class="comments none" id="comments'+key+'">'+
                '<div class="comments_header">'+
                    '<span class="length">0</span><span> / 3000</span>'+
                '</div>'+
                '<textarea class="commBox" id="ta'+key+'" cols="30" rows="3"></textarea>'+
                '<label class="writer" for="comment1">username</label>  '+
                '<div class="comments_bottom">'+
                    '<span>깨끗한 리뷰 부탁드립니다. 불쾌감을 주는 욕설은 삭제될 수 있습니다.</span>'+
                    '<button value='+key+'>등록</button>'+
                '</div>'+
                '</div>')+
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