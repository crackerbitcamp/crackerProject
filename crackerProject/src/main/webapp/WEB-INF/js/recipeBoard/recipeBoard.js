$('#recipeBoardWriteFormBtn').click(function(){
	
	location.href="/index/recipeBoard/recipeBoardWriteForm";

});
	
$('#recipeBoardWriteBtn').click(function(){
	var content = CKEDITOR.instances.content.getData();
	
	$.ajax({
		url:'/index/recipeBoard/recipeBoardWrite',
		type:'post',
		data:{'subject' : $('#subject').val(),
				'category' : $('#category').val(),
				content},
		success:function(){
			alert('게시글을 등록하였습니다.');
			location.href='/index';
			/*if($('#category').val() == 'freedomCategory'){
				
				location.href='/index/board/boardList';
			}else{
				
				location.href='/index/board/recipeBoardList';
			}*/
		},
		error:function(e){
			console.log(e);
		}
	});//ajax
	
});