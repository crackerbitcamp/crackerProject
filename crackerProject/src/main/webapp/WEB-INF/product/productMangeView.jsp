<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/productCSS/productWriteForm.css" rel="stylesheet"
	type="text/css" />
<link href="/index/css/productCSS/product.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="productBoarContainer" >
		<div class="productBoarContent">
			
			<div class="productBoardLoadForm">
				<ul>
					<li>
						<div class="inputTextForm_product">
							<span>상품코드: </span><span id="productCode"></span>
							<input id="productCodeHide" name="productCode" value="${productCode }"type="hidden" />

						</div>
					</li>
					<li>
						<div class="inputTextForm_imgForm">
							<img id="mainPhoto"/>
						</div>
					</li>

					<li>
						<div class="inputTextForm_product">
							<span>상품명 : </span><span id="productName" class="productLoadSpan"></span>
						</div>
					</li>
					<li>
						<div class="inputTextForm_product">
							<span>카테고리 : </span><span id="productCategory"
								class="productLoadSpan"></span>
						</div>
					</li>
					<li>
						<div class="inputTextForm_product">
							<span>원산지 : </span><span id="productOrigin"
								class="productLoadSpan"></span>
						</div>
					</li>

					<li>
						<div class="inputTextForm_product">
							<span>중량 : </span><span id="productWeight"
								class="productLoadSpan"></span>
						</div>
					</li>

					<li>
						<div class="inputTextForm_product">
							<span>유통기한 : </span><span id="productLife"
								class="productLoadSpan"></span>
						</div>
					</li>
				</ul>
			</div>
			<button type="button" id="productUpdateFormBtn" class="writeBottomBtnClass">수정</button>
					<button type="button" id="productDeleteBtn" class="writeBottomBtnClass">삭제</button>
					<button type="button" class="writeBottomBtnClass" onclick="location.href='/index/product/productMangeList'">목록</button>
		</div>
	</div>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url :'/index/product/getProduct',
		data:{'productCode' : $('#productCodeHide').val()},
		type:'post',
		success : function(data){
			//alert(JSON.stringify(data));
			$('#mainPhoto').attr('src','/index/storage/'+data.mainPhoto);
			$('#productCode').html(data.productCode);
			$('#productName').html(data.productName);
			$('#productCategory').html(data.productCategory);
			$('#productOrigin').html(data.productOrigin);
			$('#productLife').html(data.productLife);
			$('#productWeight').html(data.productWeight);
		},
		error:function(e){
			
		}
		
	});
	$('#productUpdateFormBtn').click(function(){
		location.href="/index/product/productUpdateForm?productCode="+$('#productCodeHide').val()
		
	});
	$('#productDeleteBtn').click(function(){
		if(confirm('선택하신 항목 삭제하시겠습니까')){
			$.ajax({
				data:{'productCode' : $('#productCodeHide').val()},
				type:'post',
				url :'/index/product/productDelete',
				success : function(){
					alert('삭제되었습니다.');
					location.href='/index/product/productMangeList'
				},
				error:function(e){
					console.log(e)
				}
			});
		}//if confirm
	});
})
</script>
</body>
</html>