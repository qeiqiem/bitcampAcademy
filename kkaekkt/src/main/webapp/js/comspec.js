$(document).ready(function() {
	$(".side_sub").hide();
	ajax(pageObj);
	initEvent();
    initSide();
});
function initEvent(){
		//수정하기 버튼 클릭시 인풋,셀렉박스 비활성화 활성화
        var clickupdate = $("#updateSpec");
        var changebtn = $("#btn_change");
        var resetbtn = $("#resetSpec");
        // 디폴트
            changebtn.hide();
            $("input").attr("disabled", true);
            $("select").attr("disabled", true);
            $("#week button").attr("disabled", true);
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
                $("input").attr("disabled", true);
                $("select").attr("disabled", true);
                $("#week button").attr("disabled", true);
            });
        // 영업시간 
            var weekBtn = $('#week button');
            var weekLi = $('#weekBox ul');
            weekBtn.click(function() {
                        var idx = $(this).index();
                        event.preventDefault();
                        $(this).toggleClass('selected');
                        if ($(this).hasClass("selected")) {
                            $(this).css("background-color","rgb(157, 187, 252)");
                            $(this).css("border","rgb(157, 187, 252)");
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
                            $(this).css("border","1px solid rgb(221, 221, 221)");
                            $(this).css("background-color","transparent");
                            $("#weekBox ul li[style='order:"+ (idx + 1) + "']").remove();
                        }

                    });
            function clicked() {
                var weekLi = $('#weekBox ul li');
                var list = new Array();
                for (var i = 0; i < weekLi.size(); i++) {
                    var open = weekLi[i].children[1].value;
                    var close = weekLi[i].children[2].value;
                    list.push({
                        schno : JSON.parse(weekLi.eq(i)
                                .css("order")),
                        time : open + '~' + close
                    });
                }
                $("#weekBox input[name='schedule']")[0].value = JSON
                        .stringify(list)

            }
}

function ajax(pageObj) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/selectComspec.do",
        data:pageObj,
        success: function(data) {
    		console.log('ajax 함수 완료');
            var comspec=JSON.parse(data);

           	// 품목이 일치하면 값 넣어주기
			$.each(comspec.laundryList, function(index, item) {
				console.log(index + ":" + item.laundry +","+ item.price);
				for(var i = 0; i<8; i++){
					if(item.laundry == ($("td").eq(i).text().trim())) {
						$("td").eq(i).next().children("input").val(item.price); 
					}
				} 
			}); // 품목리스트 반복문
        }
    }); // ajax
}



function initSide() {
    $('.side button').eq(3).addClass("side_select");
}

