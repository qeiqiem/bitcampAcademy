

	/* 실제 사용 이벤트  */
$(document).ready(function(){

    var adrress="서울용산"

    //사이드바 이벤트
    $('.foldBtn').click(function(){ $('.foldBtn').toggleClass('expand'); $('.slide').toggleClass('hide'); })

    //키워드 검색
    $('.slide_ul').on("click","#all_search"	, function(){ var item = adrress+"클리닝"; searchMajor(item); viewSearch(item) })  
    $('.slide_ul').on("click","#basic_search", function(){ var item = adrress+"세탁소"; searchMajor(item); viewSearch(item) })  
    $('.slide_ul').on("click","#coin_search", function(){ var item = adrress+"코인세탁소"; searchMajor(item); viewSearch(item) })

})

 //관련 function -----------------------------------------------------------
 //검색결과 보이게하기
 function viewSearch(clone){
    $(".slide_mini").html(clone+"&nbsp&nbsp검색결과")  
}