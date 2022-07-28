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
									<span>상품코드: </span><select id="productSelect">
									<option>상품을 선택하세요</option>
									</select>
									<input
										id="productCodeHide" name="productCode" type="hidden"/>
								
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
						
							<span>제목 : </span><input type="text" name="productSubject" id="productSubject" class="productInput">
						</div>
					</li>

					<li>
						<div class="inputTextForm">
							<span>금액 : </span><input type="text" name="productPrice" id="productPrice" class="productInput">
						</div>
					</li>
					<li>
						<div class="inputTextForm">
							<span>수량 : </span><input type="text" name="productQty" id="productQty" class="productInput">
						</div>
					</li>



				</ul>
				<div class="inputTextForm">
					상세 내용을 입력해주세요
					<textarea name="productContent" id="productContent"></textarea>

					<button type="button" id="productBoardWriteBtn" class="writeBottomBtnClass">작성하기</button>
					<button type="button" class="writeBottomBtnClass">다시작성</button>
					<button type="button" class="writeBottomBtnClass">취소</button>
		
				</div>
			</div>

		</div>
	</form>



	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/info/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : '/index/product/getProductMangeList',
				data : $('#pg').val(),
				type : 'post',
				success : function(data) {
					//alert(JSON.stringify(data));
					$.each(data.list, function(index, items) {
						$('<option/>', {
							'valute' : items.productCode,
							'text' : items.productCode
						}).addClass('productCodeOption').appendTo(
								$('#productSelect'));
					});
					$('#productSelect').change(
							function() {
								$.ajax({
									data : {
										productCode : $('#productSelect').val()
									},
									url : '/index/product/getProduct',
								 	type : 'post',
									success : function(data) {
										//alert(JSON.stringify(data));
										$('#productCode')
												.html(data.productCode);
										$('#productName')
												.html(data.productName);
										$('#productCategory').html(
												data.productCategory);
										$('#mainPhoto').attr(
												'src',
												'/index/storage/'
														+ data.mainPhoto);
										$('#productOrigin').html(
												data.productOrigin);
										$('#productWeight').html(
												data.productWeight);
										$('#productLife')
												.html(data.productLife);
										$('#productCodeHide').attr('value',
												data.productCode);
									},
									error : function(e) {

									}
								});
							})

				},//success
				error : function(e) {

				}

			})
		})
		$('#productBoardWriteBtn').click(function() {
			var productContent = CKEDITOR.instances.productContent.getData();
			$.ajax({
				data : {
					'productContent' : productContent,
					'productCode' : $('#productCodeHide').val(),
					'productQty' : $('#productQty').val(),
					'productSubject' : $('#productSubject').val(),
					'productPrice' : $('#productPrice').val()
				},
				type : 'post',
				url : '/index/product/productBoardWrite',
				success : function() {
					alert('등록완료')
					location.href = "/index/product/productMangeList"
				},
				error : function(e) {

				}
			});
		});

		CKEDITOR.replace('productContent', {
			filebrowserUploadUrl : '/index/board/imageUpload'
		});
	</script>

</body>
</html>