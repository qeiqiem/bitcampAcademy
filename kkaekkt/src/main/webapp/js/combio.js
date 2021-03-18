var fomatpw = 0;
	var fomatbirth = 0;			// 1일때가 유효성 통과했을때
    var content = document.getElementsByClassName("userinfo");

        window.onload = function () {
			initSide();
            var inputli = content[0].getElementsByTagName('input');
            for (var i = 5; i < inputli.length; i++) {
                inputli[i].disabled = true;
            }
        
            var buttonli = content[0].getElementsByTagName('button');
            for (var i = 6; i < buttonli.length; i++) {
                buttonli[i].disabled = true;
            }

            //수정하기 버튼 클릭시 수정완료 돌아가기 버튼 활성화, 인풋창 활성화
            document.getElementById("btn_updatebio").onclick = function btnChange(event) {
                //수정완료 돌아가기 버튼 활성화, 인풋창 활성화
                document.getElementById("btn_updatebio").style.display = "none";
                document.getElementById("btn_coinbioClick").style.display = "block";
                //인풋창 활성화
                for (var i = 5; i < inputli.length; i++) {
                    if (i != 5 || i != 6) {
                        event.preventDefault();
                        inputli[i].disabled = false;
                        console.log("12")
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
                document.getElementById("btn_updatebio").style.display = "block";
                document.getElementById("btn_coinbioClick").style.display = "none";
                document.getElementsByTagName('input').disabled = true;

                //인풋창 비활성화, 입력값 초기화(기존에 받아온 값으로 바껴야하느데..)
                for (var i = 5; i < inputli.length; i++) {
                    inputli[i].disabled = true;

                }
                //본인인증, 우편번호 찾기 버튼 비활성화
                for (var i = 3; i < buttonli.length; i++) {
                    if (i != 4) {
                        buttonli[i].disabled = true;
                    }
                }
            }

        }
function initSide() {
		$('.side button').eq(4).addClass("side_select");
}