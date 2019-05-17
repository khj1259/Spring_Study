<%@page import="com.ssafy.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="24kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>예상섭취식품</title>
<style type="text/css">
.bono{
	position:absolute;
	float: left;
	padding-right: 10px;
}
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경4-1.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
.item img{
	height: 180px;
	width: 200px;
}
.item{
	text-align: center;
	padding-bottom: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {    
		//삭제 버튼 클릭시
		$('.delBt').click(function () {
			var wishcode = $(this).val();
			var flag = confirm("삭제하시겠습니까?");
			if(flag){
				$.ajax({
					url:"wishListDelete.mvc",
					type:"POST",
					data:{wishcode:wishcode},
					success:function(){
						alert('삭제되었습니다');
						window.location.reload();
					}
				});
			}
		});
		
		//수정 버튼 클릭시
		$('.updateBt').click(function () {
			var wishcode = $(this).val();
			var cnt = prompt('수정할 수량을 입력해 주세요');
			if(cnt != null){
				$.ajax({
					url:"wishListUpdate.mvc",
					type:"POST",
					data:{wishcode:wishcode, cnt:cnt},
					success:function(){
						alert('수정되었습니다');
						window.location.reload();
					}
				});
			}
		});
		//추가버튼 클릭 시
		$('.btAdd').click(function() {
			//$('.alert').show();
			var code =  $(this).val();
			var wishcode = $(this).prev().val();
			console.log(wishcode);
			var cnt = $(this).parents().prev().val();
			if(cnt != null){
				$.ajax({
					url:"eatFoodAdd.mvc",
					type:"POST",
					data:"code="+code+"&cnt="+cnt,
					success:function(){
						$.ajax({
							url:"wishListDelete.mvc",
							type:"POST",
							data:{wishcode:wishcode},
							success:function(){
								window.location.reload();
								alert('추가되었습니다');
							}
						});
					}
				});
			}
		});
	});
</script>
</head>
<body>
<%@include file="topmenu.jsp" %>
 	<div class="blur header_img"></div>
 		<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item"><a href="userInfo.mvc">회원정보</a></li>
			<li class="breadcrumb-item active" aria-current="page">예상섭취정보</li>
		</ol>
	</nav>
   <div class="darkbox">
		<form action="search_result.mvc" method="get">
			<table>
				<tr>
					<td>
						<select name="search_opt">
							<option value="name">식품명</option>	
							<option value="maker">제조사</option>	
							<option value="material">원재료</option>	
						</select>
					</td>
					<td> <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" name="searchValue" class=" search-query form-control" placeholder="Search" />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" id="search" type="submit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </td>
					<!-- <td><input type="text" name="searchValue"></td>
					<td><button id="search" type="submit">검색</button></td> -->
				</tr>
			</table>
		</form>
	</div>
	<!-- contents -->

	<div class="back">
		<div class="container">
			<fieldset>
			<legend><h2>예상 섭취 식품<!-- <img src="img/bono.gif" width=150px height=150px> --></h2>
			<br>
			<br>
			</legend>
			</fieldset>
			
			<fieldset>
                <legend>
            <c:forEach items="${list}" var="food" varStatus="idx">
                        <div class="col-sm-2">
                            <div class="item">
                                <div>
                                    <a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img
                                        src="${food.img }"></a>
                                </div>
                                <h4>${food.name }</h4>
                                <h4>수량 : ${food.cnt}</h4>
                                <input type="text" value="${food.cnt}" style="display: none;" >
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-primary delBt" value="${food.wishcode }">삭제</button>
									<button type="button" class="btn btn-primary updateBt" value="${food.wishcode }">수정</button>
									<button type="button" class="btn btn-primary btAdd" value="${food.code }">추가</button>
								</div>
							</div>
                        </div>
            </c:forEach>
                  </legend>
            </fieldset>
	</div>
	</div>
	<!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>