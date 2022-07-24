<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">레시피 작성 리스트</h2>
	<form id="recipeSearchForm">
		<%-- 		<input type="hidden" id="pg" value="${pg}"> <!-- requestScope 생략 가능 --> --%>
		<input type="hidden" name="pg" id="searchPg" value="1">

		<div style="text-align: center;">
			<select name="searchOption">
				<option value="subject">제목</option>
				<option value="content">내용</option>
			</select> <input type="search" name="recipeSearchkeyword"
				id="recipeSearchkeyword" value="${keyword }"> <input
				type="button" id="adminrecipeSearchBtn" value="검색">


		</div>

	</form>

	<form id="adminRecipeListForm" method="get"
		action="/index/admin/adminRecipeDelete">

		<table id="adminRecipeListTable" border="1" cellspacing="0"
			cellpadding="7" frame="hsides" rules="rows">
			<tr>
				<th width="200"><input type="checkbox" id="allSelect"
					value="전체선택" style="float: left;" />글번호</th>
				<th width="100">아이디</th>
				<th width="400">레시피 제목</th>
				<th width="100">작성일</th>
			</tr>
			<!-- 동적 처리 -->
		</table>



		<div id="adminRecipePagingDiv"></div>

	</form>

	</div>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/admin/adminRecipeList.js"></script>
	<script type="text/javascript">
		function adminPaging(pg2) {
			/* 
			 location.href="/index/admin/adminRecipeList?pg="+pg2; */

			var keyword = $('#recipeSearchkeyword').val();

			if (keyword == '') {
				location.href = "/index/admin/adminRecipeList?pg=" + pg2;

			} else {

				$('#searchPg').val(pg2);
				$('#recipeBoardSearchBtn').trigger('click');
				$('#searchPg').val(1);
			}
		}
	</script>

</body>
</html>