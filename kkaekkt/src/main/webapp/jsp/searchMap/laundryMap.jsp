<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지도생성하기</title>
    <!-- 헤더에서 필요한 참조 -->
<<<<<<< HEAD
	<link rel="stylesheet" href="/css/all.css">
	<link rel="stylesheet" href="/css/head0.css">
=======
   <link rel="stylesheet" href="/css/all.css">
   <link rel="stylesheet" href="/css/head0.css">
>>>>>>> 6e8bbdfc1a32c1bfe44044addaa14796fa5a6462
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>

    <!-- map 에서 필요한 참조 -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="/js/map.js"></script>
<<<<<<< HEAD
	<link rel="stylesheet" href="/css/laundryMap.css">
=======
   <link rel="stylesheet" href="/css/laundryMap.css">
>>>>>>> 6e8bbdfc1a32c1bfe44044addaa14796fa5a6462

</head>
<body>
    <jsp:include page="/jsp/header0.jsp"></jsp:include>
        <div class="body_container">
            <div class="map_container">
                <div class="slide">
                    <div>
                        <button class="foldBtn">&lt;</button>
                        <button class="foldBtn expand">&gt;</button>
                    </div>
                        <div class="slide_top">
                            <img class="map_logo" src="/img/logo.svg" alt="">
                            <p class="here"><input type="radio">내 주변 찾기</p>
                            <div class="slide_search">
                                <form onsubmit="searchPlaces(); return false;">
<<<<<<< HEAD
                                    <input 	class="input_search" 	type="text" id="keyword" placeholder="동네를 입력해주세요.">
=======
                                    <input    class="input_search"    type="text" id="keyword" placeholder="동네를 입력해주세요.">
>>>>>>> 6e8bbdfc1a32c1bfe44044addaa14796fa5a6462
                                    <button class="input_searchBtn" type="submit">
                                        <i class="fas fa-search fa-lg "></i>                
                                    </button>
                                </form>
                            </div>
                            <div class="tag">
                                <ul class="slide_ul">
<<<<<<< HEAD
                                    <li id="all_search" 	value="1">전체</li>
                                    <li id="basic_search" 	value="2" >일반세탁소</li>
                                    <li id="coin_search" 	value="3">코인세탁소</li>
=======
                                    <li id="all_search"    value="1">전체</li>
                                    <li id="basic_search"    value="2" >일반세탁소</li>
                                    <li id="coin_search"    value="3">코인세탁소</li>
