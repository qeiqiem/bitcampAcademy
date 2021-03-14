var fomatpw = 0;
	var fomatbirth = 0;			// 1일때가 유효성 통과했을때
    var content = document.getElementsByClassName("content");
        window.onload = function () {
                  
            var inputli = content[0].getElementsByTagName('input');
            for (var i = 3; i < inputli.length; i++) {
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
                for (var i = 3; i < inputli.length; i++) {
                    if (i != 3 && i != 4) {
                        inputli[i].disabled = false;
                    }
                }
                //수정, 이메일인증, 우편번호 찾기 버튼 활성화

                for (var i = 3; i < buttonli.length; i++) {
                    if (i != 4) {
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
                if (pwd == 1) {
                	formatpw = 1;
                	document.getElementById("checkpwd").innerText
                    = "";
                	
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
                 
                    document.getElementById("checkpwd").innerText
                        = " 입력하신 비밀번호가 일치하지 않습니다.";
                }
            }
            // 새 비밀번호 유효성 검사
            inputli[3].addEventListener('keyup', () => {
                //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
                var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
                if (!regex.test(inputli[3].value)) {
                	if(inputli[3].value.length == 0){
                		document.getElementById("checkval").innerText
                        = "";
                	} else {
                    	document.getElementById("checkval").innerText
                        = " 비밀번호 양식과 맞지 않습니다. (특수문자,문자,숫자 포함 8~15자리이내)";
                	}
                } else {
                    document.getElementById("checkval").innerText
                        = "";
                	
                }
            })


            // 새 비밀번호, 새 비밀번호 확인 인풋 값 같은지 비교 => 비밀법호 업데이트 
            document.getElementById("btn_updatepwd").onclick = function undatePwd() {
                if (inputli[3].value == inputli[4].value ) {
                	 $.ajax({ 
                     	url :'updatePs.do', 
                     	type : 'post', 
                     	dataType : 'json', 
                     	data : { 
                     		mno : $('#mno').val(),
                     		password : $('#newpwd').val(), 
                     	}, 
                     	success: function(data){ 
                     		console.log("성공"); 
                     	} 
                     });
                	 
                    for (var i = 0; i < inputli.length; i++) {
                        if (i == 2) {
                            inputli[i].disabled = false;
                        }
                        if (i == 3 || i == 4) {
                            inputli[i].value = null;
                            inputli[i].disabled = true;
                        }
                    }
                    document.getElementById("match").innerText
                        = " 변경이 완료되었습니다, 이후 프로필 수정시, 변경된 비밀번호로 입력해주세요.";
                    document.getElementById("match").style.color = "rgba(254, 54, 54, 0.55)";

                } else {
                	
                    document.getElementById("match").innerText
                        = " 새 비밀번호와 일치하지 않습니다.";
                    inputli[4].value = null;
                }
            }

            // 생년월일 입력형식 확인
            inputli[10].addEventListener('keyup', () => {
                //20210101
                var regex = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
                if (!regex.test(inputli[10].value)) {
                	if(inputli[10].value.length == 0){
                		document.getElementById("checkbirth").innerText
                        = "";
                	} else {
                    	document.getElementById("checkbirth").innerText
                        = " 양식과 맞지 않습니다. ex) 20210101";
                	}
                } else {
                	formatbirth = 1;
                    document.getElementById("checkbirth").innerText
                        = "";
                	
                }
            })

            // 핸드폰 번호 입력값 합치기 
           document.getElementById("btn_mybiofin").onclick = function phoneNum() {
            	var phone = document.getElementById("phone1").value + "-" +
            				document.getElementById("phone2").value + "-" +
            				document.getElementById("phone3").value;
            
            	
            	document.getElementById("phone").value = phone;
               
            }
            
            
            
        }