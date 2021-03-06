<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<style>
#boardUpdateForm div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

</style>
</head>
<body>


<h2>글 수정하기</h2>
<form name="boardUpdateForm" id="boardUpdateForm">
<input type = "hidden" name="seq" id="seq" value="${seq}">
<input type = "hidden" name="pg" id="pg" value="${pg}">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">
			제목
			</td>
			<td><input type = "text" name="subject" id = "subject" placeholder="제목 입력" >
			<div id="subjectDiv"></div></td>
		</tr>
		<tr>
			<td align="center">
			내용
			</td>
			<td>
			  <textarea id="content" name="content" ></textarea>
			  <div id="contentDiv"></div>
			</td>

		</tr>
		<tr>
			<td colspan="2" align ="center">
			<input type ="button" value="수정하기" id="boardUpdateBtn">
			<input type ="reset" value="다시작성" id="resetBtn">
			<input type= "button" value = "목록" onclick ="location.href='/index/board/boardList?pg=${pg}'">
			</td>
			
		</tr>
	</table>
</form>

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
	$(content).empty();
	
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