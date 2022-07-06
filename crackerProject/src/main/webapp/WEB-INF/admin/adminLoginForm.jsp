<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<div>아이디 :</div>
			<div>
				<input type="text" id="adminId">
			</div>
		</div>

		<div>
			<div>비밀번호 :</div>
			<div>
				<input type="password" id="adminPwd">
			</div>
		</div>
		
		<div>
			
			<div>
				<input type="button" id="adminLoginBtn" value="로그인">
			</div>
		</div>
		

	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#adminLoginBtn').click(function(){
	$.ajax({
		type: 'post',
		url:'/index/admin/adminLogin',
		data: $('#loginForm').serialize(),
	});//ajax
	
});

</script>
</body>
</html>