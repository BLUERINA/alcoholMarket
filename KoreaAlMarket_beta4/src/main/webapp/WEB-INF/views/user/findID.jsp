<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		button {
		    overflow: visible;
		    background-color: transparent;
		    border: none;
		}
		
		input[type=button] {
			cursor: pointer;
		}
	
		.css-findid-box {
		    min-width: 1050px;
		    padding: 50px 0px;
		    background-color: white;
		}
		
		.css-findid-title {
		    padding-bottom: 30px;
		    font-weight: 500;
		    font-size: 28px;
		    text-align: center;
		}
		
		.css-findid-main {
			max-width: 400px;
		    padding: 0px 10px 6px;
		    margin: auto;
		    position: relative;
		    background-color: white;
		}
		
		.css-findid-type {
			background-color: white;
		    padding: 0px 15px;
		    margin: 0px;
		    box-shadow: rgb(221 221 221) 0px -0.5px 0px 0px inset;
		    display: flex;
		    flex-wrap: nowrap;
		    text-align: center;
		}
		
		.css-findid-type-phone {
		    display: block;
		    -webkit-box-flex: 1;
		    flex-grow: 1;
		    position: relative;
		    height: 48px;
		    font-weight: 500;
		    font-size: 16px;
		    color: #9FE7F6;
		    line-height: 18px;
		    box-shadow: #9FE7F6 0px -2px 0px 0px inset;
		}
		
		.css-findid-form {
			padding: 24px 20px;
		}
		
		.css-findid-info {
			padding-bottom: 12px;
		}
		
		.css-findid-verify {
			margin-top: 18px;
		}
		
		.css-findid-verify-btn:disabled {
			background-color: rgb(200, 200, 200);
		}
		
		.css-findid-verify-btn {
		    display: block;
		    padding: 0px 10px;
		    text-align: center;
		    overflow: hidden;
		    width: 100%;
		    height: 52px;
		    border-radius: 4px;
		    color: rgb(255, 255, 255);
		    background-color: #9FE7F6;
		    border: 0px none;
		}
		
		.css-findid-info-title {
			display: inline-block;
		    padding: 8px 0px 11px;
		    font-size: 14px;
		    font-weight: 500;
		    line-height: 19px;
		    color: rgb(51, 51, 51);
		}
		
		.css-findid-input-name {
			width: 100%;
		    height: 46px;
		    padding: 0px 11px 1px 15px;
		    border-radius: 4px;
		    border: 1px solid rgb(221, 221, 221);
		    font-weight: 400;
		    font-size: 16px;
		    line-height: 1.5px;
		    color: rgb(51, 51, 51);
		    outline: none;
		    box-sizing: border-box;
		}
		
		.css-findid-input-phone {
		    width: 100%;
		    height: 46px;
		    padding: 0px 11px 1px 15px;
		    border-radius: 4px;
		    border: 1px solid rgb(221, 221, 221);
		    font-weight: 400;
		    font-size: 16px;
		    line-height: 44px;
		    color: rgb(51, 51, 51);
		    outline: none;
		    box-sizing: border-box;
		}
		
		.error-m {
		    font-size: 13px;
		    color: rgb(240, 63, 64);
		    margin-top: -4px;
		    display: none;
		}
		
		.hidden {
			display:none;
		}

	</style>
	
