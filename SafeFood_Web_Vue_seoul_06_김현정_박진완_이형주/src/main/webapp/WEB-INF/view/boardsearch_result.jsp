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
<!-- vue, axios -->
<script src="https://unpkg.com/vue"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<title>공지사항 게시판</title>
</head>
<style type="text/css">
#writeBt {
    display: block;
    margin: 0 auto;
    width: 80px;
}
#board {
    width: 80%;
    margin: 0 auto;
}
table, th {
    text-align: center;
}
th:nth-child(2) {
    width: 60%;
}
th:nth-child(4) {
    width: 10%;
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
    <div id="board">
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
                <c:forEach items="${boardlist }" var="board" varStatus="idx">
                <tr>
                    <td scope="row">${board.bnum}</td>
                    <td><a href="boardDetail.mvc?bnum=${board.bnum}">${board.title }</a></td> 
                    <td>${board.id}</td>
                    <td>${board.bdate}</td>
                    <td>${board.cnt}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <a class="btn btn-primary" id="writeBt"
            href="${pageContext.request.contextPath}/boardWrite.mvc"
            role="button">글쓰기</a>
    </div>
    <script type="text/javascript">
        $(function() {
            $('#userinfo').click(function() {
                location.href = 'userInfo.mvc';
            });
            $('#logout').click(function() {
                location.href = 'logout.mvc';
            });
        });
    </script>
    <!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>