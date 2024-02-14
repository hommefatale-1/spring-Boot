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

.board-container {
	max-width: 600px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.board-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
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
</style>
<body>
	<div id="app">

		<table>
			<tr>
				<th>제목</th>
				<td>{{info.title}}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>{{info.userName}}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>{{info.contents}}</td>
			</tr>
		</table>
		<!-- 본인이 쓴글이거나 관리자 권한일때만 삭제버튼 보이게 하기 -->
		<div v-if="info.userId == sessionId || sessionStatus == 'A'">
			<button @click="fndelete()">삭제</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			boardNo : "${map.boardNo}",
			sessionId : "${userId}",
			sessionStatus : "${userStatus}",
			info : []
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardDetail.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.info;
					}
				});
			},
			fndelete : function() {
				var self = this;
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardDelete.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.delete = data.delete;
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>