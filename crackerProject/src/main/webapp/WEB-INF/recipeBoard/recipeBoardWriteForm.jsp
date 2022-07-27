<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 작성</title>
<link href="/index/css/boardCSS/boardWrite.css" rel="stylesheet"
	type="text/css" />
<style>
.ck-editor__editable {
	height: 1000px;
}
</style>
</head>
<body>
	
	<div id="boardWriteFormOutDiv" >
		<form class="boardWriteForm" name="recipeBoardWriteForm" id="recipeBoardWriteForm">
			
			<input type="hidden" name="seq" value="${boardDTO.seq}">
			<input type="hidden" name="pg" value="${pg}">

			<div class="inputTextForm">
				<select id="category">
					<option value="한식">한식</option>
					<option value="양식">양식</option>
					<option value="일식">일식</option>
					<option value="분식">분식</option>
					<option value="중식">중식</option>
					<option value="아시아">아시아</option>
				</select> 
				<input type="text" name="subject" id="subject" placeholder="제목 입력">
			</div>
			<div id="subjectDiv"></div>


			<div class="inputTextForm">
				<textarea id="content" name="content" style='border: 0;'></textarea>
			
				<button class="writeBottomBtnClass" type="button"  id="recipeBoardWriteBtn">글쓰기</button>
				
				<button	class="writeBottomBtnClass" type="button"  id="recipeBoardWriteReturnBtn">다시작성</button>
				
				<button	class="writeBottomBtnClass" type="button" 
					onclick="location.href='/index/recipeBoard/recipeBoardList'">목록</button>
			</div>

			<div id="contentDiv"></div>



		</form>
	</div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/index/js/recipeBoard/recipeBoard.js"></script>
	<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		// 글쓰기 editor 및 사진 업로드 기능
		CKEDITOR.replace('content', {
			filebrowserUploadUrl : 'imageUpload'
		});
	</script>

</body>
</html>