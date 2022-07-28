$('#productBtn').click(function() {
	var memberemail = $('#memberemail').val();
	if (!memberemail) {
		swal('로그인을 해주세요.', '', 'warning').then(function() {
			location.href = '/index/member/memberLoginForm'
		});
	} else {
		$.ajax({
			type : 'post',
			data : $('#productBoardViewForm').serialize(),
			url : '/index/shop/shopPayForm',
			success : function(data) {
				if (!data.memberDTO.memberaddress1) {
					swal('주소를 먼저 입력해주세요', '', 'warning').then(function() {
						location.href = '/index/shop/shopproductbuy'
					});
				}else{
				location.href = '/index/shop/shopPay'
				}
			},
			error : function(e) {
				console.log(e);
			}

		});
	}

});

$('#cartBtn').click(function(){
	var memberemail = $('#memberemail').val();
	if (!memberemail) {
		swal('로그인을 해주세요.', '', 'warning').then(function() {
			location.href = '/index/member/memberLoginForm'
		});
	}else if($('#totalprice').val() == '0'){
		swal('수량을 입력해주세요','','warning')
	}
	else {
		$.ajax({
			type : 'post',
			data : $('#productBoardViewForm').serialize(),
			url : '/index/shop/shopcartForm',
			success : function(data) {
				if(data.Memberaddress1 == null){
					swal('주소를 먼저 입력해주세요', '', 'warning').then(function() {
						location.href = '/index/shop/shopproductbuy'
				});
				}else{
					swal('장바구니에 추가되었습니다.','','success')
				}
			},
			error : function(e) {
				console.log(e);
			}

		});
	}
});

