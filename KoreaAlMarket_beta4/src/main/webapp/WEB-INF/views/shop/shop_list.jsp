<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

	<c:if test="${ sessionScope.vo ne null }">
		<jsp:include page="/WEB-INF/views/market/logout_header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ sessionScope.vo eq null }">
		<jsp:include page="/WEB-INF/views/market/login_header.jsp"></jsp:include>
	</c:if>

<meta name="viewport" content="width=device-width,initial-scale=1">



<!-- checkbox -->
<script>

function payment(){
	
}
		
 function checkAll(all){
	
	 var sum = 0; // 총금액
		var s =0; //배송비
	 
		
	 var chks=document.getElementsByName("chBox");
	 
		for (var i = 0; i < chks.length; i++) {
			
			chks[i].checked = all;
			
			sum += parseInt(chks[i].value);
			s += 2500;
			
		 }
			 
			 if(allCheck.checked == false){
			 sum = 0;
			 s = 0;
				 
			}
			 
			document.getElementById("sumtext").value = sum; //총금액
			 document.getElementById("sh").value = s;	//총배송비	
			 document.getElementById("total").value = s+sum;	//결제예정금액
 }
</script>

<!-- 선택한것만 계산 -->
<script type="text/javascript">
		var sum = 0; // 총금액
		var s =0; //배송비
		function calc(cBox) {
			if(cBox.checked){
				sum += parseInt(cBox.value);
				s += 2500;
			}else{
			sum -= parseInt(cBox.value);
				s -= 2500;
			}
			document.getElementById("sumtext").value = sum;
			 document.getElementById("sh").value = s;
			 document.getElementById("total").value = s+sum;
		}
	</script>
<script src="/shop/resources/js/httpRequest.js"></script>
<!-- 삭제 -->
<script>
	function del(f){
		
		if(!confirm("삭제 하시겠습니까 ?")){
			return;
		}
		var url="delete.do";
		var param="idx="+f.idx.value;
		sendRequest(url,param,resultFn,"GET");
		
		
		
	}
	
	function resultFn() {
		

			
if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			
			if( data == 'no' ){
				
			
				alert("실패");
				return;
			}
			
			
			location.href="list.do";
			
		
	}
	}
</script>

<!-- 수량변경 -->
<script type="text/javascript">
	function modify(f){
		
		
		var url = "modify.do";
		var param = "idx="+f.idx.value+"&buyNO=" +
		f.buyNO.value;
		
		
		sendRequest(url,param,sendCallback,"POST");
	}
	function sendCallback(){
		if( xhr.readyState == 4 && xhr.status == 200 ){
			
			
			var data = xhr.responseText;
			
			if( data == 'no' ){
				alert("실패");
				return;
			}
				alert("변경성공")
			
			
			
			location.href="list.do";
			
		}
	}
</script>







<style type="text/css">
img{
	width:50px;
	height:50px;
}
.headerContainer {
	display: flex;
	justify-content: space-between;
	background-color: #F8F9FA;
	font-family: 'Nanum Myeongjo', serif;
	font-weight: 700;
}

.categoryContainer {
	font-family: 'Nanum Myeongjo', serif;
	font-weight: 700;
	display: flex;
	justify-content: space-between;
	margin: auto;
	background-color: #9FE7F6;
	font-size: 25px;
	height: 80px;
	letter-spacing: 0.2em;
	padding-top: 25px;
}

.alchol1 {
	margin-left: 300px;
}

.food3 {
	margin-right: 300px;
}

.name {
	font-size: 60px;
	margin-left: 30px;
	margin-top: 50px;
	padding-bottom: 15px;
}

.btn-outline-success {
	width: 100px;
}

.loginAndCart {
	margin-right: 50px;
	margin-top: 10px;
}

.login {
	margin-right: 10px;
}

.search {
	margin-top: 50px;
}

.d-flex {
	width: 500px;
}

body.cssBody {
	background-color: #f5f5f0;
	font-size: 13pt;
	min-width: 1480px;
	width: 100%;
	padding: 50px 0;
}

#frame {
	width: 80%;
	margin: 0 auto;
	padding: 50px 50px;
	background-color: #fff;
}

.home {
	float: right;
}

table.calculation1 {
	clear: both;
	border: solid 1px #e0e0eb;
	border-collapse: collapse;
	background-color: #f5f5f0;
	width: 100%;
	font-size: 10pt;
}

