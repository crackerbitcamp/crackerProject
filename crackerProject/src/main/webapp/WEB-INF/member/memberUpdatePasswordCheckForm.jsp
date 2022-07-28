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
		<form id = "memberUpdateFormPasswordCheckForm" style="display: block;">
			<div id = "memberUpdateFormDiv">
				<div><b class = "updateIdName">아이디</b><input type="text" value="${memberDTO.memberemail }" disabled class="write-input-name-wrap"></div>
				<div><b class = "updatePwdName">비밀번호</b><input type = "password" name = "memberpwd" class="write-input-name-wrap"></div>
				<div style=" margin-left: 	30px;"><button type="button" id = "pwdcheckBtn" class="btn_ct" style="margin-top: 20px; margin-right: 20px;">다음</button><button type = "button" class="btn_ct">취소</button></div>
			</div>
		</form>
</body>
</html>