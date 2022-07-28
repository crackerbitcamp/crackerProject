<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/recipeboardCss/recipeBoardViewCSS.css" rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<style type="text/css">
#recipeBoardViewForm #commentContentDiv{
	font-size: 7px;
	color: red;
}
</style>
</head>
<body>
<form id="recipeBoardViewForm">

<input type = "hidden" name="seq" id="seq" value="${seq}"/>
<input type = "hidden" name="pg" id ="pg" value="${pg}"/>
<input type="hidden" id="category" value="레시피"/>


<div id="recipeBoardView_subject">
	<div class="recipeBoardView_content_subject">
		<span id="subjectSpan"></span>
		<ul class="recipeBoard_top_bar_ul">
			<li class="recipeBoard_top_bar_li"><span id="categorySpan"></span></li>
			<li class="recipeBoard_top_bar_li">글번호 <span id="seqSpan"></span></li>
			<li class="recipeBoard_top_bar_li"><span id="logtimeSpan"></span></li>
			<li class="recipeBoard_top_bar_li">작성자 <span id="idSpan"></span></li>
			<li class="recipeBoard_top_bar_li">조회수 <span id="hitSpan"></span></li>
			<li class="recipeBoard_top_bar_li">추천 <span id="goodCountSpan"></span></li>
		</ul>
	</div>
	
	<div class="recipeBoardView_content">
			<pre id="content2"
				style="height:auto; white-space: pre-line; word-break: break-all; overflow-wrap: anywhere;">
			</pre>
	</div>
	
	<div class="recipeBoardView_content_menu">
			<input type="button" value="목록" style="margin: 5px;" onclick="location.href='/index/admin/adminRecipeBoardList?pg=${pg}'">
			
			<input type="button" value="삭제" id="adminRecipeboardDeleteBtn">
		
	</div>
	
</div> <!-- recipeBoardView_subject -->


	
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/recipeBoard/recipeBoardView.js"></script>

<script type="text/javascript">
$(function(){
	$.ajax({
		type : 'post',
		url : '/index/recipeBoard/getRecipeBoardView',
		data : 'seq=' + $('input[name=seq]').val(),
		dataType:'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$('#subjectSpan').html(data.subject);
			$('#seqSpan').html(data.seq);
			$('#idSpan').html(data.nickName);
			$('#hitSpan').html(data.hit);
			$('#content2').html(data.content); 
			$('#logtimeSpan').html(data.logtime);
			$('#goodCountSpan').html(data.goodCount);
			/* if(data.memId == data.boardDTO.id){
				$('#boardViewSpan').show();
			}
			else{
				$('#boardViewSpan').hide();
			} */
		},
		
		error:function(e){
			console.log(e);
		}
	});//ajax
});
$('#adminRecipeboardDeleteBtn').click(function(){
	if(confirm('선택하신 항목 삭제하시겠습니까')){
		$.ajax({
			type:'post',
			url : '/index/recipeBoard/recipeBoardDelete',
			data : 'seq='+$('input[name=seq]').val(),
				
			success : function(){
					alert('삭제 되었습니다.');
					location.href='/index/recipeBoard/recipeBoardList';
			},
			
			error:function(e){
				console.log(e);
			}
		});
	}
});


</script>

</body>
</html>