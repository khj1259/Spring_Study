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
 <%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>
<!--  readonly 값을 바꿀수 없는것  -->