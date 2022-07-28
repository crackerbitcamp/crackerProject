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
<form id="productUpdateForm">
	<div class="productBoarContainer" >
		<div class="productBoarContent">
			
			<div class="productBoardLoadForm">
				<ul>
					<li>
						<div class="inputTextForm_update">
							<span>상품코드: </span><input type="text" class="productInput" name="productCode" id="productCode">
							<input id="productCodeHide" name="productCodeHide" value="${productCode }"type="hidden" />

						</div>
					</li>
					<li>
						<div class="inputTextForm_imgForm">
							<img name="mainPhoto" id="mainPhoto">
						</div>
					</li>

					<li>
						<div class="inputTextForm_update">
							<span>상품명 : </span><input class="productInput" type="text" name="productName" id="productName"/>
						</div>
					</li>
					<li>
						<div class="inputTextForm_update">
							<span>카테고리 : </span>
							<select name="productCategory" id="productCategory" class="productInput">
								<option value="밀키트">밀키트</option>
								<option value="고기">고기</option>
								<option value="생선">생선</option>
								<option value="냉동식품">냉동식품</option>
							</select>
						</div>
					</li>
					<li>
						<div class="inputTextForm_update">
							<span>원산지 : </span>
							<input type="text" name="productOrigin" class="productInput" id="productOrigin"/>
						</div>
					</li>

					<li>
						<div class="inputTextForm_update">
							<span>중량 : </span>
							<input type="text" name="productWeight" class="productInput" id="productWeight"/>
						</div>
					</li>

					<li>
						<div class="inputTextForm_update">
							<span>유통기한 : 
							</span>
							<input type="text" name="productLife" class="productInput"id="productLife"/>
						</div>
					</li>
				</ul>
			</div>
			<button type="button" id="productUpdateBtn" class="writeBottomBtnClass">수정</button>
					<!-- <button type="button" id="resetBtn" class="writeBottomBtnClass">다시작성</button> -->
					<button type="button" class="writeBottomBtnClass" onclick="location.href='/index/product/productMangeList'">목록</button>
		</div>
	</div>
</form>
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
			$('#productCode').val(data.productCode);
			$('#productName').val(data.productName);
			$('#productCategory').val(data.productCategory);
			$('#productOrigin').val(data.productOrigin);
			$('#productLife').val(data.productLife);
			$('#productWeight').val(data.productWeight);
		},
		error:function(e){
			
		}
		
	});

});
$('#productUpdateBtn').click(function(){
	$.ajax({
		data:$('#productUpdateForm').serialize(),
		type:'post',
		url :'/index/product/productUpdate',
		success : function(){
			alert('수정되었습니다.');
			location.href="/index/product/productMangeList"
		},
		error:function(e){
			console.log(e)
		}
	});
});
</script>
</body>
</html>