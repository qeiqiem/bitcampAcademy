$(document).ready(function() {
    init();
    ajax(pageObj); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
});
function init() {
    initEvent();
    initSide();
    initModal();
}
function initEvent() {
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
    $('.searchBox i.fas').click(function() {
	    pageObj.search=$('.search')[0].value;
        pageObj.searchOption=$('.searchBox select')[0].value;
        pageObj.currentPageNum=1;
        ajax(pageObj);
    });
    $('.process').on('click','.cancelBtn',function() {//리스트의 취소 버튼을 누를 때
		rsvObj.rsvNum=JSON.parse($('.processList tr').eq($(this)[0].value).children().eq(1)[0].innerHTML);
        openModal('cancel');
	});
	$('.process').on('click','.completeBtn',function() {//리스트의 완료버튼을 누를 때
		rsvObj.rsvNum=JSON.parse($('.processList tr').eq($(this)[0].value).children().eq(1)[0].innerHTML);
		openModal('complete');
	});
}
function enter() {
    if(window.event.keyCode==13) {
        pageObj.search=$('.search')[0].value;
        pageObj.searchOption=$('.searchBox select')[0].value;
        ajax(pageObj);
    }
}
function initSide() {
    $('.side button').eq(1).addClass("side_select");
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
        console.log('허허');
        operate();
    });
}
function openModal(button) {
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
        console.log('취소버튼누름');
        cancel(rsvObj);
    }else {//버튼이 완료하기라면
        console.log('완료버튼누름');
        complete(rsvObj);
    }
}
function cancel(rsvObj) {
	$.post({
        url:"/cancel.do",
        data:rsvObj,
        success: function() {
			ajax(pageObj);
            alert('주문이 정상적으로 취소되었습니다.');
            modalClose();
		}
	});
}
function modalClose() {
    $('#modal_container').hide();
}
function complete(rsvObj) {
	$.post({
		url:"/complete.do",
		data:rsvObj,
		success: function() {
			ajax(pageObj);
            alert('작업이 완료되었습니다.');
            modalClose();
		}
	});
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
        url:"/getRsvListBs.do",
        data:pageObj,
        success: function(data) {
            var rsv=JSON.parse(data);
            $('.content_header p:nth-child(1) span').html(rsv.totalPostCount);
            var list=rsv.rsvListRno;
            printlist(list);
            initPageObj(rsv);
            initPageBtn();
            console.log('ajax 완료');
        }
    });
}

function printlist(list) {//리팩토링 무조건 필요함 뇌빼고 작업한 부분(3.29-태연)
    var rsvType=true;
    $('.process').children().remove();
    $.each(list, function(key,value) {
        var className=(value.state=='세탁 완료'?'processList':'completeList');
        var laundry="";
        var count="";
        var price="";
        var state="";
        $.each(value.laundryList,function(idx,val) {
            laundry+=val.laundry;
            count+=val.count;
            price+=val.price;
            state+=val.state;
            if(value.laundryList.length!=idx+1) { //마지막이 아니라면 <br>붙이기
                laundry+='<br>';
                count+='<br>';
                price+='<br>';
                state+='<br>';
            }
        });
        if(key==0&&value.state=='세탁 완료') {
            $('.process').prepend("<p>세탁 완료</p>");//세탁완료 라벨 출력
            $('.process').append(//세탁완료 헤더 출력
            '<table class="processHeader">'+
                '<tr>'+
                    '<th>주문일</th>'+
                    '<th>주문번호</th>'+
                    '<th>주문자</th>'+
                    '<th>상품명</th>'+
                    '<th>개수</th>'+
                    '<th>금액</th>'+
                    '<th>처리상황</th>'+
                    '<th>남은일자</th>'+
                    '<th>상태변경</th>'+
                '</tr>'+
            '</table>'
            );
        }else if(key==0&&value.state=='전달 완료') {
            rsvType=false;
            $('.process').prepend("<p>전달 완료</p>");//전달완료 라벨 출력
            $('.process').append(//전달완료 헤더 출력
            '<table class="completeHeader">'+
                '<tr>'+
                    '<th>주문일</th>'+
                    '<th>주문번호</th>'+
                    '<th>주문자</th>'+
                    '<th>상품명</th>'+
                    '<th>개수</th>'+
                    '<th>금액</th>'+
                    '<th>완료날짜</th>'+
                   ' <th>주문전표</th>'+
                '</tr>'+
            '</table>'
            );
        }else if(rsvType&&value.state=='전달 완료') {
            rsvType=false;
            $('.process').append('<p>전달 완료</p>');//전달완료 라벨 출력
            $('.process').append(//전달완료 헤더 출력
            '<table class="completeHeader">'+
                '<tr>'+
                    '<th>주문일</th>'+
                    '<th>주문번호</th>'+
                    '<th>주문자</th>'+
                    '<th>상품명</th>'+
                    '<th>개수</th>'+
                    '<th>금액</th>'+
                    '<th>완료날짜</th>'+
                   ' <th>주문전표</th>'+
                '</tr>'+
            '</table>'
            );
        }
        $('.process').append(
            '<table class="'+className+'">' +
                '<tr>' +
                    '<td>'+value.rsvDate+'</td>'+
                    '<td>'+value.rsvNum+'</td>'+
                    '<td>'+value.mname+'</td>'+
                    '<td>'+laundry+'</td>'+
                    '<td>'+count+'</td>'+
                    '<td>'+price+'</td>'+
                    (value.state=='세탁 완료'?
                    '<td>'+state+'</td>'+
                    (value.dDay<0?
                    '<td style="color:red;">D+'+value.dDay*-1+'</td>'
                    :'<td>D'+value.dDay*-1+'</td>')+
                    '<td><div><button class="cancelBtn" value='+key+'>취소하기</button>'+
					'<button class="completeBtn" value='+key+'>작업완료</button></div></td>'
                    :'<td>'+value.dDate+'</td>'+
                    '<td><button>출력하기</button></td>')+
                '</tr>'+
            '</table>'
        );
    });
}