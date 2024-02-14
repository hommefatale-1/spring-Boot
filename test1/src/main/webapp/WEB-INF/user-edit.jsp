<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>회원정보 수정 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<span>아이디 : </span> <input type="text" v-model="user.id" disabled>
		
			<div>
				<span>비밀번호 : </span><input type="text" v-model="user.pwd">
			</div>
			<div>
				<span>비밀번호확인 : </span><input type="text" v-model="user.pwd1">
			</div>
			<div>
				<span>이름 : </span><input type="text" v-model="user.name" value="">
			</div>
			<div>
				<span>핸드폰 번호 : </span> 
				<input type="text" v-model="user.phone1"> - 
				<input type="text" v-model="user.phone2"> - 
				<input type="text" v-model="user.phone3">
			</div>
			<div>
				<label><input type="radio" name="gender" value="남성" v-model="user.gender">남성</label> 
				<label><input type="radio" name="gender" value="여성" v-model="user.gender">여성</label>
			</div>
			<div>
				<!-- 메소드에 login 호출 -->
				<button @click="">수정</button>
			</div>
		</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			user : {
				id : "${userId}",
				pwd : "",
				pwdch : "",
				name : "",
				phone1 : "",
				phone2 : "",
				phone3 : "",
				gender : ""
			}
		},
		methods : {
			fnSelectUser : function() {
				var self = this;
				var nparmap = {id : self.user.id };
				$.ajax({
					url : "../selectUser.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.user);
						 // 서버에서 받아온 데이터를 Vue 데이터에 할당
                        self.user = data.user;
					
					}
				});
			}
		}
		, created : function() {
			var self = this;
			self.fnSelectUser();
		}
	});
</script>