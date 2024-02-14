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
		<div v-for="item in emp">
			<div>사번 : {{item.empNo}}</div>
			<div>이름 : {{item.eName}}</div>
			<div>급여 : {{item.sal}}</div>
		</div> 
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	// 변수 선언
    	emp : []
    }   
    , methods: {
    	list : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"first.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	self.emp = data.emp;
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
		self.list();
	}
});
</script>