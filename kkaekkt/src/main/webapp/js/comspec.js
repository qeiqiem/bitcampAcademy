$(document).ready(function() {
	$(".side_sub").hide();
	initEvent();
	ajax(pageObj);
    initSide();
    
		
});
function initEvent(){
    // 수정하기 버튼 클릭시 인풋,셀렉박스 비활성화 활성화
    var clickupdate = $("#updateSpec");
    var changebtn = $("#btn_change");
    var resetbtn = $("#resetSpec");
    // 디폴트
        changebtn.hide();
        $("input").attr("disabled", true);
        $("#week button").attr("disabled", true);
        $("select").attr("disabled", true);
    // 수정하기 버튼 클릭시 
        clickupdate.click(function(){
            clickupdate.hide();
            changebtn.show();
            $("input").attr("disabled", false);
            $("select").attr("disabled", false);
            $("#week button").attr("disabled", false);
        });
    // 돌아가기 버튼 클릭시
        resetbtn.click(function(){
            clickupdate.show();
            changebtn.hide();

			// 영업시간 변동사항 삭제후 다시 ajax실행
			$("#week button").removeClass('selected');
			 $("#weekBox ul li").remove();
			ajax(pageObj);

            $("input").attr("disabled", true);
            $("select").attr("disabled", true);
            $("#week button").attr("disabled", true);

        });
	// 수정완료 버튼 클릭시
		$("#submitSpec").click(function(){
			
		// 품목 리스트 데이터 처리
        var chkBox=$(".laundry input[type='checkbox']");
        var priceBox=$(".laundry input[id='won']");
       
        for(var i=0; i<chkBox.size();i++) {
			var list = new Array();
            if(chkBox[i].checked) {
			console.log(chkBox[i].value);
                list.push({lno:JSON.parse(chkBox[i].value),price:JSON.parse(priceBox[i].value)});
            }
        }
        $("input[name='laundry']")[0].value=JSON.stringify(list);

		// 운영시간 데이터 처리
    	// var weekLi=$('#weekBox ul li');
   		//  list=[];//위에서 쓰인 리스트 초기화
    	// for(var i=0;i<weekLi.size();i++) {
        // 	var open=weekLi[i].children[1].value;
        // 	var close=weekLi[i].children[2].value;
        // 	list.push({schno:JSON.parse(weekLi.eq(i).css("order")),time:open+'~'+close});
    	// }
    	// $("#weekBox input[name='schedule']")[0].value=JSON.stringify(list);
		$("form").submit();
		});
		
    // 영업시간 
        var weekBtn = $('#week button');
        var weekLi = $('#weekBox ul');
        weekBtn.click(function() {
                    var idx = $(this).index();
                    event.preventDefault();
                    $(this).toggleClass('selected');
                    if ($(this).hasClass("selected")) {
                        if (idx < 7) {
                            weekLi.append("<li style='order:"
                                            + (idx + 1)
                                            + "'><span>"
                                            + $(this).html()
                                            + "요일</span>시간 <select></select> ~ <select></select></li>").trigger("create");
                        } else {
                            weekLi.append("<li style='order:"
                                            + (idx + 1)
                                            + "'><span>"
                                            + $(this).html()
                                            + "</span>시간 <select></select> ~ <select></select></li>").trigger("create");
                        }
                        var opt = $("#weekBox li[style='order:"
                                + (idx + 1) + "'] select");
                        for (var i = 0; i < 25; i++) {
                            opt.append("<option>"+ (i < 10 ? "0" + i : i)+ ":00</option>");
                            if (i != 24) {
                                opt.append("<option>"+ (i < 10 ? "0"+ i : i)+ ":30</option>");
                            }
                        }
                    } else {
                        $("#weekBox ul li[style='order:"+ (idx + 1) + "']").remove();
                    }

                });
        
};

function ajax(pageObj) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/selectComspec.do",
        data:pageObj,
        success: function(data) {
    		console.log('ajax 함수 완료');
            var comspec=JSON.parse(data);
			console.log(comspec.scheduleList);
           	// 품목이 일치하면 값 넣어주기
			$.each(comspec.laundryList, function(index, item) {
				console.log(index + ":" + item.laundry +","+ item.price);
				for(var i = 0; i<16; i++){
						console.log($("td").eq(i).text().trim());
					if(item.laundry == ($("td").eq(i).text().trim())) {
						$("td").eq(i).next().children("input").val(item.price); 
						$("td").eq(i).children().children("input:checkbox").prop("checked", true);
					}
				} 
			}); // 품목리스트 반복문

           
			// // 운영시간 값 넣어주기
			$.each(comspec.scheduleList, function(index, item) {
			var weekBtn = $('#week button');
        	var weekLi = $('#weekBox ul');
				console.log(index + ":" + item.schno +","+ item.time);
				var start = (item.time).split("~")[0];
				var end = (item.time).split("~")[1];
				var idx = item.schno;
				console.log(start, end, idx, $('#'+idx).html());
                        event.preventDefault();
                        $('#'+idx).toggleClass('selected');
                        if ($('#'+idx).hasClass("selected")) {
                            if (idx < 7) {
                                weekLi.append("<li style='order:"
                                                + (idx)
                                                + "'><span>"
                                                + $('#'+idx).html()
                                                + "요일</span>시간 <select disabled><option>"+start+"</option></select> ~ <select disabled><option>"+end+"</option></select></li>").trigger("create");
                            } else {
                                weekLi.append("<li style='order:"
                                                + (idx)
                                                + "'><span>"
                                                + $('#'+idx).html()
                                                + "</span>시간 <select disabled><option>"+start+"</option></select> ~ <select disabled><option>"+end+"</option></select></li>").trigger("create");
                            }
                            var opt = $("#weekBox li[style='order:"
                                    + (idx) + "'] select");
                            for (var i = 0; i < 25; i++) {
                                opt.append("<option>"+ (i < 10 ? "0" + i : i)+ ":00</option>");
                                if (i != 24) {
                                    opt.append("<option>"+ (i < 10 ? "0"+ i : i)+ ":30</option>");
                                }
                            }
                        } else {
                            $("#weekBox ul li[style='order:"+ (idx) + "']").remove();
                        }
			
			}); // 운영시간 반복문
           
        }
    }); // ajax
}



function initSide() {
    $('.side button').eq(3).addClass("side_select");
}
// function submitSpec(){
// 		var list = new Array();
// 		// 품목 리스트 데이터 처리
//         var chkBox=$(".laundry input[type='checkbox']");
//         var priceBox=$(".laundry input[id='won']");
       
//         for(var i=0; i<chkBox.size();i++) {
//             if(chkBox[i].checked) {
// 			console.log(chkBox[1].checked);
//                 list.push({lno:JSON.parse(chkBox[i].value),price:JSON.parse(priceBox[i].value)});
//             }
//         }
//         $("input[name='laundry']")[0].value=JSON.stringify(list);
// 		// 운영시간 데이터 처리
//     	var weekLi=$('#weekBox ul li');
//    		 list=[];//위에서 쓰인 리스트 초기화
//     	for(var i=0;i<weekLi.size();i++) {
//         	var open=weekLi[i].children[1].value;
//         	var close=weekLi[i].children[2].value;
//         	list.push({schno:JSON.parse(weekLi.eq(i).css("order")),time:open+'~'+close});
//     	}
//     	$("#weekBox input[name='schedule']")[0].value=JSON.stringify(list);
// 	$("form").submit();
// }

