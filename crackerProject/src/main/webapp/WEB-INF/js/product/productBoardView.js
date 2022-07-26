$(function(){
	$.ajax({
		url : '/index/product/getProductBoardView',
		data : {'seq' : $('#seq').val()},
		type:'post',
		success : function(data){
			var productPrice = parseInt(data.productPrice);
			var qty =$('#shopqty').val();
			//alert(JSON.stringify(data));
			$('#productMainPhoto').attr('src','/index/storage/'+data.mainPhoto);
			$('#productSubject_dt').html(data.productSubject)
			$('#productPrice_b').html(data.productPrice+"원");
			$('#productWeight_dd').html(data.productWeight);
			$('#productLife_dd').html(data.productLife);
			$('#productPrice_total').html(productPrice * parseInt(qty)+"원");
			$('#productContent_div').html(data.productContent);
			$('#totalprice').val(productPrice * parseInt(qty))
			var input ;
			$('.minus').click(function(){
			    input = $('.input').val();
				if(input > 0){
				$('.input').val((input-1));
				$('#productPrice_total').html(productPrice * (parseInt(input)-1)+"원");
				$('#totalprice').val(productPrice * (parseInt(input)-1))
				}
			});
			$('.plus').click(function(){
			    input = $('.input').val();
				$('.input').val((parseInt(input)+1));
				$('#productPrice_total').html(productPrice * (parseInt(input)+1)+"원");
				$('#totalprice').val(productPrice * (parseInt(input)+1))
			});
		},
		error:function(e){
			console.log(e);
		}
	});
	
});