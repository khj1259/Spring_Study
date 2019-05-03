<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="searchPassword.mvc">
		<div class="form-group row">
					<label for="signup_id" class="col-sm-2 col-form-label">아이디<span style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id" required="required" placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="form-group row">
					<label for="signup_pw" class="col-sm-2 col-form-label">이름<span style="color: red">&nbsp;*</span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name" required="required" placeholder="이름을 입력하세요">
					</div>
				</div>
					<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">완 료</button>
					</div>
				</div>
	</form> 
	
	
	
</body>
</html>