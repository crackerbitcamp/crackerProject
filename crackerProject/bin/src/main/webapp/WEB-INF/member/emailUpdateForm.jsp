<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/member.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<input type = "text" id = "emailUpdatecheck" value="fail">
	<input type = "text" id = "emailUpdateSet">
	<form id = "emailUpdateForm">
		<fieldset id="find-Idfieldset-wrap">
			<legend>이메일 변경 </legend>
			<div class="idbox">
				<label class="label.txt" style="margin-right: 35px;">이름</label>
				<input type = "text" id = "updateEmail" class = "input_txt" name = "findName"><br>
				<label class ="label.txt" id="FindTel">아이디</label>
				<input type = "email" placeholder="ex)cracker123@naver.com" id = "updatememberemail" name = "memberemail" class="input_txt" style="margin-left: 17px; width: 220px;" >
				<button class="btn_ct" id="updateEmailBtn" type="button">인증번호받기</button><br>
				<input type = "text" id="updateEmailcheck" name="updateEmailcheck" disabled class="input_txt" style="width:217px; margin-left: 75px;" placeholder="인증번호 6자리 숫자 입력" maxlength="6">
				<span class="point successPhoneChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
				<div id = "updateEmailDiv"></div>
			</div>
				<button class="btn_next" id = "emailupdate_btn" name="emailupdate_btn" type="button">다음</button>
		</fieldset>
	</form>
</body>
</html>