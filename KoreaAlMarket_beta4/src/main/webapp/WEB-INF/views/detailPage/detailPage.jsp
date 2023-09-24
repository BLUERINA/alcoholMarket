<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세페이지</title>


<script>
	function send(){
		var ff = document.getElementById("ff");
		var price = ff.price.value;
		ff.cnt.value = document.getElementById("ccnt").value;
		var name = ff.name.value;
		
		ff.action = "insert_shop.do"; 
		/* ff.action = "shop.do"; */
		ff.method = "get";
		ff.submit();
	}	
</script>

<link rel="stylesheet" href="/market/resources/css/product.css">
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

.mainContent {
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

.box {
	appearance: none;
	text-align-last: center;
	font-size: 25px;
	width: 200px;
	background-color: #9FE7F6;
	font-family: 'Nanum Myeongjo', serif;
	font-weight: 700;
}

.selectBox {
	display: flex;
	justify-content: center;
	heigth: 200px;
}
</style>

<script type="text/javascript">
function in_cart(){

	if(sessionScope.vo ne null)
	
}
</script>


</head>
<body>
	<c:if test="${ sessionScope.vo ne null }">
		<jsp:include page="/WEB-INF/views/market/logout_header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ sessionScope.vo eq null }">
		<jsp:include page="/WEB-INF/views/market/login_header.jsp"></jsp:include>
	</c:if>
	<br>
	
<form id="ff">

<%-- b:${ vo.price } --%>
	<input type="hidden" name="product_idx" value="${ vo.product_idx }">
	<input type="hidden" name="price" value="${ vo.price }">
	<input type="hidden" name="cnt">
	<input type="hidden" name="name" value="${ vo.name }">

	<div class="line"></div>
	<div class="content_top">
		<div class="ct_left_area">
			<img class="img" src="resources/img/${ vo.product_idx }.jpg">
		</div>
		<div class="ct_right_area">
		<div class="title">
		<div id="name"><h1>${vo.name}</h1></div>
		</div>
		<div class="line"></div>
		<div class="author">
			<span> ${vo.p_type} </span> <span>|</span> <span>
					${vo.degree}도 </span> <span>|</span> <span> 유통기한
					${vo.expiration_date} </span>
			</div>
			<div class="line"></div>
			<div class="price">판매가 : ${ vo.price } 원</div>
			<div class="line"></div>
			<div class="button">
				<div class="button_quantity">
					<div class="product_number">남은 수량 : ${ vo.product_number } 개</div>
					주문수량 <select id="ccnt">
									<option value="0">수량을 선택해주세요</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select>
					</span>
				</div>
				<!-- <div class="button_set">
					<a type="button" class="btn_cart" onclick="send()">장바구니 담기</a> 
					<a class="btn_buy" onclick="">바로구매</a>
				</div> -->
				
				<div class="button_set">
					<c:if test="${ sessionScope.vo ne null }">
						<a class="btn_cart" onclick="in_cart()">장바구니 담기</a>
					</c:if>
					<c:if test="${ sessionScope.vo eq null }">
						<a class="btn_cart" onclick="location.href='login.do'">장바구니 담기</a>
					</c:if>
					<a class="btn_buy" onclick="">바로구매</a>
				</div>
			</div>
	</div>
	</div>
</form>
	<div class="line"></div>
	<!-- 술댓글로 바꿔야함 -->
	<div class="content_bottom">
		<div class= "review">
		<h2>리뷰</h2>
		</div>
			<div class=reply>
				<textarea id="content" rows="5" cols="90" onclick="text();"></textarea>
				<input class="bt" type="button" value="등록" >
			</div>
	</div>
</body>
</html>