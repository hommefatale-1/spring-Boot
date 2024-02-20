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
		<select v-model="transInfo">
			<option value="선택">::선택::</option>
			<option value="무료 배송">무료 배송</option>
			<option value="착불 배송">착불 배송</option>
		</select>
		<button @click="fnList()">검색</button>

		<div >
			<table>
				<tr>
					<th>제품 번호</th>
					<th>제품 이름</th>
					<th>제품 가격</th>
					<th>제품 설명</th>
					<th>배송 방법</th>
				</tr>
				<tr v-for="item in list">
					<td>{{item.itemNo}}</td>
					<td>{{item.itemName}}</td>
					<td>{{item.price}}</td>
					<td>{{item.contents}}</td>
					<td>{{item.transInfo}}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			transInfo : "선택",
			list : []

		// 변수 영역
		},
		methods : { // 메소드 시작
			fnList : function() {
				var self = this;
				var nparmap = {
					transInfo : self.transInfo
				};
				$.ajax({
					url : "productList2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
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