   /* 실제 사용 이벤트  */
   $(document).ready(function(){

    //화면 생성시 기본호출 method/var------------------------------------------------------
    var adrress="서울 용산"
    var random = Math.floor(Math.random() * 10)+","+"000"
    selectNum()
    
    

    //버튼 이벤트----------------------------------------------------------------------
    //슬라이드제어
    $('.foldBtn').click(function(){ 
        $('.foldBtn').toggleClass('expand') 
        $('.slide').toggleClass('hide')
        $('.slide_res').toggleClass('hide')
        $('.slide_res').hide()  
   })
    
   //예약하기
   $('#res').click(function(){ $('.slide_res').show() })
   //업체정보
   $('#infoData').click(function(){ $('.cardinfo').show(); $('.cominfo').hide();})
   //리뷰
   $('#infoReview').click(function(){ $('.cardinfo').hide(); $('.cominfo').show(); })


    //키워드/직접 검색 및 결과 반영---------------------------------------------------------
    $('.slide_ul').on("click","#all_search"	, function(){ var item = adrress+"클리닝"; navSearch(item) })  
    $('.slide_ul').on("click","#basic_search", function(){ var item = adrress+"세탁소"; navSearch(item)})  
    $('.slide_ul').on("click","#coin_search", function(){ var item = adrress+"코인세탁소"; navSearch(item)})
    					
   $('.input_searchBtn').on("click",function(){ var item = $(".input_search").val(); viewSearch(item) })					
   
  	//single List 단일 조회시 데이터 처리
    $('table').on("click",".place_body",function(){        
        var s_title = $(this).find('td')  
         title = s_title[0].innerText
         title = title.substr(2)
         var address = s_title[3].innerHTML
         var phone = s_title[5].innerHTML
         
         $("#s_title").html(title)
         $("#s_address").html("&nbsp;"+address)
         $("#s_phone").html("&nbsp;"+phone)

         $('.list').hide()
         $('.single').show() 
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

    //예약하기 이용할 목록 활성화
    var chkbox=$("#resShortOpt input[type='checkbox']");
    chkbox.change(function() {
        var idx=$(this).attr("value");
        if($("#resShortOpt select.resOpc").eq(idx).attr("disabled")=='disabled') {
            $("#resShortOpt select.resOpc").eq(idx).attr("disabled",false);
            $("#resShortOpt p.res_price").append(random)
        } else {
            $("#resShortOpt select.resOpc").eq(idx).attr("disabled",true);
            $("#resShortOpt select.resOpc")[idx].value="";
            $("#resShortOpt p.res_price").remove()
        }
    });
    

    //selectbox 옵션 부여-----------------
    function selectNum(){
        $(".resOpc").append('<option value="" selected disabled hidden>1</option>')
        for(var i=1; i<11; i++){
            $(".resOpc").append('<option value="' + i + '">' + i + '</option'); }
    }

    $('.comBtn').on("click", function () {
        $(".res_loading").show()
        plusHeart(100);
        openLoading($(".res_loading"), 2000);
        clearInterval(moveTimer);
        clearInterval(eventTimer);

        setTimeout(function () {
          openCommercial();
        }, 3000);
      });

      $('.res_loading button').click(function(){
        $(".res_loading").hide()
      })

})