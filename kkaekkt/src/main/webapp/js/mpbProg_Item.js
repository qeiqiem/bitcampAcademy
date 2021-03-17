$(document).ready(function() {
	initSide();
	initEvent();
    ajax(pageObj); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
});
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
    $('.selectbox select').change(function(){
            var select_name = $(this).children('option:selected').text();
            $(this).siblings('label').text(select_name);
            pageObj.order=$('.selectbox select')[0].value;
            pageObj.currentPageNum=1;
            ajax(pageObj);
    });
    $('.laundry_nav li').click(function() {
        if(!$(this).hasClass('selected')) {
            resetSearch();
            pageObj.laundryType=$(this)[0].value;
            $(this).siblings().removeClass('selected');
            $(this).addClass('selected');
            ajax(pageObj);
        }
    });
	$('.process').on('click','.cancelBtn',function() {
		rsvObj.laundry=$('.processList tr').eq($(this)[0].value).children().eq(3)[0].innerHTML;
		rsvObj.rsvNum=JSON.parse($('.processList tr').eq($(this)[0].value).children().eq(1)[0].innerHTML);
		cancel(rsvObj);
	});
	$('.process').on('click','.completeBtn',function() {
		rsvObj.laundry=$('.processList tr').eq($(this)[0].value).children().eq(3)[0].innerHTML;
		rsvObj.rsvNum=JSON.parse($('.processList tr').eq($(this)[0].value).children().eq(1)[0].innerHTML);
		complete(rsvObj);
	});
}
function cancel(rsvObj) {
	$.post({
        url:"/cancel.do",
        data:rsvObj,
        success: function(data) {
			ajax(pageObj);
		}
	});
}
function complete(rsvObj) {
	$.post({
		url:"/complete.do",
		data:rsvObj,
		success: function(data) {
			ajax(pageObj);
		}
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
		$('.side_sub').css('display','unset');
		$('.side button').eq(0).addClass("side_select");
		$('.side_sub button').eq(0).addClass("side_sub_select");
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
function resetSearch() {
    pageObj.search='';
    pageObj.searchOption=0;
    $('.search')[0].value='';
    $('.searchBox select').eq(0).prop('selected',true);
}
function ajax(pageObj) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/getRsvListBs.do",
        data:pageObj,
        success: function(data) {
            var rsv=JSON.parse(data);
            $('.content_header p:nth-child(1) span').html(rsv.totalPostCount);
            var list=rsv.rsvListLno;
            printlist(list);
            initPageObj(rsv);
            initPageBtn();
            console.log('ajax 완료');
        }
    });
}
function toDay() {
    var date=new Date();
    var mm=date.getMonth()+1;
    var dd=date.getDate();
    var today=mm+'월 '+dd+', '+date.getFullYear();
    return today;
}
function printHeader(key,value) {
    if($('.selectbox select')[0].value==1) { //정렬이 주문번호 순이라면,
        if(key==0&&value.rsvDate==toDay()) {
            $('.order p')[0].innerHTML="오늘 주문";
        }else if(key==0) {
            $('.order p')[0].innerHTML="지난 주문";
        }else if($('.order p')[0].innerHTML=='오늘 주문'&&value.rsvDate!=toDay()) {
            $('.process').append('지난 주문');
        }
    }else { //정렬이 남은일자 순이라면
        if(key==0) {
            if(value.dDay<0) {
                $('.order p')[0].innerHTML="기한을 넘긴 주문";
                $('.order p')[0].style.color='red';
            }else if(value.dDay<3) {
                rsvType=false;
                $('.order p')[0].innerHTML="마감이 임박한 주문";
            }else if(value.dDay>=3) {
                rsvType2=false;
                $('.order p')[0].innerHTML='기한이 넉넉한 주문';
            }
        } else {
            if($('.order p')[0].innerHTML=='기한을 넘긴 주문'&&value.dDay>0&&value.dDay<3) {
                $('.process').append("<p style='color:red;'>마감이 임박한 주문</p>");
            }else if($('.order p')[0].innerHTML!='기한이 넉넉한 주문'&&value.dDay>=3) {
                $('.process').append('<p>기한이 넉넉한 주문</p>');
            }
        }
    }
}
function printlist(list) {
    $('.processList').remove();
    $('.order p')[0].style.color=null;
    $.each(list, function(key,value) {
        printHeader(key,value);
        $('.process').append(
            '<table class="processList">' +
                '<tr>' +
                    '<td>'+value.rsvDate+'</td>'+
                    '<td>'+value.rsvNum+'</td>'+
                    '<td>'+value.mname+'</td>'+
                    '<td>'+value.laundry+'</td>'+
                    '<td>'+value.count+'</td>'+
                    (value.dDay<0?
                    '<td style="color:red;">D+'+value.dDay*-1+'</td>'
                    :'<td>D'+value.dDay*-1+'</td>')+
                    '<td><div><button class="cancelBtn" value='+key+'>취소하기</button>'+
					'<button class="completeBtn" value='+key+'>작업완료</button></div></td>'+
                '</tr>'+
            '</table>'
        );
    });
}