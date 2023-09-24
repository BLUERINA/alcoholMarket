<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		
		* {
			padding: 0;
		}
		form {
			padding: 24px 20px;
		}
		
		.css-body {
			in-width: 1050px;
		    padding: 50px 0;
		    background-color: white;
		}
		
		.css-body-title {
		    padding-bottom: 30px;
		    font-weight: 500;
		    font-size: 28px;
		    text-align: center;
		}
		
		.css-body-main {
			max-width: 400px;
		    padding: 0px 10px 6px;
		    margin: auto;
		    position: relative;
		    background-color: white;
		}
		
		.css-body-cpw {
			margin-top: 8px;
		}
		
		.css-body-btn {
			margin-top: 18px;
		}
		
		.css-confirm-btn {
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
		    cursor: pointer;
		}
		
		.css-confirm-btn:disabled {
			background-color: rgb(221, 221, 221);
			cursor: default;
		}
		
		.css-body-pw-top {
			padding-bottom: 12px;
		}
		
		.css-body-cpw-top {
			padding-bottom: 12px;
		}
		
		.css-body-label {
		    display: inline-block;
		    padding: 8px 0px 11px;
		    font-size: 14px;
		    font-weight: 500;
		    line-height: 19px;
		    color: rgb(51, 51, 51);
		}
		
		.css-body-input-box {
			position: relative;
	    	height: 48px;
		}
		
		.css-input {
			width: 100%;
		    height: 46px;
		    padding: 0px 11px 1px 15px;
		    border-radius: 4px;
		    border: 1px solid rgb(221, 221, 221);
		    font-weight: 400;
		    font-size: 16px;
		    line-height: 1.5;
		    color: rgb(51, 51, 51);
		    outline: none;
		    box-sizing: border-box;
		}
		
		.check-message-iv {
			font-size: 12px;
		    color: rgb(240, 63, 64);
		    line-height: 18px;
		    letter-spacing: -0.3px;
		    border: 0;
		}
		
		.check-message-v {
		    font-size: 12px;
		    color: rgb(14, 133, 26);
		    line-height: 18px;
		    letter-spacing: -0.3px;
		}
		
		.check-message-iv::before {
		    content: "✕";
		    display: inline-block;
		    padding: 0px 4px 0px 2px;
		    font-size: 12px;
		    vertical-align: 0px;
		}
		
		.check-message-v::before {
			content: "✓";
		    display: inline-block;
		    padding: 0px 4px 0px 2px;
		    font-size: 12px;
		    vertical-align: 0px;
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

	<div class="css-body">
		<div class="css-body-title">비밀번호 재설정</div>
		<div class="css-body-main">
			<form>
				<div class="css-body-pw">
					<div class="css-body-pw-top">
						<label class="css-body-label">새 비밀번호 등록</label>
						<div class="css-body-input-box">
							<input class="css-input" type="password" id="password" name="pw" placeholder="새 비밀번호를 입력해 주세요" oninput="checkPW(this.form)">
						</div>
					</div>
					<p class="check-message-iv" id="numLimit">8자 이상 20자 이하 입력</p>
					<p class="check-message-iv" id="pwCombination" >영문/숫자/특수문자(공백제외)를 조합</p>
				</div>
				<div class="css-body-cpw">
					<div class="css-body-cpw-top">
						<label class="css-body-label">새 비밀번호 확인</label>
						<div class="css-body-input-box">
							<input class="css-input" type="password" id="c_password" name="c_pw" placeholder="새 비밀번호를 한 번 더 입력해 주세요" oninput="checkCPW(this.form)">
						</div>
					</div>
					<p class="check-message-iv" id="cpwMessage">동일한 비밀번호를 입력해 주세요 </p>
				</div>
				<div class="css-body-btn">
					<input class="css-confirm-btn" id="confirm_btn" type="button" value="확인" onclick="changePW(this.form)" disabled>
					<input type="hidden" name="id" value="${ id }">
				</div>
			</form>
		</div>
	</div>
	
	<script src="/market/resources/js/httpRequest.js"></script>
	<script>
		var pwFlag = false;
		var cpwFlag = false;
		
		function changePW(f) {
			if(pwFlag && cpwFlag) {
				var url = "success.do";
				var param = "id=${ id }" + "&pw=" + f.pw.value ;
				sendRequest(url, param, callback, "POST");
			}
			
		}
	
		function checkPW(f) {
			var pw = f.pw.value;
			var num = pw.search(/[0-9]/);
			var eng = pw.search(/[a-z]/);
			var spe = pw.search(/[~!@#$%^&*()_+|<>?:{}]/);
			
			if (pw.length < 8 || pw.length > 20) {
				document.getElementById("numLimit").className = "check-message-iv";
				pwFlag = false;
			} else {
				document.getElementById("numLimit").className = "check-message-v";
				
				if(num < 0 || eng < 0 || spe < 0) {
					document.getElementById("pwCombination").className = "check-message-iv";
					pwFlag = false;
				} else {
					document.getElementById("pwCombination").className = "check-message-v";
					pwFlag = true;
				}
			}
			
			if(pwFlag && cpwFlag) {
				document.getElementById("confirm_btn").disabled = false;
			} else {
				document.getElementById("confirm_btn").disabled = true;
			}
		}
		
		function checkCPW(f) {
			var pw = f.pw.value;
			var c_pw = f.c_pw.value;
			
			if(pw == c_pw) {
				document.getElementById("cpwMessage").className = "check-message-v";
				cpwFlag = true;
			} else {
				document.getElementById("cpwMessage").className = "check-message-iv";
				cpwFlag = false;
			}
			if(pwFlag && cpwFlag) {
				document.getElementById("confirm_btn").disabled = false;
			} else {
				document.getElementById("confirm_btn").disabled = true;
			}
		}
		
		function callback() {
			
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				var data = xhr.responseText;
				
				if(data == "success") {
					alert("비밀번호 변경에 성공했습니다.\n로그인 페이지로 이동합니다 .");
					location.href = "../../login.do";
				} else if(data == "fail") {
					alert("비밀번호 변경 실패");
				}
			}
		}
	</script>
</body>
</html>