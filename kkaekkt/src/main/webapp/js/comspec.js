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
    var chkBox=$(".laundry input[type='checkbox']");
    var priceBox=$(".laundry input[id='won']");
    // 디폴트
        changebtn.hide();
        $("input").attr("disabled", true);
        $("select").attr("disabled", true);
        $("#week button").attr("disabled", true);
    // 체크박스 선택시 해당 품목 가격인풋창 활성화
    chkBox.click(function(){
            for(var i=0; i<chkBox.size();i++) {
            if(chkBox[i].checked){
                priceBox.eq(i).attr("disabled", false);
            } else{
                priceBox.eq(i).attr("disabled", true);
                priceBox.eq(i).val("");
            }
        }
    });
    // 수정하기 버튼 클릭시 
        clickupdate.click(function(){
            clickupdate.hide();
            changebtn.show();
        // 체크된 품목의 인풋창만 활성화
            for(var i=0; i<chkBox.size();i++) {
                if(chkBox[i].checked) {
                    priceBox.eq(i).attr("disabled", false);
                }else {
                    priceBox.eq(i).attr("disabled", true);
                }
            }
            chkBox.attr("disabled", false);
            
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
		$("input").attr("disabled", false);
		var list = new Array();

        // 품목 리스트 데이터 처리
        for(var i=0; i<chkBox.size();i++) {
            if(chkBox[i].checked) {
                list.push({lno:JSON.parse(chkBox[i].value),price:JSON.parse(priceBox[i].value)});
            }
            else if(!chkBox[i].checked){
                list.push({lno:JSON.parse(chkBox[i].value),price:0});
            }
        }
        $("input[name='laundry']").val(JSON.stringify(list));

	    // 운영시간 데이터 처리
    	var weekLi=$('#weekBox ul li');
   		 list=[];//위에서 쓰인 리스트 초기화
    	for(var i=0;i<weekLi.size();i++) {
        	var open=weekLi[i].children[1].value;
        	var close=weekLi[i].children[2].value;
        if($('#week button').eq(i).hasClass("selected")){
        	list.push({schno:JSON.parse(weekLi.eq(i).css("order")),time:open+'~'+close});
        } else {
        	list.push({schno:JSON.parse(weekLi.eq(i).css("order")),time:"00:00~00:00"});
            }
    	}
        console.log(list);
    	$("#weekBox input[name='schedule']")[0].value=JSON.stringify(list);
		
        // form submit
        $("form").submit();
	});
		

    // 영업시간 
    var weekBtn = $('#week button');
    var weekLi = $('#weekBox ul');
    weekBtn.click(function () {
        var idx = $(this).index();
        console.log($(this));
        $(this).toggleClass('selected');
        if ($(this).hasClass("selected")) {
            $("#weekBox ul li").eq(idx).show();
        } else {
            $("#weekBox ul li").eq(idx).hide();
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
			$("input[name='bno']").val(comspec.bno);
           	// 품목이 일치하면 값 넣어주기
			$.each(comspec.laundryList, function(index, item) {
				console.log(item.lno + ":" + item.laundry +","+ item.price);
                var checkli = $("input[type='checkbox']");
				for(var i = 0; i<checkli.length; i++){
					if(item.lno == checkli[i].value) {
                        if(item.price !=0){
                            checkli.eq(i).prop("checked", true);
                           $(".laundry input[id='won']").eq(item.lno - 1).val(item.price);
                        }
					}
				} 
			}); // 품목리스트 반복문
            // 운영시간 값 넣어주기
            $.each(comspec.scheduleList, function (index, item) {
                var weekBtn = $('#week button');
                var weekLi = $('#weekBox ul');
                console.log(index + ":" + item.schno + "," + item.time);
                var start = (item.time).split("~")[0];
                var end = (item.time).split("~")[1];
                var idx = item.schno;
                if (start != "00:00" && end != "00:00") {
                    $('#' + idx).toggleClass('selected');
                }

                if (idx <= 7) {
                    weekLi.append("<li id=" + idx + " style='order:"
                        + (idx)
                        + "'><span>"
                        + $('#' + idx).html()
                        + "요일</span>시간 <select disabled><option>" + start + "</option></select> ~ <select disabled><option>" + end + "</option></select></li>").trigger("create");
                } else {
                    weekLi.append("<li id=" + idx + " style='order:"
                        + (idx)
                        + "'><span>"
                        + $('#' + idx).html()
                        + "</span>시간 <select disabled><option>" + start + "</option></select> ~ <select disabled><option>" + end + "</option></select></li>").trigger("create");
                }
                var opt = $("#weekBox li[style='order:"
                    + (idx) + "'] select");
                for (var i = 0; i < 25; i++) {
                    opt.append("<option>" + (i < 10 ? "0" + i : i) + ":00</option>");
                    if (i != 24) {
                        opt.append("<option>" + (i < 10 ? "0" + i : i) + ":30</option>");
                    }
                }
                if (!($('#' + idx).hasClass("selected"))) {
                    $("#weekBox ul li[style='order:" + (idx) + "']").hide();
                }

            }); // 운영시간 반복문
			
        }
    }); // ajax
}



function initSide() {
    $('.side button').eq(3).addClass("side_select");
}

