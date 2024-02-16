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
	<div>이름 : {{info.userName}}</div>
	<div>아이디 : {{info.userId}}</div>
	<div>성별 : {{info.gender}}</div>
	<div>전화번호 : {{info.phone}}</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "${map.userId}",
    	info : []
    }   
    , methods: {
    	list : function(){
            var self = this;
            var nparmap = {
            		
            };
            $.ajax({
                url:"selectUserList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.user
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
	}
});
</script>