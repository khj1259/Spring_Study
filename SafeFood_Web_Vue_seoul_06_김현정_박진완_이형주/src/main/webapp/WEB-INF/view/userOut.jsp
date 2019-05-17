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
/* .background {
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
} */
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
	background-image: url("img/배경6-3.PNG");
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
			<li class="breadcrumb-item"><a href="userInfo.mvc">회원 정보</a></li>
			<li class="breadcrumb-item active" aria-current="page">회원 탈퇴</li>
		</ol>
	</nav>
	<br>
	<!-- content -->
<%-- 
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
	</div> --%>
	
	
	<div class="back">
		<div class="container contents">
			<h2>회원탈퇴</h2>
			<form method="post" action="userOut.mvc">
				<div class="form-group row">
					<label for="signup_id" class="col-sm-2 col-form-label">아이디<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" value="${user.id }" class="form-control" name="id"
							required="required">
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_pw" class="col-sm-2 col-form-label">비밀번호<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="password"
							required="required" placeholder="이름을 입력하세요">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">확인</button>
						<a class="btn btn-primary" href="main.mvc">돌아가기</a>
						<c:if test="${not empty error }">
						<h5 style="color: red;">${error }</h5>
					</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- content end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>