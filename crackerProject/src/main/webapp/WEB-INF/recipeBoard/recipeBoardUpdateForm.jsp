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
#boardWriteFormOutDiv{
	
}

</style>
</head>
<body>
	
	<div id="boardWriteFormOutDiv" >
		<form class="boardWriteForm" name="recipeBoardWriteForm" id="recipeBoardWriteForm">
			
			<input type="hidden" name="seq" id="seq" value="${seq}"> <input
				type="hidden" name="pg" id="pg" value="${pg}">

			<div class="inputTextForm">
				<select id="category">
					<option value="한식">한식</option>
					<option value="양식">양식</option>
					<option value="일식">일식</option>
					<option value="분식">분식</option>
					<option value="중식">중식</option>
					<option value="아시아">아시아</option>
				</select> <input type="text" name="subject" id="subject" placeholder="제목 입력">
			</div>
			<div id="subjectDiv"></div>


			<div class="inputTextForm">
				<textarea id="content" name="content" style='border: 0;'></textarea>
			
				<button class="writeBottomBtnClass" type="button"  id="recipeBoardUpdateBtn">수정하기</button>
				
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
	$(function(){
		$.ajax({
			type:'post',
			url: '/index/recipeBoard/getRecipeBoardView',
			data: {'seq' : $('#seq').val()},
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				$('#category').val(data.category);
				$('#subject').val(data.subject);
				$('#content').val(data.content);
			},
			error: function(e){
				console.log(e);
			}
		});
		
		
			$('#resetBtn').click(function(){
				$.ajax({
					type:'post',
					url: '/index/recipeBoard/getRecipeBoardView',
					data: {'seq' : $('#seq').val()},
					dataType: 'json',
					success: function(data){
						$('#category').val(data.category);
						$('#subject').val(data.subject);
						$('#content').val(data.content);
					},
					error: function(e){
						console.log(e);
					}
				});
			});
		
	});
	$('#recipeBoardUpdateBtn').click(function(){
		
		var content = CKEDITOR.instances.content.getData();
		
		$('#subjectDiv').empty();
		$(content).empty();
		
		if($('#subject').val()==''){
			$('#subjectDiv').html('제목을 입력하세요');
			
		}else if(content == ''){
			$('#contentDiv').html('내용을 입력하세요');
			
		}else{
			$.ajax({
				url: '/index/recipeBoard/recipeBoardUpdate',
				type:'post',
				data:{'subject' : $('#subject').val(),
					  'seq' : $('#seq').val(),
					  'content' : content,
					  'category' : $('#category').val()},
				success:function(){
					alert('게시글을 수정하였습니다.');
					location.href='/index/recipeBoard/recipeBoardList?pg='+$('#pg').val();
				},
				error:function(e){
					console.log(e);
				}
			});
		}//else
	});
	// 글쓰기 editor 및 사진 업로드 기능
	CKEDITOR.replace('content', {
		filebrowserUploadUrl : 'imageUpload'
	});
		
	</script>

</body>
</html>