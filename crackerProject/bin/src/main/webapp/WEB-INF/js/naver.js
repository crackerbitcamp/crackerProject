var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "mvZbn8H2DEWz0pz4HtrA", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/index/member/naverlogincallback", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: true,
			callbackHandle: true
		}
	);	
naverLogin.init();
