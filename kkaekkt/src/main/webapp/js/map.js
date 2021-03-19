   /* 실제 사용 이벤트  */
$(document).ready(function(){

    var adrress="서울 용산"

    //사이드바 이벤트
    $('.foldBtn').click(function(){ $('.foldBtn').toggleClass('expand'); $('.slide').toggleClass('hide'); })

    //키워드/직접 검색 및 결과 반영
    $('.slide_ul').on("click","#all_search"	, function(){ var item = adrress+"클리닝"; navSearch(item) })  
    $('.slide_ul').on("click","#basic_search", function(){ var item = adrress+"세탁소"; navSearch(item)})  
    $('.slide_ul').on("click","#coin_search", function(){ var item = adrress+"코인세탁소"; navSearch(item)})
    					
   $('.input_searchBtn').on("click",function(){ var item = $(".input_search").val(); viewSearch(item) })					
   
  	//single List 단일 조회시 데이터 처리
    $('table').on("click",".place_body",function(){        
        var s_title = $(this).find('td')  
        singleView(s_title)
     })

})

 //관련 function -----------------------------------------------------------
 
 //List 검색결과 반영 및 side 제어이벤트
 
 function navSearch(item){
   searchMajor(item); 
   viewSearch(item) 
    $('.single').hide(); 
    $('.list').show();
 }
 
 //검색결과 COMMENT 보이게하기
 function viewSearch(clone){
    $(".slide_mini").html(clone+"&nbsp&nbsp검색결과")  
}

//단일 조회시 데이터 처리
function singleView(title){
   var title = s_title[0].innerText
   title = title.substr(2)
   var address = s_title[3].innerHTML
   var phone = s_title[5].innerHTML
   
   $("#s_title").html(title)
   $("#s_address").html(address)
   $("#s_phone").html(phone)

   $('.list').hide()
   $('.single').show() 
}