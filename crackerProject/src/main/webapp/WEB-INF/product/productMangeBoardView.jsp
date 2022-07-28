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
<form id="productBoardWriteForm">

		<div class="productBoardWriteForm">
			<div class="productBoarTitle"></div>
			<div class="productBoarContainer" style=>
				<div class="productBoarContent">
					<div class="mainPhotoDiv">
						<img id="mainPhoto">
					</div>
					<div class="productBoardLoadForm">
						<ul>
							<li>
								<div class="inputTextForm_product">
									<span>상품코드: </span><span id="productCode" class="productLoadSpan"></span>
									<input id="seq" value="${seq }"type="hidden"/>
								
								</div>
							</li>

		
							<li>
								<div class="inputTextForm_product">
								<span>상품명 : </span><span id="productName" class="productLoadSpan"></span>
								</div>
							</li>
							<li>
								<div class="inputTextForm_product">
								<span>카테고리 : </span><span id="productCategory" class="productLoadSpan"></span>
								</div>
							</li>
							<li>
								<div class="inputTextForm_product">
									<span>원산지 : </span><span id="productOrigin" class="productLoadSpan"></span>
								</div>
							</li>
							
							<li>
								<div class="inputTextForm_product">
									<span>중량 : </span><span id="productWeight" class="productLoadSpan"></span>
								</div>
							</li>
							
							<li>
								<div class="inputTextForm_product">	
									<span>유통기한 : </span><span id="productLife" class="productLoadSpan"></span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<ul>
					<li>
						<div class="inputTextForm">
						
							<span>제목 : </span><span id="productSubject" class="productInput"></span>
						</div>
					</li>

					<li>
						<div class="inputTextForm">
							<span>금액 : </span><span id="productPrice" class="productInput"></span>
						</div>
					</li>
					<li>
						<div class="inputTextForm">
							<span>수량 : </span><span id="productQty" class="productInput"></span>
						</div>
					</li>



				</ul>
				<div class="inputTextForm">
					<span  id="productContent"></span>
					

					<button type="button" id="productBoardWriteBtn" class="writeBottomBtnClass">수정하기</button>
					<button type="button" id="productBoardUpdateBtn"class="writeBottomBtnClass">삭제</button>
					<button type="button" class="writeBottomBtnClass">목록</button>
		
				</div>
			</div>

		</div>
	</form>
<script type="text/javascript">
$(function(){
	$.ajax({
		url :'/index/product/getProductBoardView',
		data:{'seq' : $('#seq').val()},
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
			$('#productSubject').html(data.productSubject);
			$('#productQty').html(data.productQty);
			$('#productPrice').html(data.productPrice);
			$('#productContent').html(data.productContent);
		},
		error:function(e){
			
		}
		
	});
	
});

$('#productBoardUpdateBtn').click(function(){
	if(confirm('선택하신 항목 삭제하시겠습니까')){
		$.ajax({
			url :'/index/product/productBoardDelete',
			data:{'seq' : $('#seq').val()},
			type:'post',
			success : function(){
				alert('삭제되었습니다.');
				location.href='/index/product/productMangeList'
			},
			error:function(e){
				
			}
		});//ajax
	}
});
</script>
</body>
</html>