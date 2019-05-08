<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1> 게시물 작성 </h1>
	</header>
	
	<section>
		<form method="post" action="boardWrite.mvc">    <!--  ./ 생략 된것임 -->
			제목: <input type="text" name="title" ><br>
			작성자: <input type="text" name="id" value="${userId }" readonly="readonly"><br>
			내용: <textarea rows="30" cols="100" name="content"></textarea><br>
			<input type="submit" value="등록"/>
			<input type="reset" value="취소"/>
		</form>
	</section>

</body>
</html>


<!--  readonly 값을 바꿀수 없는것  -->