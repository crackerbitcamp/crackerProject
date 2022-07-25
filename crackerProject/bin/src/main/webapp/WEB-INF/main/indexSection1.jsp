<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
		<div class="display_title">
			<h2 class="display_title_text">자유 게시판 & 질문 게시판</h2>
			<a class="display_title_list" href="#">게시글 더보기</a>
		</div>
		
		<jsp:include page="../board/boardListIndex.jsp"></jsp:include>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/index/js/boardList.js"></script>
	
</body>
</html>