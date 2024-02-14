<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
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
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
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
        }

        button.delete-btn {
            background-color: #f44336;
        }
    </style>
</head>

<body>
	<div id="app">
		<div>학번검색 : 
			<input type="text" v-model="keyword" @keyup.enter="fnGetList">
			<button @click="fnGetList">검색</button>
		</div>
		<div>학년 : <input type="text" v-model="grade"> </div>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>성별</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr v-for="(item, index) in list">
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.stuDept}}</td>
				<td>{{item.stuGrade}}</td>
				<td>
					<span style="color:blue;" v-if="item.stuGender == 'M'">남자</span>
					<span style="color:red;" v-else>여자</span>
				</td>
				<td><button @click="fnEdit(item.stuNo)">수정</button></td>
				<td><button>삭제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		grade : "",
		keyword : ""
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.keyword};
            $.ajax({
                url:"stu/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
	                self.list = data.list;
                }
            }); 
        },
        fnEdit : function(stuNo){
            var self = this;
            var nparmap = {stuNo : stuNo, stuGrade : self.grade};
            $.ajax({
                url:"stu/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("수정되었습니다!");
                	self.fnGetList();
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();

	}
});
</script>