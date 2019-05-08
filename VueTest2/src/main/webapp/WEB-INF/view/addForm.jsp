<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="seo">
		<form action="add.do" method="post" @submit.prevent="addProduct"><!-- submit 하기전에 검사할 메서드 호출 -->
			id : <input type="text" name="id" v-model="id"><br>
			name : <input type="text" name="name" v-model="name"><br>
			price : <input type="text" name="price" v-model="price"><br>
			description : <input type="text" name="description" v-model="description"><br>
			<input type="submit" value="추가등록">	
		</form>
	</div>
	<script type="text/javascript">
		new Vue({
			el : '#seo',
			data(){
				return{
					loading : true,
					errored : false,
					id : '',
					name : '',
					price : '',
					description : ''
				}
			},
			methods : {
				addProduct(){ // 유효성 체크
					if(this.id=='') {alert('아이디를 입력하세요'); return;}
					if(this.name=='') {alert('이름을 입력하세요'); return;}
					if(this.price=='') {alert('가격을 입력하세요'); return;}
					if(this.description=='') {alert('부서를 입력하세요'); return;}
					
					// form에 입력한 데이터가 문제가 없으면 진행, insert 요청해서 진행
					axios.post('add.json', {
						id : this.id, // 보낼 데이터
						name : this.name,
						price : this.price,
						description : this.description
					})
					.then(response => {
						console.log(response.data); //받아온 데이터 출력
						if(response.data.result==true){
							alert("insert 성공");
							location.href="list.do"; // 페이지이동, SPA 로 구현해보기
						}else{
							alert("insert 실패")
						}
					})
					.catch(error => {
						console.log(error);
						this.errored = true;
					})
					.finally(() => this.loading = false)
				}
			}// end methods
		});//end Vue
	</script>
</body>
</html>