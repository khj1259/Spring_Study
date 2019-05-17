<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="24kb"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- vue, axios -->
<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<title>Safe Food</title>
<style type="text/css">
img {
	width: 100%;
}

.item {
	height: 500px;
}

#content {
	padding-top: 50px;
	display: table;
	margin: 0 auto;
	padding: 22px 0;
	width: 90%;
	font: 13px/22px Helvetica, Arial, sans-serif;
	background: #FFFFFF;
}

#mainContent {
	display: table-cell;
	width: 80%;
	padding-right: 22px;
}

aside {
	display: table-cell;
	width: 300px;
	background-color: white;
}

.blogPost header p, .blogPost header p a {
	font-size: 14px;
	font-style: italic;
	color: #777;
}

.blogPost header p a:hover {
	text-decoration: none;
	color: #000;
}

.blogPost div {
	-moz-column-count: 2;
	-webkit-column-count: 2;
	-moz-column-gap: 22px;
	-webkit-column-gap: 22px;
}

.blogPost img {
	margin: 22px 0;
	-webkit-box-shadow: 3px 3px 7px #777;
}

/* #newproduct {
	padding-left: 106px; margin-top : 21px;
	padding-top: 22px;
	border-top: 0px solid #d7d7d7;
	margin-top: 21px;
} */

#newproduct article {
	width: 500px; padding : 21px;
	background: #E3E3E3;
	border: 1px solid #d7d7d7;
	-moz-border-radius: 11px;
	-webkit-border-radius: 11px;
	padding: 21px;
}

#newproduct article header {
	display: table-cell;
	width: 220px;
	padding-right: 22px;
}

#newproduct article header a {
	display: block;
	font-weight: bold;
	color: #000;
}

#newproduct article header a:hover {
	text-decoration: none;
}

#newproduct article p {
	padding: 0;
}

#coffee {
	width: 320px;
}

video {
	padding-top: 30px;
	border-radius: px;
	object-fit: fill;
}

#videotd {
	border: 1px solid;
	border-left-color: white;
	border-right-color: white;
	border-bottom-color: white;
}

/* #new {
	width: 600px;
	height: 300px;
}

#new2 {
	padding-left:106px;
	width: 1000px;
	height: 300px;
} */
#new, #new2{
	 width:600px;
	 height:300px;
}

section {
	border-top-color: white;
}

#board, #newproduct {
	width: 1300px;
	margin: 0 auto;
}

#title {
	border-radius: 5px;
	width: 100%;
	height: 90%;
}

#boardtitle {
	text-align: right;
	font-size: 20px;
	font-style: normal;
	color: black;
}

#boardid {
	text-align: right;
	font-size: 15px;
}

#bestseller {
	font-size: 30px;
	font-family: 'Noto Sans KR', sans-serif;
}

#announce {
	font-size: 30px;
	font-family: 'Noto Sans KR', sans-serif;
}

#card {
	width: 95%;
	height: 95%;
	border: 1px solid;
	border-left-color: white;
	border-right-color: white;
	border-bottom-color: white;
	vertical-align: top;
}

#newitems {
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}

#interval {
	width: 10%;
}

#productline {
	border: 1px solid;
	border-left-color: white;
	border-right-color: white;
	border-bottom-color: white;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/view/topmenu.jsp"%>
	<!-- carousel -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="img/진짜쫄면.jpg"
					onclick="location.href='searchFood.mvc?code=21'" alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="img/진라면.jpg"
					onclick="location.href='searchFood.mvc?code=2'" alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="img/우유.jpg"
					onclick="location.href='searchFood.mvc?code=12'" alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="img/서울우유.PNG"
					onclick="location.href='searchFood.mvc?code=11'" alt="...">
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
	<div id="content">
		<table border="0" id="board">
            <tr>
                <td id="interval"></td>
                <td><p style="margin-right: 0px" id="bestseller">Best
                        Seller</p></td>
                <td id="interval"></td>
                <td id="announcetd"><p style="" id="announce">공지사항</p></td>
            </tr>
            
            <tr>
                <td id="interval"></td>
                <td id="videotd"><video muted autoplay loop src="img/칸타탁.mkv"
                        width="600" height="406"></video></td>
                <td id="interval"></td>
                <td id="card" style="margin: 0 auto;">
                <div style="font-size: 11pt; margin-bottom: 50px; margin-top: 10px;">
               			<div class="col-sm-2">
                            <span>글번호</span>
                        </div>
                        <div class="col-sm-6">
                            <span>제목</span>
                        </div>
                        <div class="col-sm-2">
                            <span>   글쓴이</span>
                        </div>
                        <div class="col-sm-2">
                            <span>등록일자</span>
                        </div>
                </div>
                <template v-for="item in items">
                    <div id="title">
                        <div class="col-sm-2">
                            <span>{{item.bnum}}</span>
                        </div>
                        <div class="col-sm-6">
                       
                        <c:if test="${not empty sessionScope.user }">
						 <a id="boardtitle"
                                v-bind:href="'boardDetail.mvc?bnum='+item.bnum">{{item.title}}</a>
						</c:if>
						
						  <c:if test="${empty sessionScope.user }">
						 <a id="boardtitle">{{item.title}}</a>
						</c:if>
                           
                        </div>
                        <div class="col-sm-2">
                            <span>{{item.id}}</span>
                        </div>
                        <div class="col-sm-2">
                            <span>{{item.bdate}}</span>
                        </div>
                    </div>
                    <hr>
                    <hr>
                    </template></td>
                    <hr>
            </tr>
        </table>
		
		<!-- <section id="newproduct"> -->
        <table id="newproduct">
            	<tr>
            		<td id="interval"></td>
                	<td><h3 id="bestseller">신제품 안내</h3></td>
                	<td id="interval"></td>
                	<td id="announcetd"></td>
            	</tr>
            	<tr>
            		<td id="interval"></td>
                	<td>
                    <p>
                    	<c:if test="${not empty sessionScope.user }">
	                        <a href="searchFood.mvc?code=22">
	                        <img src="img/신라면건면.jpg"  height="300px" id="new">
	                        </a>
	                    </c:if>
	                    <c:if test="${empty sessionScope.user }">
	                    	<img src="img/신라면건면.jpg"  height="300px" id="new">
	                    </c:if>
                    </p>
                	</td>
                	<td id="interval"></td>
                	<td>
                    <p>
                   		<c:if test="${not empty sessionScope.user }">
	                        <a href="searchFood.mvc?code=21">
	                        	<img src="img/진짜쫄면.jpg" height="300px" id="new2">
	                        </a>
	                    </c:if>
	                    <c:if test="${empty sessionScope.user }">
	                    	<img src="img/진짜쫄면.jpg" height="300px" id="new2">
	                    </c:if>
                    </p>
                </td>
            	</tr>
                
                
            </table>
        <!-- </section> -->
    </div>
	<!-- contents end -->
	<%@ include file="/WEB-INF/view/bottom.jsp"%>

	<!-- vue script -->
	<script type="text/javascript">
		var app = new Vue({
			el : '#board',
			data(){
				return {
					items : [],
					loading : true,
					errored : false
				}
			},
			mounted (){
				axios.get('boardList')
					.then(response => {
						console.log(response.data);
						this.items = response.data;
					})
					.catch(error => {
						console.log(error);
						this.errored = true;
					})
					.finally(() => this.loading = false)
			}
		});
		
	</script>
</body>
</html>