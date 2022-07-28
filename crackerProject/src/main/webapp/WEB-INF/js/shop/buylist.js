$(function(){
	$.ajax({
		type : 'post',
		data : {'memberemail' : $('#memberemail').val()},
		url : '/index/shop/getbuylist',
		success:function(data){
	         $.each(data,function(index,items){

	             $('<div/>').addClass('body').append($('<div/>').append($('<div/>',{
	                class : 'item-checkbox-select'
	             }).append($('<span/>',{
	                class : 'chk',
	                name : 'chk',
	                text : items.productbuydate,
	             })))).append($('<div/>',{
	                class : 'item-product-img'
	             }).append($('<img>',{
	                src : '/index/storage/'+items.productimg,
	                class : 'itemimg'
	             }))).append($('<div/>',{
	                class : 'item-product-select'
	             }).append($('<h3/>',{
	                text : items.productsubject
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
		},
		error:function(e){
			console.log(e);
		}
	});
});
