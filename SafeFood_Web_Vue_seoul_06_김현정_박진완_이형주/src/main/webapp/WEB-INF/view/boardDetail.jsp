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
#input{
 /*    font-style:inherit;
    font-size:40px;
    border-style: none; */
       width:50%;
    margin: 0 auto;
}
#titleField{
    width: 100%;
    margin: 0 auto;
}
#infoField{
    width: 50%;
    text-align:right;
    margin: 0 auto;
}
#textField{
    width: 100%;
    height: 400px;
    text-align:left;
    margin: 0 auto;
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
.header_img{
    width: 100%;
    height: 242px;
    background-image: url("img/배경2.PNG");
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
#input{
    width:50%;
    margin: 0 auto;
}
#inside{
    height: auto;
    border:2px solid;
    width:100%;
    padding:20px;
    margin-top: 20px;
}
</style>
<body>
    <%@include file="topmenu.jsp" %>
    <div class="header_img"></div>
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="boardList.mvc">공지사항</a></li>
        </ol>
    </nav>
    <div id="input">
        <section>
            <div id="inside">
                <form method="post">
                    <fieldset id="titleField">
                        <legend>
                            <h3>
                               	 글 번호 : <input type="text" id="input" name="bnum" value="${board.bnum}" readonly="readonly" style="width: 100pt; border:none; margin-right: 500px ">
                                <div style="float: right;">
                                 조회수 : ${board.cnt}<%--  작성날짜: ${board.bdate} --%>
                                 </div>
                            </h3>
                        </legend>
                        <legend>
                            <h3>
                               	 제목  : <input type="text" id="input" name="title" value="${board.title}" style="width: 350pt; border: none; ">
                                <div style="float: right;">
                              	  작성자  : <input type="text" id="input" name="id" value="${userId }" readonly="readonly" style="text-align:right; width: 120pt; border: none; ">
                                </div>
                            </h3>
                        </legend>
                    </fieldset>
                    <h3>Content</h3>
                    <textarea rows="30" cols="50" name="content" id="textField" style="font-size: large;">${board.content}</textarea>
                    <br>
                    <div id="buttondiv">
                        <input class="btn btn-success" type="button" id="checkButton" value="확인" onclick="location.href='${pageContext.request.contextPath}/boardList.mvc'" />
                        <c:if test="${sessionScope.userId eq board.id}">
                            <c:if test="${sessionScope.userId!='admin'}">
                                <input class="btn btn-warning" type="submit" id="modifyButton" value="수정" formaction="${pageContext.request.contextPath}/boardModify.mvc" />
                                <input class="btn btn-danger" type="submit" id="deleteButton" value="삭제" formaction="${pageContext.request.contextPath}/boardDelete.mvc" />
                            </c:if>
                        </c:if>
                        <!-- 관리자일 때 삭제 가능, 관리자 ID : admin -->
                        <c:if test="${sessionScope.userId=='admin'}">
                            <input class="btn btn-warning" type="submit" id="modifyButton" value="수정" formaction="${pageContext.request.contextPath}/boardModify.mvc" />
                            <input class="btn btn-danger" type="submit" id="deleteButton" value="삭제" formaction="${pageContext.request.contextPath}/boardDelete.mvc" />
                        </c:if>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>