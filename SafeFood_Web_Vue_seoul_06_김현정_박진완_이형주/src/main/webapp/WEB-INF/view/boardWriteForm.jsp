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
    width:50%;
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
    text-align:left;
    margin: 0 auto;
    
}
#inside{
    height: auto;
    border:2px solid;
    width:100%;
    padding:20px;
    margin-top: 20px;
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
                <li class="breadcrumb-item"><a href="boardList.mvc">공지사항</a></li>
        </ol>
    </nav>
      <div id="input">
        <section>
            <div id="inside">
                <form method="post" action="boardWrite.mvc">
                    <!--  ./ 생략 된것임 -->
                    <fieldset id="titleField">
                        <legend>
                            <h3>
                                제목 : <input type="text" name="title" placeholder="제목을 입력하세요" style="border: none; width: 70%;">
                            </h3>
                        </legend>
                    </fieldset>
                    <fieldset id="infoField">
                        <legend>
                <%--             <p style="font-size: 30px;" id="name" name="id">작성자 : ${userId}</p> --%>
                        <h3> 작성자: <input type="text" id="name" name="id" value="${userId }" readonly="readonly" style="font-size: 20px;"> </h3>
                        </legend>
                    </fieldset>
                    <h3>Content</h3>
                    <textarea rows="20" cols="80" name="content" placeholder="내용을 입력하세요" style="width: 100%"></textarea>
                    <br>
                    <div id="buttondiv">
                        <input class="btn btn-success btn-lg" type="submit" value="등록" style="margin-right: 15px;"/>
                        <input class="btn btn-danger btn-lg" type="reset" value="취소" />
                    </div>
                </form>
            </div>
        </section>
    </div>
    <%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>
<!--  readonly 값을 바꿀수 없는것  -->