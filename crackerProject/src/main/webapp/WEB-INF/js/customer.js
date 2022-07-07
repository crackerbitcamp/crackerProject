$(function(){
	$('#customerWriteBtn').click(function(){
		$('#idDiv').empty();
		$('#emailDiv').empty();
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#id').val()==''){
			$('#idDiv').html('아이디를 입력하세요');

		}else if($('#email').val()==''){
	    	$('#emailDiv').html('이메일을 입력하세요');
	    
		}else if($('#subject').val()==''){
	    	$('#subjectDiv').html('제목을 입력하세요');
	    	
		}else if($('#content').val()==''){
	    	$('#contentDiv').html('내용을 입력하세요');
	    	
		}else{
			$.ajax({
				type: 'post',
				url: '/index/customer/customerWrite',
				data: {'subject': $('#subject').val(),
				       'content': $('#content').val(),
				       'id': $('#id').val(),
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