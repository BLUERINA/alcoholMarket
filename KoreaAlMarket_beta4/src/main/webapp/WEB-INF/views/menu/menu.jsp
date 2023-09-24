<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<link rel="stylesheet" href="/market/resources/css/menu.css">
<script src="/market/resources/js/subMenuSelect.js"></script>

<style>
.submenuContainer {
	display: flex; /* 내용 한줄로 */
	height: 80px;
	width: 800px;
	font-size: 25px;
	background-color: #9FE7F6;
	font-family: 'Nanum Myeongjo', serif;
	font-weight: 700;
	margin: auto; /* div를 가운데 */
	text-align: left; /* text를 가운데 */
	
	justify-content: space-around;
	letter-spacing: 0.2em; /* 글자사이 간격  */
	padding-top: 25px; /* 위에서부터 간격 */
	
}

.box{
  appearance: none;
  text-align-last: center;
  font-size: 25px;
  width : 200px;
  background-color: #9FE7F6;
  font-family: 'Nanum Myeongjo', serif;
  font-weight: 700;
  
  
}

.selectBox{
	display: flex;
    justify-content: center;
    heigth: 200px;
    
}

.mainContent{
	
    
    display: flex;
    justify-content: center;
    
    text-align: center;
	font-size: 60px;
	/* margin-ton: 50%;
	margin-bottom: 10px; */
	font-family: 'Nanum Myeongjo', serif;
	font-weight: 700;
	align-items: center;
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
 	<br>
 	<div class="mainContent">
	::: 추천 주류 :::
	</div>

  
	<!--------------------------------------------------주류내용----------------------------------------------------------------->
	
			<div class="carousel-wrapper">
				<div class="carousel">
			
				<c:forEach var="vo" items="${r_list}" >	 
			
					<div class="content">
						
						<!-- 이미지 클릭시 상세페이지로 넘어가기 -->
						<img class="img" src="resources/img/${ vo.product_idx }.jpg" 
							onclick="location.href='product.do?idx=${vo.idx}'">
						<div class="name">${ vo.name }</div>
						<div class="info">::: ${ vo.info } :::</div><br>
						<div class="volume">별점 : ${ vo.star } 점</div>
						<div class="price">가격 : ${ vo.price } 원</div>
					</div>
					
				</c:forEach>
				</div>
			</div>
</body>
</html> 