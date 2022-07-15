<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<style type="text/css">
#recipeBoardListDiv .recipeCard{
	float: left;
	margin: 10px;
	border : #dddddd solid 1px;
	padding: 5px 5px 5px 5px;
	box-shadow: 1px 1px 3px #333333;
	width: 310px;
	height: 320px;
	
}

#recipeBoardListDiv{
	/* padding: 20px; */
	position : relative;
	float : left;
	width: 1655px;
	height: 1000px;
	background : #ffffff;
	/* display:flex; */
	
}
#recipeBoardListDiv .recipeCard:hover{
	cursor:pointer;
}

#recipecatgoryfont {
	margin-top: 10px;
	font-size : 1.5em;
}

#recipenickNamefont {
	margin-top : 5px;
}

#recipesubjectfont {
	margin-top : 10px;
	font-weight : bolder;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#recipelogtimefont {
	margin-top : 10px;
	font-size : 10px;
}

/* header */

.recipeBoardTop {
	border-bottom : 1px solid #f76900;
}

.inner {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px 0px 40px 430px;
	padding: 48px 30px 20px 30px;
	width: 860px;
}
.title {
	margin-top: 50px;
	text-align : center;
}

.title2 {
	color: #787878;
	text-align : center;
}
#recipeBoardListDiv{
	/* width: 1000px;
	height: 1500px; */
}
</style>
</head>
<body>
<header class="recipeBoardTop">
	<div class="inner" style="padding-bottom: 10px;">
		<h1 class="title">레시피가 궁금해?</h1>
		<h2 class="title2">"맛있다" 연발 하는 레시피 대공개! :)</h2>
	</div>
</header>

	<form id="recipeBoardListForm">
	<div>
	
		<input type="hidden" id="pg" value="${pg}">
		<input type="hidden" id='category' value = "${category}">
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
							width : '300px',
							height : '200px'
						})).append($('<div/>',{
							id : 'recipecatgoryfont',
							align:'center',
							text:items.category
							
						})).append($('<div/>',{
							id : 'recipenickNamefont',
							align:'center',
							text:items.nickName
						}))
						.append($('<div/>', {
							id : 'recipesubjectfont',
							align: 'center',
							text : items.subject
						})).append($('<div/>', {
							id : 'recipelogtimefont',
							align: 'center',
							text : items.logtime
					})).appendTo($('#recipeBoardListDiv'));
					$('.recipeCard_'+items.seq).click(function(){
						if(data.memId == null){
							alert('먼저 로그인하세요')
						}else{
							location.href = '/index/recipeBoard/recipeBoardView?seq='
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