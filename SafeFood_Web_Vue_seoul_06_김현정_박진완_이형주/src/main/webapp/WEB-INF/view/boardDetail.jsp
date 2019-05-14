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
<title>게시물 상세보기</title>
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
#input{
    font-style:inherit;
    font-size:40px;
    border-style: none;
}
#titleField{
    text-align:center;
    width: 50%;
    margin: 0 auto;
    
}
#infoField{
    width: 50%;
    text-align:right;
    margin: 0 auto;
}
#textField{
    width: 50%;
    margin: 0 auto;
    display:block;
}
#checkButton{
    width :80px;
    margin: 0 auto;
}
#modifyButton{
    width :80px;
    margin: 0 auto;
}
#deleteButton{
    width :80px;
    margin: 0 auto;
}
#buttondiv{
    display: block;
    width : 250px;
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
    
    
    <div class="contents">
    <br>
    <table class="table table-hover">
    <section>
        <form method="post">
            <fieldset id ="titleField">
            <legend>
            <input type="text" id="input" name="bnum" value="${board.bnum}" readonly="readonly" size="2"><input type="text" id="input" name="title" value="${board.title }">
            </legend>
            </fieldset>
            
            <fieldset id="infoField">
            <legend>
            조회수  : ${board.cnt} 작성날짜: ${board.bdate}
            </legend>
            </fieldset>
            <br>
            <br>
            
            <textarea rows="30" cols="100" name="content" id="textField">${board.content}</textarea><br>
            <div id="buttondiv">        
            <input type="button" id="checkButton" value="확인" onclick="location.href='${pageContext.request.contextPath}/boardList.mvc'"/>
            
            
            <c:if test="${sessionScope.userId eq board.id}">
            <c:if test="${sessionScope.userId!='admin'}">
            <input type="submit" id="modifyButton" value="수정" formaction="${pageContext.request.contextPath}/boardModify.mvc"/>
            <input type="submit" id="deleteButton" value="삭제" formaction="${pageContext.request.contextPath}/boardDelete.mvc"/>
            </c:if>
            </c:if>
            
            <!-- 관리자일 때 삭제 가능, 관리자 ID : admin -->
            <c:if test="${sessionScope.userId=='admin'}">
            <input type="submit" id="modifyButton" value="수정" formaction="${pageContext.request.contextPath}/boardModify.mvc"/>
            <input type="submit" id="deleteButton" value="삭제" formaction="${pageContext.request.contextPath}/boardDelete.mvc"/>
            </c:if>
            </div>
        </form>
    </section>
    </table>
    </div>
    
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>
