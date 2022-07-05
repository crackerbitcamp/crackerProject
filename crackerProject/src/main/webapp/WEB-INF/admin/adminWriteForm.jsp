<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type = "text/css">

table {
	border-collapse: collapse; /* 이중 테두리 제거 */
}

 #writeForm div {
	font-size : 8pt;
	color : red;
	}		
	
</style>

</head>
<body>
<h2 align="center">회원가입</h2>
<form name="writeForm" id="writeForm" >
<table border="1" align="center">
<tr>
<td width="100" align="center">이름</td>
<td>
		<input type="text" name="adminname" id="adminname" placeholder="이름 입력">
		<div id="adminnameDiv"></div>
		</td>
</tr>

<tr>
<td align="center">아이디</td>
<td>
		<input type="text" name="adminid" id="adminid" placeholder="아이디 입력" >
		<input type="hidden" name="overlapid" value="">
		<div id="adminidDiv"></div>
		</td>
</tr>

		<tr>
			<td align="center">이메일</td>
			<td>
			<input type="text" name="adminmail1" id="adminmail1" placeholder="이메일 입력">
			@
			<input type="text" list="adminmail2" name="adminmail2" placeholder="직접입력">
			<datalist id="adminmail2">
				<option value="gmail.com">
				<option value="daum.net">
  	  			<option value="naver.com">
			</datalist></td>
		<tr>


	<tr>
		<td colspan="2" align="center">
			<!-- <input type="button" value="회원가입" onclick="check()"> on : ~할때 -->
			<input type="button" value="회원가입" id="adminWriteBtn">
			<input type="reset" value="다시작성">		
		</td>
		</tr>

</table>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//회원가입
$('#adminWriteBtn').click(function(){
	
	//초기화
	$('#adminnameDiv').html(''); //
	$('#adminidDiv').html('');
	$('#adminmail1').html('');
	
	if( $('#adminname').val() == ''){
		$('#adminnameDiv').html('이름을 입력하세요');
		$('#adminnameDiv').css('color','red');
		$('#adminnameDiv').css('font-size','8pt');
	}else if( $('#adminid').val() == '') {
		$('#adminidDiv').html('아이디를 입력하세요');
		$('#adminidDiv').css('color','red');
		$('#adminidDiv').css('font-size','8pt');	
	}else if ( $('#adminmail1').val() == '') {
		$('#adminemail1Div').html('이메일을 입력하세요');
		$('#adminemail1Div').css('color','red');
		$('#adminemail1Div').css('font-size','8pt');	
	}
	else {
		
		$.ajax({
			type : 'post',
			url : '/index/admin/write',
			data : $('#adminWriteForm').serialize(),
			success : function() {
				alert('회원가입ㅊㅋㅊㅋ');
				location.href = "/index/adminInclude/adminMain";
			},
			error : function(err) {
				console.log(err);
			} 
		});
	}
});
</script>

</body>
</html>