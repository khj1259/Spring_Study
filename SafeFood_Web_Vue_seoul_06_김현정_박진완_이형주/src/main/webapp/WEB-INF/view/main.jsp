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
<%@include file="topmenu.jsp" %>
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
	<!-- contents -->
	<div class="container">
		<%-- <div class="row">
			<div>
				<img alt="" src="img/칸타타아메리카노.jpg">
			</div>
			<div class="data">
				<h2>칸타타아메리카노</h2>
				19.03.12 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">#아메리카노</a><br>
				<hr>
				<p>사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서
					고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을
					위하여서</p>
				<c:if test="${not empty user }">
				<button>추가</button>
				<button>찜</button>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div>
				<img alt="" src="img/맥심티오피마스터라떼.jpg">
			</div>
			<div class="data">
				<h2>칸타타아메리카노</h2>
				18.08.27 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">#라떼</a>&nbsp;&nbsp;<a
					href="#">#티오피</a><br>
				<hr>
				<p>사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서
					고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을
					위하여서</p>
				<c:if test="${not empty user }">
				<button>추가</button>
				<button>찜</button>
				</c:if>
			</div>

		</div> --%>
	</div>
	<!-- contents end -->
<%@ include file="bottom.jsp" %>
</body>
</html>