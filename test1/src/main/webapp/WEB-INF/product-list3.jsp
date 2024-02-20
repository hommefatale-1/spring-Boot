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
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	color: #333;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.board-container {
	width: 80%;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
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

textarea {
	width: calc(100% - 12px);
	padding: 5px;
	box-sizing: border-box;
	margin-top: 5px;
}

button {
	padding: 8px 16px;
	background-color: #4caf50;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
}

button:hover {
	background-color: #45a049;
}
</style>
<body>
	<div id="app">
		<select v-model="sellYn">
			<option value="선택">::선택::</option>
			<option value="N">판매 가능</option>
			<option value="Y">판매 불가</option>
		</select>

		<button @click="fnList()">검색</button>
		<div>
			<input type="text" v-model="itemNo">
			<button @click="fndelete">삭제</button>
		</div>
		<table>
			<tr>
				<th>제품 번호</th>
				<th>제품 이름</th>
				<th>제품 가격</th>
				<th>판매 여부</th>
				<th>제품 설명</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.itemNo}}</td>
				<td><a href="javascript:;" @click="fndetail(item.itemNo)">{{item.itemName}}</a></td>
				<td>{{item.price}}</td>
				<td>{{item.sellYn}}</td>
				<td>{{item.contents}}</td>
			</tr>
		</table>
		<button @click="fnProductAdd()">제품추가</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			sellYn : "선택",
			itemNo : "",
			list : []

		// 변수 영역
		},
		methods : { // 메소드 시작
			fnList : function() {
				var self = this;
				var nparmap = {
					sellYn : self.sellYn
				};
				$.ajax({
					url : "productList3.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					}
				});
			},
			fndetail : function(itemNo) {
				$.pageChange("/productView.do", {
					"itemNo" : itemNo
				});

			},
			fnProductAdd : function() {
				location.href = "/ProductAdd.do";
			},
			fndelete : function() {
				var self = this;
				var nparmap = {
					itemNo : self.itemNo
				};
				$.ajax({
					url : "productdelete.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
					}
				});
			}
		},
		created : function() {
			var self = this;
			//self.fnList();
		}
	});
</script>