$(function() {
    $("#mainPhoto").on('change', function(){
    	
    	readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#showMainPhoto').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}



$('#productWriteFormBtn').click(function(){
	
	var formData= new FormData($('#productWriteForm')[0]);
	
	$.ajax({
		url : '/index/product/productWrite',
		type : 'post',
		enctype:'multipart/form-data',
		processData: false,
		contentType: false,
		data: formData,
		success:function(){
			alert('상품 등록완료');
			location.href='/index/product/productMangeList';
		},
		error:function(e){
			console.log(e);
		}
		
	});//ajax
	
});//'#productMangeWriteForm').click