table.calculation1 th {
	border: solid 1px #e0e0eb;
	padding: 10px 0;
}

table.calculation1 td {
	border: solid 1px #e0e0eb;
	text-align: center;
}

table.calculation2 {
	border: solid 1px #e0e0eb;
	border-collapse: collapse;
	background-color: #f5f5f0;
	width: 100%;
	font-size: 10pt;
	
}

table.calculation2 th {
	border: solid 1px #e0e0eb;
	text-align: center;
}

table.calculation2 td {
	border: solid 1px #e0e0eb;
	text-align: center;
}

.price {
	font-size: 20pt;
	font-weight: bold;
}

.btn {
	border: none;
	color: white;
	padding: 5px 10px;
	font-size: 13px;
	cursor: pointer;
	border-radius: 5px;
}

.default {
	background-color: #fff;
	border: solid 1px gray;
	color: black;
}

.default:hover {
	background: #ddd;
}

.backBtn {
	background-color: #fff;
	border: solid 1px gray;
}

#allProduct, #productClear {
	padding: 11px 25px;
}

#allProduct {
	margin-left: 140px;
	background-color: #264d73;
	color: #fff;
	font-weight: bold;
	font-size: 12pt;
}

#productClear {
	background-color: gray;
	color: #fff;
	font-weight: bold;
	font-size: 12pt;
}

.aa:hover {
	cursor: pointer;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}
</style>


<script type="text/javascript">
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>


</head>
<body class="cssBody">

	<div id="frame">
		<form>
			<div id="frame2">
				<span style="font-size: 16pt; font-weight: bold;"></span> <span
					class="home">main>장바구니</span> <span></span>
			</div>
			<br>

			<div>
				<table class="calculation1">
					<tr>
						<th class="aa">구매상품</th>
						<th style="width: 700px;"></th>
					</tr>
				</table>
			</div>
			<br>
			<div>
				<table class="calculation1">
					<thead>
						<tr>

							<th colspan="10" style="text-align: left; padding-left: 10px;">
								<input type="checkbox" name="allCheck" id="allCheck"
								checked="checked" onclick="checkAll(this.checked);" /><label for="allCheck">모두
									선택</label>
							</th>
						</tr>


						<tr>
							<th></th>
							<th><span>상품사진</span></th>

							<th style="width: 550px;"><span>상품이름</span></th>
							<th>판매가</th>
							<th>수량</th>

							<th>배송구분</th>
							<th>배송비</th>
							<th>합계</th>
							<th>선택</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="vo" items="${ list }">
							<form name="form">
								<tr style="height: 90px; background-color: #fff;">
									<td
										style="text-align: left; text-align: center; border-right: none;">
										<input type="checkbox" name="chBox" class="chBox"
										value="${vo.price * vo.cnt}" onClick="calc(this);" />
									</td>

									<td style="border-left: none; border-right: none;">
									<img class="img" src="resources/img/${ vo.product_idx }.jpg" 
										onclick="location.href='product.do'">
									</td>

									<input type="hidden" name="idx" value="${ vo.regdate }">
									<td
										style="border-align: left; padding-left: 10px; boder-left: none; font-weight: bold;">${ vo.name }</td>

									<td>${ vo.price }원</td>
									<td class="updown" style="width: 80px;"><input
										type="number" name="buyNO"
										style="textalign: right; width: 43px; margin-bottom: 5px;"
										min="0" max="99" step="0" value="${ vo.cnt }" /> <input
										type="button" value="변경" onclick="modify(this.form);">
									</td>
									<td>기본배송</td>
									<td>2500</td>
									<td>${vo.price * vo.cnt + 2500}원</td>
									<td>
										 <input type="button" class="btn default" value="삭제" onclick="del(this.form);">
									</td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>

				<table class="calculation2">
					<tr>
						<th>총금액</th>
						<th>총배송비</th>
						<th><span>결제금액</span></th>
					</tr>

					<tr style="background-color: #fff;">
						<td><input id="sumtext" value="0">원</td>
						<td><input id="sh" value="0">원</td>
						<td><input id="total" value="0" >원</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button class="btn default backBtn" id="productClear" onclick="payment();">상품주문</button>		
				</div>
			</div>
		</form>
	</div>
</body>
</html>