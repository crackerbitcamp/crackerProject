<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/boardCSS/boardViewCSS.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<form name="boardViewForm">
		<input type="hidden" name="seq" id="seq" value="${seq}" />
		<input type="hidden" name="pg" value="${pg}" />
		<input type="hidden" id="memEmail" value="${memEmail }" />
		<input type="text" id="category" value="자유"/>
		<div id="boardView_content">
			<div class="boardView_content_subject">
				<span id="subjectSpan"></span>
			</div>
			<div class="boardView_content_subject">
				<ul class="board_top_bar_ul">
					<li class="board_top_bar_li">글번호 :<span id="seqSpan"></span>
					</li>
					<li class="board_top_bar_li">작성자 : <span id="nickNameSpan"></span>
					</li>
					<li class="board_top_bar_li">조회수 : <span id="hitSpan"></span>
					</li>
				</ul>
	
			</div>
			<div>
				<div style="width: 100%; height: 100%; overflow: auto;">
					<pre id="content"
						style="white-space: pre-line; word-break: break-all; overflow-wrap: anywhere;">
					</pre>
				</div>
			</div>
	
			<div style="margin-right: 1px;">
				<button type="button" id="goodBtn">추천</button>
				<span id="goodcount"></span>
			</div>
			<div>
			
				<input type="button" value="목록" style="margin: 5px;"
				onclick="location.href='/index/board/boardList?pg=${pg}'">
				<input type="button" value="글수정" id="boardUpdateBtn">
				<input type="button" value="삭제" id="boardDeleteBtn">
				<input type="button" value="답글" id="boardReplyBtn">
			
			</div>
		</div>

		<div class="comment_form_div">
			<div>
				댓글입력 : <input type="text" id="commentContent"> <input
					type="button" id="commentBtn" value="댓글입력">
			</div>
			<ul  id="commentInside">
			</ul>
		</div>

		
	</form>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/boardView.js"></script>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				type : "post",
				url : "/index/good/goodCount",
				dataType : "text",
				data : 'seq=' + $('#seq').val(),
				error : function() {
					alert("통신 에러");

				},
				success : function(data) {
					$('#goodcount').html(data);
				}
			});
		});

		$('#goodBtn').click(function() {
			$.ajax({
				type : "post",
				url : "/index/good/updateGood",
				dataType : "json",
				data : {
					'seq' : $('#seq').val(),
					'memEmail' : $('#memEmail').val()
				},
				error : function() {
					alert("통신 에러");
				},
				success : function(data) {
					if (data == 0) {
						alert("추천완료.");
						document.location.reload();

					} else if (data == 1) {
						alert("추천취소");
						document.location.reload();
					}
				}
			});
		});
	</script>


</body>
</html>