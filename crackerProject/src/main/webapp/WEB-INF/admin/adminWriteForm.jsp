<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="/index/css/boardCSS/boardWrite.css" rel="stylesheet"
	type="text/css" />
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
<form name="adminWriteForm" id="adminWriteForm" >
	<div class="inputTextForm"> 
	
		<input class="inputTypeText" type="text" name="adminname" id="adminname" placeholder="이름 입력">
		<div id="adminnameDiv"></div>
	</div>


	<div class="inputTextForm"> 
		<input class="inputTypeText" type="text" name="adminid" id="adminid" placeholder="아이디 입력" >
		<input type="hidden" name="overlapid" value="">
		<div id="adminidDiv"></div>
	</div>
	<div class="inputTextForm"> 
		<input class="inputTypeText" type="password" name="adminpwd" id="adminpwd" placeholder="비밀번호 입력" >
		<div id="adminpwdDiv"></div>
	</div>
	<div class="inputTextForm"> 
		<input class="inputTypeText" type="password" name="adminrepwd" id="adminrepwd" placeholder="비밀번호 확인">
		<div id="adminrepwdDiv"></div>
	</div>



	<div class="inputTextForm"> 
			<input type="text" name="adminmail1" id="adminmail1" placeholder="이메일 입력" class="inputTypeTextS">
			
			@
			<input type="text" list="adminmail2" name="adminmail2"  placeholder="직접입력" class="inputTypeTextS">
			<datalist id="adminmail2">
				<option value="gmail.com">
				<option value="daum.net">
  	  			<option value="naver.com">
			</datalist> 
			<div id="adminmail1Div"></div> 
	</div>	
		
			<!-- <input type="button" value="회원가입" onclick="check()"> on : ~할때 -->
			<button type="button" class="writeBottomBtnClass" id="adminWriteBtn">회원가입</button>
			<button type="reset" class="writeBottomBtnClass">다시작성</button>
		


</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//회원가입
$('#adminWriteBtn').click(function(){
	
	//초기화
	$('#adminnameDiv').html(''); //
	$('#adminidDiv').html('');
	$('#adminmail1Div').html('');
	$('#adminpwdDiv').html('');
	$('#adminrepwdDiv').html('');
	
	if( $('#adminname').val() == ''){
		$('#adminnameDiv').html('이름을 입력하세요');
		$('#adminnameDiv').css('color','red');
		$('#adminnameDiv').css('font-size','8pt');
	}else if( $('#adminid').val() == '') {
		$('#adminidDiv').html('아이디를 입력하세요');
		$('#adminidDiv').css('color','red');
		$('#adminidDiv').css('font-size','8pt');	
	}else if ( $('#adminpwd').val() == '') {
		$('#adminpwdDiv').html('비밀번호를 입력하세요');
		$('#adminpwdDiv').css('color','red');
		$('#adminpwdDiv').css('font-size','8pt');	
	}else if ( $('#adminpwd').val() != $('#adminrepwd').val()) {
		$('#adminrepwdDiv').html('비밀번호가 맞지 않습니다');
		$('#adminrepwdDiv').css('color','red');
		$('#adminrepwdDiv').css('font-size','8pt');	
	}else if ( $('#adminmail1').val() == '') {
		$('#adminmail1Div').html('이메일을 입력하세요');
		$('#adminmail1Div').css('color','red');
		$('#adminmail1Div').css('font-size','8pt');	
	}
	else {
		
		$.ajax({
			type : 'post',
			url : '/index/admin/adminWrite',
			data : $('#adminWriteForm').serialize(),
			success : function() {
				alert('회원가입을 축하합니다');
				location.href = "/index/admin/adminMain";
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