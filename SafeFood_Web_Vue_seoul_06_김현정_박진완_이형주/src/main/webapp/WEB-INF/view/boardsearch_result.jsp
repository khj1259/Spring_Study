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
<title>QnA 게시판</title>
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
.darkbox input, select {
    color: white;
}
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
</style>
<body>
    <%@include file="topmenu.jsp" %>
    <div class="graybox">
        <h3>WHAT WE PROVIDE</h3>
        <h5>건강한 삶을 위한 먹거리 프로젝트</h5>
    </div>
    <div class="darkbox">
        <form action="search_boardresult.mvc" method="get">
            <table>
                <tr>
                    <td>검색조건</td>
                    <td>검색단어</td>
                    <td>&nbsp</td>
                </tr>
                <tr>
                    <td><select name="search_opt">
                            <option value="title">제목</option>
                            <option value="author">작성자</option>
                    </select></td>
                    <td><input type="text" name="searchBoardValue"></td>
                    <td><button id="search" type="submit">검색</button></td>
                </tr>
            </table>
        </form>
    </div>
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
            <li class="breadcrumb-item active"><a href="boardList.mvc">전체보기</a></li>
        </ol>
    </nav>
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