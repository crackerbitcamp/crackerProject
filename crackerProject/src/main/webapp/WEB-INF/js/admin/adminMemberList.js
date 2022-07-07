$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/index/admin/getadminMemberList',
		data : 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			
			$.each(data.list, function(index, items) {
				
				$('<tr/>').append($('<td/>',{
					text : ' ' + items.memberid
				}).prepend($('<input/>',{
					type : 'checkbox',
					name : 'check',
					value : items.memberid
				})))
				.append($('<td/>',{
					align : 'center',
					text : items.membername
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.memberemail1 + '@' + items.memberemail2
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.membertel1 + '-' + items.membertel2 + '-' + items.membertel3
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.membernickname
				})).appendTo($('#adminMemberListTable'));
				
				
			}); //each
			
			//페이징처리
			$('#adminMemberPagingDiv').html(data.adminPaging.pagingHTML);
			
		}, // success
		
		error : function(err) {
			console.log(err);
			} // error
			
	}); //ajax 
	
	
	//전체선택 and 전체해제
	
	$('#allSelect').click(function(){
		
		if($('#allSelect').prop('checked'))
			$('input[name="check"]').prop('checked',true);
		else
			$('input[name="check"]').prop('checked',false);
	});
	
	//선택삭제
	
	$('#adminMemberdDeleteBtn').click(function(){
		var count = $('input[name="check"]:checked').length; // 체크 된 개수
		
		if(count==0)
			alert('삭제 할 항목을 선택하세요');
		else 
			if(confirm('정말로 삭제 하시겠습니까?')) $('#adminMemberListForm').submit();
	});
	
	
}); //document
