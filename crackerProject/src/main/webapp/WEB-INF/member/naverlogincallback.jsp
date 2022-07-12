<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/naver.js"></script>
</head>
<body>

</body>

<script type="text/javascript">
var email;
var name;
var mobile;

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			email = naverLogin.user.getEmail(); 
    		name = naverLogin.user.getName();
    		mobile = naverLogin.user.getMobile(); 
    		nickname = naverLogin.user.getNickName();
    		console.log("name = " + name);
    		console.log("email =" + email);
    		console.log("mobile=" + mobile);
    		sessionStorage.setItem("naverEmail",email);
    		sessionStorage.setItem("naverTel",mobile);
    		sessionStorage.setItem("naverName",name);
    		sessionStorage.setItem("navernickName",nickname);
			console.log(naverLogin.user); 
			
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
		$.ajax({
			type : 'post',
			url : '/index/member/naverdatacall',
			data : {'naverName' : sessionStorage.getItem("naverName"),
					'naverTel' : sessionStorage.getItem("naverTel"),
					'naverEmail' : sessionStorage.getItem("naverEmail"),
					'naverNickName' : sessionStorage.getItem("navernickName")},
			success:function(){
				opener.parent.location='/index'; 
				window.close();
			},error:function(e){
				console.log(e);
			}
			
		});
	});
});
</script>
</html>