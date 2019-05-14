<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="24kb"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Safe Food</title>
<style type="text/css">
img{
	width: 100%;
}
.item{
	height: 500px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/view/topmenu.jsp" %>
	    <!-- carousel -->
    <div id="carousel-example-generic" class="carousel slide"
        data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0"
                class="active"></li>
            <li data-target="#carousel-example-generic"  data-slide-to="1">
            <a href="searchFood.mvc?code=2"></a>
            </li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/진짜쫄면.jpg" alt="...">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="img/진라면.jpg" onclick="location.href='searchFood.mvc?code=2'" alt="...">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="img/우유.jpg" onclick="location.href='searchFood.mvc?code=12'" alt="...">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="img/서울우유.PNG" onclick="location.href='searchFood.mvc?code=11'" alt="...">
                <div class="carousel-caption"></div>
            </div>
        </div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- <div class="graybox">
		<h3>WHAT WE PROVIDE</h3>
		<h5>건강한 삶을 위한 먹거리 프로젝트</h5>
	</div> -->
	<%-- <div class="darkbox">
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
					
					<c:if test="${not empty user }">
					<td><button id="search" type="submit">검색</button></td>
					</c:if>
				
					<c:if test="${empty user}">
					<td><button id="test" type="reset" onclick="login()">검색</button></td>
					</c:if>
					
				</tr>
			</table>
		</form>
	</div> --%>
	<!-- contents -->
	<div class="container">
		<video muted autoplay loop src="img/칸타탁.mkv" width="1000" height="500">
        </video>
	
	</div>
	<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>