<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="loginForm">

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
	
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#adminLoginBtn').click(function(){
	$.ajax({
		type: 'post',
		url:'/index/admin/adminLogin',
		data:{'adminId' :$('#adminId').val(),
			'adminPwd' :$('#adminPwd').val()},
		dataType:"text",
		success:function(data){
			alert(data);
			if(data =='ok'){
				location.href="/index/admin/adminMain";
			}else{
				alert('다시확인해주세요');
			}
		},error:function(e){
			console.log(e);
		}
	});//ajax
	
});

</script>
</body>
</html>