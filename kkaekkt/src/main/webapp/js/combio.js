let fomatpw = 0;
let formatemail = 1; 

const regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

const content = document.getElementsByClassName("content")[0];
const bizinfo = document.getElementsByClassName("bizMemberInfo")[0];
let inputli = content.getElementsByTagName('input');
let buttonli = bizinfo.getElementsByTagName('button');
let selectli = content.getElementsByTagName('select');

window.onload = function () {
    initSide();
    defaultDisable();
    inputInfo();

   

    //수정하기 버튼 클릭시 수정완료 돌아가기 버튼 활성화, 인풋창 활성화
    document.getElementById("updateBio").onclick = function btnChange() {

        //수정완료 돌아가기 버튼 활성화,
        document.getElementById("updateBio").style.display = "none";
        document.getElementById("btn_change").style.display = "block";

        //인풋창 활성화
        for (let i = 0; i < inputli.length; i++) {
            if (i != 4 || i != 5) {     // 새 비밀번호 제외
                inputli[i].disabled = false;
            }
        }
        for (let i = 0; i < selectli.length; i++) {
            selectli[i].disabled = false;
        }
        // 변경하기, 이메일인증확인 제외
        for (let i = 3; i < buttonli.length; i++) {
            if (i != 1 || i!=3) {
                buttonli[i].disabled = false;
            }
        }

    }

    //돌아가기버튼 클릭시 수정하기 버튼 활성화, 인풋창 비활성화
    document.getElementById("resetBio").onclick = function btnChange() {

        document.getElementById("btn_change").style.display = "none";
        document.getElementById("updateBio").style.display = "block";

        defaultDisable();
    }

    // 비밀번호 입력 후 수정버튼(비밀번호 변경시) 새 비밀번호, 확인버튼 활성화
    document.getElementById("btn_checkpwd").onclick = function checkPwd() {
        // 로그인된 회원의 비밀번호와 일치하는지 확인
        let curpwd = document.getElementById("curpwd");

        // 일치
        if (curpwd == pageObj["password"]) {
            formatpw = 1;
            document.getElementById("checkpwd").innerText = " 아래 새 비밀번호를 입력하세요";
            document.getElementById("checkpwd").style.color = "rgb(116, 116, 116)";

            // 기존 비밀번호창 비활성화
            curpwd.disabled = true;
            curpwd.value = null;

            // 새비밀번호 인풋창 활성화
            document.getElementById("pwd").disabled = false;
            document.getElementById("newpwd").disabled = false;

            // 변경하기 버튼 활성화
            document.getElementById("btn_checkpwd").disabled = true;
            document.getElementById("btn_updatepwd").disabled = false;

        } else {
            formatpw = 0;
            document.getElementById("checkpwd").innerText = " 입력하신 비밀번호가 일치하지 않습니다.";
        }
    }

    // 새 비밀번호 유효성 검사
    document.getElementById("pwd").addEventListener('keyup', () => {
 
        if (!regPw.test(this.value)) {
            if (this.value.length == 0) {
                document.getElementById("checkval").innerText = "";
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
        if ($('#pwd').val == $('#newpwd').val && formatnewpw == 1) {
            console.log($('#pwd').val + $('#newpwd') + formatnewpw);
            $.ajax({
                url: '/updatePspwd.do',
                type: 'post',
                data: {
                    bno: pageObj["bno"],
                    id: $("input[name='id']").val(),
                    password: $('#newpwd').val()
                }, success: function(data){
                    let password = JSON.parse(data);
                    console.log("ajax성공 "+password);
                    pageObj["password"] = password;
                    
                }, error: function() {
                   alert("비밀번호 변경에 예상치 못한 오류가 생겼습니다. 다시 시도해주세요");
                }   
    
            });
                $("#curpwd").disabled = false;
                
                // 비밀번호 변경관련 비활성화
                $("#pwd").val("");
                $("#pwd").attr("disabled", true);
                $("#pnewpwdwd").val("");
                $("#newpwd").attr("disabled", true);
                $("#btn_updatepwd").attr("disabled", true);

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
            document.getElementById("match").innerText = "입력형식을 확인하세요";
             $("#pwd").val("");
             $("#pnewpwdwd").val("");
        }
        if ($('#pwd').val != $('#newpwd').val) {
            document.getElementById("match").innerText
                = " 새 비밀번호와 일치하지 않습니다.";
            $("#pnewpwdwd").val("");
        }

    });
    // 이메일 입력형식 확인
    document.getElementById("email").addEventListener('keyup', () => {
        formatemail = 0;
       if (!regEmail.test(this.value)) {
            if (this.value.length == 0) {
                document.getElementById("checkemail").innerText
                    = "";
            } else {
                document.getElementById("checkemail").innerText
                    = " 양식과 맞지 않습니다.";
            }
        } else {
            document.getElementById("checkemail").innerText
                = "";

        }
    })
    $(".mail_check_button").click(function(){
        emailApi();
    });
    /* 인증번호 비교 */
    $("#mail_check").click(function(){
        checkemailNum();
    });



}   // end onload


function initSide() {
    $('.side button').eq(5).addClass("side_select");
}
// 디폴트
function defaultDisable(){
    for (let i = 0; i < inputli.length; i++) {
        inputli[i].disabled = true;
    }
    for (let i = 0; i < buttonli.length; i++) {
        buttonli[i].disabled = true;
    }
    for (let i = 0; i < selectli.length; i++) {
        selectli[i].disabled = true;
    }
    document.getElementById("btn_change").style.display = "none";
}
function inputInfo(){
    document.getElementsByName('bno')[0].value = pageObj["bno"];
    document.getElementsByName('mno')[0].value = pageObj["mno"];
    document.getElementById('name').innerText = pageObj["bname"];
    document.getElementById('bankNum').value = pageObj["bankNum"];
    document.getElementById('bankAccNum').value = pageObj["bankAccNum"];
    document.getElementsByName('id')[0].value = pageObj["id"];
    var phoneSplit = pageObj["phone"].split('-');
    document.getElementById('phone1').value = phoneSplit[0];
    document.getElementById('phone2').value = phoneSplit[1];
    document.getElementById('phone3').value = phoneSplit[2];
    document.getElementsByName('email')[0].value = pageObj["email"];
    var addressSplit = pageObj["address"].split(',');
    document.getElementById('postcode').value = addressSplit[0];
    document.getElementById('roadAddress').value = addressSplit[1];
    document.getElementById('detailAddress').value = addressSplit[2];
    document.getElementById('extraAddress').value = addressSplit[3];
}

function emailApi(){
     /* 인증번호 이메일 전송 */
     
        console.log("이메일인증 클릭");
        var email = $(".mail_input").val();        // 입력한 이메일
        
        $.ajax({
            
            type:"GET",
            url:"/mailCheck.do?email=" + email,
            success:function(data){
                //console.log("data : " + data);
                $(".mail_check_input").attr("disabled",false);
                doncument.getElementById("btn_checkemail").disabled = false;
                $(".mail_check_input").attr("id", "mail_check_input_box_true");
                alert(" 인증번호를 전송했습니다.");
                code = data;
            }
                    
        });
        
}    
    
function checkemailNum(){
    var inputCode = $(".mail_check_input").val();        // 입력코드    

    if(inputCode == code){
        formatemail = 1;
        $("#reqinput").text("");
        alert(" 인증번호가 일치합니다.");
        $(".mail_input").attr("disabled",true);
        $(".mail_check_input").attr("disabled",true);
        doncument.getElementById("btn_checkemail").disabled = true;
   
        $("#reqinput").attr("class", "correct");        
    } else {                                            // 일치하지 않을 경우
        formatemail = 0;
        $("#reqinput").text("");
        alert(" 인증번호를 다시 확인해주세요.");
        console.log(formatemail);

        $("#reqinput").attr("class", "incorrect");
    } 

}
    
// 핸드폰 번호 입력값 합치기 
// 주소 도로명+상세주소 값 합치기
// 전체 폼 보낼때 null값 + 유효성 검사 통과 확인 후 submit
function submitCombio() {
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
