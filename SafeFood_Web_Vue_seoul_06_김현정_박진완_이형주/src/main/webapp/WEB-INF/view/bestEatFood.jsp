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
<title>베스트섭취식품</title>
<style type="text/css">
.bono {
    position: absolute;
    float: left;
    padding-right: 10px;
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
.header_img{
	width: 100%;
	height: 242px;
	background-image: url("img/배경5.PNG");
	background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
.item img{
	height: 180px;
	width: 200px;
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
   <%@include file="/WEB-INF/view/topmenu.jsp" %>
    <div class="blur header_img"></div>
   <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main.mvc">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">베스트섭취정보</li>
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
                 <div class="col-sm-1"></div>
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
                                     <button type="button" class="btn btn-primary btWish" value="${food.code }">찜</button><br> 
                            	</div>
                            </div>
                        </div>
            </c:forEach>
                 <div class="col-sm-1"></div>
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