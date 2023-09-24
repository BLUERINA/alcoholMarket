<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.headerContainer {
	display: flex;
	justify-content: space-between;
	background-color: #F8F9FA;
	font-family: 'Nanum Myeongjo', serif;
	font-weight: 700;
}

.logo {
	font-size: 60px;
	margin-left: 30px;
	margin-top: 50px;
	padding-bottom: 15px;
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

.alchol3 {
	margin-right: 300px;
}

.search {
	display: flex;
	flex-direction: row;
	width: 600px;
	justify-content: space-between;
	margin: auto;
}

.loginAndCart {
	margin-right: 112px;
	margin-top: 10px;
}
.login {
	margin-right: 50px;
}

a:link, a:hover, a:visited {
	text-decoration: none;
	color: black;
}


</style>
<!-- 폰트를 사용하기위한 코드 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700;800&display=swap"
	rel="stylesheet">
<!-- 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script>
function search() {

	var search = document.getElementById("search").value.trim();
	if (search == '') {
		alert("검색어를 입력하세요");
		return;
	}
	location.href = "search1.do?search=" + search;
}

</script>
	
</head>
<body>
<!--------------------------------------------------제목과 로그인----------------------------------------------------------------->
	<div class="headerContainer">
		<div class="logo"><a href="menu.do">신선노름</a></div>
<!--------------------------------------------------검색창 부트스트랩------------------------------------------------------------->
	<div class="search">
		<input class="form-control" id="search" placeholder="검색어를 입력하세요">
		<input type="button" class="btn btn-outline-info" value="검색"
			onclick="search();">
	</div>

<!--------------------------------------------------로그인링크----------------------------------------------------------------->		
		<div class="loginAndCart">
			<span class="login"><a href="mypage.do">${ vo.name } 님</a></span>
			<span class="logout"><a href="logout.do">로그아웃</a></span>
		</div>
	</div>
<!--------------------------------------------------카테고리----------------------------------------------------------------->
	<div class="categoryContainer">
			<div class="alchol1"><a href="alchol11.do">양조주</a></div>
			<div class="alchol2"><a href="alchol12.do">증류주</a></div>
			<div class="alchol3"><a href="alchol13.do">혼성주</a></div>
	</div>
</body>
</html>