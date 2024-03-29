$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/index/admin/getadminMemberList',
		data : 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			
			$.each(data.list, function(index, items) {
				
				$('<tr/>').append($('<a/>',{
					href : '#',
					id : 'adminMemberViewBtn',
					class:'adminMemberViewBtn'+items.memberseq
				}).append($('<td/>',{
					id : 'memberid',
					align : 'center',
					width : '300px',
					text : ' ' + items.memberemail
				})/*.prepend($('<input/>',{
					type : 'checkbox',
					name : 'check'
				}))*/)
				.append($('<td/>',{
					id : 'membername',
					align : 'center',
					width : '100px',
					text : items.membername
				}))
				.append($('<td/>',{
					id : 'membernickname',
					align : 'center',
					width : '300px',
					text : items.membernickname
				}))
				.append($('<td/>',{
					id : 'membertel',
					align : 'center',
					width : '200px',
					text : items.membertel1 + '-' + items.membertel2 + '-' + items.membertel3
				}))).appendTo($('#adminMemberListTable'));
				
				$('.adminMemberViewBtn'+items.memberseq).click(function(){
					location.href='/index/admin/adminMemberView?pg='+$('#pg').val()+'&seq='+items.memberseq;
				});
			}); //each
			
			/*$('<td/>').append($('<input/>',{
				id : 'adminMemberdDeleteBtn',
				type : 'button',
				value : '선택삭제'
			})).appendTo($('#adminMemberListTable'));*/
			
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


// 회원리스트 view




// 검색

$('#adminMemberSearchBtn').click(function(){
	if($('#memberSearchkeyword').val() == '') 
		alert('검색어를 입력하세요');
	else{
		$.ajax({
			type: 'post',
			url: '/index/admin/adminMemberSearch',
			data: $('#adminMemberSearchForm').serialize(), 
			dataType: 'json',
			success: function(data){
				
				$('#adminMemberListTable tr:gt(0)').remove();
				
				$.each(data.list, function(index, items) {
					
					$('<tr/>').append($('<a/>',{
						href : '../admin/adminMemberView',
						id : 'adminMemberViewBtn'
					}).append($('<td/>',{
						id : 'memberid',
						align : 'center',
						width : '300px',
						text : ' ' + items.memberemail
					})/*.prepend($('<input/>',{
						type : 'checkbox',
						name : 'check'
					}))*/)
					.append($('<td/>',{
						id : 'membername',
						align : 'center',
						width : '100px',
						text : items.membername
					}))
					.append($('<td/>',{
						id : 'membernickname',
						align : 'center',
						width : '300px',
						text : items.membernickname
					}))
					.append($('<td/>',{
						id : 'membertel',
						align : 'center',
						width : '200px',
						text : items.membertel1 + '-' + items.membertel2 + '-' + items.membertel3
					}))).appendTo($('#adminMemberListTable'));
			}); // 제이쿼리 for문
			
			
				//페이징처리
				$('#adminMemberPagingDiv').html(data.adminPaging.pagingHTML);
				
			},
			error: function(e){
				console.log(e);
			}
		});
	}
});


