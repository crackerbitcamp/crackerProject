$(function(){
	const a = ['밀키트', '고기','냉동음식','생선']
	$.each(a,function(categoryIndex, item){
		$('<div/>',{
			'text' : item,
			'class' : 'productFormTitle'
		}).appendTo($('.productForm'));
		$('<ul/>').addClass('productListCategory_ul'+categoryIndex)
		.appendTo($('.productForm'));
		//alert(item);
		$.ajax({
			url:"/index/product/getProductBoardList",
			type:'post',
			dataType:'json',
			data:{'productCategory' : item},
			success:function(data){
				//alert(JSON.stringify(data));
				$.each(data.list, function(index, items){
					
					$('<li/>').addClass('productListLi')
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
					.appendTo($('.productListCategory_ul'+categoryIndex));
					
					$('.productListA'+items.seq).click(function(){
						location.href = '/index/product/productBoardView?seq='
							+items.seq
						
					});//.productListA'+items.productSeq
				});0
			},
			error:function(e){
			}
			
			
		})//ajax
	});//each
});