$(function(){
	var memberEmail = $('#memberEmail').val();
	$.ajax({
		type : 'post',
		data : {'memberEmail' : memberEmail},
		url : '/index/shop/getcartView',
		success:function(data){
			//alert(JSON.stringify(data));
			var productdelivery = 0; //배송비
			$.each(data,function(index,items){
				
				$('<input/>', {
					type : 'hidden',
					id : 'contentA'
				}).appendTo($('.itemSearch'));
				$('#contentA').html(items.productcontent);
			 	var p = $('#contentA').text();
				$('<input>',{
					type : 'hidden',
					class : 'total1',
					value : items.producttotalprice
				}).appendTo($('.itemSearch'));
				
				$('<div>',{
					class : 'itemtext'
				})
				$('<div/>').addClass('body').append($('<div/>').append($('<div/>',{
					class : 'item-checkbox-select'
				}).append($('<input/>',{
					type : 'checkbox',
					class : 'chk',
					name : 'chk',
					checked : 'checked',
					value : items.productseq,
					item : items.producttotalprice
				})))).append($('<div/>',{
					class : 'item-product-img'
				}).append($('<img>',{
					src : '/index/storage/'+items.productimg,
					class : 'itemimg'
				}))).append($('<div/>',{
					class : 'item-product-select'
				}).append($('<h3/>',{
					text : items.productsubject
				})).append($('<p/>',{
					text : p
				}))).append($('<div/>',{
					class : 'item-price-select'
				}).append($('<span/>',{
					text : items.productqty+"개"
				}))).append($('<div/>',{
					class : 'item-price-select'
				}).append($('<span/>',{
					text : items.productprice+"원"
				}))).appendTo($('.test'))
				productdelivery = items.productdelivery;
		
				
			})
			var pricesum = 0;
			
			
			$('.total1').each(function(){
				pricesum += parseInt($(this).val());
			});
			
			if(pricesum <= 19800){
				productdelivery = 2500
			}
			$('.final-product-price').html(pricesum)
			$('.final-delivery-charge').html(productdelivery)
			$('.final-order-price').html((pricesum + productdelivery));
			var chec=pricesum;
			var checkitem;

			$('.chk').on('change',function(){
				var tmp = $(this).prop('checked');
				checkitem = $(this).attr('item');	//개당 총금액
				if(tmp){
					chec += parseInt(checkitem)
					$('.final-product-price').html(chec)
					$('.final-delivery-charge').html(productdelivery)
					$('.final-order-price').html((parseInt(chec) + productdelivery));
				}else if(!tmp){
					chec -= parseInt(checkitem)
					$('.final-product-price').html(chec)
					$('.final-delivery-charge').html(productdelivery)
					$('.final-order-price').html((parseInt(chec) + productdelivery));
				}
				$('.final-product-price').html(chec)
				$('.final-delivery-charge').html(productdelivery)
				$('.final-order-price').html((parseInt(chec) + productdelivery));
				
			});
			
			

//			$('#chk-all').on('change',function(){
//				var tmp = $(this).prop('checked');
//				if(tmp){
//					$('.final-product-price').html(pricesum)
//					$('.final-delivery-charge').html(productdelivery)
//					$('.final-order-price').html((pricesum + productdelivery))
//					$('.chk').attr('checked',true);
//				}else{
//					chec =0;
//					$('.final-product-price').html(0)
//					$('.final-delivery-charge').html(0)
//					$('.final-order-price').html(0);
//					$('.chk').attr('checked',false);
//				}
//			});
		},error:function(e){
			console.log(e);
		}
	});
});
$(function(){
	var test = '';

	$('#itemDel').click(function(){
		$('.chk').each(function(){
			var tmp = $(this).prop('checked');
			if(tmp){
				var data = $(this).val();
				$.ajax({
					type : 'post',
					data : {'productseq' : data},
					url : '/index/shop/cartViewDelete',
					success:function(){
						
					},error:function(e){
						console.log(e);
					}
				});
			}
		});
		swal('삭제가 완료되었습니다.','','success').then(function(){
			location.reload();
		});
	});
});
