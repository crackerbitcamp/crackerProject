<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
<link href="/index/css/boardCSS/boardWrite.css" rel="stylesheet" type="text/css" />
<style>

#boardReplyForm div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

#boardWriteFormOutDiv{
	height: 600px;
}

</style>
</head>
<body>


<div id="boardWriteFormOutDiv" >
		<form name="boardReplyForm" id="boardWriteForm" class="boardWriteForm">
			<input type = "hidden" name="category" id= "category" value="${category}">
			<input type = "hidden" name="pseq" id="pseq" value="${pseq}">
			<input type="hidden" name="pg" id="pg" value="${pg}">

			<div class="inputTextForm">
				<select id="category">
					<option value="자유">자유</option>
					<option value="질문">질문</option>
				</select> <input type="text" name="subject" id="subject" placeholder="제목 입력">
			</div>
			<div id="subjectDiv"></div>


			<div class="inputTextForm">
				<textarea id="content" name="content" style='border: 0;'></textarea>

			<button class="writeBottomBtnClass" type="button"  id="boardReplyBtn1">답글쓰기</button>
			<button	class="writeBottomBtnClass" type="button"  id="boardReplyReturnBtn">다시작성</button>
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
$('#boardReplyReturnBtn').click(function() {
	location.reload();
});

$('#boardReplyBtn1').click(function(){
	var content = CKEDITOR.instances.content.getData();
	$('#subjectDiv').empty();
	$(content).empty()
	
	if($('#subject').val()==''){
		$('#subjectDiv').html('제목을 입력하세요');
		
	}else if(content == ''){
		$('#contentDiv').html('내용을 입력하세요');
		
	}else{
		$.ajax({
			url:'/index/board/boardReply',
			type:'post',
			data: {
				'subject' : $('#subject').val(),
				'pseq' : $('#pseq').val(),
				'category' : $('#category').val(),
				 content
				 },
			success:function(){ 
				alert('답글을 등록하였습니다.');
				location.href='/index/board/boardList?pg='+$('#pg').val();
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
});
</script>


