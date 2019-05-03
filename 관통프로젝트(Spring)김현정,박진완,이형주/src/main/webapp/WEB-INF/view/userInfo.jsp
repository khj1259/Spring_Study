<%@page import="com.ssafy.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="24kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.contents {
	width: 50%;
	background-color: #F6F6F6;
	border-radius: 20px;
	padding: 50px;
}

form {
	padding: 50px;
}

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
}

header img {
	margin-left: 30px;
	margin-top: 10px;
	height: 40px;
	width: 60px;
}

.logobar {
	display: flex;
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

.graybox {
	background-color: gray;
	color: white;
	width: 100%;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	margin-top: 10px;
}

.darkbox {
	background-color: #4d4d4d;
	color: gray;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
}

.darkbox table {
	margin: 0 auto;
}

.darkbox table tr input, table select {
	border-radius: 3px;
	background-color: gray;
}

.darkbox table td {
	text-align: left;
	padding-left: 5px;
	padding-right: 5px;
	color: #999999
}

.darkbox table button {
	background-color: #0099ff;
	color: white;
	border-radius: 3px;
	width: 60px;
}

footer a {
	text-decoration: none;
	color: #0099ff;
}

footer div {
	margin-left: 10px;
}

footer div img {
	margin-right: 15px;
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
		location.href = 'userInfo.mvc';
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
	<div class="graybox">
		<h3>WHAT WE PROVIDE</h3>
		<h5>건강한 삶을 위한 먹거리 프로젝트</h5>
	</div>
	<div class="darkbox">
		<table>
			<tr>
				<td>검색조건</td>
				<td>검색단어</td>
				<td>&nbsp</td>
			</tr>
			<tr>
				<td><select name="search_opt">
						<option value="name">상품명</option>
				</select></td>
				<td><input type="text"></td>
				<td><button>검색</button></td>
			</tr>
		</table>
	</div>
	<!-- contents -->
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">회원 정보</li>
		</ol>
	</nav>
	<div class="back">
		<div class="container contents">
			<h2>회원 정보</h2>
			<br>
			<form>
				<div class="form-group row">
					<label for="signup_id" class="col-sm-2 col-form-label">아이디<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<span>${user.getId() }</span>
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_name" class="col-sm-2 col-form-label">이름<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<span>${user.getName() }</span>
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_address" class="col-sm-2 col-form-label">주소<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<span>${user.getAddress() }</span>
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_phone" class="col-sm-2 col-form-label">전화번호<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<span>${user.getPhone() }</span>
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_allergy" class="col-sm-2 col-form-label">알레르기<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<fieldset disabled="disabled">
							<legend>Check</legend>
							<div class="row">
								<% String []list = {"대두", "땅콩", "우유", "게"};
									for(String val : list){ %>
										<label class="form-check-label col-sm-2">
									<% User user = (User) session.getAttribute("user");
										if (user.getAllergy().contains(val)){ %>
											<input class="form-check-input" type="checkbox" checked="checked"><%=val %>
										<%} else{ %>
											<input class="form-check-input" type="checkbox"><%=val %>
										<%} %>
								</label>
									<%}
								%>
							</div>
							<div class="row">
							<% String []list2 = {"새우", "참치", "연어", "쑥"};
									for(String val : list2){ %>
										<label class="form-check-label col-sm-2">
									<% User user = (User) session.getAttribute("user");
										if (user.getAllergy().contains(val)){ %>
											<input class="form-check-input" type="checkbox" checked="checked"><%=val %>
										<%} else{ %>
											<input class="form-check-input" type="checkbox"><%=val %>
										<%} %>
								</label>
									<%}
								%>
							</div>
							<div class="row">
								<% String []list3 = {"소고기", "닭고기", "돼지고기"};
									for(String val : list3){ %>
										<label class="form-check-label col-sm-2">
									<% User user = (User) session.getAttribute("user");
										if (user.getAllergy().contains(val)){ %>
											<input class="form-check-input" type="checkbox" checked="checked"><%=val %>
										<%} else{ %>
											<input class="form-check-input" type="checkbox"><%=val %>
										<%} %>
								</label>
									<%}
								%>
							</div>
							<div class="row">
								<% String []list4 = {"복숭아", "민들레", "계란흰자"};
									for(String val : list4){ %>
										<label class="form-check-label col-sm-2">
									<% User user = (User) session.getAttribute("user");
										if (user.getAllergy().contains(val)){ %>
											<input class="form-check-input" type="checkbox" checked="checked"><%=val %>
										<%} else{ %>
											<input class="form-check-input" type="checkbox"><%=val %>
										<%} %>
								</label>
									<%}
								%>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<a class="btn btn-primary" href="userOutReady.mvc" role="button">회원
							탈퇴</a>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-primary" href="userInfoEdit.mvc" role="button">정보
							수정</a>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-info" href="eatFoodList.mvc" role="button">
							섭취식품</a>
					</div>
					<!-- <div class="col-sm-2">
						<a class="btn btn-info" href="#" role="button">
							찜한 식품</a>
					</div> -->
				</div>
			</form>
		</div>






		<!-- contents end -->
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