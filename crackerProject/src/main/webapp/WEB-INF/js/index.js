$(function(){
	$('#userHistory_black').hide();
	
});

$('#headerLogo').click(function(){
	location.href="/index";
	
});

var swc = 1;
$('#memberImgBtn').click(function(){
	swc ++;
	if(swc%2==0){
		$(".userHistory").show();
		$('#userHistory_black').show();
	}else{
		$(".userHistory").hide();
		$('#userHistory_black').hide();
	}
});
$('#userHistory_black').click(function(){
	swc = 1;
	$(".userHistory").hide();
	$('#userHistory_black').hide();
});

$('#loginBtn').click(function(){
	location.href="/index/member/memberLoginForm"
});
$('#memberWriteBtn').click(function(){
	$('.memberWriteModal').fadeIn(300);
	$('.memberWriteModal').css('display','block');
	return false;
});















$('#check_all').click(function(){
	if($("#check_all").is(":checked")){ 
		$("input[name=modalchk]").prop("checked", true);
	}
	else $("input[name=modalchk]").prop("checked", false);
});

$('.join_wrap_btn').click(function(){
	if($('modalchecked1').val() == 'true' && $('#modalchecked2').val() == 'true' || $('#modalchecked3').val() == 'true'){
		location.href = '/index/member/memberWriteForm'
	}
});

$('#modalclose').click(function(){
	$('.memberWriteModal').fadeOut(300);
});

$('#modalcheck1').change(function(){
	if($('#modalcheck1').is(":checked")){
		$('#modalchecked1').prop('value','true');
	}else{
		$('#modalchecked1').prop('value','false');
	}
});

$('#modalcheck2').change(function(){
	if($('#modalcheck2').is(":checked")){
		$('#modalchecked2').prop('value','true');
	}else{
		$('#modalchecked2').prop('value','false');
	}
});

$('#modalcheck3').change(function(){
	if($('#modalcheck3').is(":checked")){
		$('#modalchecked3').prop('value','true');
	}else{
		$('#modalchecked3').prop('value','false');
	}
});