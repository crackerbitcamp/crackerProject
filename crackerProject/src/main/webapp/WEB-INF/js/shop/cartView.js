/*

$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/index/product/getUserShopitemList',
		data :  'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			alert('데이터확인'+data)
			
		},
		error: function(e){
			 console.log(JSON.stringify(error));
		}
		
	});
});
 */






$('#headerLogo').click(function(){
	location.href='/index/shop/shopmain'
});





