<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<link href="/index/css/boardCSS/boardWrite.css" rel="stylesheet"
	type="text/css" />
<style>

.ck-editor__editable {
	height: 1000px;
}

#boardUpdateForm div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

</style>
</head>
<body>
	
	<div id="boardWriteFormOutDiv" >
		<form class="boardWriteForm" name=“boardWriteForm" id="boardWriteForm">
			
			<input type="hidden" name="seq" id="seq" value="${seq}">
			<input type="hidden" name="pg" id="pg" value="${pg}">

			<div class="inputTextForm">
				<select id="category">
					<option value="한식">자유</option>
					<option value="양식">질문</option>
				</select> <input type="text" name="subject" id="subject" placeholder="제목 입력">
			</div>
			<div id="subjectDiv"></div>


			<div class="inputTextForm">
				<textarea id="content" name="content" style='border: 0;'></textarea>
			
				<button class="writeBottomBtnClass" type="button"  id="boardUpdateBtn">수정하기</button>
				
				<button	class="writeBottomBtnClass" type="button"  id="resetBtn">다시작성</button>
				
				<button	class="writeBottomBtnClass" type="button" 
					onclick="location.href='/index/board/boardList?pg=${pg}'">목록</button>
			</div>

			<div id="contentDiv"></div>



		</form>
	</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
CKEDITOR.replace('content',
	{filebrowserUploadUrl:'imageUpload'
});
</script>

<script type="text/javascript">


$(function(){
	$.ajax({
		type:'post',
		url: '/index/board/getBoard',
		data: {'seq' : $('#seq').val()},
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			$('#subject').val(data.subject);
			$('#content').val(data.content);
		},
		error: function(e){
			console.log(e);
		}
	});
}); 


//수정버튼
$('#boardUpdateBtn').click(function(){
	var content = CKEDITOR.instances.content.getData();
	
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val()==''){
		$('#subjectDiv').html('제목을 입력하세요');
		
	}else if(content == ''){
		$('#contentDiv').html('내용을 입력하세요');
		
	}else{
		$.ajax({
			url: '/index/board/boardUpdate',
			type:'post',
			data:{'subject' : $('#subject').val(),
				  'seq' : $('#seq').val(),
				  content},
			success:function(){
				alert('게시글을 수정하였습니다.');
				location.href='/index/board/boardList?pg='+$('#pg').val();
			},
			error:function(e){
				console.log(e);
			}
		});
	}//else
});

$('#resetBtn').click(function(){
	$.ajax({
		type:'post',
		url: '/index/board/getBoard',
		data: {'seq' : $('#seq').val()},
		dataType: 'json',
		success: function(data){
			$('#subject').val(data.subject);
			$('#content').val(data.content);
		},
		error: function(e){
			console.log(e);
		}
	});
});

</script>
</body>
</html>