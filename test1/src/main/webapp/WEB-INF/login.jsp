<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>로그인 페이지만들기</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<span>아이디 : </span><input type="text" v-model="id">
		</div>
		<div>
			<span>비밀번호 : </span><input type="text" v-model="pwd">
		</div>
		<div>
			<!-- 메소드에 login 호출 -->
			<button @click="login">로그인</button>
			<button @click="join">회원가입</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			id : "",
			pwd : ""
		},
		methods : {
			login : function() {
				var self = this;
				var nparmap = {
					id : self.id,
					pwd : self.pwd
				};
				$.ajax({
					url : "login.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert(data.message);
						if(data.result == "success"){
							//페이지 이동
							location.href="/main.do";
						}
					}
				});
			},
			//클릭시 페이지 이동
			join : function() {
				location.href="join.do";
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>