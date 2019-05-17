<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="24kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">

.contents img {
	width: 200px;
	height: 200px;
}

.txt {
	background-color: #F6F6F6;
}

.item {
	margin-bottom: 10px;
	margin-right: 10px;
}

nav ul a {
	color: black;
}
.row{
	margin-bottom: 15px;
}
.contents{
	width: 80%;
	margin: 0 auto;
}
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경1.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
</style>
<script type="text/javascript">
$(function () {
	//추가버튼 클릭 시
	$('.btAdd').click(function() {
		//$('.alert').show();
		var code =  $(this).val();
		var cnt = prompt('섭취수량을 입력해 주세요');
		if(cnt != null){
			$.ajax({
				url:"eatFoodAdd.mvc",
				type:"POST",
				data:"code="+code+"&cnt="+cnt,
				success:function(){
					alert('추가되었습니다');
				}
			});
		}
	});
	//찜버튼 클릭 시
	$('.btWish').click(function() {
		//$('.alert').show();
		var code =  $(this).val();
		var cnt = prompt('수량을 입력해 주세요');
		if(cnt != null){
			$.ajax({
				url:"wishListAdd.mvc",
				type:"POST",
				data:"code="+code+"&cnt="+cnt,
				success:function(){
					alert('찜목록에 추가되었습니다');
				}
			});
		}
	});
});
</script>
</head>
<body>
	<%@include file="topmenu.jsp" %>
	<div class="header_img"></div>
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">상품정보</li>
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
	<!-- content -->
	<div class="contents">
		<c:forEach items="${list }" var="food" varStatus="idx">
			<c:choose>
				<c:when test="${idx.count mod 2 eq 1 }">
					<div class="row">
						<div class="col-sm-6">
							<div class="item">
								<div class="col-sm-3">
									<a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img
										src="${food.img }"></a>
								</div>
								<div class="col-sm-9 txt">
									<h3>${food.name }</h3>
									<p>${food.material }</p>
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-primary btAdd"
											value="${food.code }">추가</button>
										<button type="button" class="btn btn-primary btWish" value="${food.code }">찜</button><br>
									</div>
								</div>
							</div>
						</div>
				</c:when>
				<c:otherwise>
						<div class="col-sm-6">
							<div class="item">
								<div class="col-sm-3"><a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img src="${food.img }"></a></div>
								<div class="col-sm-9 txt">
									<h3>${food.name }</h3><p>${food.material }</p>
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-primary btAdd" value="${food.code }">추가</button>
										<button type="button" class="btn btn-primary btWish" value="${food.code }">찜</button><br>
									</div>
								</div>
							</div>
						</div>
					</div>		
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<!-- content end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>