$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/index/customer/getCustomerList',
		data : 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<a/>',{
					id : 'customerseq',
					href: '/index/customer/customerView?seq='+items.seq+'&pg='+$('#pg').val(),
					class: 'customerseq'+items.seq
				})
				.append($('<td/>',{
					align: 'center',
					text: items.seq
				}))
				.append($('<td/>',{
					align: 'center',
					text: items.name
				}))
				.append($('<td/>',{
					href:'#',
					text: items.subject,
				}))
				.append($('<td/>',{
					align: 'center',
					text: items.logtime.toLocaleString()
				}))).appendTo($('#customerListTable'));

				$('.subjectA_'+items.seq).click(function(){
					if(data.sionAdminId == null){
						alert('먼저 로그인하세요')
					}else{
						location.href = '/index/customer/customerView?seq='
										+items.seq+'&pg='+$('#pg').val();
					}
				});
				
			});//each
			$('#pg').val(data.pg);

			//페이징처리
			$('#adminCustomerPagingDiv').html(data.customerPaging.pagingHTML);
		},
		error: function(e){
			 console.log(JSON.stringify(error));
		}
	});//ajax
});
$('#customerSearchBtn').click(function(){
	//alert('버튼확인')
	if($('#keyword').val() == '')
		alert('검색어를 입력하세요');
	else{
		$.ajax({
			type: 'post',
			url: '/index/customer/customerSearch',
			data: $('#customerSearchForm').serialize(),
			dataType: 'json',
			success: function(data){
				//alert(JSON.Stringify(data));
				//테이블에서 기존 목록제거
				$('#customerListTable tr:gt(0)').remove();
				
				$.each(data.list, function(index, items){
					//console.log(inex, items.seq, items.name,  items.subject, items.logtime)
					$('<tr/>').append($('<a/>',{
						id : 'customerseq',
						href: '/index/customer/customerView?seq='+items.seq+'&pg='+$('#pg').val(),
						class: 'customerseq'+items.seq
					})
					.append($('<td/>',{
						align: 'center',
						text: items.seq
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.name
					}))
					.append($('<td/>',{
						href:'#',
						text: items.subject,
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.logtime.toLocaleString()
					}))).appendTo($('#customerListTable'));
					
					$('<tr/>').click(function(){
						if(data.sionAdminId == null){
							alert('먼저 로그인하세요');
						}else{
							location.href = '/index/customer/customerView?seq='+items.seq+'&pg='+$('#pg').val();
						}
					});
				});
				//페이징처리
				$('#adminCustomerPagingDiv').html(data.customerPaging.pagingHTML);
			},
			error: function(e){
				 console.log(e);
			}
		});
	}
});