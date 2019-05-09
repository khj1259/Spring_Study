<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.model.dto.Food" buffer="24kb"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_info</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0//css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

</head>
<script>	
	$(document).ready(function() {
		
		$('#userinfo').click(function () {
			location.href = 'userInfo.mvc';
		});
		$('#logout').click(function () {
			location.href = 'logout.mvc';
		});
		$('#signup').click(function() {
			location.href = 'signup.mvc';
		});
		$('#search').click(function() {
			location.href = 'search_result.html';
		});
		$('#userOut').click(function () {
			location.href = 'userOutReady.mvc';
		});
		
		
		//추가버튼 클릭 시
		$('.btAdd').click(function() {
			//$('.alert').show();
			var code =  $(this).val();
			var cnt = prompt('섭취수량을 입력해 주세요');
			if(cnt != null){
				$.ajax({
					url:"eatFoodAdd.mvc",
					type:"POST",
					data:"code="+code+"&cnt="+cnt,
					success:function(){
						alert('추가되었습니다');
					}
				});
			}
		});
		
	});
</script>
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
footer{
	clear: both;
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

.contents img {
	width: 200px;
	height: 200px;
}

.txt {
	background-color: #F6F6F6;
}

.item {
	margin-bottom: 10px;
	margin-right: 10px;
}

nav ul a {
	color: black;
}

.darkbox input, select{
	color: white;
}
.row{
	margin-bottom: 15px;
}
.contents{
	width: 80%;
	margin: 0 auto;
}
th {
	width: 75px;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				var ctx = document.getElementById("myChart").getContext('2d');
				var foodCalory = document.getElementById("foodCalory").getAttribute("value");
				var foodCarbo = document.getElementById("foodCarbo").getAttribute("value");
				var foodProtein = document.getElementById("foodProtein").getAttribute("value");
				var foodFat = document.getElementById("foodFat").getAttribute("value");
				var foodSugar = document.getElementById("foodSugar").getAttribute("value");
				var foodNatrium = document.getElementById("foodNatrium").getAttribute("value");
				var foodChole = document.getElementById("foodChole").getAttribute("value");
				var foodFattyacid = document.getElementById("foodFattyacid").getAttribute("value");
				var foodTransfat = document.getElementById("foodTransfat").getAttribute("value");
// 				$('#btnChartDraw').click(
// 						function() {
							var myDoughnutChart = new Chart(ctx, {
								type : 'doughnut',
								data : {
									datasets : [ {
										data : [ foodCalory, foodCarbo, foodProtein, foodFat, foodSugar,
												foodNatrium, foodChole, foodFattyacid, foodTransfat],
										backgroundColor : [
												'rgba(255, 99, 132, 0.2)',
												'rgba(54, 162, 235, 0.2)',
												'rgba(255, 206, 86, 0.2)',
												'rgba(75, 192, 192, 0.2)',
												'rgba(153, 102, 255, 0.2)',
												'rgba(255, 159, 64, 0.2)',
												'rgba(200, 122, 64, 0.2)',
												'rgba(201, 132, 56, 0.2)',
												'rgba(73, 22, 56, 0.2)'

										]
									} ],

									// These labels appear in the legend and in the tooltips when hovering different arcs
									labels : ['칼로리', '탄수화물', '단백질', '지방', '당류', '나트륨', '콜레스테롤', '포화 지방산', '트랜스지방' ],

								},
								options : {
									responsive : false
								}
							});
							// 							$('#donut_example').append(myDoughnutChart);
// 						})
			
				$('#btAdd').click(function() {
					$('.alert').show();
					var code = ${ food.getCode() };
					var cnt = $('#cnt').val();
					$.ajax({
						url:"eatFoodAdd.mvc",
						type:"POST",
						data:"code="+code+"&cnt="+cnt,
						success:function(){
							alert('추가되었습니다');
						}
					});
				});
			})
</script>


