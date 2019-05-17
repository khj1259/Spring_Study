<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- vue, axios -->
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<title>공지사항 게시판</title>
</head>
<style type="text/css">
#writeBt{
	display: block;
	margin: 0 auto;
	width: 80px;
}
#board{
	width: 60%;
	margin: 0 auto;
}
#board table, th{
	text-align: center;
}
#board th:nth-child(2) {
	width: 60%;
}
#board th:nth-child(4) {
	width: 10%;
}
#board thead{
	background-color: #EAEAEA;
	border-top: 1px black solid;
}
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경2.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
</style>
<body>
<%@include file="topmenu.jsp" %>
	<div class="header_img"></div>
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">공지사항</li>
		</ol>
	</nav>
	<div class="darkbox">
		<form action="search_boardresult.mvc" method="get">
			<table>
				<tr>
					<td><select name="search_opt">
							<option value="title">제목</option>
							<option value="author">작성자</option>
					</select></td>
					<td><td>
						<div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text"
									name="searchBoardValue" class=" search-query form-control"
									placeholder="공지사항 검색" />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger"
										id="search" type="submit">
                                        <span
											class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </td>
                    </td>
					
                </tr>
            </table>
        </form>
	</div>

	<!-- contents -->
	<br>
	<div id="board">
		<h1>공지사항</h1>
		<br>
		<div v-if="errored">Error In AJAX Transport</div>
		<div v-else>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">날짜</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<template v-for="item in items">
						<tr>
							<td scope="row">{{item.bnum}}</td>
							<td><a v-bind:href="'${pageContext.request.contextPath}/boardDetail.mvc?bnum='+item.bnum">{{item.title}}</a></td>
							<td>{{item.id}}</td>
							<td>{{item.bdate}}</td>
							<td>{{item.cnt}}</td>
						</tr>
					</template>
				</tbody>
			</table>
			<a class="btn btn-primary" id="writeBt" href="${pageContext.request.contextPath}/boardWrite.mvc" role="button">글쓰기</a>
		</div>
	</div>
	
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
	<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>