<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="productBoardWriteForm">
<div>
	<div>
		<ul>
			<li>
				상품 선택 <select id="productSelect">
				</select>
			</li>
			
			<li>
				상품코드<span id="productCode"></span>
				<input id="productCodeHide" name="productCode" type="text">
			</li>
			<li>
				상품명<span id="productName"></span>
				
			</li>
			<li>
				상품카테고리<span id="productCategory"></span>
			</li>
			<li>
				<span><img id="mainPhoto"></span>
			</li>
			<li>
				원산지<span id="productOrigin"></span>
			</li>
			<li>
				중량<span id="productWeight"></span>
			</li>
			<li>
				유통기한<span id="productLife"></span>
			</li>
		</ul>
		<ul>
			<li>
				제목<input type="text" name="productSubject" id="productSubject">
			</li>
			
			<li>
				금액<input type="text" name="productPrice" id="productPrice">
			</li>
			<li>
				수량<input type="text" name="productQty" id="productQty">
			</li>
			<li>
				내용<textarea name="productContent" id="productContent"></textarea>
			</li>
			
		</ul>
		<button type="button" id="productBoardWriteBtn">작성하기</button>
		<button type="button">다시작성</button>
		<button type="button">취소</button>
	</div>
	
</div>
</form>



<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:'/index/product/getProductMangeList',
		data : $('#pg').val(),
		type: 'post',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<option/>',{
					'valute': items.productName,
					'text' : items.productName
				}).addClass('productNameOption').appendTo($('#productSelect'));
			});
			$('#productSelect').change(function(){
				$.ajax({
					data: {productName : $('#productSelect').val()},
					url:'/index/product/getProduct',
					type:'post',
					success:function(data){
						alert(JSON.stringify(data));
						$('#productCode').html(data.productCode);
						$('#productName').html(data.productName);
						$('#productCategory').html(data.productCategory);
						$('#mainPhoto').attr('src','/index/storage/'+data.mainPhoto);
						$('#productOrigin').html(data.productOrigin);
						$('#productWeight').html(data.productWeight);
						$('#productLife').html(data.productLife);
						$('#productCodeHide').attr('value',data.productCode);
					},
					error:function(e){
						
					}
				});
			})
			
			
		},//success
		error : function(e){
			
		}
	
	})
})
$('#productBoardWriteBtn').click(function(){
	var productContent = CKEDITOR.instances.productContent.getData();
	$.ajax({
		data:{ 'productContent': productContent,
				'productCode': $('#productCodeHide').val(),
				'productQty' : $('#productQty').val(),
				'productSubjcet':$('#productSubject').val(),
				'productPrice' : $('#productPrice').val()
				},
		type:'post',
		url:'/index/product/productBoardWrite',
		success:function(){
			alert('등록완료')
			location.href="/index/product/productMangeList"
		},
		error:function(e){
			
		}
	});
});

CKEDITOR.replace('productContent', {
	filebrowserUploadUrl : '/index/board/imageUpload'
});
</script>

</body>
</html>