<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/productCSS/productWriteForm.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
<div id="productWriteFormOutDiv">
<form id="productWriteForm" method="post">
	<div id="" class="inputTextForm">
		<span>상품명</span>
		<select name="productCategory">
			<option value="밀키트">밀키트</option>
			<option value="냉동음식">냉동음식</option>
			<option value="고기">고기</option>
			<option value="생선">생선</option>
			<option value="채소">채소</option>
		</select>
		<input type="text" name="productName" class="productInput"/>	
	</div>
	
	
	<div class="inputTextForm">
		<span>상품코드 :</span>
		
		<input type="text" name="productCode" class="productInput"/>	
	</div>
	
	<div class="inputTextForm">
		<span>메인사진 : </span><input type="file" name="mainPhoto" id="mainPhoto" class="productInput"/>	
	</div>
	<div class="inputTextForm_imgForm">
		<img id="showMainPhoto" src="#" alt="이미지 미리보기" style="width:100%; height: 100%;">
	</div>
	
	
	<div class="inputTextForm">
		<span>원산지 :</span><input type="text" name="productOrigin" class="productInput"/>	
	</div>
	<div class="inputTextForm">
		<span>중량 :</span><input type="text" name="productWeight" class="productInput"/>	
	</div>
	<div class="inputTextForm">
		<span>유통기한 :</span><input type="text" name="productLife" class="productInput"/>	
	</div>
	
	
	<button type="button" id="productWriteFormBtn" class="writeBottomBtnClass">작성하기</button>
</form>
</div>
<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/product/productWrite.js"></script>
<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
		// 글쓰기 editor 및 사진 업로드 기능
		 
</script>
</body>
</html>