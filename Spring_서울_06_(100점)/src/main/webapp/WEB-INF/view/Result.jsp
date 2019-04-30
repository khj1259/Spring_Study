<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test="${sessionScope.user != null}">
			${sessionScope.user.id}님 로그인 되었습니다.<a href="logout.do">로그아웃</a>
		</c:if>
		<h2>자동차관리-등록 성공</h2>
		<h2><a href="list.do">자동차 목록 조회</a></h2>
	</body>
</html>