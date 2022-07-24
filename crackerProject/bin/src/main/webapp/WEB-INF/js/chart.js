$(function(){
	$.ajax({
		type: 'post',
		url: '/index/admin/loginMember',
		dataType: 'json',
		success:function(member){
			var ctx = document.getElementById('myChart').getContext('2d');
			var chart = new Chart(ctx, {
			    type: 'line',// 챠트 종류를 선택
			    data: {// 챠트를 그릴 데이타
			      labels: ['7일', '6일', '5일', '4일', '2일전', '1일전', '오늘'],
			      datasets: [{
			    	label: '회원가입 현황',
			        backgroundColor: 'transparent',
			        borderColor: 'red',
			        data: [
			        	member.day6, member.day5 , member.day4 ,member.day3,member.day2,member.day1,member.day0]
			      }]	
			    },
			    // 옵션
			    options: {
			    	responsive: false,
			    	legend:{ display: false
			    	},
			    	title: {display: true
			    	},
			    	scales: {
						yAxes: [{
							ticks: {
								min: 0,
								
								stepSize : 1,
								beginAtZero: true,
								fontSize : 14,
							}
						}]
					}
			    	
			    }
			});
		},
		error:function(e){
			console.log(e);
		}
	});
});

$('#memberGraphBtn').click(function(){
	//alert('버튼확인')
	$.ajax({
		type: 'post',
		url: '/index/admin/loginMember',
		dataType: 'json',
		success:function(member){
			var ctx = document.getElementById('myChart').getContext('2d');
			var chart = new Chart(ctx, {
			    type: 'line',// 챠트 종류를 선택
			    data: {// 챠트를 그릴 데이타
			      labels: ['7일', '6일', '5일', '4일', '2일전', '1일전', '오늘'],
			      datasets: [{
			    	label: '회원가입 현황',
			        backgroundColor: 'transparent',
			        borderColor: 'red',
			        data: [
			        	member.day6, member.day5 , member.day4 ,member.day3,member.day2,member.day1,member.day0]
			      }]	
			    },
			    // 옵션
			    options: {
			    	responsive: false,
			    	legend:{ display: false
			    	},
			    	title: {display: true
			    	},
			    	scales: {
						yAxes: [{
							ticks: {
								min: 0,
								
								stepSize : 1,
								beginAtZero: true,
								fontSize : 14,
							}
						}]
					}
			    	
			    }
			});
		},
		error:function(e){
			console.log(e);
		}
	});
});

$('#memberDayGraphBtn').click(function(){
	//alert('버튼확인')
	$.ajax({
		type: 'post',
		url: '/index/admin/dayLoginMember',
		dataType: 'json',
		success:function(member){
			var ctx = document.getElementById('myChart').getContext('2d');
			var chart = new Chart(ctx, {
			    type: 'line',// 챠트 종류를 선택
			    data: {// 챠트를 그릴 데이타
			      labels: ['7일', '6일', '5일', '4일', '2일전', '1일전', '오늘'],
			      datasets: [{
			    	label: '회원가입 현황',
			        backgroundColor: 'transparent',
			        borderColor: 'red',
			        data: [
			        	member.day6, member.day5 , member.day4 ,member.day3,member.day2,member.day1,member.day0]
			      }]	
			    },
			    // 옵션
			    options: {
			    	responsive: false,
			    	legend:{ display: false
			    	},
			    	title: {display: true
			    	},
			    	scales: {
						yAxes: [{
							ticks: {
								min: 0,	
							
								stepSize : 1,
								beginAtZero: true,
								fontSize : 14,
							}
						}]
					}
			    	
			    }
			});
		},
		error:function(e){
			console.log(e);
		}
	});
});