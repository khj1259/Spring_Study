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
<title>QnA 게시판</title>
</head>
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
.btn-primary{
    width :80px;
    display:block;
    margin: 0 auto;
}
#board{
    width: 80%;
    margin: 0 auto;
}
#input{
    width:80%;
    margin: 0 auto;
}
#buttondiv{
    display: block;
    width : 250px;
    margin: 0 auto;
}
#name{
    border-style: none;
}
#titleField{
    text-align:left;
    width: 100%;
    margin: 0 auto;
    
}
#infoField{
    width: 100%;
    text-align:right;
    margin: 0 auto;
    
}
</style>
<body>
<header>
        <nav class="blackbar">
            <ul>
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
                        내 섭취정보
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
                <li class="breadcrumb-item"><a href="boardList.mvc.mvc">공지사항</a></li>
        </ol>
    </nav>
    <div id="input">
    <section>
        <form method="post" action="boardWrite.mvc">    <!--  ./ 생략 된것임 -->
            <fieldset id="titleField">
            <legend>
            <h2><input type="text" name="title" placeholder="제목을 입력하세요"></h2>
            </legend>
            </fieldset>
            
            <fieldset id="infoField">
            <legend>
            작성자 <input type="text" id="name" name="id" value="${userId }" readonly="readonly">
            </legend>
            </fieldset>
            
            
            <br>
            <br>
            <h2>Content</h2>
            <br>
            <textarea rows="30" cols="100"  name="content" placeholder="내용을 입력하세요"></textarea><br>
            <div id="buttondiv">
            <input type="submit" value="등록"/>
            <input type="reset" value="취소"/>
            </div>
        </form>
    </section>
    </div>
    
    <footer>
        <h3>Find us</h3>
        <hr>
        <div>
            <img alt="pin" src="img/pin.png" style="height: 25px; width: 20px;">(SSAFY)서울시 강남구 테헤란로 멀티스퀘어
        </div>
        <div>
            <img alt="phone" src="img/phone.png" style="height: 25px; width: 20px;">1544-9001
        </div>
        <div>
            <img alt="mail" src="img/mail.png" style="height: 25px; width: 25px;"><a href="#">admin@ssafy.com</a>
        </div>
    </footer>
    
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
</body>
</html>
<!--  readonly 값을 바꿀수 없는것  -->