<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>학번 : 
			<input type="text" v-model="stuInfo.stuNo">
			<button @click="fnCheck">중복체크</button>
		</div>
		<div>이름 : <input type="text" v-model="stuInfo.stuName"></div>
		<div>학과 : <input type="text" v-model="stuInfo.stuDept"></div>
		<div>학년 : <input type="text" v-model="stuInfo.stuGrade"></div>
		<div>성별 : 
			<input type="radio" name="stuGender" value="M" v-model="stuInfo.stuGender">남
			<input type="radio" name="stuGender" value="F" v-model="stuInfo.stuGender">여
		</div>
		<div><button @click="fnAdd">저장</button></div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		stuInfo : { stuNo : "",
					stuName : "",
					stuDept : "",
					stuGrade : "",
					stuGender : "M"
				 }
    }   
    , methods: {
    	fnAdd : function(){
            var self = this;
            if(self.stuInfo.stuNo.length != 8){
            	alert("아이디는 8글자만 가능!");
            	return;
            }
            
            var nparmap = self.stuInfo;
            $.ajax({
                url:"stu/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("추가되었습니다!");
                }
            }); 
        },
        fnCheck : function (){
        	var self = this;
       	 	if(self.stuInfo.stuNo.length != 8){
            	alert("아이디는 8글자만 가능!");
            	return;
            }
        	var nparmap = {stuNo : self.stuInfo.stuNo};
            $.ajax({
                url:"stu/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.student != null && data.student != undefined){
                		alert("중북된 아이디가 존재합니다");
                	} else {
                		alert("사용가능한 아이디 입니다.");
                	}
                }
            }); 
        }
    }   
    , created: function () {
    	var self = this;
    	
	}
});
</script>