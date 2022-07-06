<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color: black; text-decoration: none;}
.subjectA:hover {color: green; text-decoration: underline;}
.subjectA:active {color: #d81e5b; text-decoration: none;}

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
.subjectA {
	width: 320px;
	display:inline-block;
	white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>

</head>
<body>
	<input type="hidden" id="pg" value="${requestScope.pg }">
	<table id="board4ListTable"  cellspacing="2" cellpadding="6" >
	<tr>
		<td><a><h4>카테고리제목4</h4></a></td>
	</tr>
	
	<!-- 동적처리 -->
	
	</table>
	
</body>
</html>