<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript" src = "../js/member.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="main-container">
	<header>
		<img src="../image/logo.jpg" alt="로고">
	</header>
	<section>
<form id = "memberWriteForm">
	<input type = "text" id = "checkId">
	<input type = "text" id = "checkPwd">
	<input type = "text" id = "checkPhone">
	<input type = "email" id = "checkemail">
		<div class="write-input-wrap">	
			<div class = "write-input-name-wrap">아이디</div>  
			<input type = "text" placeholder="ID입력" id = "memberWriteId" name = "memberㅑd">
			<div id="memberWriteIdDiv" class="memberWrite"></div>
			<div class = "write-input-name-wrap">비밀번호</div>  
			<input type = "password" placeholder="비밀번호 입력" id = "memberWritePwd" name = "memberpwd">
			<div id="memberWritePwdDiv" class="memberWrite"></div>
			
					<div class = "write-input-name-wrap">비밀번호 재확인</div>  
			<input type = "password" placeholder="비밀번호 입력" id = "memberWriterePwd">
			<div class = "write-input-name-wrap">이름</div>  
			<input type = "text" placeholder="이름 입력 " id = "memberWriteName" name = "membername">
			<div id ="memberWriteNameDiv" class="memberWrite"></div>
			<div class = "write-input-name-wrap">이메일</div>  
			<input type = "email" placeholder="email입력" id = "memberWriteEmail1" name = "memberemail1">&nbsp;@&nbsp;
			<input type = "email" id="memberWriteEmail2" placeholder="직접 입력" name ="memberemail2">
			<select id = "emailselect">
				<option>-----------선택-----------</option>
				<option>naver.com</option>
				<option>google.com</option>
				<option>paran.com</option>
			</select>
			<div class="input-group-addon">
				<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
			</div>
			<input type =text class="write-input-name-wrap" id="mail-Check-Num" placeholder="인증번호 6자리를 입력해주세요!" disabled maxlength="6">
			<div id ="memberWriteEmailDiv" class="memberWrite"></div>
			<div class = "write-input-name-wrap">전화번호</div>  
			<select id = "phoneselect" name = "membertel1">
			<option>-----------선택-----------</option>
			<option>010</option>
			<option>019</option>
			<option>017</option>
			</select>
			&nbsp;-&nbsp;<input type = "tel" placeholder="번호 입력 " id = "memberWritephone1" name = "membertel2">
			&nbsp;-&nbsp;<input type = "tel" placeholder="번호 입력 " id = "memberWritephone2" name = "membertel3">
			<div id="memberWritephoneDiv" class="memberWrite"></div>
		</div>
	</form>
	</section>
	<footer>
		<div class="login-button-wrap">
			<button id = "memberWriteBtn"><strong>가입하기</strong></button>
		</div>
	</footer>
	</div>
</body>
</html>