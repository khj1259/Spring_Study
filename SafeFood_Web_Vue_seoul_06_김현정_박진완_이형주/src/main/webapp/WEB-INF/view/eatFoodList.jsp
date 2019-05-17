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
<!-- chart -->
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<title>섭취식품</title>
<style type="text/css">
.bono {
    position: absolute;
    float: left;
    padding-right: 10px;
}
#best {
    color: red;
    margin-left: 170px;
}
#cal {
    color: aqua;
    margin-left: 170px;
}
#overcal {
    color: red;
    margin-left: 170px;
}
#nat {
    color: aqua;
    margin-left: 170px;
}
#overnat {
    color: red;
    margin-left: 170px;
}
.header_img {
    width: 100%;
    height: 242px;
    background-image: url("img/배경3-1.PNG");
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    /* text-align: center; */
    /* filter:blur(2px); */
}
/* .header_img h3{
    height: 185px;
   padding-top: 70px;
    color: #fff;
    font-size: 50px;
    font-weight: 550;
    text-align: center;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    font-family: font-family: 'Noto Sans KR', sans-serif;
}
.header_img h3 span{
    display: block;
    margin-top: 15px;
    font-size: 24px;
    font-weight: 300;
} */
#dual_x_div {
    margin: 0 auto;
}
.item img{
	height: 180px;
	width: 200px;
}
.item{
	padding-bottom: 25px;
	text-align: center;
}
#barchart_material{
	margin: 0 auto;
}
</style>
<script type="text/javascript">
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var data = new google.visualization.arrayToDataTable([
        [ '', '권장량', '섭취량' ],
        [ '칼로리', ${kcal }, ${cal } ],
        [ '나트륨', 2000, ${nat } ],
        [ '탄수화물', 328, ${carbo } ],
        [ '단백질', 60, ${protein } ],
        [ '지방', 65, ${fat } ]
         ]);
             var options = {
                      chart: {
                        title: 'Nutrition Graph',
                        subtitle: '본인의 섭취 정보를 확인하세요'
                      },
                      bars: 'horizontal' // Required for Material Bar Charts.
                    };
              var chart = new google.charts.Bar(document.getElementById('barchart_material'));
                chart.draw(data, google.charts.Bar.convertOptions(options));
        };
        // 차트 끝
        
$(document).ready(function () {
    //삭제 버튼 클릭시
    $('.delBt').click(function () {
        var eatfoodcode = $(this).val();
        var flag = confirm("삭제하시겠습니까?");
        if(flag){
            $.ajax({
                url:"eatFoodDelete.mvc",
                type:"POST",
                data:{eatfoodcode:eatfoodcode},
                success:function(){
                    alert('삭제되었습니다');
                    window.location.reload();
                }
            });
        }
    });
    
    //수정 버튼 클릭시
    $('.updateBt').click(function () {
        var eatfoodcode = $(this).val();
        var cnt = prompt('수정할 수량을 입력해 주세요');
        if(cnt != null){
            $.ajax({
                url:"eatFoodUpdate.mvc",
                type:"POST",
                data:{eatfoodcode:eatfoodcode, cnt:cnt},
                success:function(){
                    alert('수정되었습니다');
                    window.location.reload();
                }
            });
        }
    });
});
</script>
</head>
<body>
    <%@include file="topmenu.jsp"%>
    <div class="blur header_img"></div>
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
            <li class="breadcrumb-item"><a href="userInfo.mvc">회원정보</a></li>
            <li class="breadcrumb-item active" aria-current="page">내 섭취정보</li>
        </ol>
    </nav>
    <div class="darkbox">
        <form action="search_result.mvc" method="get">
            <table>
                <tr>
                    <td><select name="search_opt">
                            <option value="name">식품명</option>
                            <option value="maker">제조사</option>
                            <option value="material">원재료</option>
                    </select></td>
                    <td>
                        <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" name="searchValue"
                                    class=" search-query form-control" placeholder="Search" /> <span
                                    class="input-group-btn">
                                    <button class="btn btn-danger" id="search" type="submit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- contents -->
    <div class="back">
        <div class="container">
            <fieldset>
                <legend>
                    <h2>${userId }님의 섭취 정보입니다
                    </h2>
                    <br> <br>
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
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-primary delBt"
										value="${food.eatfoodcode }">삭제</button>
									<button type="button" class="btn btn-primary updateBt"
										value="${food.eatfoodcode }">수정</button>
									<br>
								</div>
							</div>
                        </div>
            </c:forEach>
                  </legend>
            </fieldset>
        </div>
    </div>
    <br>
    <fieldset>
        <legend> </legend>
    </fieldset>
    <div class="back">
        <div class="container">
            <c:set var="kcal" value="${kcal }"></c:set>
            <c:set var="cal" value="${cal }"></c:set>
            <c:if test="${kcal == -1}">
                <a><h5 id="best">권장 칼로리 : 추가 정보를 등록하셔야 확인할 수 있습니다.</h5></a>
                <a><h5 id="best">${userId }님의BMI:추가 정보를 등록하셔야 확인할 수 있습니다.</h5></a>
                <a><h5 id="cal">섭취 칼로리 : ${cal }</h5></a>
                <c:set var="nat" value="${nat }"></c:set>
                <c:if test="${nat>=2000}">
                    <a><h5 id="overnat">섭취한 나트륨 : ${nat }</h5></a>
                </c:if>
                <c:if test="${nat<2000}">
                    <a><h5 id="nat">섭취한 나트륨 : ${nat }</h5></a>
                </c:if>
            </c:if>
            <c:if test="${kcal != -1}">
                <c:set var="userBMI" value="${userBMI }"></c:set>
                <!-- 그래프 -->
                <div id="barchart_material" style="width: 900px; height: 500px;"></div>
                <a><h5 id="best">권장 칼로리 : ${kcal }</h5></a>
                <c:if test="${18.5<=userBMI&&userBMI<=23}">
                    <a><h5 id="cal">${userId }님의BMI:${userBMI}</h5></a>
                </c:if>
                <c:if test="${18.5>userBMI||userBMI>23}">
                    <a><h5 id="best">${userId }님의BMI:${userBMI}</h5></a>
                </c:if>
                <c:if test="${kcal>cal}">
                    <a><h5 id="cal">섭취 칼로리 : ${cal }</h5></a>
                </c:if>
                <c:if test="${cal>=kcal}">
                    <a><h5 id="overcal">섭취 칼로리 : ${cal }</h5></a>
                </c:if>
                <c:if test="${nat>=2000}">
                    <a><h5 id="overnat">섭취한 나트륨 : ${nat }</h5></a>
                </c:if>
                <c:if test="${nat<2000}">
                    <a><h5 id="nat">섭취한 나트륨 : ${nat }</h5></a>
                </c:if>
            </c:if>
        </div>
    </div>
    <!-- contents end -->
    <%@ include file="/WEB-INF/view/bottom.jsp"%>
</body>
</html>