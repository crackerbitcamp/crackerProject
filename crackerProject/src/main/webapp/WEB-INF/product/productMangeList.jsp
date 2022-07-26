<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/productCSS/productMengeList.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form>
<input id="pg" value="${pg}" type="hidden">
<button type="button" id="productWriteFormBtn">상품등록</button>
<button type="button" id="productBoardWriteFormBtn">상품 게시글 등록</button>
<button type="button" id="#">상품 게시판</button>
<div>
	<ul id="productMangeListUl">
		<li>크래커 샵 상품</li>
	</ul>
</div>
</form>


<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/product/productMangeList.js"></script>
<script type="text/javascript" src="../js/product/productBoard.js"></script>
</body>
</html>