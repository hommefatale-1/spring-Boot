<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>게시판 페이지</title>
</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	color: #333;
}

#app {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type="text"] {
	padding: 8px;
	margin: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	padding: 10px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
}

button.primary {
	background-color: #4caf50;
	color: #fff;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #4caf50;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e0e0e0;
}

button.edit-btn {
	background-color: #2196F3;
	color: #fff;
}

button.delete-btn {
	background-color: #f44336;
	color: #fff;
}
</style>
<body>
	<div id="app">
		<table border="1">
			<tr>
				<th>게시판선택</th>
				<td><select v-model="add.kind">
						<option value="">::선택::</option>
						<option value="1">공지사항</option>
						<option value="2">자유게시판</option>
						<option value="3">문의게시판</option>
				</select></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" v-model="add.title"></td>
			</tr>

			<tr>
				<td width="30%">파일</td>
				<td width="70%"><input type="file" id="file1" name="file1"
					accept=".jsp, .png, .gif"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="40" v-model="add.contents"></textarea></td>
			</tr>
		</table>
		<button @click="fnsave()" class="primary">작성하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			add : {
				userId : "${userId}",
				title : "",
				contents : "",
				kind : ""
			}
		},
		methods : {
			fnsave : function() {
				var self = this;
				var nparmap = self.add;
				$.ajax({
					url : "boardAdd.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							var form = new FormData();
							form.append("file1", $("#file1")[0].files[0]);
							form.append("boardNo", data.boardNo); // 임시 pk
							self.upload(form);
						}else{
							
						}
					}
				});
			},
			upload : function(form) {
				var self = this;
				console.log(form);
				$.ajax({
					url : "/fileUpload.dox",
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>