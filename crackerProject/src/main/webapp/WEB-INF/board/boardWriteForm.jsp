<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
  .ck-editor__editable { height: 700px;}
</style>
</head>
<body>

<h4>글쓰기</h4>
<div id="boaraWrite">
<form name="boardWriteForm" id="boardWriteForm">
<input type = "hidden" name="seq" value="${boardDTO.seq}">
<input type = "hidden" name="pg" value="${pg}">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td>
			카테고리
			</td>
			<td>
			<select id = "category" >
				<option value="freedomCategory">자유</option>
				<option value="recipeCategory">레시피</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">
			제목
			</td>
			<td><input type = "text" name="subject" id = "subject" placeholder="제목 입력">
			<div id="subjectDiv"></div></td>
		</tr>
		<tr>
			<td align="center">
			내용
			</td>
			<td>
			  <textarea id="content" name="content"></textarea>
			 
			  <div id="contentDiv"></div>
			</td>

		</tr>
		<tr>
			<td colspan="2" align ="center">
			<input type ="button" value="글쓰기" id="boardWriteBtn">
			<input type ="button" value="다시작성" id="boardWriteReturnBtn">
			<input type= "button" value = "목록" onclick ="location.href='/index/board/boardList'">
			</td>
		</tr>
	</table>
</form>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/board_jQuery.js"></script>
<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
CKEDITOR.replace('content',
	{filebrowserUploadUrl:'imageUpload'
});
</script>

</body>
</html>