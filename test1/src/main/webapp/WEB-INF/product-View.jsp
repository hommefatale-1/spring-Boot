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
				<th>제품설명</th>
				<th>제품이름</th>
				<th>제품가격</th>
				<th>제품내용</th>
				<th>배송 방법</th>
			</tr>
			<tr >
				<td>{{list.itemNo}}</td>
				<td>{{list.itemName}}</td>
				<td>{{list.price}}</td>
				<td>{{list.contents}}</td>
				<td>{{list.transInfo}}</td>	
			</tr>
		</table>
		<button @click="fnInsert(list.itemNo)">수정하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			itemNo : "${map.itemNo}",
			list : {}
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
						itemNo :  self.itemNo
				};
				$.ajax({
					url : "productView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.list);
						self.list = data.list;
					}
				});
			},
			
			fnInsert : function(itemNo) {
				$.pageChange("/productModify.do", {
					"itemNo" : itemNo
				});

			}
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>