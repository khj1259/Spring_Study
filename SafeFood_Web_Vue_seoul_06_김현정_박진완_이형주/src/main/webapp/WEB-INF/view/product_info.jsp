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
<style type="text/css">
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
.darkbox input, select{
	color: white;
}
.row{
	margin-bottom: 15px;
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
			
				//추가버튼 클릭시
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
				//찜버튼 클릭 시
				$('#btWish').click(function() {
					$('.alert').show();
					var code =  ${ food.getCode() };
					var cnt = $('#cnt').val();
					$.ajax({
						url:"wishListAdd.mvc",
						type:"POST",
						data:"code="+code+"&cnt="+cnt,
						success:function(){
							alert('찜목록에 추가되었습니다');
						}
					});
				});
			})
</script>
<body>
	<%@include file="topmenu.jsp" %>
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
					<button type="button" class="btn btn-primary" id="btWish">찜</button>
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
	<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>
