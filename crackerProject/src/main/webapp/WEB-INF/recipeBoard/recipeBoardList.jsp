<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#recipeBoardListDiv .recipeCard{
	float: left;
	margin: 10px;
	border : #dddddd solid 1px;
	padding: 5px 5px 5px 5px;
	box-shadow: 1px 1px 3px #333333;
	width: 210px;
	height: 300px;
	
}

#recipeBoardListDiv{
	width: 1600px;
	height: 1000px;
	border: soild 1px red;
}
#recipeBoardListDiv .recipeCard:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<form id="recipeBoardListForm">
	<div>
	
		<input type="hidden" id="pg" value="${pg}">
		<input type="text" id='category' value = "${category}">
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
			url : '/index/recipeBoard/getRecipeBoardList',
			data : {'pg' : $('#pg').val(),
					'category' : $('#category').val()
			},
			dataType : 'json',
			success : function(data) {

				$.each(data.list, function(index, items) {

					$('<input/>', {
						type : 'hidden',
						id : 'contentA'
					}).appendTo($('#recipeBoardListDiv'));
					$('#contentA').html(items.content);
					var img = $('#contentA img:first-child').attr('src');
					
					
					$('<div/>',{
						class : 'recipeCard recipeCard_'+items.seq
					}).append($('<img>', {
							align: 'center',
							src : img,
							width : '200px',
							height : '200px'
						})).append($('<div/>',{
							align:'center',
							text:items.category
						})).append($('<div/>',{
							align:'center',
							text:items.nickName
						}))
						.append($('<div/>', {
							align: 'center',
							text : items.subject
						})).append($('<div/>', {
							align: 'center',
							text : items.email
							
						})).append($('<div/>', {
							align: 'center',
							text : items.logtime
					})).appendTo($('#recipeBoardListDiv'));
					$('.recipeCard_'+items.seq).click(function(){
						if(data.memId == null){
							alert('먼저 로그인하세요')
						}else{
							location.href = '/index/board/recipeBoardView?seq='
											+items.seq+'&pg='+$('#pg').val();
						}
						
					});//카드 클래스 클릭
				});

			},
			error : function(e) {
				console.log(e);
			}

		});//ajax
		
		
	});
	
</script>
</body>
</html>