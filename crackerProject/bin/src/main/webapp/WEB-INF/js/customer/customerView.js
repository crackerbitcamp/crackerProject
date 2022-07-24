$(function(){
	$.ajax({
		type : 'post',
		url : '/index/customer/getCustomerView',
		data : 'seq=' + $('input[name=seq]').val(),
		dataType:'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$('#name').html(data.customerDTO.name);
			$('#email').html(data.customerDTO.email);
			$('#subject').html(data.customerDTO.subject);
			$('#content').html(data.customerDTO.content);
			
		},
		error:function(	e){
			console.log(e);
		}
	});
});