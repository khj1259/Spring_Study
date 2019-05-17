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

<script type="text/javascript">
	if('${flag2}' == 1){
	console.log("중복된 아이디");
	alert('중복된 아이디입니다.');
	location.href = 'signup.mvc';
}

</script>
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
	background-image: url("img/배경6-1.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
	/* text-align: center; */
	/*  filter:blur(2px);    */
}
/* .header_img h3{
	height: 185px;
   padding-top: 70px;
    color: #fff;
    font-size: 50px;
    font-weight: 550;
    text-align: center;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    font-family: font-family: 'Noto Sans KR', sans-serif;
}
.header_img h3 span{
	display: block;
    margin-top: 15px;
    font-size: 24px;
    font-weight: 400;
}  */

</style>
</head>
<body>
<%@include file="topmenu.jsp" %>
<div class="header_img">
	<!-- <h3>회원정보
	<span>소중한 고객님의 회원정보 입니다.</span>
	</h3> -->
</div>
	<!-- contents -->
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">회원가입</li>
		</ol>
	</nav>
	<br>
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
				추가 정보(선택사항)
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