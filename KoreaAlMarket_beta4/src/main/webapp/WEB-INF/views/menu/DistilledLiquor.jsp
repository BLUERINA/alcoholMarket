<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증류주</title>

<link rel="stylesheet" href="/market/resources/css/menu.css">
<script src="/market/resources/js/subMenuSelect.js"></script>

<script>

function price() { 
	
	// 가격을 가져옴
	var price = document.getElementById('price');
	var value = price.options[price.selectedIndex].value;	
	
	location.href="DistilledLiquor_page.do?value="+value;	
}

function degree() { 
	
	// 도수를 가져옴
	var degree = document.getElementById('degree');
	var value = degree.options[degree.selectedIndex].value;	

	location.href="DistilledLiquor_page.do?value="+value;
	
}

function volume() { 
	
	// 용량을 가져옴
	var volume = document.getElementById('volume');
	var value = volume.options[volume.selectedIndex].value;	

	location.href="DistilledLiquor_page.do?value="+value;
	
}

function star() { 
	
	// 별점을 가져옴
	var star = document.getElementById('star');
	var value = star.options[star.selectedIndex].value;
	
	location.href="DistilledLiquor_page.do?value="+value;
	
}
		
	
</script>

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
		<div class="mainContent" style="height:200px;">
		::: 증류주 :::
		</div>
		<br>
	<!--------------------------------------------------카테고리----------------------------------------------------------------->
	<div class="selectBox">
		<select class="box" id="price" name="price" onchange="price()" style="height:80px;">
		  <option selected>가격</option>
		  <option value="10000"> ~ 1만원 </option>
		  <option value="30000"> 1만원 ~ 3만원 </option>
		  <option value="50000"> 3만원 ~ 5만원 </option>
		  <option value="50001"> 5만원 이상 </option>
		</select>
  
  
		  <select class="box" id="degree" name="degree" onchange="degree()">
			  <option selected>도수</option>
			  <option value="5"> ~ 5도 </option>
			  <option value="10"> 5도 ~ 10도 </option>
			  <option value="11"> 10도 이상 </option>
		  </select>
		  
		  <select class="box" id="volume" name="volume" onchange="volume()">
			  <option selected>용량</option>
			  <option value="300"> ~ 300ml </option>
			  <option value="500"> 300ml ~ 500ml </option>
			  <option value="501"> 500ml 이상 </option>
		  </select>
		  
		  <select class="box" id="star" name="star" onchange="star()">
			  <option selected>별점</option>
			  <option value="6">5점</option>
			  <%-- <fmt:formatNumber value="65.153454" pattern=".00"/> --%>
			  <option value="4">4점</option>
			  <option value="3">3점</option>
			  <option value="2">2점</option>
			  <option value="1">1점</option>
		  </select>
	  </div>
	<!--------------------------------------------------주류내용----------------------------------------------------------------->
		<c:if test="${ idx % 3 == 0 }">
			<div class="menu_box">
				<c:forEach var="vo" items="${m_list}" >
					<!-- 증류주인것만 보이기 -->
					<c:if test="${ vo.p_type eq '증류주' }">
						<div class="content">
							<!-- 이미지 클릭시 상세페이지로 넘어가기 -->
							<img class="img" src="resources/img/${ vo.product_idx }.jpg" 
							onclick="location.href='product.do?idx=${vo.idx}'">		
							
							<div class="name"><br>${ vo.name }</div>
							<div class="info">::: ${ vo.info } :::</div><br>
							<div>====================================</div>
							<div class="volume">별점 : ${ vo.star } 점</div>
							<div class="volume">용량 : ${ vo.volume } ml</div>
							<div class="degree">도수 : ${ vo.degree } 도</div>
							<div class="price">가격 : ${ vo.price } 원</div>
							<div>====================================</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:if>

</body>
</html>