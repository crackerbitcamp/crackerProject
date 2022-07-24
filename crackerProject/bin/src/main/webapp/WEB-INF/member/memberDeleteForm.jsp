<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form id="memberDeleteForm">
	<h4>크래커 탈퇴 전 확인하세요</h4>
	<p>탈퇴하시면 이용 중인 크래커 이용에 제한이생기며,
	모든데이터는 복구가 불가능합니다.
	</p>
	<input type="hidden" name="memberemail" id="memberemail" value="${memEmail }">
	<input type="checkbox" name="chk_info" id="chk_info" value="탈퇴안내">안내 사항을 확인하였으며, 이에 동의합니다.
	<div class="updateForm-input" style=" margin: auto">
		<button class="btn_next" id = "memberDelete_btn" name="memberDelete_btn" type="button">회원 탈퇴하기</button>
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src = "../js/member.js"></script>

</body>
</html>