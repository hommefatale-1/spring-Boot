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

li {
	list-style: none;
	margin-left: 10px;
}
ul{
	display: inline-block;
	padding: 3px;
	cursor: 
}

.tab {
 background-color: #ddd;
 border: 1px 1px #ddd;
 box-shadow: 1px 1px #eee;
}
.select-tab{
background-color: #bbb;
 border: 1px 1px #bbb;
 box-shadow: 1px 1px #ccc; 
}
.search{
clear:both;
}
ul:hover{
background-color: black;
color: white;
}



</style>
<body>
	<div id="app">
		<li>
			<ul v-bind:class="[kind==1 ? 'select-tob' : 'tab']" @click="fnList(1)">공지사항</ul>
			<ul v-bind:class="[kind==2 ? 'select-tob' : 'tab']" @click="fnList(2)">자유게시판</ul>
			<ul v-bind:class="[kind==3 ? 'select-tob' : 'tab']" @click="fnList(3)">게시판</ul>
		</li>
		<div>
			<select v-model="keywordType">
				<option value="">::선택::</option>
				<option value="title">제목</option>
				<option value="user">작성자</option>
			</select> <span>검색 : </span><input type="text" v-model="keyword"
				@keyup.enter="fnList">
			<button @click="fnList">검색하기</button>
		</div>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tr v-for="(item, index) in list">
				<td>{{item.boardNo}}</td>
				<td><a href="javascript:;" @click="fnView(item.boardNo)">
						{{item.title}} <span v-if="item.commCnt != 0">
							({{item.commCnt}}) </span>
				</a></td>
				<td>{{item.hit}}</td>
				<td><a href="javascript:;" @click="fnUser(item.userId)">
						{{item.userName}} </a></td>
				<td>{{item.cdateTime}}</td>
			</tr>
		</table>
		<div>
			<button @click="fnboardAdd">게시글 작성하기</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			keyword : "",
			keywordType : "",
			kind : 1
		},
		methods : {
			fnList : function(kind) {
				var self = this;
				self.kind = kind;
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					kind : kind
				};
				$.ajax({
					url : "board.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
					}
				});
			},

			fnView : function(boardNo) {
				$.pageChange("/boardView.do", {
					"boardNo" : boardNo
				});
			},
			fnboardAdd : function() {
				var self = this;
				$.pageChange("/boardAdd.do", {
					"kind" : self.kind
				});
			},
			fnUser : function(userId) {
				$.pageChange("/selectUser.do", {
					"userId" : userId
				});
			}
		},
		created : function() {
			var self = this;
			self.fnList(1);
		}
	});
</script>