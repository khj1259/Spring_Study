<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td width="200px" align="center">아이디</td>
			<td width="200px" align="center">상품명</td>
			<td width="200px" align="center">가격</td>
			<td width="200px" align="center">상품설명</td>
		</tr>
		<tr>
			<td width="800px" colspan="4" bgcolor="hotpink"></td> 
		</tr>
		<c:forEach items="${list }" var="product">
		<tr>
			<td align="center">${product.id }</td>
			<td align="center">${product.name }</td>
			<td align="center">${product.price }</td>
			<td align="center">${product.description }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="right">
				<a href="addForm.do">상품추가하기</a>			 
			</td>
		</tr>
	</table>
</body>
</html>