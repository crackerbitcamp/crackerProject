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



<style type="text/css">
    

#recipeBoardListDiv .recipeCard {
/* 	border : #dddddd solid 1px; 
	padding: 5px 5px 5px 5px; 
	box-shadow: 1px 1px 3px #333333; */
	width: 770px;
	height: 350px;
	border-bottom : 1px solid #6e6e6e;
	margin : 0 auto;
}

#recipeBoardListDiv{

	padding: 0px 20px 20px 20px;
	position : relative;
	width: 100%;
	background : #fff;	
	height: 100%;

	
}
#recipeBoardListDiv #recipeextend:hover{
	cursor:pointer;
}

#recipeBoardListDiv #recipelistimg:hover {
	cursor:pointer;
}

#recipeBoardListDiv #recipesubjectfont:hover {
	cursor:pointer;
}


#recipelistimg {
	margin-top : 25px;
	margin-bottom: 25px;
	border : #dcdcdc solid 1px;
}

#recipelistAll {
	position : absolute;
	display : inline-block;
	width : 330px;
	margin-left : 30px;
	margin-top: 40px;
	margin-bottom: 25px;
	font-family: 'Noto Sans KR', sans-serif;
	
}

#recipecatgoryfont {
	text-align : left;
	font-size : 1.5em;
	color : #6e6e6e;
	margin-bottom: 20px;
}

#recipenickNamefont {
	text-align : right;
	margin-bottom : 25px;
}

#recipesubjectfont {
	text-align : left;
	font-weight : bolder;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size : 2em;
    color : #f76900;
    margin-top: 34px;
}

#recipecontentsfont {	
	margin-top: 50px;
    height: 40px;
	text-align : left;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}


#recipelogtimefont {
	text-align : left;
	font-size : 10px;
	margin-top: 30px;
}

#recipelist {
	list-style: none;
}

#recipeBoardPagingDiv {
	text-align : center;
	background : #fff;
	cursor:pointer;
	margin-bottom : 100px;
	font-size : 1.5em;
}

#currentPaging{
	color:#f76900;
	text-decoration:underline;
	cursor: pointer;
}
#paging{
	color:black;
	text-decoration:non;
	cursor: pointer;
}

/* header */

.recipeBoardTop {
	width: 100%;
	border-bottom : 1px solid #f76900;
}

.inner {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 48px 0px 48px 0px ;
	width: 100%;
	background-color: #f3f3f3;
}
.title2 {
	margin-top: 50px;
    text-align: center;
    font-size: 2rem;
    font-weight: bold;
    font-family: 'Noto Sans KR', sans-serif;
	
}

.title3 {
	color: #787878;
	text-align : center;
   	margin: auto;
   	margin-top: 20px;
   	font-size: 1.3rem;
  	border-bottom:1px solid #ebeef1;
  	font-family: 'Noto Sans KR', sans-serif;
}

#boardSearchOption {
	margin-left: 355px;
    margin-top: 30px;
}

</style>
</head>
<body>
<header class="recipeBoardTop">
	<div class="inner">
		<h1 class="title2">레시피가 궁금해?</h1>
		<h2 class="title3">"맛있다" 연발 하는 레시피 대공개! :)</h2>
	</div>
</header>

	<form id="recipeBoardListForm">
	<div>
	
		<input type="hidden" id="pg" value="${pg}">
		<input type="hidden" id='category' value = "${category}">
		<select id="boardSearchOption"">
			<option value="">선택</option>
			<option value="">한식</option>
			<option value="">양식</option>
			<option value="">일식</option>
			<option value="">중식</option>
			<option value="">아시아</option>
			<option value="">분식</option>
		</select>
	<div id="recipeBoardListDiv"> </div>
		<div id="recipeBoardPagingDiv"></div>
	</div>


	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
function recipeBoardPaging(pg2) {
	
	location.href="/index/recipeBoard/recipeBoardList?pg="+pg2;
	
}
</script>

<script type="text/javascript">
	$(function() {
		var recipeBoardUrl;
		if($('#keyword').val()==null){
			recipeBoardUrl = '/index/recipeBoard/getRecipeBoardList';
		}else{
			recipeBoardUrl = '/index/recipeBoard/recipeBoardSearch';
		}
		var images = $('#content img:first-child').attr('src');
		$.ajax({
			type : 'post',
			url : recipeBoardUrl,
			data : {'pg' : $('#pg').val(),
					'category' : $('#category').val(),
					'keyword':$('#keyword').val()
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
						})).append($('<div/>',{
							id : 'recipeextend',
							align : 'right',
							text : '> 더보기'
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
				}); //each
				
				//페이징처리
				$('#recipeBoardPagingDiv').html(data.recipeBoardPaging.pagingHTML);

			},
			error : function(e) {
				console.log(e);
			}

		});//ajax
		
		
	});
	
</script>
</body>
</html>