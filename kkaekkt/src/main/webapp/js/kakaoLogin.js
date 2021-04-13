window.Kakao.init("cf4c8601d1ea3d2f4f0704d04de2729c");

function kakaoLogin() {
  window.Kakao.Auth.login({
    scope: "profile, account_email, birthday",
    success: function (authObj) {
      console.log(authObj);
      window.Kakao.API.request({
        url: "/v2/user/me",
        success: (res) => {
          const kakao = res.kakao_account;

          var userEmail = kakao.email;
          console.log(userEmail);

          var userdata = {
            email: userEmail,
          };

          $.ajax({
            url: "/loginSNS.do",
            type: "POST",
            data: {
              email: userEmail,
            },
            success: function (data) {
              if (data == "fail") {
                alert("회원정보 없음");
              } else {
                location.href = "/index.do";
              }
            },
          }); // ajax
        },
      });
    },
  });
}

function kakaoLogout() {
  //Kakao.init();
  //Kakao.isInitialized();

  if (!Kakao.Auth.getAccessToken()) {
    console.log("Not logged in.");
    return;
  }
  Kakao.Auth.logout(function () {
    console.log(Kakao.Auth.getAccessToken());
  });
}
