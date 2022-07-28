<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<input type = "hidden" id = "findIdCheckDiv" value="fail">
	<form id = "findidForm">
	<fieldset id="find-Idfieldset-wrap">
			<legend>핸드폰 변경하기</legend>
			<div class="idbox">
				<label class="label.txt" style="margin-right: 35px;">이름</label>
				<input type = "text" id = "updateId" class = "input_txt" name = "updateId"><br>
				<label class ="label.txt" id="FindTelsub">휴대전화</label>
				<select style="width: 61px; height: 30px; border: none;">
					<option>+82</option>
				</select>
				<input type = "text" class = "input_txt" placeholder="휴대전화번호" id="findphone" name = "findtel" maxlength="11">
				<button class="btn_ct" id="findIdBtn" type="button">인증번호받기</button><br>
				<input type = "text" id="phonecheck" name="phonecheck" disabled class="input_txt" style="width:217px; margin-left: 75px;" placeholder="인증번호 6자리 숫자 입력" maxlength="6">
				<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
				<div id = "phonecheckDiv"></div>
			</div>
				<button class="btn_next" id = "updatetelBtn" name="updatetelBtn" type="button">다음</button>
		</fieldset>
	</form>
</body>
</html>