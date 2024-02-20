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
</head>
<body>
	<div id="app" class="board-container">

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
				<td>{{info.contents}}
					<div v-for="item in fileList">
					<!-- :src사용하기 그냥 할 경우 텍스트로 암 -->
						<img alt="커비" :src="item.path">
					</div>
				</td>
			</tr>
		</table>
		<!-- 댓글목록 보기 -->
		<table>
			<tr>
				<th>작성자</th>
				<th>댓글내용</th>
				<th>등록(수정)일시</th>
				<th>댓글수정</th>
				<th>댓글삭제</th>
			</tr>
			<tr v-for="(item,index) in commentList">
				<td>{{item.userId}}</td>
				<td>
					<template v-if="item.updateFlg">{{item.cmt}}</template>
					<template v-else>
						<textarea rows="3" cols="50" v-model="editComment"></textarea>
					</template>
				</td>
				<td>{{item.udateTime}}</td>
				<td>
					<button v-if="sessionId == item.userId && item.updateFlg"
						@click="fneditBtn(item,index)">수정하기</button>
					<button v-if="!item.updateFlg" @click="fneditComm(item)">저장</button>
					<button v-if="!item.updateFlg" @click="fneditBtn(item,index)">취소</button>
				</td>
				<td><button v-if="sessionId == item.userId">삭제하기</button></td>
			</tr>
		</table>

		<table>
			<tr>
				<th>댓글</th>
				<td><textarea rows="5" cols="40" v-model="comment"></textarea></td>
				<td><button @click="fnComment">댓글쓰기</button></td>
			</tr>
		</table>
		<!-- 본인이 쓴글이거나 관리자 권한일때만 삭제버튼 보이게 하기 -->
		<div>
			<template v-if="info.userId == sessionId || sessionStatus == 'A'">
				<button @click="fndelete">삭제</button>
				<button @click="fnInset">수정</button>
			</template>
			<button @click="fngoBack">되돌아 가기</button>
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
			comment : "",
			commentList : [],
			fileList : [],
			info : {},
			editComment : "",
			commentIndex : 0
		},
		methods : {
			fnView : function(str) {
				var self = this;
				var nparmap = {
					boardNo : self.boardNo,
					str : str
				};
				$.ajax({
					url : "boardDetail.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.info;
						self.commentList = data.commentList;
						self.fileList = data.fileList
						//console.log(data.fileList);
					}
				});
			},
			fndelete : function() {
				var self = this;
				if (!confirm("삭제하겠습니까?")) {
					return;
				}
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardDelete.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("삭제 되었습니다.");
							$.pageChange("/boardList.do", {});
							//location.href = "/boaerList";
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
			},
			fnInset : function() {
				var self = this;
				$.pageChange("/updateBoard.do", {
					boardNo : self.boardNo
				});
			},
			fngoBack : function() {
				location.href = "/boardList.do"
			},
			fnComment : function() {
				var self = this;
				var nparmap = {
					boardNo : self.boardNo,
					comment : self.comment,
					userId : self.sessionId
				};
				$.ajax({
					url : "boardComment.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("등록되었습니다.");
							self.fnView("list");
							self.comment = "";
						} else {
							alert("실패하셨습니다.");
						}
					}
				});
			},
			/* 댓글 수정창보기 */
			fneditBtn : function(item, index) {
				var self = this;
				/* 	for(var i=0; i<self.dommentList.length; i++){
						self.commentList[i].updateFlg = true;
					} */
				if (self.commentIndex != index) {
					self.commentList[self.commentIndex].updateFlg = true;
				}
				self.commentIndex = index;
				self.editComment = item.cmt;
				item.updateFlg = !item.updateFlg;
			},

			/* 댓글 수정 */
			fneditComm : function(item) {
				var self = this;
				var nparmap = {
					commentNo : item.commentNo,
					comment : self.editComment
				};
				$.ajax({
					url : "editComment.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("등록되었습니다.");
							self.fnView("list");
							self.comment = "";
						} else {
							alert("실패하셨습니다.");
						}
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnView("new");
		}
	});
</script>