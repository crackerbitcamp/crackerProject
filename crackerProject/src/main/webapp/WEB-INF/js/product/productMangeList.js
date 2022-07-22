$('#productWriteFormBtn').click(function(){
	location.href="/index/product/productWriteForm";
});

$(function(){
	$.ajax({
		url:'/index/product/getProductMangeList',
		data : $('#pg').val(),
		type: 'post',
		success : function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<li/>')
				.append($('<div/>')
						.append($('<img/>',{
							'src' : '/index/storage/'+items.mainPhoto
						}))).appendTo($('#productMangeListUl'))
			});
		},
		error : function(e){
			
		}
		
		
	});
});