>>>>>>> 6e8bbdfc1a32c1bfe44044addaa14796fa5a6462
                                    <li id="my_search">my</li>
                                </ul>
                                <hr>
                                <p class="slide_mini"></p>
                            </div>
                        </div>
                        <div class="footer list">
                            <ul>
                                <li><b>장소</b>0</li>
                                <li style="margin-left: 45%;font-size: 12px;">거리순</li>
                                <li style="font-size: 12px;">인기순</li>
                                <li style="font-size: 12px;">평점순</li>
                            </ul>
                            <div class="slide_card">
                                <table id="placesList"></table>
                                <div id="pagination"></div>
                            </div>
                        </div>
                        <div class="footer single">
                            <div class="card">
                                <img id="single_img" src="/img/kkaekkt.png" style="width: 100%; height: 200px; background-color: aliceblue;">
                                <p id="s_title"></p>
                                <div id="s_star">0.0
                                    <p class="rating-group">
                                        <label aria-label="1 star" class="rating__label" for="rating-1">
                                        <i class="rating__icon rating__icon--star fa fa-star"></i></label> 
                                        <input class="rating__input" name="rating" id="rating-1" value="1" type="radio" checked> 
                            
                                        <label aria-label="2 stars"   class="rating__label" for="rating-2">
                                        <i   class="rating__icon rating__icon--star fa fa-star"></i></label>             
                                        <input class="rating__input" name="rating" id="rating-2" value="2" type="radio">
                            
                                        <label aria-label="3 stars" class="rating__label" for="rating-3">
                                            <i class="rating__icon rating__icon--star fa fa-star"></i></label> 
                                        <input class="rating__input" name="rating" id="rating-3" value="3" type="radio">
                            
                                        <label aria-label="4 stars" class="rating__label" for="rating-4">
                                            <i class="rating__icon rating__icon--star fa fa-star"></i></label>            
                                        <input class="rating__input" name="rating" id="rating-4" value="4" type="radio" >
                                        
                                        <label aria-label="5 stars" class="rating__label" for="rating-5">
                                            <i class="rating__icon rating__icon--star fa fa-star"></i></label>                
                                        <input class="rating__input" name="rating" id="rating-5" value="5" type="radio">
                                        &nbsp; | 리뷰 1건</p>
                                </div>
                            </div>
                            <div class="cardinfo">
                                    <button class="btn" id="info">업체정보</button>
                                    <button class="btn" id="res">예약하기</button>
                                    <table id="single_table">
                                        <tr>
                                            <td><input class="tag_kkaekkt" value="kkarkkt 가맹점 입니다"></td>
                                        </tr>
                                        <tr>
                                            <td ><i class="fas fa-phone" id="s_phone" style="color:rgb(90, 90, 90); "></i></td>
                                        </tr>
                                        <tr>
                                            <td><i class="fas fa-map-marker-alt" id="s_address" style="color:rgb(90, 90, 90);"></i></td>
                                        </tr>
                                        <tr>
                                            <td><i class="far fa-clock"></i> 00:00~12:00</td>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </table>
                            </div>
                            <div class="moreinfo">
                                <p class="more_title">취급 품목</p>
                                <hr>
                                <table id="single_option">
                                    <tr>
                                        <td class="option_title">1~3일 소요</td>
                                        <td class="option_title">금액(개당)</td>
                                    </tr>
                                    <tr>
                                        <td>일반의류</td>
                                        <td>3,000</td>
                                    </tr>
                                    <tr>
                                        <td>와이셔츠</td>
                                        <td>4,000</td>
                                    </tr>
                                    <tr>
                                        <td>이 불</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>운동화</td>
                                        <td>25,000</td>
                                    </tr>
                                </table>
                                <table id="single_option">
                                    <tr>
                                        <td class="option_title">4~7일 소요</td>
                                        <td class="option_title">금액(개당)</td>
                                    </tr>
                                    <tr>
                                        <td>가죽모피</td>
                                        <td>4,000</td>
                                    </tr>
                                    <tr>
                                        <td>명품가방</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>아웃도어</td>
                                        <td>25,000</td>
                                    </tr>
                                </table>
                                <input class="resbtn" value="예약하러 가기 >">
                            </div> 
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
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),level: 2
            };  

        var map = new kakao.maps.Map(mapContainer, mapOption);
        var ps = new kakao.maps.services.Places();  

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        //-> 일반세탁의 경우 예약하기가 나오게 컨트롤
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});


        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() { 
<<<<<<< HEAD
			
=======
         
>>>>>>> 6e8bbdfc1a32c1bfe44044addaa14796fa5a6462
            var keyword = document.getElementById('keyword').value;
            if (!keyword.replace(/^\s+|\s+$/g, '')) { 
                alert('키워드를 입력해주세요!'); 
            return false;
            }

            // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch( keyword, placesSearchCB); 
        }


<<<<<<< HEAD
  		// 대분류 검색 
        function searchMajor(item) { 
			
			var item = item		
			ps.keywordSearch( item, placesSearchCB); 
	
=======
        // 대분류 검색 
        function searchMajor(item) { 
         
         var item = item      
         ps.keywordSearch( item, placesSearchCB); 
   
>>>>>>> 6e8bbdfc1a32c1bfe44044addaa14796fa5a6462
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

                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, i), 
                    itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
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

        // 리스트 출력
        function getListItem(index, places) {
            var el = document.createElement('table'),
							
            itemStr =  		'<tbody class="place_body">'
							+'<tr>'
                            + '<td class="place_name">'+ (index+1)+'&nbsp;&nbsp;' + places.place_name + '</td>'
                            + '<td rowspan="3"  style="float: right;">'
                            + '<i class="far fa-heart" id="heart" style="color:lightgray; font-size:30px"></i></td>'
                        + '</tr>'
                        + '<tr>'
                            + '<td>5.0'
                                for(var i=0; i<5; i++) {
                                    itemStr += '<i class="rating__icon rating__icon--star fa fa-star"></i>'
                                }
                            itemStr +='&nbsp;&nbsp;1건 | 리뷰</td>'
                        + '</tr>'
                        + '<tr><td class="place_address">' + places.road_address_name + '</td>'
                        + '</tr>'
                        + '<tr><td>영업중 | 매일 00:00~24:00</td>'
                        + '</tr>'
                        + '<tr><td class="place_phone">' +places.phone + '</td>'
                        + '</tr>'
						+'</tbody>';
            el.innerHTML = itemStr;
            el.className = 'item';

            return el;

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

        function displayPagination(pagination) {
            var paginationEl = document.getElementById('pagination'),
                fragment = document.createDocumentFragment(),
                i; 

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