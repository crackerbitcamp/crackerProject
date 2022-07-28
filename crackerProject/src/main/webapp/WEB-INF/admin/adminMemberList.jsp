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

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#adminMemberPagingDiv {
	text-align: center;
	margin-top: 30px;
}

#adminMemberListTable {
	border-bottom-style : hidden;
	border-top-color : black;
	border-bottom-color : black;
	
}
#adminMemberListTable input[name='check'] {
	margin-right : 50px;
}

#adminMemberListTable tr {
	display: block;
}

/* #adminMemberListTable th {
	border-top:none;
	font-size : 1.3em;
	
}

#adminMemberListTable td {
	font-size : 1.2em;
	border-top : none;
}
 */
#adminMemberListTable a {
	text-decoration-line: none;
	color : black;
}

#membername {
	margin-left : 20px;
}

</style>

</head>
<body>
<div style="margin-top:100px;">
	
	
	<h2 align="center">회원 리스트</h2>
	<input type="hidden" id="pg" value="${pg }" /> <!-- requestScope 생략 가능 -->

		<form id="adminMemberSearchForm">
			<input type="hidden" name="pg" id="searchPg" value="1">
	
			<div style="text-align: center;">
				<select name="searchOption">
					<option value="membername">이름</option>
					<option value="memberemail">아이디</option>
				</select>
		
					<input type="search" name="memberSearchkeyword" id="memberSearchkeyword" value="${memberSearchkeyword }">
					<input type="button" id = "adminMemberSearchBtn" value="검색">
				
		
			</div>
	
		</form>
		
		<form id="adminMemberListForm" method="get" action="/index/admin/adminMemberDelete">
			
				<table id="adminMemberListTable" border="1" cellspacing="0" cellpadding="7" frame="hsides" rules="rows" >
					<tr>
						<th width="300"><!-- <input type="checkbox" id="allSelect" value="전체선택" style="float:left;"/> --> 아이디</th>
						<th width="100">이름</th>
						<th width="300">닉네임</th>
						<th width="200">핸드폰번호</th>
						
					</tr>
				<!-- 동적 처리 -->			
				</table>
		
		
<!-- 			<input type="button" id="adminMemberdDeleteBtn" value="선택삭제" />  -->
			<div id="adminMemberPagingDiv" ></div>

		</form>
	
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/admin/adminMemberList.js"></script>
<script type="text/javascript">


function adminPaging(pg2) {
	
	location.href="/index/admin/adminMemberList?pg="+pg2;

	var keyword = $('#keyword').val();
	
		if(keyword == ''){
		location.href = "/index/admin/adminMemberList?pg="+pg2;
		
		}else {
		
		$('#searchPg').val(pg2); 
		$('#adminMemberSearchBtn').trigger('click');
		
		$('#searchPg').val(1);
		}
}



</script>

</body>
</html>