</head>
<body>
	<c:if test="${ sessionScope.vo ne null }">
		<jsp:include page="/WEB-INF/views/market/logout_header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ sessionScope.vo eq null }">
		<jsp:include page="/WEB-INF/views/market/login_header.jsp"></jsp:include>
	</c:if>

	<div class="css-findid-box">
		<div class="css-findid-title">아이디 찾기</div>
		<div class="css-findid-main">
			<div class="css-findid-type">
				<button class="css-findid-type-phone" disabled>휴대폰 인증</button>
			</div>
			<form class="css-findid-form">
				<div class="css-findid-info">
					<div class="css-findid-name">
						<label for="name" class="css-findid-info-title">이름</label>
						<div>
							<input class="css-findid-input-name" id="inputName" name="name" type="text" placeholder="이름을 입력해주세요" onkeyup="checkName()">
						</div>
					</div>
					
				</div>
				<p class="error-m" id="error-name">가입 시 등록한 이름을 입력해 주세요.</p>
				<div class="css-findid-info">
					<div class="css-findid-phone">
						<label for="phone" class="css-findid-info-title">휴대폰 번호</label>
						<div>
							<input class="css-findid-input-phone" id="inputPhone" name="phone" type="text" placeholder="휴대폰 번호를 입력해주세요" onkeyup="checkPhone()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					
				</div>
				<p class="error-m" id="error-phone">가입 시 등록한 휴대폰 번호를 입력해 주세요.</p>
				
				<div class="css-findid-info hidden" id="hidden-verification">
					<div class="css-findid-verification">
						<label for="verifyNum" class="css-findid-info-title">인증번호</label>
						<div>
							<input class="css-findid-input-phone" id="verificationNum" type="text" placeholder="인증번호  6자리" onkeyup="validNum()" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					
				</div>
				<p class="error-m" id="error-vnum">인증번호를 입력해 주세요.</p>
				
				<div class="css-findid-verify">
					<input class="css-findid-verify-btn" id="verify_btn" type="button" value="인증번호 받기" onclick="findUser(this.form)" disabled>
					<input type="hidden" id="sms_ans">
				</div>
				
			</form>
		</div>
	</div>
	
	
	<script src="/market/resources/js/httpRequest.js"></script>
	<script>
		var inputName = false;
		var inputPhone = false;
	
		function checkName() {
			var name = document.getElementById("inputName");
			var err_m = document.getElementById("error-name");
			
			if(name.value.length == 0) {
				err_m.style.display = "block";	
				inputName = false;
			} else {
				err_m.style.display = "none";
				inputName = true;
			}
			
			if(inputPhone && inputName) {
				document.getElementById("verify_btn").disabled = false;
			} else {
				document.getElementById("verify_btn").disabled = true;
			}
		}
		
		function checkPhone() {
			var phone = document.getElementById("inputPhone");
			var err_m = document.getElementById("error-phone");
			
			if(phone.value.length == 0) {
				err_m.style.display = "block";
				err_m.innerHTML = "가입 시 등록한 휴대폰 번호를 입력해 주세요.";
				inputPhone = false;
			} else if(phone.value.length < 11) {
				err_m.style.display = "block";
				err_m.innerHTML = "휴대폰 번호를 정확히 입력해 주세요.";
				inputPhone = false;
			} else {
				err_m.style.display = "none";
				inputPhone = true;
			}
			
			if(inputPhone && inputName) {
				document.getElementById("verify_btn").disabled = false;
			} else {
				document.getElementById("verify_btn").disabled = true;
			}
		}
		
		function findUser(f) {
			if(document.getElementById("verify_btn").value == "확인") {
				checkSms(f);
				return;
			}
			
			var name = f.name.value;
			var phone = f.phone.value; 
			
			var url = "id/namePhone.do";
			var param = "name=" + name + "&phone=" + phone;
			sendRequest(url, param, callbackUser, "POST");
		}
		
		//인증번호 실시간 체크
		function validNum() {
			var num = document.getElementById("verificationNum");
			var err_m = document.getElementById("error-vnum");
			
			if(num.value.length == 6) {
				err_m.style.display = "none";
			} else {
				err_m.style.display = "block";
			}
		}
		
		function checkSms(f) {
			var ans = document.getElementById("sms_ans").value;
			var guess = document.getElementById("verificationNum").value;
			if(ans == guess) {
				f.name.disabled = false;
				f.phone.disabled = false;
				f.method = "post";
				f.action = "id/success.do";
				f.submit();
			} else {
				alert("인증번호가 틀렸습니다.");
			}
		}
		
		function callbackUser() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				var data = xhr.responseText;
				
				if(data == "iv") {
					alert("가입 시 입력하신 회원정보가 맞는지 다시 한번 확인해 주세요.");
				} else if(data == "v") {
					sendSms();
				}
			}
		}
		
		function sendSms() {
			var userPhoneNo = document.getElementById("inputPhone"); 
			var url = "sendSms.do";
			var param = "userPhoneNo=" + userPhoneNo;
			sendRequest(url, param, callbackSms, "POST");
		}
		
		function callbackSms() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				document.getElementById("inputName").disabled = true;
				document.getElementById("inputPhone").disabled = true;
				document.getElementById("hidden-verification").style.display = "block";
				document.getElementById("error-vnum").style.display = "block";
				document.getElementById("verify_btn").value = "확인";
				alert("인증번호를 문자로 보냈습니다.");
				
				var data = xhr.responseText;
				document.getElementById("sms_ans").value = data;
			}
		}
	</script>
	
</body>
</html>