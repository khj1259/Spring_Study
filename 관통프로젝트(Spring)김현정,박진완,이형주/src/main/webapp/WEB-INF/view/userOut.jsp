<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="24kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
nav.blackbar {
	list-style: none;
	background-color: black;
	padding: 5px;
	height: 40px;
	border: none;
}

.blackbar ul {
	float: right;
	margin: 1px;
}

.blackbar ul li {
	display: inline-block;
	padding-left: 20px;
	padding-right: 20px;
	margin: 2px;
}

.blackbar ul li button {
	background-color: #555;
	color: white;
	border-radius: 10px;
	height: 25px;
	width: 80px;
	border: none;
}

header img {
	margin-left: 30px;
	margin-top: 10px;
	height: 40px;
	width: 60px;
	margin-top: 10px;
}

.logobar {
	background-color: white;
	display: flex;
	margin-bottom: 5px;
}

.logobar ul {
	margin-top: 20px;
	margin-left: 100px;
}

.logobar ul li {
	float: right;
	list-style-type: none;
	padding-left: 20px;
	padding-right: 20px;
}

.logobar .logo {
	height: 50px;
	width: 70px;
}

.logobar .lens {
	height: 20px;
	width: 20px;
	background-color: gray;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 25px;
	padding-right: 5px;
	border-radius: 20px;
	margin-top: 15px;
}

.background {
	background-color: #666666;
	width: 100%;
	height: 900px;
}

.page {
	width: 900px;
	height: 700px;
	background-color: #ccc;
	margin: 0 auto;
}

.page button {
	background-color: #66b3ff;
	border: none;
	border-radius: 5px;
	color: white;
}

nav ul a {
	color: black;
}

.darkbox input, select{
	color: white;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#userinfo').click(function() {
			location.href = 'userInfo.html';
		});
		$('.mainPage').click(function() {
			location.href = 'main.mvc';
		});
		$('#confirm').click(function() {
			location.href = 'userOut.mvc';
		});
		$('#logout').click(function() {
			location.href = 'logout.mvc';
		});
	});
</script>
</head>
<body>
	<header>
		<nav class="blackbar">
			<ul>
				<li><button id="logout">Logout</button></li>
				<li><button id="userinfo">회원정보</button></li>
			</ul>
		</nav>
		<nav class="logobar">
			<a href="main.mvc"><img class="logo" alt="logo"
				src="img/logo.png"></a>
			<ul>
				<li class="info_eat">예상 섭취 정보</li>
				<li class="info_my"><a href="eatFoodList.mvc">내 섭취정보</a></li>
				<li class="info_best">베스트 섭취 정보</li>
				<li class="info_item"><a href="foodlist.mvc">상품정보</a></li>
				<li class="announce">공지사항</li>
			</ul>
			<img class="lens" alt="search" src="img/lens.png">
		</nav>
	</header>
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">제품 정보</li>
		</ol>
	</nav>
	<!-- content -->

	<div class="background">
		<div class="page">
			<div class="container">
				<form method="post" action="userOut.mvc">
					<h2>회원 탈퇴</h2>
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" value="${user.id }" disabled="disabled" name="id"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>
					</table>
					<br>
					<button class="btn btn-warning confirm">확인</button>
					<a class="btn btn-primary" href="main.mvc">돌아가기</a>
					<c:if test="${not empty error }">
						<h5 style="color: red;">${error }</h5>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<footer>
		<h3>Find us</h3>
		<hr>
		<div>
			<img alt="pin" src="img/pin.png"
				style="height: 25px; width: 20px;">(SSAFY)서울시 강남구 테헤란로 멀티스퀘어
		</div>
		<div>
			<img alt="phone" src="img/phone.png"
				style="height: 25px; width: 20px;">1544-9001
		</div>
		<div>
			<img alt="mail" src="img/mail.png"
				style="height: 25px; width: 25px;"><a href="#">admin@ssafy.com</a>
		</div>
	</footer>
</body>
</html>