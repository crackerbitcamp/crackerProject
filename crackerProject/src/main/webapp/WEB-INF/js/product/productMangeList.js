$('#productWriteFormBtn').click(function(){
	location.href="/index/product/productWriteForm";
});

$(function(){
	$.ajax({
		url:'/index/product/getProductMangeList',
		data : $('#pg').val(),
		type: 'post',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<li/>').addClass('getProductMangeListLi')
				.append($('<div/>',{
							'text' : items.productCode
					}))
				.append($('<div/>')
						.append($('<img/>',{
							class : 'productMengeListImg',
							'src' : '/index/storage/'+items.mainPhoto
						})
					)).append($('<div/>',{
							'text' : items.productCategory
							
					}))
					.append($('<div/>',{
							'text' : items.productName
					}))
					
					.appendTo($('#productMangeListUl'))
			});
		},
		error : function(e){
			
		}
		
		
	});
});