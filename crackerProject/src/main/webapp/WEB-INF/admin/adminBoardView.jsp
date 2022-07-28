<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/boardCSS/boardViewCSS.css" rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
</head>
<body>
	<form name="boardViewForm">
		<input type="hidden" name="seq" id="seq" value="${seq}" />
		<input type="hidden" name="pg" id="pg" value="${pg}" />
		<input type="hidden" id="memEmail" value="${memEmail }" />
		<input type="hidden" id="category" value="자유"/>
		
		<div id="boardView_subject">
			<div class="boardView_content_subject">
				<span id="subjectSpan"></span>
				<ul class="board_top_bar_ul">
					<li class="board_top_bar_li"><span id="categorySpan"></span></li>
					<li class="board_top_bar_li">글번호 <span id="seqSpan"></span></li>
					<li class="board_top_bar_li"><span id="logtimeSpan"></span></li>
					<li class="board_top_bar_li">작성자 <span id="nickNameSpan"></span></li>
					<li class="board_top_bar_li">조회수 <span id="hitSpan"></span></li>
					<li class="board_top_bar_li">추천 <span id="goodCountSpan"></span></li>
				</ul>
	
			</div>
			
			<div class="boardView_content">
				<pre id="content1"
					style="height:auto; white-space: pre-line; word-break: break-all; overflow-wrap: anywhere;">
				</pre>
			</div>
			
			<div class="boardView_content_menu">
				<div style="margin-right: 1px;">
					<span>추천 : </span><span id="goodcount"></span>
					
				</div>
			
			
				<input type="button" value="목록" style="margin: 5px;"
				onclick="location.href='/index/admin/adminBoardList?pg=${pg}'">
				
				<input type="button" value="삭제" id="boardDeleteBtn">
				
			
			</div>
		</div>
		
		<div id="boardView_img">
			<img id="view_img"src="/index/image/view_.jpg">
		</div>

		<div class="comment_form_div">
			
			<ul  id="commentInside">
			</ul>
		</div>
	
		
	</form>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script type="text/javascript">
	$(function(){
		$.ajax({
			type : 'post',
			url : '/index/board/getBoardView',
			data : 'seq=' + $('input[name=seq]').val(),
			dataType:'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('#subjectSpan').html(data.boardDTO.subject);
				$('#seqSpan').html(data.boardDTO.seq);
				$('#nickNameSpan').html(data.boardDTO.nickname);
				$('#hitSpan').html(data.boardDTO.hit);
				$('#categorySpan').html(data.boardDTO.category);
				$('#goodCountSpan').html(data.boardDTO.goodcount);
				$('#logtimeSpan').html(data.boardDTO.logtime);
				$('#content1').html(data.boardDTO.content);  // content 이름 겹쳐 1 추가
				/*if(data.memLogin == data.boardDTO.id){
					$('#boardViewSpan').show();
				}
				else{
					$('#boardViewSpan').hide();
				}*/
			},
			
			error:function(e){
				console.log(e);
			}
		});//ajax
		
		
		$('#boardDeleteBtn').click(function(){
			if(confirm('선택하신 항목 삭제하시겠습니까')){
				$.ajax({
					type:'post',
					url : '/index/board/boardDelete',
					data : 'seq='+$('input[name=seq]').val(),
						
					success : function(){
							alert('삭제 되었습니다.');
							location.href='/index/admin/adminBoardList';
					},
					
					error:function(e){
						console.log(e);
					}
				});
			}
		});
	});
	</script>



</body>
</html>