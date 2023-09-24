<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 15%;
  background-color: #F8F9FA;
  position: fixed;
  height: 100%;
  overflow: auto;
  font-family: 'Nanum Myeongjo', serif;
  font-weight: 700;
}

li a {
  display: block;
  color: #000;
  padding: 10px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
.myPage{
	font-size: 20px;
	font-weight: 700;
	padding: 16px 16px;
}
</style>
<!-- 폰트를 사용하기위한 코드 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700;800&display=swap"
	rel="stylesheet">

</head>
<body>
	<c:if test="${ sessionScope.vo ne null }">
		<jsp:include page="/WEB-INF/views/market/logout_header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ sessionScope.vo eq null }">
		<jsp:include page="/WEB-INF/views/market/login_header.jsp"></jsp:include>
	</c:if>
<ul>
  <li class="myPage">마이페이지</li>
  <li></li>
  <li><a href="shop.do">장바구니</a></li>
  <li><a href="#">주문내역</a></li>
  <li><a href="#">음??</a></li>
  <li><a href="logout.do">로그아웃</a></li>
</ul>


</body>
</html>