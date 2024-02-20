<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>파일 업로드</title>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border: 1px solid black;
	padding: 5px 10px;
}
</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<td width="30%">파일</td>
				<td width="70%"><input type="file" id="file1" name="file1"
					accept=".jsp, .png, .gif"></td>
			</tr>
		</table>
		<button @click="fnAdd">이미지 저장</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},// data
		methods : {
			fnAdd : function() {
				var self = this;
				var form = new FormData();
				form.append("file1", $("#file1")[0].files[0]);
				form.append("idx", 1234); // 임시 pk
				self.upload(form);
			}

			// 파일 업로드
			,
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

		}, // methods
		created : function() {
			var self = this;
		}// created
	});
</script>
