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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
<style type="text/css">
.bono{
    position:absolute;
    float: left;
    padding-right: 10px;
    
}
.graybox {
    background-color: gray;
    color: white;
    width: 100%;
    text-align: center;
    padding-bottom: 10px;
    padding-top: 10px;
    margin-top: 10px;
}
.darkbox {
    background-color: #4d4d4d;
    color: gray;
    text-align: center;
    padding-bottom: 10px;
    padding-top: 10px;
}
.darkbox table {
    margin: 0 auto;
}
.darkbox table tr input, table select {
    border-radius: 3px;
    background-color: gray;
}
.darkbox table td {
    text-align: left;
    padding-left: 5px;
    padding-right: 5px;
    color: #999999
}
.darkbox table button {
    background-color: #0099ff;
    color: white;
    border-radius: 3px;
    width: 60px;
}
nav ul a {
    color: black;
}
.darkbox input, select{
    color: white;
}
#best{
    color: red;
}
#cal{
    color : aqua;
}
#overcal{
    color: red;
}
#nat{
    color: aqua;
}
#overnat{
    color : red;
}
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경3.PNG");
	text-align: center;
	z-index: 1;
}
.header_img h3{
	height: 185px;
   padding-top: 70px;
    color: #fff;
    font-size: 50px;
    font-weight: 550;
    text-align: center;
    /* border-bottom: 1px solid #dedede;
    background-color: #fff; */
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
}
.header_img:before {
  content: '';
  position: absolute;
  top: 0; left:0; right:0; bottom:0;
  /* background: inherit; */
  z-index:-1;
  filter: blur(6px); 
  -webkit-filter: blur(2px); 
  -moz-filter: blur(2px);
  -o-filter: blur(2px);
  -ms-filter: blur(2px);
  /* filter: url(#blur); */
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
    	google.charts.load('current', {
    		'packages' : [ 'bar' ]
    	});
    	google.charts.setOnLoadCallback(drawStuff);

    	function drawStuff() {
    		var data = new google.visualization.arrayToDataTable([
    				[ '', '권장량', '섭취량' ],
    				[ '칼로리', ${kcal }, ${cal } ],
    				[ '나트륨', 2000, ${nat } ]
    				 ]);

    		var options = {
    			width : 800,
    			chart : {
    				title : 'Nutrition Graph',
    				subtitle : '본인의 섭취 정보를 확인하세요'
    			},
    			bars : 'horizontal', // Required for Material Bar Charts.
    			series : {
    				0 : {
    					axis : 'distance'
    				}, // Bind series 0 to an axis named 'distance'.
    				1 : {
    					axis : 'brightness'
    				}
    			// Bind series 1 to an axis named 'brightness'.
    			},
    			axes : {
    				x : {
    					distance : {
    						label : 'parsecs'
    					}, // Bottom x-axis.
    					brightness : {
    						side : 'top',
    						label : '${userId}님의 정보입니다'
    					}
    				// Top x-axis.
    				}
    			}
    		};

    		var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
    		chart.draw(data, options);
    	};

    	// 차트 끝
    	
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
        
        $('#userinfo').click(function() {
            location.href = 'userInfo.mvc';
        });
        $('#logout').click(function() {
            location.href = 'logout.mvc';
        });
    });
</script>
</head>
<body>
   <%@include file="topmenu.jsp" %>
   <div class="blur header_img">
   		<h3>내 섭취 정보<br>
   		<span>고객님의 섭취정보를 볼 수 있는 공간입니다.</span>
   		</h3>
   </div>
    <div class="darkbox">
        <form action="search_result.mvc" method="get">
            <table>
                <tr>
                    <td>검색조건</td>
                    <td>검색단어</td>
                    <td>&nbsp</td>
                </tr>
                <tr>
                    <td><select name="search_opt">
                            <option value="name">식품명</option>
                            <option value="maker">제조사</option>
                            <option value="material">원재료</option>
                    </select></td>
                    <td><input type="text" name="searchValue"></td>
                    
                    <td><button id="search" type="submit">검색</button></td>
                </tr>
            </table>
        </form>
    </div>
    <!-- contents -->
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
            <li class="breadcrumb-item"><a href="userInfo.mvc">회원정보</a></li>
            <li class="breadcrumb-item active" aria-current="page">내 섭취정보</li>
        </ol>
    </nav>
    <div class="back">
        <div class="container">
<fieldset>
                <legend>
                    <h2>${userId }님의
                        섭취 정보입니다<img src="img/bono.gif" width=150px height=150px>
                    </h2>
                    <br> <br>
                </legend>
            </fieldset>
            <fieldset>
                <legend>
                    <c:forEach items="${list }" var="food" varStatus="idx">
                        <c:choose>
                            <c:when test="${idx.count mod 2 eq 1 }">
                                <div class="col-sm-6">
                                    <div class="row item">
                                        <div class="col-sm-3">
                                            <a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img
                                                src="${food.img }"></a>
                                        </div>
                                        <h3>${food.name }</h3>
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
                            </c:when>
                            <c:otherwise>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="row item">
                                            <div class="col-sm-3">
                                                <a href="searchFood.mvc?code=${food.code }"
                                                    class="thumbnail"><img src="${food.img }"></a>
                                            </div>
                                            <h3>${food.name }</h3>
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
                                </div>
                            </c:otherwise>
                        </c:choose>
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
                <a><h5 id="best">${userId }님의BMI: 추가 정보를 등록하셔야 확인할 수 있습니다.</h5></a>
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
                <div id="dual_x_div" style="width: 900px; height: 500px;"></div>
                
                
                <a><h5 id="best">권장 칼로리 : ${kcal }</h5></a>
                
                <c:if test="${18.5<=userBMI&&userBMI<=23}">
                <a><h5 id="cal">${userId }님의BMI: ${userBMI}</h5></a>
                </c:if>
                
                <c:if test="${18.5>userBMI||userBMI>23}">
                <a><h5 id="best">${userId }님의BMI: ${userBMI}</h5></a>
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
  <!-- contents end -->
  <%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>