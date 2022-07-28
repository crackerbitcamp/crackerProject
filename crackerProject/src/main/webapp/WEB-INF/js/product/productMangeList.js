$('#productWriteFormBtn').click(function(){
	location.href="/index/product/productWriteForm";
});

$(function(){
	$.ajax({
		url:'/index/product/getProductMangeList',
		data : {'pg':$('#pg').val()},
		type: 'post',
		success : function(data){
			
			$.each(data.list, function(index, items){
				$('<li/>').addClass('getProductMangeListLi'+items.productCode)
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
					
					$('.getProductMangeListLi'+items.productCode).click(function(){
						location.href='/index/product/productMangeView?productCode='+items.productCode
					})
			});
		},
		error : function(e){
			
		}
		
		
	});
});