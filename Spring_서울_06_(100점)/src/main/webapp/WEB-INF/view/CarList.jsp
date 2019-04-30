<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function on_del(){
				document.getElementById("flist").submit();
				
			}
		</script>
	</head>
	<body>
		<form id="flist" action="carDel.do" method="post">
		<input type="hidden" name="numlist" value="0"/>
		<c:if test="${sessionScope.user != null}">
			${sessionScope.user.id}님 로그인 되었습니다.<a href="logout.do">로그아웃</a>
		</c:if>
		<h2>자동차관리-리스트</h2>
		<table>
			<tr>
				<th>모델번호</th>
				<th>모델이름</th>
				<th>가격</th>
				<th>제조사명</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach items="${clist}" var="item">
			<tr>
				<td><a href="carView.do?num=${item.num}">${item.num}</a></td>
				<td>${item.model}</td>
				<td>${item.price}원</td>
				<td>${item.vendor}</td>
				<td><input type="checkbox" name="numlist" value="${item.num}"/></td>
			</tr>
			</c:forEach>
		</table>
		<a href="carAdd.do">추가등록</a>
		<a href="#" onclick="on_del()">선택항목 삭제</a>
		</form>
	</body>
</html>