$(function(){
	$.ajax({
		url:"/index/product/getProductBoardList",
		type:'post',
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<div/>').addClass('productShopList1').append($('<div/>',{
					'text' : items.productName,
					'text-align' : 'center'
						
				})).append($('<div/>').append($('<img/>',{
					'src' : '/index/storage/'+items.mainPhoto,
					'width' : '300px',
					'height' : '300px'
				}))).append($('<div/>',{
					'text' : items.productSubject,
					'text-align' : 'center'
				}))
				
				.appendTo($('.productForm'))
			});
		},
		error:function(e){
			
		}
	
	})
});