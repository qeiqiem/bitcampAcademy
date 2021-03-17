$(document).ready(function() {
    initEvent();
    initSide();
    ajax(pageObj);
});
function ajax(pageObj) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/getLikedBs.do",
        data:pageObj,
        success: function(data) {
        	console.log(data);
            var liked=JSON.parse(data);
            var list=liked.bsList;
            printList(list);
            initPageObj(liked);
            initPageBtn();
            console.log('ajax 완료');
        }
    });
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
    $('.content').on('click','i.fa-heart',function() {
        var bno=JSON.parse($('.bsname span')[$(this).attr("value")].innerHTML.replace('#',''));
        likeObj.bno=bno;
        likeOff(likeObj);
    })
}
function likeOff(likeObj) {
    $.post({
        url:"/likeOff.do",
        data:likeObj,
        success:function() {
            console.log("삭제 성공?")
            ajax(pageObj);
        }
    })
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
function initPageObj(data) {
    pageObj.blockLastPageNum=data.blockLastPageNum;
    pageObj.blockFirstPageNum=data.blockFirstPageNum;
    pageObj.isNextBlockExist=data.isNextBlockExist;
    pageObj.isNextExist=data.isNextExist;
    pageObj.isPrevBlockExist=data.isPrevBlockExist;
    pageObj.isPrevExist=data.isPrevExist;
}
function printList(list) {
    $('.card').remove();
    $.each(list,function(key,value){
    $('.page_btn_container').before(
        '<div class="card">'+
            '<div class="info">'+
                '<p class="bsname">'+value.bname+'<span style="font-size:14px">#'+value.bno+'</span></p>'+
                '<table>'+
                    '<tr>'+
                        '<td><span>'+value.eval+'<i class="fas fa-star"></i> </span>'+value.eCount+'건 | 리뷰 '+value.commCount+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="bsaddress">'+value.address+'</td>'+
                    '</tr>'+
                    // '<tr>'+
                    //     '<td>(지번)<span>대흥로 330-2</span></td>'+
                    // '</tr>'+
                    '<tr>'+
                        '<td><span class="bsschedule">영업시간</span><span>대표스케쥴</span></td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="bsphone">'+value.phone+'<button class="btn_detail">상세보기</button></td>'+
                    '</tr>'+
                '</table>'+
            '</div>'+
            '<button class="btn_mark"><i class="fas fa-heart" value='+key+'></i></button>'+
        '</div>');
    });
}