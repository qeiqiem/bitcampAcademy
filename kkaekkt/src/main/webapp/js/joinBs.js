//정규식
const regId = /^[A-Za-z0-9]{4,10}$/;
const regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regName = /^[가-힝a-zA-Z]{2,}$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
const regBno = /^[0-9]{10}$/;
const regAccount=/^[0-9,\-]{3,6}\-[0-9,\-]{2,6}\-[0-9,\-]{3,6}(\-[0-9]{1,3})?$/;
const regPrice=/^[0-9]+&/;
//비교객체
const id = document.getElementById("id");
const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const email = document.getElementById("email");
const bno = document.getElementById("bno");
const account= document.getElementById("account");
//유효성 통과 여부 체크 객체 (false&true)
var formatArray = [false,false,false,false,false,false];
var alertArray = ['아이디','비밀번호','비밀번호 확인','이메일','사업자등록번호','계좌번호'];
var focusArray = [id,pw,repw,email,bno,account];
//요일 출력 배열
const week=['월요일','화요일','수요일','목요일','금요일','토요일','일요일','매일','평일','주말'];
$(document).ready(function () {
    console.log('레디완료');
    scheduleHtml();//운영시간 html 출력
    initEvent();
});
function scheduleHtml() {//운영시간 html 생성
    var opt;
    for(var idx=0;idx<10;idx++){
        $('.weekBox ul').append("<li class='hide' style='order:" + (idx+1) + "'><button>" +
        week[idx] + "</button><span>시간<span>"+
        "<select></select>~<select></select></li>");
        opt = $(".weekBox li[style='order:" + (idx+1) + "'] select");
        for (var i = 0; i < 25; i++) {
            opt.append("<option>" + (i < 10 ? "0" + i : i) + ":00</option>");
            if (i != 24) {
                opt.append("<option>" + (i < 10 ? "0" + i : i) + ":30</option>");
            }
        }
    }
}
function initEvent() {
    $('.selectbox select').change(function () {//셀렉트 옵션이 바뀔 때 라벨에 반영되는 이벤트
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });
    $('.bizType div').click(function () {//세탁소&코인세탁소 선택 반영 이벤트
        $(this).addClass('selected');
        $(this).removeClass('unselected');
        if($(this).index()==0) {
            $('.bizType div').eq(1).removeClass("selected");
            $('.bizType div').eq(1).addClass("unselected");
            $(".laundry").removeClass('hide');
            $(".coinLaundry").addClass('hide');
            $(".bizType input")[0].value=1;//비즈니스 타입값 반영
        } else {
            $('.bizType div').eq(0).removeClass("selected");
            $('.bizType div').eq(0).addClass("unselected");
            $(".laundry").addClass('hide');
            $(".coinLaundry").removeClass('hide');
            $(".bizType input")[0].value=2;//비즈니스 타입값 반영
        }
    });
    $('.week button').click(function () {//요일 보이기&숨기기
        var idx = $(this).index();
        $(this).toggleClass('selected');
        $(".weekBox ul li[style='order:" + (idx+1) + "']").toggleClass('hide');
    });
    $(".laundry input[type='checkbox']").change(function() {//취급품목-금액 활성화&비활성화
        var idx=$(this).attr("value");
        if($(".laundry input.won").eq(idx).attr("disabled")=='disabled') {
            $(".laundry input.won").eq(idx).attr("disabled",false);
        } else {
            $(".laundry input.won").eq(idx).attr("disabled",true);
            $(".laundry input.won")[idx].value="";
        }
    });
    $(".coinLaundry input[type='checkbox']").change(function() {//사양정보-금액 활성화&비활성화
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
    $('#emailChkBtn').click(function() {
       if(regEmail.test(email.value)){//이메일이 양식에 맞을 경우
        emailAjax(email.value);
       }else {
        alert('이메일이 양식에 맞지 않습니다.');
        email.focus();
       }
    });
    $('#idChkBtn').click(function() {
        if(regId.test(id.value)){
            idAjax(id.value);
        }else {
            alert('ID가 양식에 맞지 않습니다.')
            id.focus();
        }
    });
    $('#id').keyup(function() {//만약 중복검사를 통과했는데 키 입력을 했을 경우
        if(formatArray[0]==true){//통과된 상태 취소
            formatArray[0]=false;
        }
    });
}
function idAjax(data) {
    console.log('ajax진입');
    $.post({
        url:'/idchk.do',
        data:{id:data},
        success:function(data) {
            console.log('ajax완료');
            var data=JSON.parse(data);
            if(data.state==0){
                alert('사용가능한 아이디입니다.');
                formatArray[0]=true;
            }else {
                alert('중복된 아이디입니다.');
            }
        },error:function(){
            alert('에러발생');
        }
    })
}
function emailAjax(email) {//이메일인증검사
    $.get({
        url:'/mailCheck.do',
        data:{email:email},
        success:function(num) {
            console.log(num);//인증번호 체크 확인
            //모달창 띄워서 이퀄 true 나오면 패스하고 진행하는 걸로..!
        }
    });
}
function chkId() {//ID 유효성 체크
    if(regId.test(id.value)){//ID유효성 체크
        $('#idchk').addClass('hide');
    }else {
        $('#idchk').removeClass('hide');
        formatArray[0]=false;
    }
}
function chkPw() {
    if(regPw.test(pw.value)){//PW유효성 체크
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
        formatArray[2]=true;
        if($('#pwchk').hasClass('hide')){//위의 비밀번호가 정상입력상태라면,
            formatArray[1]=true;
        }
    }else {
        $('#pwRechk').removeClass('hide');
        formatArray[2]=false;
    }
}
function chkEmail() {
    if(regEmail.test(email.value)) {
        $('#emailchk').addClass('hide');
        formatArray[3]=true;
    }else {
        $('#emailchk').removeClass('hide');
        formatArray[3]=false;
    }
}
function chkBno() {
    if(regBno.test(bno.value)){
        $('#bnochk').addClass('hide');
        formatArray[4]=true;
    }else {
        $('#bnochk').removeClass('hide');
        formatArray[4]=false;
    }
}
function chkAccount() {
    if(regAccount.test(account.value)) {
        $('#accountchk').addClass('hide');
        formatArray[5]=true;
    }else {
        $('#accountchk').removeClass('hide');
        formatArray[5]=false;
    }
}
function formatChk() {//유효성검사가 걸린 차례대로 input값 체크
        for(var i=0; i<formatArray.length;i++) {
            if(!formatArray[i]){//false가 반환된다면
                if(i==0){
                    alert('ID 중복검사를 진행해주십시오.')
                    return false;
                }else {
                    alert(alertArray[i]+'의 입력을 확인해주십시오.');
                    focusArray[i].focus();
                    return false;
                }
            }
        }
        return true;//유효성검사를 전부 통과했을 경우
}
function nullchk() {
    if(formatChk()){//유효성검사 true 반환시 null체크 진입
        for(var i=0;i<3;i++){//휴대폰번호 null체크
            if($('.phone')[i].value==''){
                alert('휴대폰번호는 필수입력사항입니다.');
                $('.phone')[i].focus();
                return false;
            }
        }
        if($('#bname').value==''){//업체명 null체크
            alert('업체명은 필수입력사항입니다.');
            $('#bname').focus();
            return false;
        }
        if($('#postcode').value==null){//주소 null체크
            alert('주소는 필수입력사항입니다.');
            return false;
        }
        return true;//유효성과 null체크 전부 통과할 경우 true반환
    }else {//유효성 통과못했을 경우 false반환
        return false;
    }
}
function clicked() {
    if(nullchk()) {
        // 운영시간 데이터 처리
        var weekLi=$('.weekBox ul li');
        var time=$('.weekBox select');
        var list = new Array();
        for(var i=0;i<weekLi.size();i++) {
            var open=time[i*2].value;
            var close=time[i*2+1].value;
            list.push({
                schno:JSON.parse(weekLi.eq(i).css("order")),
                time:open+'~'+close
            });
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
                if(chkBox[i].checked) {//체크가 되어 있다면
                    if(!regPrice.test(priceBox[i].value)){//유효성에 맞지 않다면
                        alert('금액엔 숫자만 입력해주세요.');
                        priceBox[i].focus();
                        return;
                    }
                }
                list.push({
                    lno:JSON.parse(chkBox[i].value)+1,
                    price:(chkBox[i].checked==false?0:JSON.parse(priceBox[i].value))//체크가 안되어있다면 0, 되어있다면 숫자로 변환하여 저장
                });
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
                    if(!regPrice.test(priceBox[i].value)){//유효성에 맞지 않다면
                        alert('금액엔 숫자만 입력해주세요.');
                        priceBox[i].focus();
                        return;
                    }
                }
                list.push({//코인세탁 사양정보 입력
                    eno:i+1,
                    cnt:JSON.parse(selectBox[i].value.substr(0,1)),
                    price:(chkBox[i].checked==false?0:JSON.parse(priceBox[i].value))//체크가 안되어있다면 0, 되어있다면 숫자로 변환하여 저장
                });
            }
            list.push({
                eno:4,
                cnt:JSON.parse($('.coinLaundry .dry select')[0].value.substr(0,1)),
                price:($(".coinLaundry .dry input[class='won']")[0].value.length==0?0://건조기 가격이 입력되어있지 않다면 0을 입력
                JSON.parse($(".coinLaundry .dry input[class='won']")[0].value))//건조기 가격이 입력되어있다면 숫자로 변환하여 입력
            });//건조기 입력
                
            $("input[name='equipment']")[0].value=JSON.stringify(list);
            console.log($("input[name='equipment']")[0].value);
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
        console.log($('input[name="equipment"]')[0].value);
        $("form").submit();
    }
}