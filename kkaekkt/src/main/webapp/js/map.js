

/* 실제 사용 이벤트  */
$(document).ready(function() {
	
	var rsvObj={};
   // method/var-----------------------------------------------------------------------
   var adrress = "서울 용산"
   var random = Math.floor(Math.random() * 10) + "," + "000"
   var bno = ""
   var totalPrice = 0
 
   selectNum()
   

   // [Click 이벤트]----------------------------------------------------------------------
   $("#agreement i").click(function() {//약관 클릭 시
      $(this).toggleClass('fa-chevron-down');
      $(this).toggleClass('fa-chevron-up');
      console.log($(this).css('display'));
      if($('.termsText').eq($(this).attr('value')).css('display')=="none"){
          $('.termsText').eq($(this).attr('value')).show();
      }else{
          $('.termsText').eq($(this).attr('value')).hide();
      }
  });
   /* [사이드바] */
   // 1. 리스트 : 슬라이드 show
   $('.foldBtn').click(function() {
      $('.foldBtn').toggleClass('expand')
      $('.slide').toggleClass('hide')
      $('.slide_res').toggleClass('hide')
      $('.slide_res').hide()
   })

   // 1-1. 리스트 내부 조회이벤트
   $('.slide_ul').on("click", "#all_search", function() { 
	   resetInput()
	   var item = adrress + "클리닝"; 
	   navSearch(item)	   
   })
   
   $('.slide_ul').on("click", "#basic_search", function() { 
	   resetInput()
	   var item = adrress + "세탁소"; 
	   navSearch(item)
   })
   $('.slide_ul').on("click", "#coin_search", function() { 
	   resetInput()
	   var item = adrress + "코인세탁소"; 
	   navSearch(item)
   })

   $('.list').on("click", ".popul", function() { alert("준비중입니다.")})
   $('.list').on("click", ".gradescore", function() { alert("준비중입니다.")})
   
   // 2. 단일업체 페이지 전환
   $('table').on("click", ".place_body", function() { var s_title = $(this).find('td'); findSingle(s_title); findReview(bno)  })         
   
   // 2-1. 업체 블록페이지
   $('#infoData').click(function() { $('.cardinfo').show(); $('.cominfo').hide();})
   // 2-2. 리뷰 블록페이지
   $('#infoReview').click(function() { $('.cardinfo').hide(); $('.cominfo').show();})

   // 3. 예약슬라이드 (2depth) show
   $('.resbtn').click(function() { 
	   if(mno == 0){
		   alert("로그인후 이용해주세요")
	   }else{
		   resItemList(bno); $('.slide_res').show(); 
	   } 
   })
   
   $('#res_return').click(function() { 
	   resItemList(bno); 	   
	   $('.slide_success').hide(); 
	   $('.slide_res').show(); 
	})
   $('#res_check').click(function() { 
	   //아예 못돌아가게 (데이터가 꼬일수있음으로 replace 사용
	   location.replace('/jsp/mypageUser/mypagePs.jsp')}
   )
   $('.input_searchBtn').on("click", function() { $('.single').hide(); $('.list').show(); var item = $(".input_search").val();  viewSearch(item)})
   
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
      if(totalPrice==0){
         totalPrice=""; //0일 경우 공백표시
      }
      $(".totalAll").text(totalPrice);
   }
   //4. 결제 api 대기 팝업
   $('.comBtn').on("click", function() {  
      if(totalPrice == 0 && totalPrice == "" ){
         alert("지불할 금액이없습니다. 옵션을 선택해주세요.")
      }else {
		  /*$("#mask").show()*/
    	  $(".choicePay").show();
      }     
   })
   
   //버튼이벤트
   $("#kakaoPay").click(function() {
	   var payType = 1
	   requestPay(payType)
	   $(".choicePay").hide();
	   $("#mask").show()
	   
   })
      
   $("#toss").click(function() {
	   var payType = 2
	   requestPay(payType)
	   $(".choicePay").hide();
	   $("#mask").show()
   })
      
   $("#ectPay").click(function() {
	   var payType = 3
	   requestPay(payType)
	   $(".choicePay").hide();
	   $("#mask").show()
   })
   
   
   /*insertResList() */
   $('#chat').click(function() {
	   if(mno == 0){
		   alert("로그인후 이용해주세요")
	   }else{
		   alert("준비중입니다.")
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
   function resetInput() {
	   var text =  $('.input_search').val() 
	   if( text != null){
		   $('.input_search').val('') 
	   }
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
            '<option value="" selected disabled hidden selected>1</option>')
      for (var i = 1; i < 11; i++) {
         $(".resOpc").append(
               '<option value="' + i + '">' + i + '</option')
      }
   }
   
   //예약가능 품목 불러오기
   function resItemList(bno) { 
      bno = bno
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
                           html +='<input type="hidden" id="addressee" value="'+data[0].mno+'">'
                       $("#resShortOpt").append(html)
                       selectNum()
                  } 
           
           
       })
         
      $('.list').hide()
      $('.single').show()
   }
           
   function requestPay(payType) {
	   //버튼값에따라 pay open
	   switch (payType) {
			case 1:
				//kakao
				IMP.init("imp27421713")
				break;
				
			case 2:
				//toss
				IMP.init("imp76861865")
				break;	
				
			case 3:
				//ectpay
				IMP.init("imp02061320")
			 break;
	   }

       IMP.request_pay({
           pg : 'kakao', // 결제방식
           pay_method : 'card',   // 결제 수단
           merchant_uid : 'merchant_' + new Date().getTime(),
           name : '주문명: 결제 테스트',   // order 테이블에 들어갈 주문명 혹은 주문 번호
           amount : totalPrice,   // 결제 금액
           buyer_email : 'test',   // 구매자 email
           buyer_name :  'test',   // 구매자 이름
           buyer_tel :  'test',   // 구매자 전화번호
           buyer_addr :  'test',   // 구매자 주소
           buyer_postcode :  'test',   // 구매자 우편번호
           m_redirect_url : '/khx/payEnd.action'   // 결제 완료 후 보낼 컨트롤러의 메소드명
 
         }, function(rsp) {
         if ( rsp.success ) { // 성공시
            //결제관련 api 기능
            mapRes()
            $('.slide_res').hide()
            $('.slide_success').show()            
            $("#mask").hide()	            
         } else { // 실패시
            console.log('결제에 실패하였습니다.');
         }
      })
   }
   
   
   //화면단에있는 목록 가져오기
   function insertResList() {
		 //뿌려져있는 row 체크
		  var cntChk = $('.chked')
		   var arrayRes = new Array();
         var idx;
         var selc;
         var ddate;
		     for (var i = 0; i < cntChk.length ; i++) {		    	 
		    	//lno 발최
		      idx = $('.chked').eq(i).attr('id').charAt(3);
		        //개수
		        selc = $('#selc'+idx).val();
		        arrayRes.push({lno:Number(idx)+1, cnt:selc});
              if(idx<4){
                     ddate=3;
               }else{
                     ddate=7;
               }
		     }
           rsvObj.resListData=JSON.stringify(arrayRes);
           rsvObj.ddate=ddate;
		   $("choicePay").show()		   
	   }
   
 //리스트 컨트롤러로 보내기
   function mapRes() {
	   rsvObj.mno = mno;
      rsvObj.totalPrice=totalPrice;
      rsvObj.rbno=bno;
	   $.ajax({
           url:'/respay.do'
           , method : 'POST'
           , data: rsvObj
           , success:function(result){
            msgSet(result);
            sendMsg();
           }
	   })
   }
   function today() {
      var date=new Date();
      var mm=date.getMonth()+1;
      var dd=date.getDate();
      var today=date.getFullYear()+'.'+(mm<10?'0'+mm:mm)+'.'+(dd<10?'0'+dd:dd);
      return today;
  }
  function msgSet(rsvNum) {
          alertObj.addressee=Number($('#addressee').val());
          alertObj.rsvNum=rsvNum;
          alertObj.msg='새로운 주문(번호:'+rsvNum+')이 등록되었습니다.';
          alertObj.typenum=1;
  }
  function sendMsg() {
      $.post({
          url:'/regitAlert.do',
          data:alertObj,
          success:function() {
              if(socket){
                  var receiver=alertObj.addressee;
                  var msg='<li>'+
                              '<div class="msgTop">'+
                                  '<a href="/jsp/mypageBiz/mpbProg_Num.jsp">[결제]⠀'+alertObj.msg+'</a>'+
                              '</div>'+
                              '<div class="msgBottom">'+
                                  '<span class="date">'+today()+'</span>'+
                                  '<span class="byBs">by '+alertObj.senderName+'</span>'+
                              '</div>'+
                              '<i class="fas fa-times"></i>'+
                          '</li>'
                  socket.send(receiver+','+msg);//메시지 보냄
              }
          }
      });
  }
});