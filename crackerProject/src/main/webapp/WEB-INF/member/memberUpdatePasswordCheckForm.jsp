<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<body>
	<form id = "memberUpdateFormPasswordCheckForm">
		아이디&emsp;&emsp;&emsp;<input type="text" value="${memberDTO.memberid }" disabled><br>
		비밀번호입력<input type = "password"><br>
		<button type="button">다음</button>
	</form>
</body>
</html>