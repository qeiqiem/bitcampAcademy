

/* 실제 사용 이벤트  */
$(document).ready(function() {

	// 화면 생성시 기본호출
	// method/var-----------------------------------------------------------------------
	var adrress = "서울 용산"
	var random = Math.floor(Math.random() * 10) + "," + "000"
	var bno = ""
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
	$('.slide_ul').on("click", "#coin_search", function() {	var item = adrress + "코인세탁소"; navSearch(item)})

	$('.list').on("click", ".popul", function() { alert("준비중입니다.")})
	$('.list').on("click", ".gradescore", function() { alert("준비중입니다.")})
	
	// 2. 단일업체 페이지 전환
	$('table').on("click", ".place_body", function() { var s_title = $(this).find('td'); findSingle(s_title); findReview(bno)  })			
	
	// 2-1. 업체 블록페이지
	$('#infoData').click(function() { $('.cardinfo').show(); $('.cominfo').hide();})
	// 2-2. 리뷰 블록페이지
	$('#infoReview').click(function() { $('.cardinfo').hide(); $('.cominfo').show();})

	// 3. 예약슬라이드 (2depth) show
	$('#res').click(function() { resItemList(bno); $('.slide_res').show()})
	$('.input_searchBtn').on("click", function() { var item = $(".input_search").val(); viewSearch(item)})
	//예약항목 옵션 클릭시 감지
	$("#resShortOpt").on("click", 'input:checkbox', function() {
	      var ckVal = $(this).val()
	      var ckTf = $(this).is(":checked")
	      ckRes(ckVal,ckTf)
    })

		       
	//4. 결제 api 대기 팝업
	$('.comBtn').on("click", function() { $(".res_loading").show(); showpricepop()});
	$('.res_loading button').click(function() { $(".res_loading").hide()})	
	
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
	        	      		        		html += week+" : "+time+"</br>"
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
    	        					for (var j = 0; j <4; j++) {
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
	

	// [예약하기] : selectbox 옵션 부여-----------------
	function selectNum() {
		$(".resOpc").append(
				'<option value="" selected disabled hidden>1</option>')
		for (var i = 1; i < 11; i++) {
			$(".resOpc").append(
					'<option value="' + i + '">' + i + '</option');
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
	        	      		        		html += '<td><input type="checkbox" value="'+j+'">'+item+'</td>'
	        	      		        		html += '<td><select class="resOpc" disabled></select></td>'
	        	      		        		html += '<td><p class="res_price" value="'+price+'">'+price+'</p></td>'
	        	      		        		html +='</tr>'
	        	      					 }
    	        				html += '<tr><td class="option_title">4~7일 소요</td>'
    	        				html +='<td class="option_title">금액(개당)</td></tr>'
    	        					for ( j; j <data.length; j++) {
	        	      		        		var longitem = data[j].product        		
	        	      		        		var longprice = data[j].price
	        	      		        		html +='<tr>'
	        	      		        		html += '<td><input type="checkbox" value="'+j+'">'+longitem+'</td>'
	        	      		        		html += '<td><select class="resOpc" disabled></select></td>'
	        	      		        		html += '<td><p class="res_price" value="'+longprice+'">'+longprice+'</p></td>'
	        	      		        		html +='</tr>'
	        	      					 }
    	        				
    	        				
    	        				/*html +='<tr><td>결제상세</td></tr>'
    	        				html +='<tr><td>주문금액</td><td class="total"></td></tr>'*/
    	        				html +='<tr><td>결제예상금액</td><td class="totalAll"></td></tr>'
    	        					
	        				$("#resShortOpt").append(html)
	        				selectNum()
					   } 
	        
	        
	    })
      	
		$('.list').hide()
        $('.single').show()
	}

	function ckRes(ckVal,ckTf) {
		 console.log( ckVal + "번줄 / " + ckTf + " 체크박스가 클릭되었습니다.<br/>")
		 if(ckTf == true)	{	
			   //체크박스 활성화시에 disable해제
		       $("select.resOpc").eq(ckVal).attr("disabled",false)		
		       //셀렉트 박스의 값이 변한다면 금액도 변경
		       $("select.resOpc").eq(ckVal).change(function(){
		    	   //select 박스 선택 값
		    	   var option = this.value
		    	   //변경시킬 해당 row의 price정보
		    	   var chVal = $("p.res_price").eq(ckVal).attr("value")	
		    	   var total = option*chVal
		    	   $("p.res_price").eq(ckVal).text(total)
		       })
		 }else if(ckTf == false){
			 $("select.resOpc").eq(ckVal).attr("disabled",true)	
			  $("p.res_price").text(chVal)
		}
	}

	
	//결제 진행시 팝업 생성
	function showpricepop() {
		plusHeart(100);
		openLoading($(".res_loading"), 2000);
		clearInterval(moveTimer);
		clearInterval(eventTimer);

		setTimeout(function() {
			openCommercial();
		}, 3000);
	}
			
			
			
})