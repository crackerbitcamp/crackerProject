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

#recipeBoardListIndexDiv .recipeCard2{
   float: left;
   margin-left: 10px;
   margin-right: 10px;
   margin-bottom: 15px;
   border : #dddddd solid 1px;
   padding: 5px 5px 5px 5px;
   box-shadow: 1px 1px 3px #333333;
   width: 280px;
   height: 350px;
   
}

#recipeBoardListIndexDiv .recipeCard2:hover {
	cursor:pointer;
}


#recipeBoardListIndexDiv{
   position : relative;
   float : left;
   margin : 15px 0px 0px 16px;
   
}

#recipelistindex {
	list-style: none;
}

#recipelistindeximg {
	margin-left :5px;
}
#recipeBoardListIndexDiv .recipeCard:hover{
   cursor:pointer;
}

#recipeindexcatgoryfont {
	margin-top: 10px;
 	font-size : 1.5em;
	color : #6e6e6e;
	font-family: 'Noto Sans KR', sans-serif;
}

#recipeindexnickNamefont {
   margin-top : 12px;
   font-size : 13px;
   font-family: 'Noto Sans KR', sans-serif;
}

#recipeindexsubjectfont {
	width: 280px;
  	margin-top : 20px;
  	font-weight : bolder;
  	overflow: hidden;
  	text-overflow: ellipsis;
  	white-space: nowrap;
  	color : #f76900;
  	font-size : 22px;
  	font-family: 'Noto Sans KR', sans-serif;
}

#recipeindexlogtimefont {
   margin-top : 25px;
   font-size : 10px;
   font-family: 'Noto Sans KR', sans-serif;
}

</style>
</head>
<body>
	<form id="recipeBoardListIndexForm">
	<div>
		<input type="hidden" id="pg" value="${pg}">
		<input type="hidden" id='category' value = "${category}">
		
		<div id="recipeBoardListIndexDiv"></div>
	</div>
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
	$(function() {
		var images = $('#content img:first-child').attr('src');
		$.ajax({
			type : 'post',
			url : '/index/recipeBoard/getRecipeBoardListIndex',
			data : {'pg' : $('#pg').val(),
					'category' : $('#category').val()
			},
			dataType : 'json',
			success : function(data) {

				$.each(data.list, function(index, items) {
					
					$('<input/>', {
						type : 'hidden',
						id : 'contentA'
					}).appendTo($('#recipeBoardListIndexDiv'));
					
					$('#contentA').html(items.content);
					var img = $('#contentA img:first-child').attr('src');
				 	var p = $('#contentA').text();
					
		
					
					$('<ul/>',{
						class : 'recipeCard2 recipeCard_'+items.seq
					}).append($('<li/>',{
							id : 'recipelistindex'
					})).append($('<img>', {
							id : 'recipelistindeximg',
							src : img,
							width : '270px',
							height : '200px',
						})).append($('<div/>',{
							id : 'recipelistindexAll'
						}).append($('<div/>',{
							id : 'recipeindexcatgoryfont',
							align:'center',
							text:items.category
							
						})).append($('<div/>',{
							id : 'recipeindexnickNamefont',
							align:'center',
							text:items.nickName
						}))
						.append($('<div/>', {
							id : 'recipeindexsubjectfont',
							align: 'center',
							text : items.subject
						})).append($('<div/>', {
							id : 'recipeindexlogtimefont',
							align: 'center',
							text : items.logtime
					}))).appendTo($('#recipeBoardListIndexDiv'));
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