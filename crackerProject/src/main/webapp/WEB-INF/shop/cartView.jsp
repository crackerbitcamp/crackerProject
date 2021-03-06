<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d84eab0825.js" crossorigin="anonymous"></script>
<style type="text/css" src="/index/css/reset.css"></style>
<style type="text/css">

#cart_itemList {
	width: 980px;
	margin: 0 auto;
	
}

.tabs {
	text-align: center;
}	
.cartItemCount{
	float: left;
    width: 100%;
    border-top: 2px solid #0073e9;
    border-right: 2px solid #0073e9;
    border-bottom: 0;
    border-left: 2px solid #0073e9;
    padding-top: 17px;
    padding-bottom: 16px;
    background: #fff;
    font-weight: 700;
    color: #0073e9;
}


.cartTable {
	width: 100%;
	display: inline-block;
	margin-top: 30px;
	border-top: 1px solid #ddd;
    
	
}
.cartTable tr.head{
	border-bottom: 1px solid #ddd;
    display: inline-block;
    line-height: 40px;
    width: 100%;

}
.cartTable v.body{
	border-bottom: 1px solid #ddd;
	position: relative;
    display: -webkit-inline-box;
    line-height: 20px;
    font-size: 13px;
 
}

.head{
	width: 100%;
    height: 100%;
	border-bottom: 1px solid #ddd;	
	display: -webkit-inline-box;
}

.body{
	padding-top: 12px;
    padding-bottom: 12px;
    border-bottom: 1px solid #ddd;
    width: 100%;
    height: 100%;
    display: -webkit-inline-box;
    }

.cartTable th{
	
    font-size: 13px;}
    
.shop_basket{
	font-size: 24px;
	display: inline-block;
	font-weight: 900;
}
	
.shop_pree{
	display: contents;
	font-size: 13px;
}
.item-checkbox{    
	float: left;
    width: 11%;
    padding-left:14px;
}
.item-checkbox-select{
	float: left;
    width: 3%;
    padding-left:14px;
    display: flex;
}
.item-product{
	float: left;
    width: 74%;
    text-align: center;
}
.item-product-select{
	width: 69%;
    display: inline-block;
    float: left;
}

.item-price{
	float: left;
    width: 13%;
    text-align: center;
    
}
.{
	float: left;
    width: 14%;
    text-align: center;
}

.item-product-select h3{
	display: flex;
    padding-left: 15px; 
}
.item-product-select p{

    display: flex;
    padding-left: 15px;
}


.totalSum {
	    background: chartreuse;
}

.price-area{
	border: 3px solid #ddd;
    text-align: center;
    line-height: 80px;
    font-size: large;
    word-spacing: 4.6px;
    font-weight: bold;
}

#cart-button{
	text-align: center;
    padding: 30px;
}
.cart-button-shop{

	margin: 10px;
	width: 247px;
    height: 56px;
    background: #fe7600;
    border: 1px solid #fe7600;
    font-size: 16px;
    line-height: 54px;
    color: #fff;
    font-weight: bold;
    cursor: pointer;
}
.item-product-select .minus{
	left : 0;
	right: 0;
	width: 40px;
	height: 40px;
	border-right : 1px solid #dbdbdb;
	cursor: pointer;
}

.item-product-select .plus{
	left : 0;
	right: 0;
	width: 40px;
	height: 40px;
	border-left : 1px solid #dbdbdb;
	cursor: pointer;
}

.item-product-select .input{
width: 40px;
	height: 36px;
	font-size : 18px;
	font-family : "Tahoma";
	text-align : center;
	border: 2px solid;
	padding : 0;	
}
#item-product-img{
    display: flex;
    float: left;
}

.item-price-select{
	float:left;
	width:13%;
	text-align: center;
	position: relative;
    line-height: 145px;
	
}

</style>


</head>
<body>



	<div id="cartViewList">
	<input type="text" id="pg" value="${pg }"/>
	
	<section id="cart_itemList" class="cart_itemList">        
        <section class="carttitle">
            <h1 class="shop_basket">????????????</h1>
            <p class="shop_pree">???????????? (19,800??? ?????? ????????????)</p>
      
			<div class="tabs">
				<span id="cartItemCount" class="cartItemCount">???????????? (2)</span>
			</div>
		 </section>
	   	 <div id="cartContent">
	       		<div class="cartTable" >
					<div class="head" style="line-height: 48px;">
					    <div class="item-checkbox" >
					    	<input title="?????? ????????? ?????????????????? ??????" type="checkbox" checked="checked" 
					          class="chk-all" name="chk-all" id="chk-all">????????????</div>
					    <div class="item-product" >????????????</div>
					    <div class="item-price">????????????</div>
					</div>
					         
					         
					 <div class="body">
						<div class="item-checkbox-select">
						<input title="?????? ????????? ?????????????????? ??????" type="checkbox" checked="checked" 
						class="chk" name="chk" ></div>
						<div id="item-product-img"><a><img src="/index/image/??????1.jpg"></a></div>
						<div class="item-product-select">
							<h3 >?????? ???????????????</h3>
						 	<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
						 	<div style="height: 50px; display: inline-flex;">
								<button type="button" class="minus"><img src="/index/image/minus.png" style="width: 50%; height: 50%;"></button>
								<input type="text" class="input" value="1" maxlength=2>
								<button type="button" class="plus"><img src="/index/image/plus.png" style="width: 50%; height: 50%;"></button>
							</div>
						</div>
							<div class="item-price-select" >77.777???</div>
					</div>
	        	</div>
	        	
	        	<button >?????? ????????????</button>
	    	    <div class="total-price">
	                <div class="cart-total-price__inner" style="margin-top: 40px;">
	                    <div class="price-area">
	                    	??? ????????????
	                        <span class="final-product-price">12,500</span>???
	                        &#43;
	                     	??? ?????????
	                        <span class="final-delivery-charge">0</span>???
	                        &#61;
	                      	 ??? ????????????
	                        <span class="final-order-price" data-final-order-price="12500">12,500</span>???
	                    </div>
	                </div>
		
	    			<div id="cart-button">
	    				<button class="cart-button-shop" id="cart-button-shop" onClick="location.href='/index/shop/shopmain'">?????? ????????????</button>
	    				<button class="cart-button-shop"  id="cart-button-buy" >????????????</button>
	    			</div>            
	        	</div>
     	  </div>
     </section>
    </div> 

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/index/js/shop/cartView.js">
</script>


<script type="text/javascript">

$('#chk-all').click(function(){
		if($('#chk-all').is(":checked")){
			$(".chk").prop("checked", true);
		}
		else{
			$(".chk").prop("checked", false);
		}
	});
	
	
	$(".chk").click(function(){
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		
		if(total != checked) $("#chk-all").prop("checked", false);
		else $("#chk-all").prop("checked", true); 
	
});


	var input ;
	$('.minus').click(function(){
	    input = $('.input').val();
		if(input > 0){
		$('.input').prop('value',(input-1));
		}
	});
	$('.input').on('change',function(){
		input = $('.input').val();
	});
	
	$('.plus').click(function(){
	    input = $('.input').val();
		$('.input').prop('value',(parseInt(input)+1));
	});

	
</script>

</body>
</html>