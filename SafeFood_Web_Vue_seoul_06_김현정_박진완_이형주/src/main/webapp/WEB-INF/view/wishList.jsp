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
.bono{
	position:absolute;
	float: left;
	padding-right: 10px;
	
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
.darkbox input, select{
	color: white;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {    
		//삭제 버튼 클릭시
		$('.delBt').click(function () {
			var wishcode = $(this).val();
			var flag = confirm("삭제하시겠습니까?");
			if(flag){
				$.ajax({
					url:"wishListDelete.mvc",
					type:"POST",
					data:{wishcode:wishcode},
					success:function(){
						alert('삭제되었습니다');
						window.location.reload();
					}
				});
			}
		});
		
		//수정 버튼 클릭시
		$('.updateBt').click(function () {
			var wishcode = $(this).val();
			var cnt = prompt('수정할 수량을 입력해 주세요');
			if(cnt != null){
				$.ajax({
					url:"wishListUpdate.mvc",
					type:"POST",
					data:{wishcode:wishcode, cnt:cnt},
					success:function(){
						alert('수정되었습니다');
						window.location.reload();
					}
				});
			}
		});
	});
</script>
</head>
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
					<td><select name="search_opt">
							<option value="name">식품명</option>
							<option value="maker">제조사</option>
							<option value="material">원재료</option>
					</select></td>
					<td><input type="text" name="searchValue"></td>
					
					<td><button id="search" type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- contents -->
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item"><a href="userInfo.mvc">회원정보</a></li>
			<li class="breadcrumb-item active" aria-current="page">예상섭취정보</li>
		</ol>
	</nav>
	<div class="back">
		<div class="container">
			<fieldset>
			<legend><h2>예상 섭취 식품<img src="img/bono.gif" width=150px height=150px></h2>
			<br>
			<br>
			</legend>
			</fieldset>
			
		<c:forEach items="${list }" var="food" varStatus="idx">
			<c:choose>
				<c:when test="${idx.count mod 2 eq 1 }">
					<div class="col-sm-6">
						<div class="row item">
							<div class="col-sm-3"><a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img src="${food.img }"></a></div>
							<h3>${food.name }</h3><h4>수량 : ${food.cnt}</h4>	
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-primary delBt" value="${food.wishcode }">삭제</button>
									<button type="button" class="btn btn-primary updateBt" value="${food.wishcode }">수정</button><br>
								</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col-sm-6">
						<div class="row item">
							<div class="col-sm-3"><a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img src="${food.img }"></a></div>
							<h3>${food.name }</h3><h4>수량 : ${food.cnt}</h4>	
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-primary delBt" value="${food.wishcode }">삭제</button>
									<button type="button" class="btn btn-primary updateBt" value="${food.wishcode }">수정</button><br>
								</div>
						</div>
					</div>
				</div>		
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	</div>
	<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>