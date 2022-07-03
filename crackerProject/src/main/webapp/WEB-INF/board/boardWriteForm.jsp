<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
  .ck-editor__editable { height: 400px; }
</style>
</head>
<body>

<h2>글쓰기</h2>
<form name="boardWriteForm" id="boardWriteForm">
<input type = "hidden" name="seq" value="${boardDTO.seq}">
<input type = "hidden" name="pg" value="${pg}">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">
			제목
			</td>
			<td><input type = "text" name="subject" id = "subject" placeholder="제목 입력">
			<div id="subjectDiv"></div></td>
		</tr>
		<tr>
			<td align="center">
			내용123123
			</td>
			<td>
			  <textarea rows="15" cols="50" id="content" name="content" placeholder="내용 입력"></textarea>
			 
			  <div id="contentDiv"></div>
			</td>

		</tr>
		<tr>
			<td colspan="2" align ="center">
			<input type ="button" value="글쓰기" id="boardWriteBtn">
			<input type ="reset" value="다시작성">
			<input type= "button" value = "목록" onclick ="location.href='/SpringProject/board/boardList'">
			</td>
			
		</tr>
	</table>
</form>

<script type="text/javascript" src="../js/board_jQuery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
 <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
CKEDITOR.replace('content',
	{filebrowserUploadUrl:'imageUpload'
});
</script>

</body>
</html>