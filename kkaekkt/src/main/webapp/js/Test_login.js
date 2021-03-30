

$(document).ready(function () {
	$("#btn_login").on('click', function() {
		loginChk();
	})
});
	
function loginChk() {
    $.ajax({
        url: "/loginchk.do",
        type: "POST",
        data: {
        	id:$("#id").val(),
        	pw:$("#password").val()
        },
        success: function(data){
        var user = JSON.parse(data);
          console.log(user);
          
          if(data.state != 0){
          	alert("환영!");
          	
          } 
        },
        error: function(){
            alert("err");
        }
  	});
}