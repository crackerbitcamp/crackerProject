<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

<style type="text/css">

table {
	margin : auto;
	margin-top : 30px;

}

.historyback {
	margin-left : 200px;
}
.writeBottomBtnClass{
	margin :20px;
	border-radius: 10px;
	background-color: #f76900;
	border: #f76900 2px solid;
	color: white;
	font-size: 15px;
	width: 80px;
	height : 30px;
}
.inputTextForm{
	margin: 30px;
	width: 500px;
	height: auto;
	border: 0;
	border-radius: 20px;
	outline: none;
	padding-left: 10px;
	background-color: white;
	border: #f76900 2px solid;
	padding: 10px;
}
</style>

</head>
<body>
<div style="margin-top:100px;">

		<form id="adminMemberViewForm">
			<input type="hidden" id="pg" value="${pg }" />
			<input type="hidden" id="seq" value="${seq }" />
			<div class="historyback">
				<a href="#" onclick="history.back(); return false;" style="text-decoration : none;">목록</a>
			</div>
			
			<div>
				<div class="inputTextForm">
					<span>아이디 : </span><span id="memberEmail"> </span>
					<input type="hidden" id="memberemail"/>
				</div>
			</div>
			<div>
				<div class="inputTextForm">
					<span>닉네임 : </span><span id="memberNickName"> </span>
				</div>
			</div>
			<div>
				<div class="inputTextForm">
					<span>이름 : </span><span id="memberName"> </span>
				</div>
			</div>
			<div>
				<div class="inputTextForm">
					<span>번호 : </span><span id="memberPhone"> </span>
				</div>
			</div>
			<div>
				<div class="inputTextForm">
					<span>주소 : </span><span id="addres"> </span>
				</div>
			</div>
		
 			<!-- <input type="button" id="adminMemberdDeleteBtn" value="선택삭제" />  -->
			<div >
				<span  id="productContent"></span>
				

			
				<button type="button" id="memberDeleteBtn"class="writeBottomBtnClass">삭제</button>
				<button type="button" class="writeBottomBtnClass" onclick="location.href='/index/admin/adminMemberList'">목록</button>
	
			</div>

		</form>
	
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:'/index/admin/getMember',
		data:{'seq' : $('#seq').val()},
		type:'post',
		success:function(data){
			//alert(JSON.stringify(data));
			$('#memberEmail').html(data.memberemail);
			$('#memberNickName').html(data.membernickname);
			$('#memberName').html(data.membername);
			$('#memberPhone').html(data.membertel1+'-'+data.membertel2+'-'+data.membertel3);
			$('#addres').html(data.memberaddress1+' / '+data.memberaddress2)
			$('#memberemail').val(data.memberemail);
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
});
$('#memberDeleteBtn').click(function(){
	if(confirm('선택하신 항목 삭제하시겠습니까')){
		$.ajax({
			url : '/index/member/memberDelete',
			data : {'memberemail' : $('#memberemail').val()},
			type : 'post',
			success : function(){
				alert('삭제되었습니다.')
				location.href='/index/admin/adminMemberList'
			},
			error : function (){
				
			}
		});
	}
});
</script>
</body>
</html>




