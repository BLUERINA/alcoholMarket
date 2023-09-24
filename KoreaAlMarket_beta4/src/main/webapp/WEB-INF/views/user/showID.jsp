<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
		
		ul {
			list-style-type: none;
		    padding: 12px 0px;
		}
		
		input[type=button] {
			cursor: pointer;
		}
	
		.css-message {
		    padding-top: 30px;
		    font-weight: 500;
		    font-size: 17px;
		    line-height: 23px;
		}
		
		.css-submessage {
		    display: block;
		    padding-top: 4px;
		    font-weight: 400;
		    font-size: 13px;
		    color: rgb(153, 153, 153);
		    line-height: 18px;
		}
		
		.css-info-id {
		    padding-top: 17px;
		    font-weight: 500;
		    font-size: 16px;
		    line-height: 21px;
		}
		
		.css-info-regdate {
			display: block;
		    padding-top: 4px;
		    font-size: 12px;
		    color: rgb(153, 153, 153);
		}
		
		.css-profile-img {
		    width: 40px;
		    height: 40px;
		    display: block;
		    margin: 17px 12px 16px 0px;
			border: 0;
			vertical-align: top;
		}
		
		.css-user-info {
			display: flex;
		}
		
		.css-link_btns {
			margin-top: 60px;
		}
		
		.css-link-pw_btn{
			display: block;
		    padding: 0px 10px;
		    text-align: center;
		    overflow: hidden;
		    width: 100%;
		    height: 52px;
		    border-radius: 3px;
		    color: #9FE7F6;
		    background-color: rgb(255, 255, 255);
		    border: 1px solid #9FE7F6;
		    margin-bottom: 10px;
		}
		
		.css-link-login_btn {
			display: block;
		    padding: 0px 10px;
		    text-align: center;
		    overflow: hidden;
		    width: 100%;
		    height: 52px;
		    border-radius: 3px;
		    color: rgb(255, 255, 255);
		    background-color: #9FE7F6;
		    border: 0px none;
		}
		
		.css-container {
		    max-width: 400px;
		    padding: 0px 30px 30px;
		    margin: auto;
		    position: relative;
		    background-color: white;
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

	<div class="css-container">
		<div class="css-message">
			고객님의 계정을 찾았습니다.
			<div class="css-submessage">
				아이디 확인 후 로그인해 주세요.
			</div>
		</div>
		<ul>
			<li class="css-user-info">
				<img class="css-profile-img" src="/market/resources/img/profile_img.png">
				<div style="border:none" >
					<div class="css-info-id">${ id }</div>
					<div class="css-info-regdate">가입일 ${ regdate }</div>
				</div>
			</li>
		</ul>
		<div class="css-link-btns">
			<input class="css-link-pw_btn" type="button" value="비밀번호 찾기" onclick="location.href='../password.do'">
			<input class="css-link-login_btn" type="button" value="로그인" onclick="location.href='../../login.do'">
			
		</div>
	</div>
</body>
</html>