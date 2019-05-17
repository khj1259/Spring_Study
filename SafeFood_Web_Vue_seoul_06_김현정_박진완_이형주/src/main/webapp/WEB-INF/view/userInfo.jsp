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
	padding-top: 0;
	padding-bottom: 20px;
}
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경6-2.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
.btns{
	text-align: center;
	margin-top: 50px;
}
</style>
</head>
<body>
<%@include file="topmenu.jsp" %>
<div class="header_img"></div>
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">회원 정보</li>
		</ol>
	</nav>
	<br>
	<!-- contents -->
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
				<br>
	<h3>추가 정보(선택사항)<span style="color: red">&nbsp;*</span></h3>
				<br>
				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">성별<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<span>${UserPrivateInfo.getGender()}</span>
					</div>
				</div>


				<div class="form-group row">
					<label for="height" class="col-sm-2 col-form-label">키<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<span>${UserPrivateInfo.getHeight()}</span>
					</div>
				</div>

				<div class="form-group row">
					<label for="weight" class="col-sm-2 col-form-label">체중<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<span>${UserPrivateInfo.getWeight()}</span>
					</div>
				</div>

				<div class="form-group row">
					<label for="age" class="col-sm-2 col-form-label">나이<span
						style="color: red">&nbsp;</span></label>
					<div class="col-sm-10">
						<span>${UserPrivateInfo.getAge()}</span>
					</div>
				</div>

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">활동도<span
						style="color: red">&nbsp;</span></label>
					
					<div class="col-sm-10">
						<span>${UserPrivateInfo.getCheckActivity()}</span>
					</div>
				</div>
				
				<br>
				<div class="btns">
						<a class="btn btn-primary" href="userInfoEdit.mvc" role="button">정보
							수정</a>
						<a class="btn btn-danger" href="userOutReady.mvc" role="button">회원
							탈퇴</a>
						<a class="btn btn-success" href="eatFoodList.mvc" role="button">
							섭취식품</a>
						<a class="btn btn-info" href="wishList.mvc" role="button">
							찜한 식품</a>
				</div>
			</form>
		</div>
		<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>