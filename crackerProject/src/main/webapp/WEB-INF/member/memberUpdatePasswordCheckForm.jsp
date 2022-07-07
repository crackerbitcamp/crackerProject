<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src = "/index/js/member.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/index/css/member.css">
<head>
<body>
		<form id = "memberUpdateFormPasswordCheckForm">
			<div id = "memberUpdateFormDiv">
				<b>아이디</b>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${memberDTO.memberid }" disabled class="write-input-name-wrap"><br>
				<b>비밀번호</b>&nbsp;<input type = "password" name = "memberpwd" class="write-input-name-wrap"><br>
				<button type="button" id = "pwdcheckBtn" class="btn_ct" style="margin-top: 20px; margin-right: 20px;">다음</button><button type = "button" class="btn_ct">취소</button>
			</div>
		</form>
</body>
</html>