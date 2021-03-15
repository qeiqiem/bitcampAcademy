$(document).ready(function() {

    ajax(pageObj); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
    
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
        ajax(pageObj);
    });
});
function enter() {
    if(window.event.keyCode==13) {
        pageObj.search=$('.search')[0].value;
        pageObj.searchOption=$('.searchBox select')[0].value;
        ajax(pageObj);
    }
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
        url:"getRsvListBs.do",
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
function printlist(list) {
    var rsvType=true;
    $('.process p').remove();
    $('.processList').remove();
    $.each(list, function(key,value) {
        var laundry="";
        var count="";
        var price="";
        $.each(value.laundryList,function(idx,val) {
            laundry+=val.laundry;
            count+=val.count;
            price+=val.price;
            if(value.laundryList.length!=idx+1) { //마지막이 아니라면 <br>붙이기
                laundry+='<br>';
                count+='<br>';
                price+='<br>';
            }
        });
        if(key==0&&value.state=='세탁 완료') {
            $('.process').prepend("<p>세탁 완료</p>");
        }else if(key==0&&value.state=='전달 완료') {
            rsvType=false;
            $('.process').prepend("<p>전달 완료</p>");
        }else if(rsvType&&value.state=='전달 완료') {
            rsvType=false;
            $('.process').append('<p>전달 완료</p>');
        }
        $('.process').append(
            '<table class="processList">' +
                '<tr>' +
                    '<td>'+value.rsvDate+'</td>'+
                    '<td>'+value.rsvNum+'</td>'+
                    '<td>'+value.mname+'</td>'+
                    '<td>'+laundry+'</td>'+
                    '<td>'+count+'</td>'+
                    '<td>'+price+'</td>'+
                    '<td>'+value.dDate+'</td>'+
                    '<td><div>출력하기</div></td>'+
                '</tr>'+
            '</table>'
        );
    });
}