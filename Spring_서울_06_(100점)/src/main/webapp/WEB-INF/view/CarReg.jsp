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
		<form id="cform" action="carAddDo.do" method="post">
		<table>
			<tr>
				<th>차량번호</th>
				<td><input type="text" name="num" id="num" value="" maxlength="7" ></td>
			</tr>
			<tr>
				<th>모델명</th>
				<td><input type="text" name="model"/></td>
			</tr>
			<tr> 
				<th>가격</th>
				<td><input type="number" id="price" placeholder="0" name="price"/></td>
			</tr>
			<tr>
				<th>제조사코드</th>
				<td>
					<select name="vcode">
						<c:forEach items="${codelist}" var="item">
						<option value="${item.vcode}">${item.vcode}</option>
						</c:forEach>
					</select>
					
				</td>
			</tr>
		</table>
		<button type="submit">자동차 등록</button>
		<button type="reset">취소</button>
		</form>
	</body>
</html>