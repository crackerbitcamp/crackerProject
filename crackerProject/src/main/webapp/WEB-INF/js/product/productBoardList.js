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
					'href' : '#',
					class:'productListA'+items.seq
				})
				
				.append($('<div/>',{
					'text' : '상품명:'+items.productName,
					
						
				})).append($('<div/>').append($('<img/>',{
					'src' : '/index/storage/'+items.mainPhoto
				}))).append($('<div/>',{
					'text' : items.productSubject,
					
				})).append($('<div/>',{
					'text' : '가격:'+items.productPrice+'원',
					
				})).append($('<div/>',{
					'text' : '남은수량:'+items.productQty+'개',
					
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