<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/ssm/public/js/jquery-1.12.4.js"></script>
</head>
<body>
	账号：<input id="uname" type="text" name="uname"><br/>
	密码：<input id="pwd" type="password" name="pwd"><br/>
	地址：<input id="addr" type="text" name="addr"><br/>
	<button id="registerBtn">注册</button>
	
	
	
<script>
	$("#registerBtn").on("click",function(){
		var uname = $("#uname").val();
		var pwd = $("#pwd").val();
		var addr = $("#addr").val();
		$.ajax({
			url: "/ssm/Test/register.action",
			data: {
				uname: uname,
				pwd: pwd,
				addr: addr
			},
		type:"post",
		success: function(res){
			
		}
		
		}) 
		
	})
	
	

</script>
</body>


</html>