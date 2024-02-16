<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>제품 목록</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<span>가격입력 : </span><input type="text" v-model="price">
			<button @click="fnList()">검색하기</button>
		</div>
		
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			price : "",
			list : {}
		// 변수 영역
		},
		methods : { // 메소드 시작
			fnList : function() {
				var self = this;
				var nparmap = {
						price : self.price
				};
				$.ajax({
					url : "productList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					}
				});
			}
		} // 메소드 끝
		,
		created : function() {
			var self = this;
			//self.fnList();
		}
	});
</script>