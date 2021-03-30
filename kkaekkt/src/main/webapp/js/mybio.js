
var code = "";                //이메일전송 인증번호 저장위한 코드

let formatbirth = 1;			// 1일때가 유효성 통과했을때
let formatemail = 0;

window.onload = function () {
    console.log("window onload");
    var formatpw = 0;
    var formatnewpw = 0;
    var content = document.getElementsByClassName("content");
    initSide();

    //값 넣어주기

    document.getElementsByName('mno')[0].value = pageObj["mno"];
    document.getElementsByName('id')[0].value = pageObj["id"];
    document.getElementsByName('mname')[0].value = pageObj["name"];
    console.log(pageObj["name"]);
    var phoneSplit = pageObj["phone"].split('-');
    document.getElementById('phone1').value = phoneSplit[0];
    document.getElementById('phone2').value = phoneSplit[1];
    document.getElementById('phone3').value = phoneSplit[2];
    document.getElementsByName('birth')[0].value = pageObj["birth"];
    document.getElementsByName('email')[0].value = pageObj["email"];
    var addressSplit = pageObj["address"].split(',');
    document.getElementById('postcode').value = addressSplit[0];
    document.getElementById('roadAddress').value = addressSplit[1];
    document.getElementById('detailAddress').value = addressSplit[2];
    document.getElementById('extraAddress').value = addressSplit[3];


    // input button 초기값 비활성화  	
    document.getElementsByClassName("side_sub")[0].style.display = "none"
    var inputli = content[0].getElementsByTagName('input');
    for (var i = 2; i < inputli.length; i++) {
        inputli[i].disabled = true;
    }

    var buttonli = content[0].getElementsByTagName('button');
    for (var i = 3; i < buttonli.length; i++) {
        buttonli[i].disabled = true;
    }


    //수정하기 버튼 클릭시 수정완료 돌아가기 버튼 활성화, 인풋창 활성화
    document.getElementById("btn_mybio").onclick = function btnChange() {
        //수정완료 돌아가기 버튼 활성화, 인풋창 활성화
        document.getElementById("btn_mybio").style.display = "none";
        document.getElementById("btn_mybioClick").style.display = "block";
        //인풋창 활성화
        for (var i = 2; i < inputli.length; i++) {
            if (i != 3 && i != 4 && i != 12 && i != 13 && i != 15) {
                inputli[i].disabled = false;
            }
        }
        //수정, 이메일인증, 우편번호 찾기 버튼 활성화

        for (var i = 3; i < buttonli.length; i++) {
            if (i != 4 || i !=5 || i!=6) {
                buttonli[i].disabled = false;
            }
        }

    }

    //돌아가기버튼 클릭시 수정하기 버튼 활성화, 인풋창 비활성화
    document.getElementById("btn_back").onclick = function btnChange() {
        document.getElementById("btn_mybio").style.display = "block";
        document.getElementById("btn_mybioClick").style.display = "none";
        document.getElementsByTagName('input').disabled = true;
        //인풋창 비활성화, 입력값 초기화(기존에 받아온 값으로 바껴야하느데..)
        for (var i = 3; i < inputli.length; i++) {
            inputli[i].disabled = true;

        }
        //본인인증, 우편번호 찾기 버튼 비활성화
        for (var i = 3; i < buttonli.length; i++) {
            if (i != 4) {
                buttonli[i].disabled = true;
            }
        }
    }

    // 비밀번호 입력 후 수정버튼(비밀번호 변경시) 새 비밀번호, 확인버튼 활성화
    document.getElementById("btn_checkpwd").onclick = function checkPwd() {
        // 로그인된 회원의 비밀번호와 일치하는지 확인
        var pwd = inputli[2].value
        // 일치
        if (pwd == pageObj["password"]) {
            formatpw = 1;
            document.getElementById("checkpwd").innerText
                = " 아래 새 비밀번호를 입력하세요";
            document.getElementById("checkpwd").style.color = "rgb(116, 116, 116)";

            // 기존 비밀번호창 비활성화
            inputli[2].disabled = true;
            inputli[2].value = null;

            // 새비밀번호 인풋창 활성화
            inputli[3].disabled = false;
            inputli[4].disabled = false;

            // 변경하기 버튼 활성화
            buttonli[3].disabled = true;
            buttonli[4].disabled = false;

        } else {
            formatpw = 0;
            document.getElementById("checkpwd").innerText
                = " 입력하신 비밀번호가 일치하지 않습니다.";
        }
    }
    // 새 비밀번호 유효성 검사
    inputli[3].addEventListener('keyup', () => {
        //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
        var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
        if (!regex.test(inputli[3].value)) {
            if (inputli[3].value.length == 0) {
                document.getElementById("checkval").innerText
                    = "";
            } else {
                document.getElementById("checkval").innerText
                    = " 비밀번호 양식과 맞지 않습니다. (특수문자,문자,숫자 포함 8~15자리이내)";
            }
            formatnewpw = 0;
        } else {
            formatnewpw = 1;
            document.getElementById("checkval").innerText
                = "";

        }
    })
    // 새 비밀번호, 새 비밀번호 확인 인풋 값 같은지 비교 => 비밀법호 업데이트 
    $("#btn_updatepwd").click(function undatePwd() {
        var content = document.getElementsByClassName("content");
        var inputli = content[0].getElementsByTagName('input');
        if ($('#pwd').val == $('#newpwd').val && formatnewpw == 1) {
            console.log($('#pwd').val + $('#newpwd') + formatnewpw);
            $.ajax({
                url: '/updatePspwd.do',
                type: 'post',
                data: {
                    mno: $('#mno').val(),
                    id: $("input[name='id']").val(),
                    password: $('#newpwd').val()
                }, success: function(data){
                    var password = JSON.parse(data);
                    console.log("ajax성공 "+password);
                    pageObj["password"] = password;
                    
                }, error: function() {
                   alert("error");
                }   
    
            });
            console.log(pageObj["password"]);

            for (var i = 0; i < inputli.length; i++) {
                if (i == 2) {
                    inputli[i].disabled = false;
                }
                if (i == 3 || i == 4) {
                    inputli[i].value = null;
                    inputli[i].disabled = true;
                }
            }
            document.getElementById("checkpwd").innerText
                = "";
            document.getElementById("match").innerText
                = " 변경이 완료되었습니다, 이후 프로필 수정시, 변경된 비밀번호로 입력해주세요.";
            document.getElementById("match").style.color = "rgba(254, 54, 54, 0.55)";

        }
        else {
            console.log($("if문탈출"+'#pwd').val + $('#newpwd') + formatnewpw);
        }
        if (formatnewpw == 0) {
            document.getElementById("match").innerText
                = "입력형식을 확인하세요";
            inputli[3].value = null;
            inputli[4].value = null;
        }
        if ($('#pwd').val != $('#newpwd').val) {
            document.getElementById("match").innerText
                = " 새 비밀번호와 일치하지 않습니다.";
            inputli[4].value = null;
        }

    });

    // 생년월일 입력형식 확인
    inputli[10].addEventListener('keyup', () => {
        //20210101
        var regex = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if (!regex.test(inputli[10].value)) {
            if (inputli[10].value.length == 0) {
                document.getElementById("checkbirth").innerText
                    = "";
            } else {
                document.getElementById("checkbirth").innerText
                    = " 양식과 맞지 않습니다. ex) 20210101";
            }
            formatbirth = 0;
        } else {
            formatbirth = 1;
            document.getElementById("checkbirth").innerText
                = "";

        }
    })

    // 이메일 입력형식 확인
    inputli[11].addEventListener('keyup', () => {
        //20210101
        var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        if (!regex.test(inputli[11].value)) {
            if (inputli[11].value.length == 0) {
                document.getElementById("checkemail").innerText
                    = "";
            } else {
                document.getElementById("checkemail").innerText
                    = " 양식과 맞지 않습니다.";
            }
        } else {
            inputli[4].disabled = false;
            document.getElementById("checkemail").innerText
                = "";

        }
    })


    /* 인증번호 이메일 전송 */
    $(".mail_check_button").click(function(){
        console.log("이메일인증 클릭");
        var email = $(".mail_input").val();        // 입력한 이메일
        
        $.ajax({
            
            type:"GET",
            url:"/mailCheck.do?email=" + email,
            success:function(data){
                //console.log("data : " + data);
                $(".mail_check_input").attr("disabled",false);
                buttonli[6].disabled = false;
                $(".mail_check_input").attr("id", "mail_check_input_box_true");
                alert(" 인증번호를 전송했습니다.");
                code = data;
            }
                    
        });
        
    });
    /* 인증번호 비교 */
$("#mail_check").click(function(){
    var inputCode = $(".mail_check_input").val();        // 입력코드    
 

    if(inputCode == code){
        formatemail = 1;
        $("#reqinput").text("");
        alert(" 인증번호가 일치합니다.");
        $(".mail_input").attr("disabled",true);
        $(".mail_check_input").attr("disabled",true);
        buttonli[6].disabled = true;
        console.log(formatemail);

        $("#reqinput").attr("class", "correct");        
    } else {                                            // 일치하지 않을 경우
        formatemail = 0;
        $("#reqinput").text("");
        alert(" 인증번호를 다시 확인해주세요.");
        console.log(formatemail);

        $("#reqinput").attr("class", "incorrect");
    } 

    
});


}


