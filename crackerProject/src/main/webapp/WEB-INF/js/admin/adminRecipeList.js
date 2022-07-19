$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/admin/getadminRecipeList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
	
			$.each(data.list, function(index, items) {
				$('<tr/>').append($('<a/>',{
					id : 'adminRecipeseq',
					href : '/index/recipeBoard/recipeBoardView?seq='+items.seq+'&pg='+$('#pg').val(),
					class: 'adminRecipeseq'+items.seq
				}).append($('<td/>',{
					id : 'seq',
					width : '200px',
					text : items.seq
				}).prepend($('<input/>',{
					type : 'checkbox',
					name : 'check'
				})))
				.append($('<td/>',{
					id : 'nickName',
					align : 'center',
					width : '100px',
					text : items.nickName
				}))
				.append($('<td/>',{
					id : 'subject',
					align : 'center',
					width : '300px',
					text : items.subject
				}))
				.append($('<td/>',{
					id : 'logtime',
					align : 'center',
					width : '200px',
					text : items.logtime.toLocaleString()		
				}))).appendTo($('#adminRecipeListTable'));
			}); //each
			
			$('<td/>').append($('<input/>',{
				id : 'adminRecipeDeleteBtn',
				type : 'button',
				value : '선택삭제'
			})).appendTo($('#adminRecipeListTable'));
			
			//페이징처리
			$('#adminRecipePagingDiv').html(data.adminPaging.pagingHTML);
			
		}, // success
		error : function(err) {
			console.log(err);
			} // error
	});	

	//전체선택 and 전체해제
	$('#allSelect').click(function(){
		if($('#allSelect').prop('checked'))
			$('input[name="check"]').prop('checked',true);
		else
			$('input[name="check"]').prop('checked',false);
	});
	//선택삭제
	$('#adminRecipeDeleteBtn').click(function(){
		var count = $('input[name="check"]:checked').length; // 체크 된 개수
		if(count==0)
			alert('삭제 할 항목을 선택하세요');
		else 
			if(confirm('정말로 삭제 하시겠습니까?')) $('#adminRecipeListForm').submit();
	});
}); //document

$('#adminrecipeSearchBtn').click(function(){
	//alert('버튼확인')
	if($('#recipeSearchkeyword').val() == '')
		alert('검색어를 입력하세요');
	else{
		$.ajax({
			type: 'post',
			url: '/index/admin/adminrecipeSearch',
			data: $('#recipeSearchForm').serialize(),
			dataType: 'json',
			success: function(data){
				//테이블에서 기존 목록제거
				$('#adminRecipeListTable tr:gt(0)').remove();
				
				$.each(data.list, function(index, items){
				$('<tr/>').append($('<a/>',{
					id : 'adminRecipeseq',
					href : '/index/recipeBoard/recipeBoardView?seq='+items.seq+'&pg='+$('#pg').val(),
					class: 'adminRecipeseq'+items.seq
				}).append($('<td/>',{
					id : 'seq',
					width : '200px',
					text : ' ' + items.seq
				}).prepend($('<input/>',{
					type : 'checkbox',
					name : 'check'
				})))
				.append($('<td/>',{
					id : 'nickName',
					align : 'center',
					width : '100px',
					text : items.nickName
				}))
				.append($('<td/>',{
					id : 'subject',
					align : 'center',
					width : '300px',
					text : items.subject
				}))
				.append($('<td/>',{
					id : 'logtime',
					align : 'center',
					width : '200px',
					text : items.logtime.toLocaleString()		
				}))).appendTo($('#adminRecipeListTable'));
				}); //each
			$('<td/>').append($('<input/>',{
				id : 'adminRecipeDeleteBtn',
				type : 'button',
				value : '선택삭제'
			})).appendTo($('#adminRecipeListTable'));
			//페이징처리
			$('#adminRecipePagingDiv').html(data.adminPaging.pagingHTML);
			}, // success
			error : function(err) {
				console.log(err);
			} // error
		});	
		//전체선택 and 전체해제
		$('#allSelect').click(function(){
		if($('#allSelect').prop('checked'))
			$('input[name="check"]').prop('checked',true);
		else
			$('input[name="check"]').prop('checked',false);
		});
		//선택삭제
		$('#adminRecipeDeleteBtn').click(function(){
		var count = $('input[name="check"]:checked').length; // 체크 된 개수
		
		if(count==0)
			alert('삭제 할 항목을 선택하세요');
		else 
			if(confirm('정말로 삭제 하시겠습니까?')) $('#adminRecipeListForm').submit();
		}); //document
	}
});
