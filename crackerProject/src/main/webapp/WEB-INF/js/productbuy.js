// 회원정보 받아오기
$(function() {
	$.ajax({
		type : 'post',
		url : '/index/shop/getProductBuy',
		data : {'memEmail' : $('#memEmail').val()},
		dataType : 'json',
		success:function(data){
			alert(JSON.stringify(data));
			$('#name').val(data.name);
			$('#email').val(data.email);
			
			$('#equal_member').change(function() {
			    var checked = $(this).prop('checked');  // checked 상태 (true, false)
			    console.log(checked);
			 
			    if(checked){
			    	$('#address_name').val($('#name').val());
			    	$('#address_phone').val($('#phone').val());
				}else{
					$('#address_name').val('');
					$('#address_phone').val('');
				}
			}); //change
			
		},error:function(e){
			console.log(e);
		}
	}); //ajax
	
});

//주소지 등록
$('#memberaddress_updateBtn').click(function(){
	$.ajax({
		url: '/index/shop/memberaddressUpdate',
		type:'post',
		data: $('#memberaddressForm').serialize(),
		success:function(){
			alert('주소지를 업데이트 했습니다.');
			location.href='/index/shop/shopmain';
		},
		error:function(e){
			console.log(e);
		}
	});
});




// DAUM 우편번호
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}