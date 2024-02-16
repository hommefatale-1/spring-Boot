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
				<td><input type="text" v-model="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="40" v-model="contents"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>{{userId}}</td>
			</tr>
		</table>
		<!-- 본인이 쓴글이거나 관리자 권한일때만 삭제버튼 보이게 하기 -->
		<div>
			<button @click="fnUpdate">수정하기</button>
		</div>

	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			title : "",
			contents : "",
			boardNo : "${map.boardNo}",
			userId : "${userId}"
		},
		methods : {
			
			/* 게시글 가져오기 */
		  	fnBoardInfo: function(str){
	            var self = this;
	            var nparmap = {boardNo : self.boardNo};
	            $.ajax({
	                url:"boardDetail.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	if(data.result == "success"){
	                		self.title = data.info.title;
	                		self.contents = data.info.contents;
	                	} else {
	                		alert("오류 발생");
	                	}
	                }
	            }); 
	        },
			/* 게시글 수정저장 */
			fnUpdate : function(str) {
				var self = this;
				var nparmap = {
					title : self.title,
					contents : self.contents,
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardUdate.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if(data.result == "success"){
	                		alert("수정되었습니다.");
	                		location.href = "/boardList.do";
	                	} else {
	                		alert("오류 발생되었습니다.");
	                	}
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnBoardInfo("old");
		}
	});
</script>
