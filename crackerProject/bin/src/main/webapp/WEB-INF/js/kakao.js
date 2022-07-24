function kakaoLogin() {
    $.ajax({
        url: '/index/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
    		url = res;
    		name = '';
    		specs = "width=550,height=600,top=200,left=100";
    		window.open(url,name,specs);
        }
    });
 }

function kakaoLogout(){
    $.ajax({
    	url: '/index/member/kakaoLogoutForm',
    	type : 'get',
    	async : 'false',
    	dataType : 'text',
    	success:function(res){
    		url = res;
    		name = '';
    		specs = "width=550,height=600,top=200,left=100";
    		window.open(url,name,specs);
    	}
    });
}

