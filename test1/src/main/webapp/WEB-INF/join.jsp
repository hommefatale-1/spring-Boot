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
			<span>아이디 : </span> <input type="text" v-model="user.id" @keyup="fncheck">
			<div v-if="user.id != ''">
				<div v-if="checkFlg" style="color: blue;">사용 가능한 아이디 입니다.</div>
				<div v-else style="color: red;">중복된 아이디가 있습니다.</div>
			</div>
			<!-- <input v-if="checkFlg" type="text" v-model="user.id" disabled>
		<input v-else type="text" v-model="user.id">
			<button @click="fnCheck">중복확인</button>
		</div> -->
			<div>
				<span>비밀번호 : </span><input type="text" v-model="user.pwd">
			</div>
			<div>
				<span>비밀번호확인 : </span><input type="text" v-model="user.pwdch">
			</div>
			<div>
				<span>이름 : </span><input type="text" v-model="user.name">
			</div>
			<div>
				<span>핸드폰 번호 : </span> <input type="text" v-model="user.phone1">- 
				<input type="text" v-model="user.phone2"> - 
				<input type="text" v-model="user.phone3">
			</div>
			<div>
				<label><input type="radio" name="gender" value="남성"v-model="user.gender">남성</label> 
				<label><input type="radio" name="gender" value="여성" v-model="user.gender">여성</label>
			</div>
			<div>
				<!-- 메소드에 login 호출 -->
				<button @click="fnjoin">저장</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			user : {
				id : "",
				pwd : "",
				pwdch : "",
				name : "",
				phone1 : "",
				phone2 : "",
				phone3 : "",
				gender : "여성"
			},
			checkFlg : false
		},
		methods : {
			/* 로그인 */
			fnjoin : function() {
				var self = this;
				if (self.user.id == "") {
					alert("아이디를 입력해 주세요");
					return;
				}
				if (!self.checkFlg) {
					alert("중복체크 해주세요");
					return;
				}
				//js정규식 영어+숫자 
				if (self.user.pwd == "") {
					alert("비빌번호를 입력해 주세요");
					return;
				}
				if (self.pwd != self.pwdch) {
					alert("비밀번호 서로 다름");
					return;
				}
				var phone = self.user.phone1 + self.user.phone2
						+ self.user.phone3;
				var nparmap = self.user;
				nparmap.phone = phone;
				$.ajax({
					url : "join.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			},
			/* 아이디 중복확인 */
			fncheck : function() {
				var self = this;
				var nparmap = {
					id : self.user.id
				};

				$.ajax({
					url : "Check.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							self.checkFlg = true;
						} else {
							self.checkFlg = false;
						}
						/* 	if(data.result == "success"){
							if(confirm(data.message)){
								self.checkFlg = true;
							}
						}else{
							alert(data.message);
						} */
					}
				});
			}

		},
		created : function() {
			var self = this;
		}
	});
</script>