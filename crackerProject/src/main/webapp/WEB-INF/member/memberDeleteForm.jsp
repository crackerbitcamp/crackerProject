<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
<style type="text/css">
#memberNavForm {
	height: auto;
    width: 900px;
    background-color: #fff;
    margin: 0 auto;
    margin-top: 76px;
    margin-bottom: 76px;
}
.memberDeleteNav{
    margin: auto;
    width: 90%;
    padding-top: 48px;
}
.memberDeleteNav h2{
	margin-bottom: 30px;
}
.memberDeleteNav h4{
	margin-bottom: 12px;
}

.memberDeleteNav p.spanbox{
    border: 1px solid red;
    padding: 13px;

}
.navCheck {
	margin-top: 40px;
}

.deleteForm-input{
    width: 570px;
    height: 120px;
    display: flex;
    font-size: 15px;
    color: #4e4e4e;
    align-items: center;
    justify-content: center;
    padding: 18px;
}
.memberDeleteNav p{
    margin-top: 8px;
}
</style>
</head>
<body>
<form id="memberDeleteForm">
	<div id="memberNavForm">
		<div class="memberDeleteNav">
			<h2>회원 탈퇴</h2>
			<h4>회원님 CRACKER 서비스를 이용하시는데 불편함이 있으셨나요?</h4>
			<p class="spanbox">
			1) 크래커는 사용자와 함께 만들어가는 커뮤니티 사이트입니다. <br/>
			2) 이용 불편 및 각종 문의 사항은 고객센터로 문의 주시면 성심 성의껏 답변 드리겠습니다. <br/>
			-  1:1 온라인 문의 / 전화 문의: 1111-1111 (365일 오전 9시~오후6시) 
			</p>
			<p><strong>&#8251;탈퇴하시면 이용 중인 크래커 이용에 제한이생기며,
			모든데이터는 복구가 불가능합니다.</strong></p>
			
			<div class="navCheck">
				<input type="hidden" name="memberemail" id="memberemail" value="${memEmail }">
				<input type="checkbox" name="chk_info" id="chk_info" value="탈퇴안내" style="margin-right: 10px;">안내 사항을 확인하였으며, 이에 동의합니다.
				<div class="deleteForm-input" style=" margin: auto">
					<button class="btn_next" id = "memberDelete_btn" name="memberDelete_btn" type="button" style="margin-left: 0px;">회원 탈퇴하기</button>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src = "../js/member.js"></script>
</body>
</html>