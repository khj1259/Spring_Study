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
<!--  구글 api -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
<style type="text/css">
.bono {
    position: absolute;
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
.darkbox input, select {
    color: white;
}
.numbering {
    font-size: 30px;
    font-weight: bold;
}
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
        var data = google.visualization.arrayToDataTable([
          ['Year', '${list.get(0).getName()}','${list.get(1).getName()}', '${list.get(2).getName()}','${list.get(3).getName()}','${list.get(4).getName()}'],
          ['2019', ${list.get(0).getCnt()} , ${list.get(1).getCnt()}, ${list.get(2).getCnt()}, ${list.get(3).getCnt()},${list.get(4).getCnt()}],
          /* ['2018' ,${list.get(0).getCnt()},0,0,0,0],
          ['2018' ,0,${list.get(1).getCnt()},0,0,0],
          ['2018',0,0,${list.get(2).getCnt()},0,0],
          ['2018',0,0,0,${list.get(3).getCnt()},0],
          ['2018',0,0,0,0,${list.get(4).getCnt()}] */
        ]);
        var options = {
          chart: {
            title: 'Best Top 5 식품',
            subtitle: '2019년 가장 많이 판매된  상품',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };
        var chart = new google.charts.Bar(document.getElementById('barchart_material'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
<script type="text/javascript">
    $(document).ready(function() {
        //추가버튼 클릭 시
        $('.btAdd').click(function() {
            //$('.alert').show();
            var code = $(this).val();
            var cnt = prompt('섭취수량을 입력해 주세요');
            if (cnt != null) {
                $.ajax({
                    url : "eatFoodAdd.mvc",
                    type : "POST",
                    data : "code=" + code + "&cnt=" + cnt,
                    success : function() {
                        alert('추가되었습니다');
                    }
                });
            }
        });
    });
</script>
</head>
<body>
   <%@include file="/WEB-INF/view/topmenu.jsp" %>
    <div class="graybox">
        <h3>WHAT WE PROVIDE</h3>
        <h5>건강한 삶을 위한 먹거리 프로젝트</h5>
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
            <li class="breadcrumb-item active" aria-current="page">베스트섭취정보</li>
        </ol>
    </nav>
    <div class="back">
        <div class="container">
            <fieldset>
                <legend>
            <!--     <div style="text-align: center">
                    <h2>
                        Best Top 5 식품<img src="img/bono.gif" width=150px height=150px>
                    </h2>
                    </div> -->
                </legend>
            </fieldset>
                <div>
            <fieldset>
                <legend>
            <c:forEach items="${list}" var="food" varStatus="idx">
                        <div class="col-sm-2">
                            <div class="item">
                                <h2>Top ${idx.count}</h2>
                                <div>
                                    <a href="searchFood.mvc?code=${food.code }" class="thumbnail"><img
                                        src="${food.img }"></a>
                                </div>
                                <h4>${food.name }</h4>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-primary btAdd"
                                        value="${food.code }">추가</button>
                                     <button type="button" class="btn btn-primary">찜</button><br> 
                            	</div>
                            </div>
                        </div>
            </c:forEach>
                  </legend>
            </fieldset>
            </div>
    <div id="barchart_material" style="width: 900px; height: 300px;"></div>
        </div>
    </div>
    <!-- contents end -->
<%@ include file="/WEB-INF/view/bottom.jsp" %>
</body>
</html>