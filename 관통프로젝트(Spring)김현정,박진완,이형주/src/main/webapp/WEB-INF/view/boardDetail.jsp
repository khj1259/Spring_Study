<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<!--  메누파일 -->
		<h1> 게시물 조회 </h1>
	</header>
	
	<section>
		<form method="post">
			번호: <input type="text" name="bnum" value="${board.bnum}" readonly="readonly">		<br>
			제목: <input type="text" name="title" value="${board.title }"><br>
			조회수: ${board.cnt}<br>
			작성날짜: ${board.bdate}<br>
			내용: <textarea rows="30" cols="100" name="content">${board.content}</textarea><br>
			<input type="button" value="확인" onclick="location.href='${pageContext.request.contextPath}/boardList.mvc'"/>
			
			<c:if test="${sessionScope.userId eq board.id}">
			<input type="submit" value="수정" formaction="${pageContext.request.contextPath}/boardModify.mvc"/>
			<input type="submit" value="삭제" formaction="${pageContext.request.contextPath}/boardDelete.mvc"/>
			
			</c:if>
		</form>
	</section>

</body>
</html>

<!--  readonly   -->