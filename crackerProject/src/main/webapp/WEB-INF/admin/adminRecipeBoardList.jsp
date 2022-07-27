<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	border-bottom : 1px solid #6e6e6e;
	margin : 0 auto;
}

#recipeBoardListDiv{

	padding: 20px;
	position : relative;
	
	background : #f3f3f3;	
	height: 1800px;

	
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
    color : #f76900;
}

#recipecontentsfont {	
	margin-top : 20px;
	height : 50px;
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
	background : #f3f3f3;
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

.boardSearchBtn {
	display: block;
	position: absolute;
	top: 0;
	right: -1px;
	width: 20%;
	font-size: 0.813rem;
	color: #ffffff;
	border-radius: 50px;
	background-color: #777777;
	height: 100%;
	-webkit-appearance: none;
	border : 0px;
}
#boardSearch{

  width: 79%;
  height: 30px;

  font-size: 15px;
  border: 0;
  border-radius: 30px;
  outline: none;
  padding-left: 10px;
  background-color: white;
}
#searchForm{
	margin: 45px auto 0 auto;
	width: 31%;
	overflow: hidden;
	padding-right:20px;
	padding-left:20px;
	border-radius: 30px;
	border: #777777 3px solid;
	position: relative;
	background-color: white;
	

}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id="recipeBoardListForm">
	<div>
	
		<input type="hidden" id="pg" value="${pg}">
		<input type="hidden" id='category' value = "${category}">
		<input type="hidden" id='keyword' value = "${keyword}">
	<div id="recipeBoardListDiv"> 
		<div id="searchForm">
			<span></span><input type="text" id="boardSearch"/><button type="button" id="recipeBoardSearchBtn" class="boardSearchBtn">검색</button>
		</div>
		
		<div id="recipeBoardPagingDiv"></div>
	</div>
	</div>


	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
function recipeBoardPaging(pg2) {
	
	location.href="/index/admin/adminRecipeBoardList?pg="+pg2;
	
}

$('#recipeBoardSearchBtn').click(function(){
	location.href='/index/admin/adminRecipeBoardList?keyword='+$('#boardSearch').val();
});
</script>

<script type="text/javascript">
	$(function() {
		var recipeBoardUrl;
		if($('#keyword').val()==''){
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
				//alert(JSON.stringify(data));
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
						
						location.href = '/index/admin/adminRecipeBoardView?seq='
											+items.seq+'&pg='+$('#pg').val();
						
						
					});//카드 클래스 클릭
				}); //each
				
				//페이징처리
				$('#recipeBoardPagingDiv').html(data.recipeBoardPaging.PagingHTML);

			},
			error : function(e) {
				console.log(e);
			}

		});//ajax
		
		
	});
	
</script>
</body>
</html>