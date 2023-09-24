<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/market/resources/css/menu.css">
</head>
<body>
	<c:if test="${ sessionScope.vo ne null }">
		<jsp:include page="/WEB-INF/views/market/logout_header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ sessionScope.vo eq null }">
		<jsp:include page="/WEB-INF/views/market/login_header.jsp"></jsp:include>
	</c:if>
	
	<div class="search">
		<c:forEach var="vo" items="${list}">
			<form>
			<div class="menu_box">
					<div class="content">
						<img class="img" src="resources/img/${ vo.product_idx }.jpg" 
							onclick="location.href='product.do'">
							
						<div class="name">이름 : ${ vo.name }</div>
						<div class="volume">용량 : ${ vo.volume }</div>
						<div class="price">가격 : ${ vo.price }</div>
					</div>
			</div>
			</form>
		</c:forEach>
	</div>

</body>
</html>