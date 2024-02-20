<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>제품 번호</th>
				<td><input type="text" v-model="itemNo"></td>
				<th>제품 이름</th>
				<td><input type="text" v-model="itemName"></td>
				<th>제품 가격</th>
				<td><input type="text" v-model="price"></td>
				<th>제품 내용</th>
				<td><input type="text" v-model="contents"></td>
				<th>배송 방법</th>
				<td><input type="text" v-model="transInfo"></td>
			</tr>
		</table>
		<button @click="fnSave(itemNo)">수정하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			itemNo : "${map.itemNo}",
			itemName : "",
			price : "",
			contents : "",
			transInfo : ""
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					itemNo : self.itemNo
				};
				$.ajax({
					url : "productModify.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.list);
						self.itemNo = data.list.itemNo;
						self.itemName = data.list.itemName;
						self.price = data.list.price;
						self.contents = data.list.contents;
						self.transInfo = data.list.transInfo;

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