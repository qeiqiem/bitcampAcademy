$(document).ready(function() {
    initSide();
    initEvent();
});
function printAjax(dataObj) {
    $.post({
        url:'/printCommBs.do',
        data:dataObj,
        success:function(data) {
            var list=JSON.parse(data);
            printList(list);
        }
    });
}
function printList(list) {//기본틀! 백엔드 작업 후 수정예정
    $('.reviewList').remove();
    $('.replyList').remove();
    $.each(list,function(key,value) {
        $('.process').append(
            '<table class="reviewList" id="review'+key+'">'+
                '<tr>'+
                    '<td class="cell1">'+value.orderNum+'</td>'+
                    '<td class="cell2 close">'+value.content+'</td>'+
                    '<td class="cell3">'+value.eval+'</td>'+
                    '<td class="cell4" id="customer'+key+'">'+value.mname+'</td>'+
                    '<td class="cell5">'+value.rsvNum+'</td>'+
                    '<td class="cell6">'+value.rdate+'</td>'+
                    '<td class="cell7"><button class="replyBtn" value='+key+'>'+btnText+'</button></td>'+
                '</tr>'+
            '</table>'
        );
    });
}
function editAjax(dataObj) {
    $.post({
        url:'/editCommBs.do',
        data:dataObj,
        success:function(data) {
            
        }
    });
}
function insertAjax(dataObj) {
    $.post({
        url:'/regitCommBs.do',
        data:dataObj,
        success:function(data) {
            
        }
    });
}
function initSide() {
    $('.side_sub')[0].innerHTML=
    '<button onclick="location.href='+"'/jsp/mypageBiz/mpbProg_Item.jsp'"+'">전체 리뷰</button>'+
    '<button onclick="location.href='+"'/jsp/mypageBiz/mpbProg_Num.jsp'"+'">답하지 않은 리뷰</button>';
    $('.side_sub').css('display','unset');
    $('.side button').eq(4).addClass("side_select");
    $('.side_sub button').eq(0).addClass("side_sub_select");
}
function initEvent() {
    var idx;
    $('.selectbox select').change(function(){//정렬 셀렉트박스 변경 이벤트
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
        // pageObj.order=$('.selectbox select')[0].value;
        // pageObj.currentPageNum=1;
    });
    $('.order span').click(function() {//오름차순&내림차순 선택시 이벤트
        $(this).addClass('pick');
        $(this).siblings().eq(1).removeClass('pick');
    });
    $('.process').on("click","td.cell2",function() {//리뷰내용 누를경우 전체내용 출력
        $(this).toggleClass('open');
        $(this).toggleClass('close');
    });
    $('.process').on("click","td.replyCell",function() {//답글내용 누를경우 전체내용 출력
        $(this).toggleClass('open');
        $(this).toggleClass('close');
    });
    $('.process').on("keyup",".commentBox",function() {//텍스트 개수 출력
        $(this).siblings()[1].innerHTML=$(this).val().length+' / 300';
    });
    $('.process').on("click",".replyBtn",function() {//답글 버튼 클릭시 답글 폼 출력
        idx=$(this).val();
        printReplyForm(idx,'','submit');
    });
    $('.process').on("click",".cancel",function() {//답글 폼에서 취소 클릭시
        idx=$(this).val();
        cancelReply(idx);
    });
    $('.process').on("click",".submit",function() {//답글 폼에서 등록(INSERT)했을 경우
        idx=$(this).val();
        submitReply(idx);
    });
    $('.process').on("click",".edit",function() {//답글 폼에서 등록(UPDATE)했을 경우
        idx=$(this).val();
        editReply(idx);
    });
    $('.process').on("click",".editBtn",function() {//답글 리스트 수정버튼 눌렀을 경우
        idx=$(this).val();
        editFormPrint(idx);
    });
    $('.process').on("click",".delBtn",function() {
        idx=$(this).val();
        delReply(idx);
    });
}
function toDay() {//오늘 날짜 출력
    var date=new Date();
    var mm=date.getMonth()+1;
    var dd=date.getDate();
    var today=mm+'월 '+dd+', '+date.getFullYear();
    return today;
}
function delReply(idx) {//답글 삭제
    pageObj.rsvNum=JSON.parse($('#review'+idx+' .cell5')[0].innerHTML);//주문번호 담기
    //에이잭스 DELETE 메서드 구현 예정
    //SUCCESS했을 경우 
    $('#reply'+idx).remove();
    btnChange(idx,'답글',false);//답글버튼 활성화
}
function editReply(idx) {//답글 수정
    //에이잭스 UPDATE 메서드 구현예정
    pageObj.rsvNum=JSON.parse($('#review'+idx+' .cell5')[0].innerHTML);//주문번호 담기
    pageObj.content=$('#commentBox'+idx).val();//답글 내용 담기
    //만약, success했을 경우 담을 내용
    successSubmit(idx);
}
function editFormPrint(idx) {//답글 수정폼 출력
    var content=$('#reply'+idx+' .replyCell')[0].innerHTML.replace("[답글:]",'');
    $('#reply'+idx).remove();//답글행 삭제
    printReplyForm(idx,content,'edit');
}
function submitReply(idx) {//답글 등록
    //에이잭스 INSERT 메서드 구현예정
    pageObj.rsvNum=JSON.parse($('#review'+idx+' .cell5')[0].innerHTML);//주문번호 담기
    pageObj.content=$('#commentBox'+idx).val();//답글 내용 담기
    //만약, success했을 경우 담을 내용
    successSubmit(idx);
}
function successSubmit(idx) {//답글 DB 등록완료
    alert('답글이 정상적으로 작성되었습니다.');
    $('.comments').remove();//답글 폼 삭제
    $('.replyBtn[value='+idx+']')[0].innerHTML='답글완료';//버튼 텍스트 답글으로 전환
    $('<table class="replyList" id="reply'+idx+'">'+
        '<tr>'+
            '<td class="cell1">┗</td>'+
            '<td class="replyCell close">[답글:]'+pageObj.content+'</td>'+
            '<td class="cell6">'+toDay()+'</td>'+
            '<td class="cell7"><button class="editBtn" value='+idx+'>수정</button><button class="delBtn" value='+idx+'>삭제</button></td>'+
        '</tr>'+
    '</table>').insertAfter($('#review'+idx));
}
function cancelReply(idx) {//답글 취소
    $('#comments'+idx).remove();
    btnChange(idx,'답글',false);//답글버튼 활성화
}
function printReplyForm(idx,content,type){//답글 폼 출력 (인덱스,텍스트내용,등록타입-INSERT,UPDATE)
    console.log(idx);
    var customer=$('#customer'+idx)[0].innerHTML;//리뷰 작성한 고객명 추출
    $('<div class="comments" id="comments'+idx+'">'+
        '<div class="comments_header">'+
            '<p><span id="customer">'+customer+'</span> 님 리뷰에 대한 답글</p>'+
            '<button class="cancel" value='+idx+'>취소</button>'+
            '<button class="'+type+'" value='+idx+'>등록</button>'+
        '</div>'+
        '<div class="comments_body">'+
            '<span>┗</span>'+
            '<textarea class="commentBox" id="commentBox'+idx+'" cols="30" rows="3">'+content+'</textarea>'+
            '<span>0 / 300</span>'+
        '</div>'+
    '</div>').insertAfter($('#review'+idx));//댓글 폼 추가
    btnChange(idx,'작성중',true);//답글버튼 비활성화
}
function btnChange(idx,name,boolean) {//답글 버튼 전환
    $('.replyBtn[value='+idx+']')[0].innerHTML=name;//버튼 텍스트 전환
    $('.replyBtn[value='+idx+']').attr('disabled',boolean);//버튼 활성화 전환
}