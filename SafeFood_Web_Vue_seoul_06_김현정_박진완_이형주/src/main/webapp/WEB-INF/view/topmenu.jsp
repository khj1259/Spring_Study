<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<style type="text/css">
header img {
	margin-left: 30px;
	margin-top: 10px;
	height: 40px;
	width: 60px;
}
.logobar {
    display: flex;
    /* background-color: rgb(135,206,235); */  
    padding-bottom: 10px;
    padding-top: 10px; 
}

.logobar ul {
	margin-top: 20px;
	margin-left: 300px;
}

.logobar ul li {
	float: right;
	list-style-type: none;
	padding-left: 30px;
	padding-right: 30px;
	font-size: 13pt;
	/* font-weight: bold; */
	font-family: 'Noto Sans KR', sans-serif;
	line-height: 61px;
	color: black;
}
.announce{
	margin-left: 50px;
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
.darkbox {
	background-color: white;
	color: gray;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
}

.darkbox table {
	margin: 0 auto;
}
.darkbox select{
	width: 100px;
	height: 35px;
	color: black;
}
.darkbox input{
	
}

.darkbox table td {
	text-align: left;
	padding-left: 5px;
	padding-right: 5px;
	/* color: #999999 */
}

.darkbox table button {
	background-color: #0099ff;
	color: white;
	border-radius: 3px;
	width: 60px;
}
* {
	font-family: 'Noto Sans KR', sans-serif;
}
/* .container {
	padding-top: 100px;
} */

/* .row {
	display: flex;
}

.row img {
	height: 200px;
	width: 220px;
}

.row .data {
	height: 300px;
	width: 70%;
}

.row .data a {
	text-decoration: none;
}

.row button {
	height: 20px;
	width: 50px;
	border: none;
	border-radius: 5px;
	background-color: #4db8ff;
	color: white;
} */
nav ul a {
	color: black;
}
.breadcrumb{
	margin-bottom: 0;
}
.darkbox{
	margin-bottom: 15px;
	border-bottom: 1px solid #EAEAEA;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#userinfo').click(function(){
			location.href = 'userInfo.mvc'
		});
		$('#logout').click(function() {
			location.href = 'logout.mvc';
		});
		$('#signup').click(function() {
			location.href = 'signup.mvc';
		});
		$('#search').click(function() {
			location.href = 'search_result.mvc';
		});
		$('#userOut').click(function() {
			location.href = 'userOutReady.mvc';
		});
		
		if('${flag}' == 1){
			alert('로그인에 실패했습니다');
			location.href = 'main.mvc';
		}
		
	
		function login(){
			alert('로그인 후 조회 가능합니다');
		}
	});
</script>
</head>
<body>
	<header>
		<nav class="logobar">
			<div id="menu">
			<ul>
			<a href="main.mvc"><img class="logo" alt="logo"
				src="img/logo.png"></a>
				<li class="info_eat">
					<c:if test="${not empty sessionScope.user }">
						<a href="wishList.mvc">예상 섭취 정보</a>
					</c:if>
					<c:if test="${empty sessionScope.user }">
						예상 섭취 정보
					</c:if>
				</li>
				<li class="info_my">
					<c:if test="${not empty sessionScope.user }">
						<a href="eatFoodList.mvc">내 섭취 정보</a>
					</c:if>
					<c:if test="${empty sessionScope.user }">
						내 섭취 정보
					</c:if>
				</li>
				<li class="info_best"><a href="bestEatFood.mvc">베스트 섭취정보</a></li>
				<li class="info_item">
					<c:if test="${not empty sessionScope.user }">
						<a href="foodlist.mvc">상품정보</a>
					</c:if>
					<c:if test="${empty sessionScope.user }">
						상품정보
					</c:if>
				</li>
				<li class="announce">
                <c:if test="${not empty sessionScope.user }">
                        <a href="boardList.mvc">공지사항</a>
                </c:if>
                <c:if test="${empty sessionScope.user }">
                      		  공지사항
                </c:if>    
                </li>
			</ul>
			</div>
			<ul>
				<c:if test="${empty sessionScope.user }">
					<li>
						<a href="#" id="signup">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;Sign up
						</a>
					</li>
					<li><a href="#" type="button" data-toggle="modal"
							data-target="#exampleModal">
							<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;Login</a>
					</li>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Login</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" action="login.mvc">
										<div class="form-group">
											<label for="id" class="form-control-label">ID</label> <input
												type="text" class="form-control" name="id"
												id="login_id">
										</div>
										<div class="form-group">
											<label for="password" class="form-control-label">PASSWORD</label>
											<input type="password" class="form-control" name="password"
												id="login_pw">
										</div>
										<div class="modal-footer">
											<input type="submit" class="btn btn-success" value="Login">
                                            <button type="button" class="btn btn-danger"
                                                data-dismiss="modal">Close</button>
                                            <input type="button" class="btn btn-info "value="비밀번호찾기" onclick="location.href='searchPassForm.mvc'">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.user }">
					<li><a href="#" id="logout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;Logout</button></li>
					<li><a href="#" id="userinfo"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;회원정보</button></li>
				</c:if>
			</ul>
		</nav>
	</header>

</body>
</html>