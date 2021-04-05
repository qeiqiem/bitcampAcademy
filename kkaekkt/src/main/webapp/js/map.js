

/* 실제 사용 이벤트  */
$(document).ready(function() {

   // 화면 생성시 기본호출
   // url에서 로그인 정보 가져오기
	var url = document.location.href
	console.log(link)
	url = url.split("?")

	
   // method/var-----------------------------------------------------------------------
   var adrress = "서울 용산"
   var random = Math.floor(Math.random() * 10) + "," + "000"
   var bno = ""
   var totalPrice = 0
   IMP.init("imp27421713");
   selectNum()
   

   // [Click 이벤트]----------------------------------------------------------------------

   /* [사이드바] */
   // 1. 리스트 : 슬라이드 show
   $('.foldBtn').click(function() {
      $('.foldBtn').toggleClass('expand')
      $('.slide').toggleClass('hide')
      $('.slide_res').toggleClass('hide')
      $('.slide_res').hide()
   })

   // 1-1. 리스트 내부 조회이벤트
   $('.slide_ul').on("click", "#all_search", function() { var item = adrress + "클리닝"; navSearch(item)})
   $('.slide_ul').on("click", "#basic_search", function() { var item = adrress + "세탁소"; navSearch(item)})
   $('.slide_ul').on("click", "#coin_search", function() {   var item = adrress + "코인세탁소"; navSearch(item)})

   $('.list').on("click", ".popul", function() { alert("준비중입니다.")})
   $('.list').on("click", ".gradescore", function() { alert("준비중입니다.")})
   
   // 2. 단일업체 페이지 전환
   $('table').on("click", ".place_body", function() { var s_title = $(this).find('td'); findSingle(s_title); findReview(bno)  })         
   
   // 2-1. 업체 블록페이지
   $('#infoData').click(function() { $('.cardinfo').show(); $('.cominfo').hide();})
   // 2-2. 리뷰 블록페이지
   $('#infoReview').click(function() { $('.cardinfo').hide(); $('.cominfo').show();})

   // 3. 예약슬라이드 (2depth) show
   $('#res').click(function() { resItemList(bno); $('.slide_res').show(); })
   $('.input_searchBtn').on("click", function() { var item = $(".input_search").val(); viewSearch(item)})
   
   //예약항목 옵션 클릭시 감지
   $("#resShortOpt").on("click", 'input:checkbox', function() {
      //체크란 row의 값
         var idx = $(this).val()
       //체크 상태에 대한 값
         var ckTf = $(this).is(":checked")
      changeListener(idx,ckTf);
    })
    
   function changeListener(idx,ckTf){
      if(ckTf) {//활성화라면,
         $('.chkBox').eq(idx).addClass('chked');
         $("select.resOpc").eq(idx).attr("disabled",false); //셀렉트 항목 활성화
         totalPriceSet();
      }else {
         $('.chkBox').eq(idx).removeClass('chked');
         $('select.resOpc').eq(idx).val("1").trigger('change');
         $("select.resOpc").eq(idx).attr("disabled",true); //셀렉트 항목 비활성화
      }
   }
   $('#resShortOpt').on('change','select.resOpc',function() {//셀렉트 변환 시 가격반영
      var idx=Number($(this).attr('id').charAt(4));//idx 추출
      var cnt=$(this).val();   
      var price=Number($('p.res_price').eq(idx).attr('value'));
      $('p.res_price').eq(idx).text(cnt*price);
      totalPriceSet();
   });
   function totalPriceSet() {
      totalPrice=0;
      var chkedList = $('.chked');
      var idx;
      for(var i=0;i<chkedList.length;i++){
         idx=$('.chked').eq(i).attr('id').charAt(3);
         totalPrice+=Number($('#price'+idx)[0].innerHTML);
      }
      $(".totalAll").text(totalPrice);
   }
   //4. 결제 api 대기 팝업
   $('.comBtn').on("click", function() {  
      if(totalPrice == 0 && totalPrice == "" ){
         alert("지불할 금액이없습니다. 옵션을 선택해주세요.")
      }else {
    	  insertResList() 
      }     
   })
   
   
   $('.res_loading button').click(function() { $(".res_loading").hide(); $("#mask").hide(); })   
   $("#mask").on("click", function() {  $(".res_loading").hide(); $("#mask").hide();});
   
   //[기  능] -------------------------------------------------------------------------------
   function navSearch(item) {
      searchMajor(item);
      viewSearch(item)
      $('.single').hide();
      $('.list').show();
   }

   // 검색결과 COMMENT 보이게하기
   function viewSearch(clone) { $(".slide_mini").html(clone + "&nbsp&nbsp검색결과") }

   //단일 업체 db data 뽑아오기
   function findSingle(s_title) {
      
      //bno를 가지고 select 하기위해 추출
      var bnoArray = s_title[0].outerHTML.split('value="')
      bnoArray = bnoArray[1].split('"')
      bno = bnoArray[0]
      
      //화면정보 출력
      var name = s_title[0].innerText.substr(3)
        var star = s_title[2].innerHTML
        var address = s_title[3].innerHTML   
       var phone = s_title[4].innerHTML
       if(star != null)
           $("#memberlog").html('<input class="tag_kkaekkt" value="kkarkkt 가맹점 입니다">')
        
           
        $("#s_title").html(name)
        $("#s_star").html(star)
        $("#s_address").html('<i class="fas fa-map-marker-alt"></i>&nbsp;'+address)
        $("#s_phone").html('<i class="fas fa-phone-alt"></i>&nbsp;'+phone)
      
      //업체 업무시간 정보
      $.ajax({
           url:'/singleTime.do'
           , method : 'POST'
           , data: { bno : bno }
           , dataType: 'json'
           , success: function(data){ //성공후 처리는 추후 진행.                                                                                        
                       if(data==null)console.log("data 가 조회되지 않았습니다.")                               
                          var html = ''   
                        html += ' <i class="far fa-clock"></i> 업무시간 </br>'
                              for (var i = 0; i <7; i++) {
                                        var week = data[i].week                 
                                        var time = data[i].time
                                        html += "&nbsp&nbsp&nbsp&nbsp"+week+" : "+time+"</br>"
                                   }
                        $("#s_time").append(html)                        
                       }   
       })       
     
      //업체 가격정보 (추후 coin만 따로 만들예정:switch문으로)
       $.ajax({
           url:'/singleOption.do'
           , method : 'POST'
           , data: { bno : bno }
           , dataType: 'json'
           , success: function(data){ //성공후 처리는 추후 진행.                                                                                        
                       if(data==null)console.log("data 가 조회되지 않았습니다.")   
                       var html = ''
                          html += '<tr><td class="option_title">1~3일 소요</td>'
                           html +='<td class="option_title">금액(개당)</td></tr>'
                              for (var j = 0; j <4; j++) {
                                        var item = data[j].product              
                                        var price = data[j].price
                                        html += '<tr><td>'+item+'</td><td>'+price+'</td></tr>'
                                    }
                           html += '<tr><td class="option_title">4~7일 소요</td>'
                           html +='<td class="option_title">금액(개당)</td></tr>'
                              for (j; j <8; j++) {
                                        var longitem = data[j].product              
                                        var longprice = data[j].price
                                        html += '<tr><td>'+longitem+'</td><td>'+longprice+'</td></tr>'
                                    }
                       $("#single_option").append(html)
                  }                        
       })
      
      $('.list').hide()
        $('.single').show()
      
      
      
   }

   //리뷰 조회
   function findReview(bno) {
      
      //업체 업무시간 정보
      $.ajax({
           url:'/reviewList.do'
           , method : 'POST'
           , data: { bno : bno }
           , dataType: 'json'
           , success: function(data){ //성공후 처리는 추후 진행.                                                                                        
                       if(data==null)console.log("data 가 조회되지 않았습니다.")   
                       
                       //총 리뷰의 개수
                       var cnt = "리뷰 "+data.length
                       $(".allCom").append(cnt)    
                       
                          var html = ''   
                             for (var i = 0; i < data.length; i++) {
                                html += '<ul class="combodyul">'
                                 html += ' <li>'+data[i].mname+'</li>'
                                 html += '<li>'
                                    var grade = data[i].grade;                        
                                    for(var j=0; j<grade; j++) {
                                       html += '<i class="rating__icon rating__icon--star fa fa-star"></i>'
                                            }
                                            for(var j=0; j<(5-grade); j++) {
                                               html += '<i class="rating__icon rating__icon--star2 fa fa-star" sytle="color:lightgray"></i>'
                                            }
                                 html += '&nbsp&nbsp&nbsp'+data[i].rdate+'</li>'
                                 html += ' <li> <p class="comment">'+data[i].content+'</p></li>'
                              html += '</ul>'
                           }
                        
                        $(".combody").append(html)                        
                       }   
       })      
      
   }
   

   // selectbox 옵션
   function selectNum() {
      $(".resOpc").append(
            '<option value="" selected disabled hidden selected>선택</option>')
      for (var i = 1; i < 11; i++) {
         $(".resOpc").append(
               '<option value="' + i + '">' + i + '</option')
      }
   }
   
   //예약가능 품목 불러오기
   function resItemList(bno) { 
      
      $.ajax({
           url:'/singleOption.do'
           , method : 'POST'
           , data: { bno : bno }
           , dataType: 'json'
           , success: function(data){ //성공후 처리는 추후 진행.                                                                                        
                       if(data==null)console.log("data 가 조회되지 않았습니다.") 
                       $("#resShortOpt").empty()
                       var html = ''              
                          html +='<tr>'
                          html +='<td class="htdres res_title">1~3일 소요</td>'
                           html +='<td class="htdres res_num">개</td>'
                           html +='<td class="htdres ores_price">예상비용</td>'
                           html +='</tr>'
                              for (var j = 0; j <4; j++) {
                                        var item = data[j].product              
                                        var price = data[j].price
                                        html +='<tr>'
                                        html += '<td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">'+item+'</td>'
                                        html += '<td><select id="selc'+j+'" class="resOpc" disabled></select></td>'
                                        html += '<td><p class="res_price" id="price'+j+'" value="'+price+'">'+price+'</p></td>'
                                        html +='</tr>'
                                    }
                           html += '<tr><td class="htdres option_title">4~7일 소요</td>'
                          html +='<td class="htdres res_num">개</td>'
                           html +='<td class="htdres ores_price">예상비용</td></tr>'
                              for ( j; j <data.length; j++) {
                                        var longitem = data[j].product              
                                        var longprice = data[j].price
                                        html +='<tr>'
                                        html += '<td><input class="chkBox" id="chk'+j+'" type="checkbox"  value="'+j+'">'+longitem+'</td>'
                                        html += '<td><select id="selc'+j+'" class="resOpc" disabled></select></td>'
                                        html += '<td><p class="res_price" id="price'+j+'" value="'+longprice+'">'+longprice+'</p></td>'
                                        html +='</tr>'
                                    }
                           
                           html +='<tr><td style="height: 55px; font-weight: 600; font-size: 18px;">결제예상금액</td>'
                           html +='<td colspan="2" class="totalAll"></td></tr>'                          
                       $("#resShortOpt").append(html)
                       selectNum()
                  } 
           
           
       })
         
      $('.list').hide()
        $('.single').show()
   }
           
   function requestPay(arrayRes) {
	   var arrayRe = arrayRes
      //결제관련 api 기능
	   
       mapRes(arrayRe)
       $("#mask").hide()	
	   
//       IMP.request_pay({
//           pg : 'kakao', // 결제방식
//           pay_method : 'card',   // 결제 수단
//           merchant_uid : 'merchant_' + new Date().getTime(),
//           name : '주문명: 결제 테스트',   // order 테이블에 들어갈 주문명 혹은 주문 번호
//           amount : totalPrice,   // 결제 금액
//           buyer_email : 'test',   // 구매자 email
//           buyer_name :  'test',   // 구매자 이름
//           buyer_tel :  'test',   // 구매자 전화번호
//           buyer_addr :  'test',   // 구매자 주소
//           buyer_postcode :  'test',   // 구매자 우편번호
//           m_redirect_url : '/khx/payEnd.action'   // 결제 완료 후 보낼 컨트롤러의 메소드명
// 
//         }, function(rsp) {
//         if ( rsp.success ) { // 성공시
//            
//            var msg = '결제가 완료되었습니다.'
//            msg += '고유ID : ' + rsp.imp_uid
//            msg += '상점 거래ID : ' + rsp.merchant_uid
//            msg += '결제 금액 : ' + rsp.paid_amount
//            msg += '메일 : ' + rsp.buyer_email
//            msg += '이름 : ' + rsp.buyer_name
//            msg += '우편번호 : ' + rsp.buyer_postcode
//            alert(msg)
//            mapRes(arrayRe)
//            $("#mask").hide()	
//         } else { // 실패시
//            var msg = '결제에 실패하였습니다.';
//            msg += '에러내용 : ' + rsp.error_msg;
//         }
//      })
   }
   
   
   //화면단에있는 목록 가져오기
   function insertResList() {
		 //뿌려져있는 row
		  var cntChk = $('.chked')
		   var arrayRes = new Array();
		     for (var i = 0; i < cntChk.length ; i++) {
		    	 
		    	//lno 발최
		    	var idx = $('.chked').eq(i).attr('id').charAt(3)
		        //개수
		        var selc = $('#selc'+idx).val()
		        //단일금액
		        var pri = $('#price'+idx)[0].innerHTML		        
		        arrayRes[i] = Array(idx, selc, pri)
		    	
		     }

		   $("#mask").show()		  
		   requestPay(arrayRes)
	   }
   
 //리스트 컨트롤러로 보내기
   function mapRes(arrayRe) {
	   var arrayTos = arrayRe
	   console.log(arrayRe)
	   
	   $.ajax({
           url:'/respay.do'
           , method : 'POST'
           , data: { 'arrayRe' : JSON.stringify(arrayRe) }
           , dataType: 'json'
           , success:function(data){
        	   
           }
	   })
   }
  
})