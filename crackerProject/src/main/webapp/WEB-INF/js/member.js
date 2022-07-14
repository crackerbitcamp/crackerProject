/*아이디 찾기*/
function idinfo(){
		url = "/index/member/memberFindIdForm";
		name = '';
		specs = "width=550,height=600,top=200,left=100";
		window.open(url,name,specs);
}
function telUpdateForm(){
	url = "/index/member/telUpdateForm";
	name = '';
	specs = "width=550,height=128,top=200,left=100";
	window.open(url,name,specs);
}

function emailUpdateForm(){
	url = "/index/member/emailUpdateForm";
	name = "";
	specs = "width=550, height=128, top=200, left=100";
	window.open(url,name,specs);
}

$(function(){
		$('#memberLoginId').focusout(function(){
			if(!$('#memberLoginId').val()){
				$('#memberLoginIdDiv').html('아이디를 입력해 주세요');
			}else{
				$('#memberLoginIdDiv').empty();
			}
		});
		
		
		
	$('#memberLoginpwd').focusout(function(){
		if(!$('#memberLoginpwd').val()){
			$('#memberLoginpwdDiv').html('비밀번호를 입력해 주세요');
		}else{
			$('#memberLoginpwdDiv').empty();
		}
	});
	
	$('#memberloginsubmitBtn').click(function(){
		$.ajax({
			data : $('#memberLoginForm').serialize(),
			type : 'post',
			url : '/index/member/memberLoginCheck',
			success:function(data){
				if(!data){
					swal('로그인 실패','아이디 또는 비밀번호가 틀렸습니다. 다시로그인해주세요.','warning')
				}else{
					swal('로그인 완료',""+data.membernickname+"님 환영 합니다.",'success').then(function(){
						location.href='/index'
					})
				}
			},error:function(e){
				console.log(e);
			}
		});
	});
	
	/*회원가입 수정 script*/
	$('#pwdcheckBtn').click(function(){
		$.ajax({
			data : $('#memberUpdateFormPasswordCheckForm').serialize(),
			url : '/index/member/memberUpdatePasswordCheck',
			type : 'post',
			success:function(data){
				if(!data){
					swal('비밀번호가 틀렸습니다.','비밀번호가 틀렸습니다. 다시입력해주세요.','warning');
				}else{
					location.href = '/index/member/memberUpdateForm'
				}
			},error:function(e){
				console.log(e);
			}
		});
	});
	/*회원가입 script*/

    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var getCheckpwd= RegExp(/^[a-zA-Z0-9]{8,12}$/);
	var getCheckphone = RegExp(/[0-9]{3,4}/);
	
	$('#memberWriteId').focusout(function(){
		if(!$('#memberWriteId').val()){
			$('#memberWriteIdDiv').html('아이디를 입력해 주세요');
			$('#checkId').attr('value','fail');
		}else if(!getCheck.test($('#memberWriteId').val())){
			$('#memberWriteIdDiv').html('4~12자의 영문 대소문자, 숫자만 사용 가능합니다.');
			$('#checkId').attr('value','fail');
		}else{
			$('#checkId').attr('value','ok');
			$.ajax({
				data :{'memberid' : $('#memberWriteId').val()},
				type : 'post',
				url : '/index/member/memberIdCheck',
				dataType : 'text',
				success:function(data){
					if(data == 'fail'){
						$('#memberWriteIdDiv').html('아이디가 중복되었습니다. 새로운 아이디를 입력해주세요.');
						$('#checkId').attr('value','fail');
					}else{
						$('#memberWriteIdDiv').empty();
						$('#checkId').attr('value','ok');
					}
				},error:function(e){
					console.log(e);
				}
			});
		}
	});
	
	
	$('#memberWritePwd').focusout(function(){
		if(!$('#memberWritePwd').val()){
			$('#memberWritePwdDiv').html('비밀번호를 입력해 주세요');
			$('#checkPwd').attr('value','fail');
		}else if(!getCheckpwd.test($('#memberWritePwd').val())){
			$('#memberWritePwdDiv').html('8~12자의 영문 대소문자, 숫자만 사용 가능합니다.')
			$('#checkPwd').attr('value','fail');
		}else{
			$('#memberWritePwdDiv').empty();
			$('#checkPwd').attr('value','ok');
		}
	});
	
	$('#memberWriterePwd').focusout(function(){
		if(!$('#memberWriterePwd').val()){
			$('#memberWritePwdDiv').html('재확인 비밀번호를 입력해 주세요');
			$('#checkPwd').attr('value','fail');
		}else if($('#memberWriterePwd').val() != $('#memberWritePwd').val()){
			$('#memberWritePwdDiv').html('비밀번호가 맞지않습니다.');
			$('#checkPwd').attr('value','fail');
		}else if($('#memberWriterePwd').val() == $('#memberWritePwd').val()
				&& !getCheckpwd.test($('#memberWritePwd').val())){
				$('#checkPwd').attr('value','fail');
			$('#memberWritePwdDiv').html('8~12자	의 영문 대소문자, 숫자만 사용 가능합니다.');
		}else{
			$('#memberWritePwdDiv').empty();
			$('#checkPwd').attr('value','ok');
		}
	});
	
	$('#memberWriteName').focusout(function(){
		if(!$('#memberWriteName').val()){
			$('#memberWriteNameDiv').html('이름을 입력해 주세요');
		}else{
			$('#memberWriteNameDiv').empty();
		}
	});
	$('#memberWriteEmail1').focusout(function(){
		if(!$('#memberWriteEmail1').val()){
			$('#memberWriteEmailDiv').html('이메일을 입력하여 주세요.');
		}else{
			$('#memberWriteEmailDiv').empty();
		}
	});
	
	$('#memberWriteEmail2').focusout(function(){
		if(!$('#memberWriteEmail2').val()){
			$('#memberWriteEmailDiv').html('이메일을 입력하여 주세요.');
			$('#emailselect').focus();
		}else{
			$('#memberWriteEmailDiv').empty();
		}
	});
	
	//회원가입 Email중복 체크 및 인증번호 발송
	var code;
	$('#mail-Check-Btn').click(function(){
		var email = $('#memberWriteEmail').val();
		console.log(email);
		$.ajax({
			type : 'get',
			url : '/index/member/emailcheck?email='+email,
			dataType : 'text',
			success:function(data){
				if(data == 'fail'){
					swal('해당 이메일은 이미 사용중입니다.','','warning')
				}else{
					$('#mail-Check-Num').attr('disabled',false);
				code =data;
				}
			},error:function(e){
				console.log(e);
			}
		});
	});
	
	var updateEmailnumber;
	$('#updateEmailBtn').click(function(){
		var email = $('#updatememberemail').val();
		console.log(email);
		$.ajax({
			type : 'get',
			url : '/index/member/updateEmailCheck?email='+email,
			dataType : 'text',
			success:function(data){
				if(data == 'fail'){
					swal('해당아이디는 이미 등록중입니다.',"",'warning');
					$('#updateEmailcheck').attr('disabled',true);
				}else{
					$('#updateEmailcheck').attr('disabled',false);
					updateEmailnumber = data;
					$('#emailUpdateSet').attr('value',email);
					console.log(updateEmailnumber);
				}
			},error:function(e){
				console.log(e);
			}
		});
	});
	
	$('#updateEmailcheck').blur(function(){
		const inputCode = $(this).val();
		if(inputCode == updateEmailnumber){
			$('#updateEmailDiv').html('인증번호가 일치합니다.');
			$('#updateEmailDiv').css('color','green');
			$('#updateEmailDiv').css('margin-left','72px');
			$('#updateEmailDiv').css('margin-top','10px');
			$('#updateEmailcheck').attr('disabled',true);
			$('#emailUpdatecheck').attr('value','ok');
		}else{
			$('#updateEmailDiv').html('인증번호가 일치하지 않습니다.');
			$('#updateEmailDiv').css('color','red');
			$('#updateEmailDiv').css('margin-left','72px');
			$('#updateEmailDiv').css('margin-top','10px');
		}
	});
	
	// blur -> focus가 벗어나는 경우 발생
	// 회원가입 인증번호 체크
	$('#mail-Check-Num').blur(function () {
		const inputCode = $(this).val();
		if(inputCode == code){
			$('#memberWriteEmailDiv').html('인증번호가 일치합니다.');
			$('#memberWriteEmailDiv').css('color','green');
			$('#mail-Check-Num').attr('disabled',true);
			$('#memberWriteEmail').attr('readonly',true);
			$('#checkemail').attr('value','ok');
		}else{
			$('#memberWriteEmailDiv').html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$('#memberWriteEmailDiv').css('color','red');
		}
	});
	
	$('#emailupdate_btn').click(function(){
		alert($('#emailUpdateSet').val())
		if($('#emailUpdatecheck').val() == 'ok'){
			alert(updateEmail);
			$("#memberemail", opener.document).val($('#emailUpdateSet').val()); //자식창에서 부모창으로 데이터 넘기기
			$("#memberemail1", opener.document).val($('#emailUpdateSet').val()); //자식창에서 부모창으로 데이터 넘기기
			window.close();
		}else{
			swal('이메일 인증을 먼저해주세요','','warning');
		}
	});
	
	$('#updatetelBtn').click(function(){
		if($('#findIdCheckDiv').val() == 'ok'){
			$("#updateTel", opener.document).val($('#findphone').val()); //자식창에서 부모창으로 데이터 넘기기
			$("#UpdateTelcheck", opener.document).val($('#findphone').val()); //자식창에서 부모창으로 데이터 넘기기
			window.close();
		}else{
			swal('전화번호 인증을 먼저해주세요','','warning');
		}
	});
	
	$('#memberWritephone1').focusout(function(){
		if(!$('#memberWritephone1').val()){
			$('#memberWritephoneDiv').html('전화번호를 입력하여 주세요.');
			$('#checkPhone').attr('value','fail');
		}else if($('#memberWritephone1').val() && !getCheckphone.test($('#memberWritephone1').val())){
			$('#memberWritephoneDiv').html('3~4자의 숫자만 사용 가능합니다.');
			$('#checkPhone').attr('value','fail');
		}else if(!$('#memberWritephone1').val() || !$('#memberWritephone2').val()){
			$('#checkPhone').attr('value','fail');
		}else{
			$('#memberWritephoneDiv').empty();
			$('#checkPhone').attr('value','ok');
		}
	});
	
	$('#memberWritephone2').focusout(function(){
		if(!$('#memberWritephone2').val()){
			$('#memberWritephoneDiv').html('전화번호를 입력하여 주세요.');
			$('#checkPhone').attr('value','fail');
		}else if($('#memberWritephone2').val() && !getCheckphone.test($('#memberWritephone2').val()) || !getCheckphone.test($('#memberWritephone1').val())){
			$('#memberWritephoneDiv').html('3~4자의 숫자만 사용 가능합니다.');
			$('#checkPhone').attr('value','fail');
		}else{
			$('#memberWritephoneDiv').empty();
			$('#checkPhone').attr('value','ok');
		}
	});
	
	$('#phoneselect').focusout(function(){
		if($('#phoneselect').val() == '-----------선택-----------'){
			$('#memberWritephoneDiv').html('전화번호를 선택하여 주세요.');
		}else{
			$('#memberWritephoneDiv').empty();
		}
	});
	
	
	$('#memberWriteBtn').click(function(){
		if($('#memberWritePwd').val() && !$('#memberWriterePwd').val() 
			|| !$('#memberWriteName').val()	  || !$('#memberWriteEmail').val() 
			|| !$('#memberWritephone1').val() || !$('#memberWritephone2').val()
			|| !$('#phoneselect').val() == '-----------선택-----------'
			|| $('#checkemail').val() == 'fail' || $('#checkPwd').val() == 'fail'
			|| $('#checkPhone').val() == 'fail'){
			swal('생성 실패',"내용을 입력해주세요",'warning');
			//location.reload();
		}else{
			$.ajax({
				type : 'post',
				data : $('#memberWriteForm').serialize(),
				url : '/index/member/memberWrite',
				dataType : 'text',
				success:function(data){
					swal('생성 완료',""+data+"님 환영 합니다.",'success').then(function(){
						location.href='/index'
					})
				},error:function(e){
					console.log(e);
				}
			});	
		}

	});
	$('#emailselect').on('change',function(){
		var check = $('#emailselect option:selected').val();
		$('#memberWriteEmail2').attr('value',check);
		$('#memberWriteEmailDiv').empty();
	});
	
	//Id 찾기 핸드폰 인증번호 
	var code2;
	$('#findIdBtn').click(function(){
		swal('인증번호전송 완료\n 인증번호를 확인해주세요',"",'success')
		$.ajax({
	        type:"get",
	        url:"/index/member/phoneCheck",
	        data : {'findphone' : $('#findphone').val()},
	        success:function(data){
	        		code2 = data;
	        		console.log(data);
	        		$("#phonecheck").attr("disabled",false);
	        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	        		$(".successPhoneChk").css("color","green");
	        	}
	    });
	});
	
	// blur -> focus가 벗어나는 경우 발생
	$('#phonecheck').blur(function () {
		const inputCode = $(this).val();
		if(inputCode == code2){
			$('#findIdCheckDiv').attr('value','ok');
			$('#phonecheckDiv').html('인증번호가 일치합니다.');
			$('#phonecheckDiv').css('color','green');
			$('#phonecheckDiv').css('margin-left','72px');
			$('#phonecheckDiv').css('margin-top','10px');
			$('#phonecheck').attr('disabled',true);
		}else{
			$('#phonecheckDiv').html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$('#phonecheckDiv').css('color','red');
			$('#phonecheckDiv').css('margin-left','72px');
			$('#phonecheckDiv').css('margin-top','10px');
			$('#findIdCheckDiv').attr('value','fail');
		}
	});
	
	$('#btn_next').click(function(){
		if($('#findIdCheckDiv').val() == 'ok'){
		$.ajax({
			  	type:"post",
		        url:"/index/member/memberfindIdcheck",
		        data : $('#findidForm').serialize(),
		        dataType : 'text',
		        success:function(data){
		        	if(data == 'fail'){
		        		swal('아이디와 휴대폰 번호를 다시 확인후 인증해주세요.',"",'warning')
		        	}else{
		        		swal('가입하신 아이디를 찾았습니다.',"가입하신 아이디는 "+data+"입니다.",'success')
		        	}
		        },error:function(e){
		        	console.log(e);
		        }
		});
		}else{
			swal('휴대폰 인증을 먼저해주세요.',"",'warning')
		}
	});
	
	$('#membercancle_btn').click(function(){
		location.href='/index';
	});
	
	$('#memberUpdate_btn').click(function(){
		if(!$('#updatePwd').val()){
			swal('새비밀번호를 입력해주세요.',"",'warning')
		}
		
		if($('#originalPwd').val() != $('#originalPwdWirte').val()){
			swal('현재 비밀번호가 틀립니다. 다시입력해주세요',"",'warning')
		}else if($('#updatePwd').val() != $('#reupdatePwd').val()){
			swal('새비밀번호 확인이 틀립니다. 다시입력해주세요.',"",'warning')
		}else if(!$('#updateNickName').val()){
			swal('닉네임 공백을 사용하실수 없습니다.',"",'warning')
		}else{
			$.ajax({
				data : $('#memberUpdateForm').serialize(),
				url : '/index/member/memberUpdate',
				type : 'post',
				success:function(){
					swal('수정이 완료되었습니다.',"",'success').then(function(){
						location.href='/index'
					})
				},error:function(e){
					console.log(e);
				}
			});
		}
	});
	
	$('#findEmailBtn').click(function(){
		$.ajax({
			data : $('#findpwdForm').serialize(),
			url : '/index/member/memberFindPwd',
			type : 'post',
			dataType : 'text',
			success:function(data){
				if(data == 'fail'){
					swal('비밀번호 변경에 실패하였습니다.',"",'warning')
				}else{
					swal('임시 비밀번호로 변경 되었습니다.','이메일에서 확인해주세요','success').then(function(){
						window.close();
					});
					}
				},error:function(e){
				console.log(e);
			}
		});
	});
	
}); 