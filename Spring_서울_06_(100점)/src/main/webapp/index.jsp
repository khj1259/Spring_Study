<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<body>
	<h1>메인페이지</h1>
	<c:if test="${sessionScope.user != null}">
			${sessionScope.user.id}님 로그인 되었습니다.<a href="logout.do">로그아웃</a>
		</c:if>
	<form action="login.do" method="post">
	id:<input type="text" name="id"/><br>
	pw:<input type="password" name="pw"/><br>
	<button type="submit">로그인</button>
	</form>
	<a href="carAdd.do">차량등록</a><br>
	<a href="list.do">차량목록</a><br>
</body>
</html>
