//정규식
const regId = /^[A-Za-z0-9]{4,10}$/;
const regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regName = /^[가-힝a-zA-Z]{2,}$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
const regBno = /^[0-9]{10}$/;
const regAccount=/^[0-9,\-]{3,6}\-[0-9,\-]{2,6}\-[0-9,\-]{3,6}(\-[0-9]{1,3})?$/;
//비교객체
const id = document.getElementById("id");
const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const email = document.getElementById("email");
const bno = document.getElementById("bno");
const account= document.getElementById("account");
//유효성 통과 여부 체크 객체 (false&true)
var formatId=false;
var formatPw=false;
var formatEmail=false;
var formatBno=false;
var formatAccount=false;
var formatArray = [formatId,formatPw,formatEmail,formatBno,formatAccount];
var alertArray = ['아이디','패스워드','이메일','사업자등록번호','계좌번호'];
$(document).ready(function () {
    initEvent();
});
function initEvent() {
    $('.selectbox select').change(function () {
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });
    $('.bizType div').click(function () {
        $(this).addClass('selected');
        $(this).removeClass('unselected');
        if($(this).index()==0) {
            $('.bizType div').eq(1).removeClass("selected");
            $('.bizType div').eq(1).addClass("unselected");
            $(".laundry").removeClass('hide');
            $(".coinLaundry").addClass('hide');
            $(".bizType input")[0].value=1;
        } else {
            $('.bizType div').eq(0).removeClass("selected");
            $('.bizType div').eq(0).addClass("unselected");
            $(".laundry").addClass('hide');
            $(".coinLaundry").removeClass('hide');
            $(".bizType input")[0].value=2;
        }
    });
    $('.week button').click(function () {
        var idx = $(this).index();
        event.preventDefault();
        $(this).toggleClass('selected');
        if ($(this).hasClass("selected")) {
            if(idx<7) {
                $('.weekBox ul').append("<li style='order:" + (idx+1) + "'><button>" + 
                $(this).html() + 
                "요일</button><span>시간<span>"+
                "<select></select>~<select></select></li>");
            }else {
                $('.weekBox ul').append("<li style='order:" + (idx+1) + "'><button>" + $(this).html() + "</button><span>시간<span><select></select>~<select></select></li>");
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
    $(".laundry input[type='checkbox']").change(function() {
        var idx=$(this).attr("value");
        if($(".laundry input.won").eq(idx).attr("disabled")=='disabled') {
            $(".laundry input.won").eq(idx).attr("disabled",false);
        } else {
            $(".laundry input.won").eq(idx).attr("disabled",true);
            $(".laundry input.won")[idx].value="";
        }
    });
    $(".coinLaundry input[type='checkbox']").change(function() {
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
}
function chkId() {//ID 유효성 체크
    if(regId.test(id.value)){//ID유효성 체크
        $('#idchk').addClass('hide');
        formatArray[0]=true;
    }else {
        $('#idchk').removeClass('hide');
        formatArray[0]=false;
    }
}
function chkPw() {
    if(regPw.test(pw.value)){//ID유효성 체크
        $('#pwchk').addClass('hide');
        chkRePw();
    }else {
        $('#pwchk').removeClass('hide');
        formatArray[1]=false;
    }
}
function chkRePw() {
    if(pw.value==repw.value){
        $('#pwRechk').addClass('hide');
        if($('#pwchk').hasClass('hide')){//위의 비밀번호가 정상입력상태라면,
            formatArray[1]=true;
        }
    }else {
        $('#pwRechk').removeClass('hide');
        formatArray[1]=false;
    }
}
function chkEmail() {
    if(regEmail.test(email.value)) {
        $('#emailchk').addClass('hide');
        formatArray[2]=true;
    }else {
        $('#emailchk').removeClass('hide');
        formatArray[2]=false;
    }
}
function chkBno() {
    if(regBno.test(bno.value)){
        $('#bnochk').addClass('hide');
        formatArray[3]=true;
    }else {
        $('#bnochk').removeClass('hide');
        formatArray[3]=false;
    }
}
function chkAccount() {
    if(regAccount.test(account.value)) {
        $('#accountchk').addClass('hide');
        formatArray[4]=true;
    }else {
        $('#accountchk').removeClass('hide');
        formatArray[4]=false;
    }
}
function formatChk() {
    for(var i=0; i<formatArray.length;i++) {
        if(!formatArray[i]){//false가 반환된다면
            alert(alertArray[i]+'의 입력을 확인해주십시오.')
            return false;
        }
    }
    return true;
}
function clicked() {
    if(formatChk()) {    
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
}
