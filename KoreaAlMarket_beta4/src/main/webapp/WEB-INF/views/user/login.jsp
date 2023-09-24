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
		
		a {
		    background-color: transparent;
		    text-decoration: none;
		}
		
		input[type=button] {
			cursor: pointer;
		}
		
		span:not(css-separator) {
			color: #EE6A7B;
		}
		
		.css-mainbox {
		    min-width: 1050px;
		    margin-top: 90px;
		    margin-bottom: 60px;
		    background-color: rgb(255, 255, 255);
		}
		
		.css-title-login {
		    font-weight: 800;
		    font-size: 20px;
		    line-height: 20px;
		    text-align: center;
		}
		
		.css-body-main {
			width: 340px;
		    margin: 0px auto;
		    letter-spacing: -0.6px;
		}
		
		.css-body-input {
			margin-top: 30px;
		}
		
		.css-body-input-box {
			padding-bottom: 12px;
		}
		
		.css-body-input-box:first-of-type {
			margin-bottom: 5px;
		}
		
		.css-body-input-box-inside {
			position: relative;
    		height: 48px;
		}
		
		.css-input {
			height: 54px;
    		font-size: 14px;
   		    width: 100%;
		    padding: 0px 11px 1px 15px;
		    border-radius: 4px;
		    border: 1px solid rgb(221, 221, 221);
		    font-weight: 400;
		    line-height: 1.5;
		    color: rgb(51, 51, 51);
		    outline: none;
		    box-sizing: border-box;
		}
		
		.css-body-find {
			display: flex;
		    -webkit-box-pack: end;
		    justify-content: flex-end;
		    margin-top: 10px;
		    font-size: 13px;
		}
		
		.css-find-info {
		    color: rgb(51, 51, 51);
    		cursor: pointer;
		}
		
		.css-separator{
		    width: 1px;
		    height: 10px;
		    margin: 3px 6px 0px;
		    background-color: rgb(51, 51, 51);
		}
		
		.css-body-links {
		    margin-top: 28px;
		}
		
		.css-login-btn {
			display: block;
		    padding: 0px 10px;
		    text-align: center;
		    overflow: hidden;
		    width: 100%;
		    height: 54px;
		    border-radius: 3px;
		    color: rgb(255, 255, 255);
		    background-color: #9FE7F6;
		    border: 0px none;
		}
		
		.css-signup-btn {
			display: block;
		    padding: 0px 10px;
		    text-align: center;
		    overflow: hidden;
		    width: 100%;
		    height: 54px;
		    border-radius: 3px;
		    color: #9FE7F6;
		    background-color: rgb(255, 255, 255);
		    border: 1px solid #9FE7F6;
		    margin-top: 10px;
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

	<div class="css-mainbox">
		<div class="css-title-login">로그인</div>
		<div class="css-body-main">
			<form>
				<div class="css-body-input">
					<div class="css-body-input-box id">
						<div class="css-body-input-box-inside">
							<c:if test="${ input_id ne null }">
								<input class="css-input name" name="id" placeholder="아이디를 입력하세요" value="${ input_id }">
							</c:if>
							<c:if test="${ input_id eq null }">
								<input class="css-input name" name="id" placeholder="아이디를 입력하세요">
							</c:if>
						</div>
					</div>
					
					<div class="css-body-input-box pw">
						<div class="css-body-input-box-inside">
							<c:if test="${ input_pw ne null }">
								<input class="css-input pw" name="pw" type="password" placeholder="비밀번호를 입력하세요" value="${ input_pw }">
							</c:if>
							<c:if test="${ input_pw eq null }">
								<input class="css-input pw" name="pw" type="password" placeholder="비밀번호를 입력하세요">
							</c:if>
						</div>
						
						
					</div>
					<div>
						<c:if test="${ login_result eq 'iv_id' }">
							<span>아이디가 틀렸습니다.</span>
						</c:if>
						<c:if test="${ login_result eq 'iv_pw' }">
							<span>비밀번호가 틀렸습니다.</span>
						</c:if>
						
					</div>
				</div>
				<div class="css-body-find">
					<a class="css-find-info" href="find/id.do">아이디 찾기</a>
					<span class="css-separator"></span>
					<a class="css-find-info" href="find/password.do">비밀번호 찾기</a>
				</div>
				<div class="css-body-links">
					<input class="css-login-btn" type="button" value="로그인" onclick="login(this.form);">
					<input class="css-signup-btn" type="button" value="회원가입" onclick="location.href='signup_form.do'">
				</div>
		
			</form>
		</div>
	</div>

	
	
	
	<script src="/market/resources/js/httpRequest.js"></script>
	
	<script>
		function login(f) {
			var id = f.id.value;
			var pw = f.pw.value;
			if(id == '') {
				alert("아이디를 입력하세요.");
				return;
			}
			if(pw == '') {
				alert("비밀번호를 입력하세요.");
				return;
			}	
			
			f.method = "POST";
			f.action = "verify_login.do";
			f.submit();
		}
		
	</script>
	
</body>
</html>