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
		<h2>자동차관리-자동차 등록</h2>
		<form action="carAddDo.do" method="post">
		<table>
			<tr>
				<th>차량번호</th>
				<td>${carDetail.num}</td>
			</tr>
			<tr>
				<th>모델명</th>
				<td>${carDetail.model}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${carDetail.price}만원</td>
			</tr>
			<tr>
				<th>제조사</th>
				<td>
				${carDetail.vendor}
				</td>
			</tr>
		</table>
		<a href="/">메인페이지로</a>
		<a href="list.do">자동차 목록 페이지로</a>
		</form>
	</body>
</html>