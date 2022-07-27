$('#boardSearchBtn').click(function(){
	if($('#boardSearchOption').val()=='board'){
		
		location.href='/index/board/boardList?keyword='+$('#boardSearch').val()
	}else{
		location.href='/index/recipeBoard/recipeBoardList?keyword='+$('#boardSearch').val()
		
	}
	
});// boardSearchBtn
