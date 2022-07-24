$(function(){
	$.ajax({
		type: 'post',
		url: '/index/customer/getCustomer',
		dataType: 'json',
		success:function(data){
			if(data.name != null){
				$('#name').val(data.name);
				$('#email').val(data.email);
				
			}else{
			alert('먼저 회원가입을하세요')
			location.href = '/index/member/memberLoginForm';
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
	
	$('#customerWriteBtn').click(function(){
		$('#idDiv').empty();
		$('#emailDiv').empty();
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()==''){
	    	$('#subjectDiv').html('제목을 입력하세요');
	    	
		}else if($('#content').val()==''){
	    	$('#contentDiv').html('내용을 입력하세요');
	    	
		}else{
			$.ajax({
				type: 'post',
				url: '/index/customer/customerWrite',
				data: {'subject': $('#subject').val(),
				       'content': $('#content').val(),
				       'name': $('#name').val(),
				       'email': $('#email').val()
				},
		       	success:function(){
					alert('등록되었습니다.');
		            location.href='/index';
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	});
});