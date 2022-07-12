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


</style>

</head>
<body>
<div style="margin-top:100px;">
	
	
	<h2 align="center">회원 리스트</h2>

		<form id="adminMemberViewForm">
			
				<table id="adminMemberViewTable" border="1" cellspacing="0" cellpadding="7" frame="hsides" rules="rows" >
					<tr>
						<th width="200">@@@님의 게시글</th>
						<th width="200">@@@님의 댓글</th>
						<th width="200">@@@님의 좋아요</th>
						<th width="100">출석포인트</th>
					</tr>
				<!-- 동적 처리 -->			
				</table>
		
		
<!-- 			<input type="button" id="adminMemberdDeleteBtn" value="선택삭제" />  -->
			<div id="adminMemberPagingDiv" ></div>

		</form>
	
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/admin/adminMemberList.js"></script>


</body>
</html>




