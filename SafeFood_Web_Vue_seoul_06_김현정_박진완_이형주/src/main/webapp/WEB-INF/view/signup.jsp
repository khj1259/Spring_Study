<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<%@include file="topmenu.jsp" %>
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
			<li class="breadcrumb-item active" aria-current="page">회원가입</li>
		</ol>
	</nav>
	<div class="back">
		<div class="container contents">
			<h2>회원가입</h2>
			<br>
			<form method="post" action="signup.mvc">
				<div class="form-group row">
					<label for="id" class="col-sm-2 col-form-label">아이디<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"
							required="required">
					</div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="password"
							required="required" placeholder="영문 숫자포함 6자리 이상">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">이름<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							required="required" placeholder="User Name">
					</div>
				</div>
				<div class="form-group row">
					<label for="address" class="col-sm-2 col-form-label">주소<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="address"
							required="required" placeholder="address">
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">전화번호<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" name="phone"
							required="required" placeholder="010-xxxx-xxxx">
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_allergy" class="col-sm-2 col-form-label">알레르기<span
						style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<fieldset>
							<legend>Check</legend>
							<div class="row">
								<label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="대두"
									type="checkbox"> 대두
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="땅콩"
									type="checkbox"> 땅콩
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="우유"
									type="checkbox"> 우유
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="게" type="checkbox">
									게
								</label>
							</div>
							<div class="row">
								<label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="새우"
									type="checkbox"> 새우
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="참치"
									type="checkbox"> 참치
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="연어"
									type="checkbox"> 연어
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="쑥" type="checkbox">
									쑥
								</label>
							</div>
							<div class="row">
								<label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="소고기"
									type="checkbox"> 소고기
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="닭고기"
									type="checkbox"> 닭고기
								</label> <label class="form-check-label col-sm-3"> <input
									class="form-check-input" name="check" value="돼지고기"
									type="checkbox"> 돼지고기
								</label>
							</div>
							<div class="row">
								<label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="복숭아"
									type="checkbox"> 복숭아
								</label> <label class="form-check-label col-sm-2"> <input
									class="form-check-input" name="check" value="민들레"
									type="checkbox"> 민들레
								</label> <label class="form-check-label col-sm-3"> <input
									class="form-check-input" name="check" value="계란흰자"
									type="checkbox"> 계란흰자
								</label>
							</div>
						</fieldset>
					</div>
				</div>

				<br>
				<br>
				<h3>
				추가 정보(선택사항)<span style="color: red">&nbsp;*</span></label>
				</h3>
				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">성별<span
						style="color: red">&nbsp;</span></label>

					<div class="col-sm-10">
						<input type="radio" name="gender" value="남자" />남자 <input
							type="radio" name="gender" value="여자" />여자<br />
					</div>
				</div>

				<div class="form-group row">
					<label for="height" class="col-sm-2 col-form-label">키<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="height"
							placeholder="키">
					</div>
				</div>

				<div class="form-group row">
					<label for="weight" class="col-sm-2 col-form-label">체중<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="weight"
							placeholder="체중">
					</div>
				</div>

				<div class="form-group row">
					<label for="age" class="col-sm-2 col-form-label">나이<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="age"
							placeholder="나이">
					</div>
				</div>

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">활동도<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<input type="radio" name="checkActivity" value="비활동적">비활동적
						<input type="radio" name="checkActivity" value="저활동적">저활동적
						<input type="radio" name="checkActivity" value="활동적">활동적 <input
							type="radio" name="checkActivity" value="매우활동적">매우활동적
					</div>
				</div>



				<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">완 료</button>
						   <button type="reset" class="btn btn-danger">취소</button>
					</div>
				</div>
			</form>
		</div>
		<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>