function initSide() {
    $('.side button').eq(2).addClass("side_select");
}

// 핸드폰 번호 입력값 합치기 
// 주소 도로명+상세주소 값 합치기
// 전체 폼 보낼때 null값 + 유효성 검사 통과 확인 후 submit
function submitMybio() {
    var phone = document.getElementById("phone1").value + "-" +
        document.getElementById("phone2").value + "-" +
        document.getElementById("phone3").value;


    document.getElementById("phone").value = phone;

    var address = document.getElementById("postcode").value + ","
        + document.getElementById("roadAddress").value + ","
        + document.getElementById("detailAddress").value + ","
        + document.getElementById("extraAddress").value;
    console.log(address);
    document.getElementById("address").value = address;

    if ($("#curpwd").val() == "" || pageObj["password"] != $("#curpwd").val()) {
        alert("비밀번호를 확인하세요.")
        $("#curpwd").focus();
        return false;
    }
    if ($("#phone1").val() == "" || $("#phone2").val() == "" || $("#phone3").val() == "") {
        alert("연락처를 확인하세요.");
        return false;
    }
    if ($("input[name='birth']").val() == "" || formatbirth != 1) {
        alert("생년월일를 확인하세요.");
        $("input[name='birth']").focus();
        return false;
    }
    if ($("input[name='email']").val() == "" || formatemail != 1) {
        alert("이메일을 확인하세요.");
        $("input[name='email']").focus();
        console.log(formatemail);
        return false;
    }



}