<body>
	<header>
		<nav class="blackbar">
			<ul>
				<c:if test="${empty user }">
					<li><button id="signup">Sign up</button></li>
					<li><button type="button" data-toggle="modal"
							data-target="#exampleModal">Login</button></li>
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
											<input type="button" value="비밀번호찾기" onclick="location.href='searchPassForm.mvc'">
											<input type="submit" class="btn btn-primary" value="로그인">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty user }">
					<li><button id="logout">Logout</button></li>
					<li><button id="userinfo">회원정보</button></li>
				</c:if>
			</ul>
		</nav>
		<nav class="logobar">
			<a href="main.mvc"><img class="logo" alt="logo" src="img/logo.png"></a>
			<ul>
				<c:if test="${not empty user }">
					<a href="expectedIntake.mvc"><li class="info_eat">예상 섭취 정보</li></a>
				</c:if>
				<c:if test="${empty user }">
					<li class="info_eat">예상 섭취 정보</li>
				</c:if>
				<li class="info_my">
					<c:if test="${not empty user }">
						<a href="eatFoodList.mvc">내 섭취정보</a>
					</c:if>
					<c:if test="${empty user }">
						내 섭취 정보
					</c:if>
				</li>
				<li class="info_best">베스트 섭취 정보</li>
				<li class="info_item">
					<c:if test="${not empty user }">
						<a href="foodlist.mvc">상품정보</a>
					</c:if>
					<c:if test="${empty user }">
						상품정보
					</c:if>
				</li>
				<li class="announce">
                <c:if test="${not empty user }">
                        <a href="boardList.mvc">공지사항</a>
                </c:if>
                <c:if test="${empty user }">
                      		  공지사항
                </c:if>    
                </li>
			</ul>
		</nav>
	</header>
	<div class="graybox">
		<h3>WHAT WE PROVIDE</h3>
		<h5>건강한 삶을 위한 먹거리 프로젝트</h5>
	</div>
	<div class="darkbox">
		<form action="search_result.mvc" method="get">
			<table>
				<tr>
					<td>검색조건</td>
					<td>검색단어</td>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td>
						<select name="search_opt">
							<option value="name">식품명</option>	
							<option value="maker">제조사</option>	
							<option value="material">원재료</option>	
						</select>
					</td>
					<td><input type="text" name="searchValue"></td>
					<td><button id="search" type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item"><a href="foodlist.mvc">상품정보</a></li>
		</ol>
	</nav>
	<div class="alert" style="display: none;">
	 	<c:if test="${fn:length(contains) > 0 }">
			<div class="alert alert-danger" role="alert">
				주의! 회원님의 알레르기 성분이 포함된 식품입니다. (
				<c:forEach items="${contains }" var="allergy">
					${allergy }&nbsp;
				</c:forEach>
				)
			</div>
	 	</c:if>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h2 class="product">
					제품 정보
					<input id="foodCalory" hidden="foodCalory" value="${ food.getCalory() }">
					<input id="foodCarbo" hidden="foodCarbo" value="${ food.getCarbo() }">
					<input id="foodProtein" hidden="foodProtein" value="${ food.getProtein() }">
					<input id="foodFat" hidden="foodFat" value="${ food.getFat() }">
					<input id="foodSugar" hidden="foodSugar" value="${ food.getSugar() }">
					<input id="foodNatrium" hidden="foodNatrium" value="${ food.getNatrium() }">
					<input id="foodChole" hidden="foodChole" value="${ food.getChole() }">
					<input id="foodFattyacid" hidden="foodFattyacid" value="${ food.getFattyacid() }">
					<input id="foodTransfat" hidden="foodTransfat" value="${ food.getTransfat() }">
				</h2>
				<hr>
				<table class="table">
					<tbody>
						<tr>
							<td rowspan="5"><img style="height: 300px; width: 300px"
								src="${ food.getImg() }" /></td>
						</tr>
						<tr>
							<th scope="row">제품명</th>
							<td>${ food.getName() }</td>
						</tr>
						<tr>
							<th scope="row">제조사</th>
							<td>${ food.getMaker() }</td>
						</tr>
						<tr>
							<th scope="row">원재료</th>
							<td>${ food.getMaterial() }</td>
						</tr>
						<tr>
							<th scope="row">알레르기 성분</th>
							<td>${ food.getAllergy() }</td>
						</tr>
					</tbody>
				</table>
				<hr>	
				<div class="col-md-2 col-md-offset-9">
					수량
					<input style="margin-bottom:5px" type="number" id="cnt">
					<br>
					<button type="button" class="btn btn-primary" id="btAdd">추가</button>
					<!-- <button type="button" class="btn btn-primary">찜</button> -->
				</div>
				<br>
				<div class="col-md-7 col-md-offset-1"> 
					<canvas id="myChart" width="400px" height="400px"></canvas>
				</div>
				<div class="col-md-4">
					<table style=" margin-top:40px;" class="table table-striped">
								<tbody>
									<tr>
										<th colspan="2">총 칼로리</th>
										<td></td>
										<td>${food.getCalory() }</td>
									</tr>
									<tr>
										<th colspan="2">탄수화물</th>
										<td></td>
										<td>${food.getCarbo() }</td>
									</tr>
									<tr>
										<th colspan="2">단백질</th>
										<td></td>
										<td>${food.getProtein() }</td>
									</tr>
									<tr>
										<th colspan="2">지방</th>
										<td></td>
										<td>${food.getFat() }</td>
									</tr>
									<tr>
										<th colspan="2">당류</th>
										<td></td>
										<td>${food.getSugar() }</td>
									</tr>
									<tr>
										<th colspan="2">나트륨</th>
										<td></td>
										<td>${food.getNatrium() }</td>
									</tr>
									<tr>
										<th colspan="2">콜레스테롤</th>
										<td></td>
										<td>${food.getChole() }</td>
									</tr>
									<tr>
										<th colspan="2">포화 지방산</th>
										<td></td>
										<td>${food.getFattyacid() }</td>
									</tr>
									<tr>
										<th colspan="2">트랜스지방</th>
										<td></td>
										<td>${food.getTransfat() }</td>
									</tr>
								</tbody>
							</table>
				</div>
			</div>
		</div>
	</div>
<!-- 	<button type="button" class="btn btn-primary" id="btnChartDraw">차트그리기</button> -->
	
</body>
</html>
