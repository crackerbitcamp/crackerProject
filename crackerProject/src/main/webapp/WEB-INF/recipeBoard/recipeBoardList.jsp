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
#recipeBoardListDiv .recipeCard {
/* 	border : #dddddd solid 1px;
	padding: 5px 5px 5px 5px;
	box-shadow: 1px 1px 3px #333333; */
	width: 770px;
	height: 350px;
	border-bottom : 1px solid #f3f3f3;
	margin : 0 auto;
}

#recipeBoardListDiv{
<<<<<<< HEAD
	padding: 20px;
=======
	/* padding: 20px; */
	position : relative;
	float : left;
>>>>>>> branch 'main' of https://github.com/keems0un/crackerProject.git
	width: 1655px;
<<<<<<< HEAD
	height: 100%;
	background : #ffffff;	
=======
	height: 1000px;
	background : #ffffff;
	/* display:flex; */
	
>>>>>>> branch 'main' of https://github.com/keems0un/crackerProject.git
}
#recipeBoardListDiv .recipeCard:hover{
	cursor:pointer;
}

#recipelistimg {
	margin-top : 25px;
	margin-bottom: 25px;
}

#recipelistAll {
	position : absolute;
	display : inline-block;
	width : 330px;
	margin-left : 30px;
	margin-top: 30px;
	margin-bottom: 25px;
	font-family: 'Noto Sans KR', sans-serif;
	
}

#recipecatgoryfont {
	text-align : left;
	font-size : 1.5em;
	color : #6e6e6e;
	margin-bottom: 40px;
}

#recipenickNamefont {
	text-align : left;
	margin-left : 250px;
	margin-bottom : 10px;
}

#recipesubjectfont {
	text-align : left;
	font-weight : bolder;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size : 2em;
}

#recipecontentsfont {	
	margin-top : 20px;
	text-align : left;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#recipelogtimefont {
	text-align : left;
	font-size : 10px;
	margin-top: 60px;
}

#recipelist {
	list-style: none;
}


/* header */

.recipeBoardTop {
	width: 100%;
	border-bottom : 1px solid #f76900;
}

.inner {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 48px 0px 48px 0px ;
	width: 1695px;
}
.title {
	margin-top: 30px;
	text-align : center;
}

.title2 {
	color: #787878;
	text-align : center;
	margin-bottom : 20px;
}

</style>
</head>
<body>
<header class="recipeBoardTop">
	<div class="inner">
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
				 	var p = $('#contentA').text();
					
		
					
					$('<ul/>',{
						class : 'recipeCard recipeCard_'+items.seq
					}).append($('<li/>',{
							id : 'recipelist'
					})).append($('<img>', {
							id : 'recipelistimg',
							src : img,
							width : '400px',
							height : '300px'
						})).append($('<div/>',{
							id : 'recipelistAll'
						}).append($('<div/>',{
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
						})).append($('<div/>',{
							id : 'recipecontentsfont',
							align: 'center',
							text : p
						})).append($('<div/>', {
							id : 'recipelogtimefont',
							align: 'center',
							text : items.logtime
					}))).appendTo($('#recipeBoardListDiv'));
					$('.recipeCard_'+items.seq).click(function(){
						if(data.memLogin == null){
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