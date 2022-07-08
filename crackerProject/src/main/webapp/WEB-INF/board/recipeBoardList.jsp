<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#recipeBoardListDiv .a{
	float: left;
	margin: 10px 10px;
}
</style>
</head>
<body>
	<form id="recipeBoardListForm">
	<div>
	
		<input type="hidden" id="pg"> 래시피 리스트
		<div id="recipeBoardListDiv"></div>
	</div>


	</form>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js">
		
	</script>
	<script type="text/javascript">
		$(function() {
			var images = $('#content img:first-child').attr('src');
			$.ajax({
				type : 'post',
				url : '/index/board/getBoardList',
				data : 'pg=' + $('#pg').val(),
				dataType : 'json',
				success : function(data) {

					$.each(data.list, function(index, items) {

						$('<input/>', {
							type : 'hidden',
							id : 'contentA'
						}).appendTo($('#recipeBoardListDiv'));
						$('#contentA').html(items.content);
						var img = $('#contentA img:first-child').attr('src');
						
						$('<div/>').addClass('a').append($('<div/>').append($('<img>', {
							src : img,
							width : '200px',
							heigth : '200px'
						}))).append($('<div/>', {
							text : items.subject
						})).appendTo($('#recipeBoardListDiv'))
					});

				},
				error : function(e) {
					console.log(JSON.stringify(error));
				}

			});//ajax
		});
	</script>
</body>
</html>