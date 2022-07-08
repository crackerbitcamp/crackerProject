<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<input type="hidden" id="pg" value="${requestScope.pg }">
	
	<h1>자유게시판</h1>

	
		<jsp:include page="../board/boardList.jsp"></jsp:include>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/index/js/boardList.js"></script>
	
</body>
</html>