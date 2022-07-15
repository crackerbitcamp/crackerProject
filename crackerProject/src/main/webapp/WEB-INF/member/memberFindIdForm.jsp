<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <input type = "hidden" id = "findIdCheckDiv">
   <form id = "findidForm">
      <fieldset id="find-Idfieldset-wrap">
         <legend>아이디 찾기 </legend>
         <div class="idbox">
            <label class="label.txt" style="margin-right: 35px;">이름</label>
            <input type = "text" id = "findId" class = "input_txt" name = "findName"><br>
            <label class ="label.txt" id="FindTel">휴대전화</label>
            <select style="width: 61px; height: 30px; border: none;">
               <option>+82</option>
            </select>
            <input type = "text" class = "input_txt" placeholder="휴대전화번호" id="findphone" name = "findphone">
            <button class="btn_ct" id="findIdBtn" type="button">인증번호받기</button><br>
            <input type = "text" id="phonecheck" name="phonecheck" disabled class="input_txt" style="width:217px; margin-left: 75px;" placeholder="인증번호 6자리 숫자 입력" maxlength="6">
            <span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
            <div id = "phonecheckDiv"></div>
         </div>
            <button class="btn_next" id = "btn_next" name="btn_next" type="button">아이디 찾기</button>
      </fieldset>
   </form>
   
   
   
   <form id = "findpwdForm">
      <fieldset id = "find-Pwdfindset-wrap">
         <legend>비밀번호 찾기</legend>
         <div class = "pwdbox">
            <label class="label.txt" style="margin-right: 33px;">이름</label>
            <input type = "text" id = "findname" class = "input_txt" name = "membername"><br>
            <label class = "label.txt" id = "FindEmail" style="margin-right: 18px;">아이디</label>
            <input type = "email" id = "findEmail" class="input_txt" name="memberemail" style="width: 220px; margin-bottom: 25px;" placeholder="ex)cracker123@naver.com">
            <button class="btn_ct" id="findEmailBtn" type="button">인증번호받기</button><br>
            <span class="point successPhoneChk" style="margin-bottom: 10px;"></span>
         </div>
      </fieldset>
   </form>

</body>
</html>