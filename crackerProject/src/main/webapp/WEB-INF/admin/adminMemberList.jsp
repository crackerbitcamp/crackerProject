<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

<style type="text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited x`{color: black; text-decoration: none;}
.subjectA:hover {color: green; text-decoration: underline;}
.subjectA:active {color: #d81e5b; text-decoration: none;}

table {
	margin-left : auto;
	margin-right : auto;
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
</style>

</head>
<body>
<h2 align="center">회원 리스트</h2>
<input type="hidden" id="pg" value="${pg }" /> <!-- requestScope 생략 가능 -->

<form id="boardSearchForm">
	<input type="hidden" name="pg" id="searchPg" value="1">
	
	<div style="text-align: center;">
		<select name="searchOption">
			<option value="membername">이름</option>
			<option value="memberid">아이디</option>
			<option value="memberemail">이메일</option>
			<option value="membertel">핸드폰번호</option>
			<option value="membernickname">닉네임</option>
			
		</select>
		<input type="search" name="keyword" id="keyword" value="${keyword }"> 
		<input type="button" id = "adminmemberSearchBtn" value="검색">
	</div>
</form>

<table id="adminMemberListTable" border="1" cellspacing="0" cellpadding="7" frame="hsides" rules="rows">
	<tr>
		<th width="100">이름</th>
		<th width="100">아이디</th>
		<th width="200">이메일</th>
		<th width="200">핸드폰번호</th>
		<th width="100">닉네임</th>
	</tr>
	
	<!-- 동적 처리 -->
	
	
	
</table>

</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


function boardPaging(pg2) {
	
	var keyword = $('#keyword').val();
	
	if(keyword == ''){
		location.href = "adminMemberList?pg=" + pg2;
		
	}else {
		 /* location.href = "boardSearch?pg=" + pg2 + "&searchOption=${searchOption}&keyword=${keyword}";
			한글 검색 안될 때 +encodeURIComponent("${keyword}");  */
		
		$('#searchPg').val(pg2); //serachPg가 1로 고정이 되어있기 때문에 검색이 끝나고 다시 검색 버튼을 누르면 searchPg를 1로 바꾸어야 한다
		$('#adminmemberSearchBtn').trigger('click'); // trigger => 강제 이벤트 발생
		
		$('#searchPg').val(1);
		//serachPg가 1로 고정이 되어있기 때문에 검색이 끝나고 다시 검색 버튼을 누르면 searchPg를 1로 바꾸어야 한다
		
	}
	
}

</script>

</body>
</html>




