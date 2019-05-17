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
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경6-4.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
</style>
</head>
<body>
<%@include file="topmenu.jsp" %>
<div class="header_img"></div>
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">비밀번호 찾기</li>
		</ol>
	</nav>
	<br>
	<!-- contents -->
	<div class="back">
		<div class="container contents">
			<h2>비밀번호 찾기</h2>
			<form method="post" action="searchPassword.mvc">
				<div class="form-group row">
					<label for="signup_id" class="col-sm-2 col-form-label">아이디<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"
							required="required" placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_pw" class="col-sm-2 col-form-label">이름<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							required="required" placeholder="이름을 입력하세요">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">완 료</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>