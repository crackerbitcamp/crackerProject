$(function(){
	$.ajax({
		url : '/index/product/getProductBoardList',
		data: {'productCategory' : $('#productCategory').val()},
		type : 'post',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				
				$('<div/>').addClass('productListLi')
				.append($('<a/>',{
					href : '#',
					class:'productListA'+items.seq
				})
				.append($('<div/>').append($('<img/>',{
					src : '/index/storage/'+items.mainPhoto,
					width : '100%',
					height : '300px'
						
				}))).append($('<div/>',{
					id : 'productName',
					text : '['+items.productName+'] '+items.productSubject
				})).append($('<div/>',{
					id : 'productPrice',
					text : +items.productPrice+'원 / ' + '남은 수량 : '+items.productQty+'개'
					
				})))
				.appendTo($('#productListForm'));
				
				$('.productListA'+items.seq).click(function(){
					location.href = '/index/product/productBoardView?seq='
						+items.seq
					
				});//.productListA'+items.productSeq
			});
		},
		error : function(e){
			
		}
		
	});
});