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
	location.href="/index/member/memberWriteForm"
	
});