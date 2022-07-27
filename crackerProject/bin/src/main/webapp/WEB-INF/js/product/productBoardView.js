$(function(){
	$.ajax({
		url : '/index/product/getProductBoardView',
		data : {'seq' : $('#seq').val()},
		type:'post',
		success : function(data){
			//alert(JSON.stringify(data));
			$('#productMainPhoto').attr('src','/index/storage/'+data.mainPhoto);
			$('#productSubject_dt').html(data.productSubject)
			$('#productPrice_b').html(data.productPrice+"원");
			$('#productWeight_dd').html(data.productWeight);
			$('#productLife_dd').html(data.productLife);
			$('#productPrice_total').html(data.productPrice+"원");
			$('#productContent_div').html(data.productContent);
		},
		error:function(e){
			console.log(e);
		}
	});
	
});