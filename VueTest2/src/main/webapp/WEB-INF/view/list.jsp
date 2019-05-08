<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
</head>
<body>
<div id="seo">
<div v-if="errored"> Error In AJAX Transport </div>
<div v-else>
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
		<template v-for="product in info">
		<tr>
			<td align="center">{{product.id}}</td>
			<td align="center">{{product.name}}</td>
			<td align="center">{{product.price}}</td>
			<td align="center">{{product.description}}</td>
		</tr>
		</template>
		<tr>
			<td colspan="4" align="right">
				<a href="addForm.do">상품추가하기</a>			 
			</td>
		</tr>
	</table>
	가져온 데이터 : {{info}}
</div>
</div>
	<script type="text/javascript">
		var app = new Vue({
			el : '#seo',
			data(){
				return {
					info : [],
					loading : true,
					errored : false
				}
			},
			mounted (){
				axios.get('products')
					.then(response => {
						this.info = response.data
					})
					.catch(error => {
						console.log(error);
						this.errored = true;
					})
					.finally(() => this.loading = false)
			}
		});
	</script>
</body>
</html>