<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <html>
   <head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지도생성하기</title>
    
    <!-- map 에서 필요한 참조 -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <!-- 아임포트 -->
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
     <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
     
    <script src="/js/map.js"></script>
   <link rel="stylesheet" href="/css/map.css">
   
   </head>
   <body>
      <jsp:include page="/jsp/header0.jsp"></jsp:include>
      <div id="mask"></div>
           <div class="body_container">
               <div class="map_container">
               <!-- 지도타입 컨트롤 div 입니다 -->
			    <div class="custom_typecontrol radius_border">
			        <span id="btnRoadmap" class="selected_btn_map" onclick="setMapType('roadmap')">지도</span>
			        <span id="btnSkyview" class="btn_sky" onclick="setMapType('skyview')">스카이뷰</span>
			    </div>
			    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			    <div class="custom_zoomcontrol radius_border"> 
			        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
			        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
			    </div>
                   <!-- 예약창 로딩중 -->
                   <div class="res_loading hidden">
                       <div class="dot">
                           <i></i><i></i><i></i>
                           <h3>결제진행을 위해 로딩중입니다.</h3>
                           <button>취 소</button>
                       </div>
                   </div>
                   <div class="slide_container">
                       <div class="slide">
                           <div class="slide_top">
                               <img class="map_logo" src="/img/logo.svg" alt="">
                               <p class="here"><input type="radio">내 주변 찾기</p>
                               <div class="slide_search">
                                   <form onsubmit="searchPlaces(); return false;">
                                       <input    class="input_search"    type="text" id="keyword" placeholder="동네를 입력해주세요.">
                                       <button class="input_searchBtn" type="submit">
                                           <i class="fas fa-search fa-lg "></i>                
                                       </button>
                                   </form>
                               </div>
                               <div class="tag">
                                   <ul class="slide_ul">
                                       <li id="all_search"   value="1">전체</li>
                                       <li id="basic_search" value="2" >일반세탁소</li>
                                       <li id="coin_search"  value="3">코인세탁소</li>
                                       <li id="my_search">my</li>
                                   </ul>
                                   <hr>
                                   <p class="slide_mini"></p>
                               </div>
                           </div>
                           <div class="footer list">
                               <ul class="searchtag">
                                   <li><b id="countp">장 소 </b></li>
                                  <!--  <li style="margin-left: 45%;font-size: 12px;">거리순</li> -->
                                   <li class="popul"style="font-size: 12px;">인기순 | </li>
                                   <li class="gradescore" style="font-size: 12px;">평점순</li>
                               </ul>
                               <div class="slide_card">
                                   <table id="placesList"></table>
                                   <div id="pagination"></div>
                               </div>
                           </div>
                           <div class="footer single">
                               <div class="card">
                                   <img id="single_img" src="/img/kkaekkt.png" style="width: 100%; height: 200px; background-color: aliceblue;">
                                   <p id="s_title"> <i class="far fa-heart" id="heart" style="color:lightgray; font-size:30px"></i></p>
                                   <div id="s_star">
                                   </div>
                           <div>
                              <button id="res">예약하기</button>
                              <button id="chat">상담하기</button>
                           </div>
                               </div>
                               <div>
                                   <button class="infoBtn" id="infoData">업체정보</button>
                                   <button class="infoBtn" id="infoReview">리&nbsp;뷰</button>
                               </div>
                               <div class="cardinfo"> 
                                       <table id="single_table">
                                           <tr>
                                               <td id="memberlog"></td>
                                           </tr>
                                           <tr>
                                               <td><p id="s_phone" style="color:rgb(90, 90, 90); margin: 0"></p></td>
                                           </tr>
                                           <tr>
                                               <td><p id="s_address" style="color:rgb(90, 90, 90); margin: 0"></p></td>
                                           </tr>
                                           <tr>
                                               <td><p id="s_time" style="color:rgb(90, 90, 90); margin: 0"></p></td>
                                           </tr>
                                           <tr>
                                           </tr>
                                       </table>
   
                                       <div class="moreinfo">
                                           <p class="more_title">취급 품목</p>
                                           <hr>
                                           <table id="single_option"> </table>
                                       </div> 
                               </div>
                               <div class="cominfo">
                                   <div class="comhead">
                                       <label for="latest"><input type="radio" class="latest">최신순</label>
                                       <label for="grade"><input type="radio" class="grade">평점순</label>
                                       <p class="allCom"></p>
                                   </div>
                                   <div class="combody"></div>                                
                               </div>
                           
                           </div>
                       </div><!-- slide -->
                       <div class="slide_res">     
                           <p id="res_p">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="far fa-edit"></i>&nbsp&nbsp예약하기</p>
                           <div class="rescont">
                               <p style="width: 94%; height: 35px; padding-block-start: 20px; border-bottom: 1px solid lightgray;">주문신청</p>
                               <table id="resShortOpt"></table>
                           </div>
                           <div class="userInfo">
                              <p>예약자 &nbsp;${person.mname}</p>
                                <p>연락처 &nbsp;${person.phone}</p>
                        <p>이메일 &nbsp;${person.email}</p>
                           </div>
                           <div class="sellerInfo">
                              <p id="selname">판매자정보 &nbsp;</p>   
                               <p>개인정보 수집, 제공 &nbsp;</p>
                               <input placeholder="개인정보 수집 동의">
                               <input placeholder="개인정보 제공 동의">
                               <ul>
                                   <li>취소/환불 규정 &nbsp;</li>
                                   <li>주문 1시간이내 취소가능</li>
                               </ul>
                               <p>예약 서비스 이용을 위한 개인정보 수집 및 제3자 제공, 취소/환불 규정을 확인하였으며 이에동의합니다.</p>
                           </div>
                           <div class="comBtnDiv">
                            <button class="comBtn">결제하기</button>
                           </div>                          
                       </div><!-- res_slide --> 
                       <div class="contBtn">
                           <button class="foldBtn">&lt;</button>
                           <button class="foldBtn expand">&gt;</button>
                       </div>
                   </div>
                   <div id="map"></div>
               </div>
               
           </div>
       </body>    
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3845f493917a302d1ea69e946c0443ff&libraries=services"></script>
       <script>
   
       /* 지도 api에서 제공하는 이벤트 */
           var markers = [];
           var mapContainer = 
            map = document.getElementById('map'),
               mapOption = {
                   center: new kakao.maps.LatLng(37.566826, 126.9786567),level: 2
               }; 
           
           var itemel;
           var bno= "";    
           var dbData = [];
           
           var mno = ${person.mno};	  

           var map = new kakao.maps.Map(mapContainer, mapOption);
           mapContainer.style.position = "initial";
            
           var ps = new kakao.maps.services.Places();  
           
           function setMapType(maptype) { 
        	    var roadmapControl = document.getElementById('btnRoadmap');
        	    var skyviewControl = document.getElementById('btnSkyview'); 
        	    if (maptype === 'roadmap') {
        	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        	        roadmapControl.className = 'selected_btn_map';
        	        skyviewControl.className = 'btn_sky';
        	    } else {
        	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        	        skyviewControl.className = 'selected_btn';
        	        roadmapControl.className = 'btn';
        	    }
        	}
           
           // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
           function zoomIn() {
               map.setLevel(map.getLevel() - 1);
           }

           // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
           function zoomOut() {
               map.setLevel(map.getLevel() + 1);
           }
           
           // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
           //-> 일반세탁의 경우 예약하기가 나오게 컨트롤
           var infowindow = new kakao.maps.InfoWindow({zIndex:1});
   	
   
           // 키워드 검색
           function searchPlaces() { 
                 
               var keyword = document.getElementById('keyword').value;
               if (!keyword.replace(/^\s+|\s+$/g,'')) { 
                   alert('키워드를 입력해주세요!'); 
               return false;
               }
               
               bindinglandry(keyword)               
              
           }
   
           // 대분류 검색 
           function searchMajor(item) {             
            var item = item      
            ps.keywordSearch(item, placesSearchCB);       
           }
           
           // 인기순 검색 
           function searchPopul(item) { }           
           // 리뷰순 검색 
           function searchGrade(item) { }
           
        
   
           //데이터 바인딩
           function bindinglandry(keyaddr) {
              
              //0325-주옥 : 검색하려는 키워드 캐치 및 select을 하기위해 controller 접근
              var keyaddr = keyaddr;
                  $.ajax({
                      url:'/maplist.do'
                      , method : 'POST'
                      , data: { keyaddr : keyaddr }
                      , dataType: 'json'
                      , success: function(data){ //성공후 처리는 추후 진행.                         
                                if(data==null){
                                   console.log("data 가 조회되지 않았습니다.") 
                                   dbData = null
                                }
                                   dbData = data
                                 // 장소검색을 요청           
                                   keyaddr = keyaddr+" 크리닝"
                                   ps.keywordSearch(keyaddr, placesSearchCB); 
                               } 
                  })
               
           
         }
   
         // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
         function placesSearchCB(data, status, pagination) {
             if (status === kakao.maps.services.Status.OK) {           	   
                 displayPlaces(data);   
                 // 페이지 번호를 표출합니다
                 displayPagination(pagination);
 
             } else if (status === kakao.maps.services.Status.ZERO_RESULT) { alert('검색 결과가 존재하지 않습니다.');
                 return;
             } else if (status === kakao.maps.services.Status.ERROR) { alert('검색 결과 중 오류가 발생했습니다.');
                 return;
             }
         }
   
           // 검색 결과 목록과 마커를 표출
           function displayPlaces(places) {
         
               var listEl = document.getElementById('placesList'), 
               menuEl = document.getElementById('menu_wrap'),
               fragment = document.createDocumentFragment(), 
               bounds = new kakao.maps.LatLngBounds(), 
               listStr = '';
   
               // 검색 결과 목록에 추가된 항목들을 제거합니다
               removeAllChildNods(listEl);
   
               // 지도에 표시되고 있는 마커를 제거합니다
               removeMarker();
   
       
               for ( var i=0; i<places.length; i++ ) {
              	 $('#countp').html("장 소"+places.length);
               
                   // 마커를 생성하고 지도에 표시합니다
                   var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                       marker = addMarker(placePosition, i), 
                       itemEl = getListItem(i, places); // 검색 결과 항목 Element를 생성합니다 
                       itemEl = itemel
                       
                       // LatLngBounds 객체에 좌표를 추가합니다
                       bounds.extend(placePosition);

                       // 마커와 검색결과 항목에 mouseover 했을때
                       // 해당 장소에 인포윈도우에 장소명을 표시합니다
                       // mouseout 했을 때는 인포윈도우를 닫습니다
                       (function(marker, title) {
                           kakao.maps.event.addListener(marker, 'mouseover', function() {
                               displayInfowindow(marker, title);
                           });

                           kakao.maps.event.addListener(marker, 'mouseout', function() {
                               infowindow.close();
                           });
                           
                           itemEl.onmouseover =  function () {
                               displayInfowindow(marker, title);
                           };

                           itemEl.onmouseout =  function () {
                               infowindow.close();
                           };
                       })(marker, places[i].place_name);
                       fragment.appendChild(itemEl);
                   
               }
   
               // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
               listEl.appendChild(fragment);
   
               // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
               map.setBounds(bounds);
           }
   
           
   
       
           //지도 위에 마커를 표시
           function addMarker(position, idx, title) {
               var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                   imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                   imgOptions =  {
                       spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                       spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                       offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                   },
                   markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                       marker = new kakao.maps.Marker({
                       position: position, // 마커의 위치
                       image: markerImage 
                   });
   
               marker.setMap(map); // 지도 위에 마커를 표출합니다
               markers.push(marker);  // 배열에 생성된 마커를 추가합니다
   
               return marker;
           }
   
           // 지도 위에 표시되고 있는 마커를 모두 제거합니다
           function removeMarker() {
               for ( var i = 0; i < markers.length; i++ ) {
                   markers[i].setMap(null);
               }   
               markers = [];
           }
   
        	// 리스트 출력
           function getListItem(i,place) {   
        		
	        	if(i==0) var i = 0      		
	        	if(place[i].place_name == dbData[i].bname){	
	        		//조회된 값이 있다면 데이터 체인지					
						console.log(place[i].place_name+" : "+ dbData[i].bname)
						console.log(place[i].road_address_name+" : "+ dbData[i].address)
						console.log(place[i].phone+" : "+dbData[i].phone)
						console.log(dbData[i].content)
						console.log(dbData[i].grade)
						console.log(dbData[i].bno)
						
						place[i].place_name = dbData[i].bname
						place[i].road_address_name = dbData[i].address
						place[i].phone  = dbData[i].phone
						var contentNum = dbData[i].content
						var grade = dbData[i].grade
						var bno = dbData[i].bno
						wirteHtml(i,place[i],contentNum,grade, bno)  
	        	}else {
	        		var contentNum = 0
					var grade = 0
					var bno = 0
	        		wirteHtml(i,place[i],contentNum,grade, bno)  
	        	}
           }
        
           function wirteHtml(i,place ,contentNum, grade, bno) { 
        	   
        	   var el = document.createElement('table'),               
	               itemStr =  '<tbody class="place_body">'
	                     +'<tr>'
                              + '<td class="place_name" value='+bno+'>'+ (i+1)+'&nbsp;&nbsp;' + place.place_name + '</td>'
                              + '<td rowspan="3"  style="float: right;"></td>'
                         + '</tr>'
                            if(grade != 0){
                                  itemStr += '<tr><td>'+grade+'.0 &nbsp;'
                                             for(var i=0; i<grade; i++) {
                                                 itemStr += '<i class="rating__icon rating__icon--star fa fa-star"></i>'
                                             }
                                             for(var i=0; i<(5-grade); i++) {
                                                 itemStr += '<i class="rating__icon rating__icon--star2 fa fa-star" sytle="color:lightgray"></i>'
                                             }
                                   itemStr +='&nbsp;&nbsp;'+contentNum+'건 | 리뷰</td></tr>'
                             }
                         itemStr += '<tr><td class="place_address">' + place.road_address_name + '</td></tr>'                                
                                  if(place.phone!=""){
                                     itemStr += '<tr><td class="place_phone">' +place.phone + '</td><tr>'
                                  }                      
                         +'</tbody>';
	               el.innerHTML = itemStr;
	               el.className = 'item';

	  	     	   itemel =  el;                  
				}
	
        	
        	
           function displayPagination(pagination) {
               var paginationEl = document.getElementById('pagination'),
                   fragment = document.createDocumentFragment(),
                   i; 
   
               $(paginationEl).show()
               // 기존에 추가된 페이지번호를 삭제합니다
               while (paginationEl.hasChildNodes()) {
                   paginationEl.removeChild (paginationEl.lastChild);
               }
   
               for (i=1; i<=pagination.last; i++) {
                   var el = document.createElement('a');
                   el.href = "#";
                   el.innerHTML = i;
   
                   if (i===pagination.current) {
                       el.className = 'on';
                   } else {
                       el.onclick = (function(i) {
                           return function() {
                               pagination.gotoPage(i);
                           }
                       })(i);
                   }
   
                   fragment.appendChild(el);
               }
               paginationEl.appendChild(fragment);
           }
   
           // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
           // 인포윈도우에 장소명을 표시합니다
           function displayInfowindow(marker, title) {
               var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
   
               infowindow.setContent(content);
               infowindow.open(map, marker);
           }
   
           // 검색결과 목록의 자식 Element를 제거하는 함수입니다
           function removeAllChildNods(el) {   
               while (el.hasChildNodes()) {
                   el.removeChild (el.lastChild);
               }
           }
          
           
        
       </script>
   </html>