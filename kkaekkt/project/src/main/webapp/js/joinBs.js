$(document).ready(function () {

    var selectTarget = $('.selectbox select');

    selectTarget.change(function () {
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });
    var bizType = $('.bizType div');
    bizType.click(function () {
        $(this).addClass('selected');
        $(this).removeClass('unselected');
        if($(this).index()==0) {
            bizType.eq(1).removeClass("selected");
            bizType.eq(1).addClass("unselected");
            $(".laundry").removeClass('hide');
            $(".coinLaundry").addClass('hide');
            $(".bizType input")[0].value=1;
        } else {
            bizType.eq(0).removeClass("selected");
            bizType.eq(0).addClass("unselected");
            $(".laundry").addClass('hide');
            $(".coinLaundry").removeClass('hide');
            $(".bizType input")[0].value=2;
        }
    });
    var weekBtn = $('.week button');
    var weekLi = $('.weekBox ul');
    weekBtn.click(function () {
        var idx = $(this).index();
        event.preventDefault();
        $(this).toggleClass('selected');
        if ($(this).hasClass("selected")) {
            if(idx<7) {
                weekLi.append("<li style='order:" + (idx+1) + "'><button>" + 
                $(this).html() + 
                "요일</button><span>시간<span>"+
                "<select></select>~<select></select></li>");
            }else {
                weekLi.append("<li style='order:" + (idx+1) + "'><button>" + $(this).html() + "</button><span>시간<span><select></select>~<select></select></li>");
            }
            var opt = $(".weekBox li[style='order:" + (idx+1) + "'] select");
            for (var i = 0; i < 25; i++) {
                opt.append("<option>" + (i < 10 ? "0" + i : i) + ":00</option>");
                if (i != 24) {
                    opt.append("<option>" + (i < 10 ? "0" + i : i) + ":30</option>");
                }
            }
        } else {
            $(".weekBox ul li[style='order:" + (idx+1) + "']").remove();
        }
    });
    var chkbox=$(".laundry input[type='checkbox']");
    chkbox.change(function() {
        var idx=$(this).attr("value");
        if($(".laundry input.won").eq(idx).attr("disabled")=='disabled') {
            $(".laundry input.won").eq(idx).attr("disabled",false);
        } else {
            $(".laundry input.won").eq(idx).attr("disabled",true);
            $(".laundry input.won")[idx].value="";
        }
    });
    chkbox=$(".coinLaundry input[type='checkbox']");
    chkbox.change(function() {
        var idx=$(this).attr("value");
        if($(".coinLaundry input.won").eq(idx).attr("disabled")=='disabled') {
            $(".coinLaundry input.won").eq(idx).attr("disabled",false);
            if(idx<=2) {
                $(".coinLaundry select").eq(idx).attr("disabled",false);
            }
        } else {
            $(".coinLaundry input.won").eq(idx).attr("disabled",true);
            $(".coinLaundry input.won")[idx].value="";
            if(idx<=2) {
                $(".coinLaundry select").eq(idx).attr("disabled",true);
                $(".coinLaundry select")[idx].value=0;
                $(".coinLaundry label[for='select']").eq(idx).text("");
            }
        }
    });
});
function clicked() {
    // 운영시간 데이터 처리
    var weekLi=$('.weekBox ul li');
    var list = new Array();
    for(var i=0;i<weekLi.size();i++) {
        var open=weekLi[i].children[1].value;
        var close=weekLi[i].children[2].value;
        list.push({schno:JSON.parse(weekLi.eq(i).css("order")),time:open+'~'+close});
    }
    $(".weekBox input[name='schedule']")[0].value=JSON.stringify(list);
    // 연락처 데이터 처리
    var number=$(".phone input[type='text']");
    for(var i=0;i<3;i++) {

        $(".phone input[type='hidden']")[0].value+=number[i].value;
        if(i!=2) {
            $(".phone input[type='hidden']")[0].value+='-';
        }
    }
    if($('.bizType input')[0].value==1) { //일반 세탁소를 작성했다면,
        // 품목 리스트 데이터 처리
        var chkBox=$(".laundry input[type='checkbox']");
        var priceBox=$(".laundry input[class='won']");
        list=[];//위에서 쓰인 리스트 초기화
        for(var i=0; i<chkBox.size();i++) {
            if(chkBox[i].checked) {
                list.push({lno:JSON.parse(chkBox[i].value)+1,price:JSON.parse(priceBox[i].value)});
            }
        }
        $("input[name='laundry']")[0].value=JSON.stringify(list);
    } else { //코인 세탁소를 작성했다면,
        // 설비 리스트 데이터 처리
        var chkBox=$(".coinLaundry .equipment input[type='checkbox']");
        var priceBox=$(".coinLaundry .equipment input[class='won']");
        var selectBox=$(".coinLaundry select");
        list=[];//리스트 초기화
        for(var i=0; i<chkBox.size();i++) {
            if(chkBox[i].checked) {
                list.push({eno:i+1,cnt:JSON.parse(selectBox[i].value),price:JSON.parse(priceBox[i].value)});
            }
        }
        list.push({eno:4,cnt:JSON.parse($('.coinLaundry .dry select')[0].value),price:JSON.parse($(".coinLaundry .dry input[class='won']")[0].value)});//건조기 추가
        $("input[name='equipment']")[0].value=JSON.stringify(list);
        // 부가서비스 데이터 처리
        chkBox=$(".coinLaundry .etc input[type='checkbox']");
        priceBox=$(".coinLaundry .etc input[class='won']");
        list=[];//리스트 초기화
        for(var i=0; i<chkBox.size(); i++) {
            if(chkBox[i].checked) {
                list.push({etcno:i+1,price:JSON.parse(priceBox[i].value)});
            }
        }
        $("input[name='etc']")[0].value=JSON.stringify(list);
    }
    $("form").submit();
	
}
