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
		<div>
			<span>제품번호 : <input type="text" v-model="add.itemNo"></span>
		</div>
		<div>
			<span>제품내용 : <input type="text" v-model="add.itemName"></span>
		</div>
		<div>
			<span>제품가격 : <input type="text" v-model="add.price"></span>
		</div>
		<div>
			<span>제품내용 : <input type="text" v-model="add.contents"></span>
		</div>
		<div>
			<span>배송방법 :</span> <select v-model="add.transInfo">
				<option value="무료 배송">무료배송</option>
				<option value="유료 배송">유료배송</option>
			</select>
		</div>
		<button @click="fnsave()">저장하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			add : {
				itemNo : "",
				itemName : "",
				price : "",
				contents : "",
				transInfo : "무료 배송"
			}
		},
		methods : {
			fnsave : function() {
				var self = this;
				var nparmap = self.add;

				$.ajax({
					url : "/productAdd.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("저장 되었습니다.");
							$.pageChange("/productList3.do", {});
						} else {
							alert("다시 시도해주세요");
						}

					}
				});
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>