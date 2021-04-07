<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont2.css">
		<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
		<style type="text/css">
			.rowCtrl{
				height: 500px;
			}
			.containerCtrl{
				margin-top: 150px;
			}
			.input0,.input1,.input2{
				margin-bottom: 10px;
				width: 300px;
				
			}
			.mima{
				margin-top:7px;
			}
			.inputControl>.input1>input{
				border-radius: 8px !important;
			}
			.inputControl>.input2>input{
				border-radius: 8px !important;
			}
			.inputControl>.input2>input{
				border-radius: 8px !important;
			}
		</style>
	</head>
	<body>
		<!-- <div>
			修改密码
		</div> -->
		
		<div class="container containerCtrl">
			<div class="row rowCtrl">
				<div class="col-md-3"></div>
				<div class="col-md-1">
					<div class="mima">
						<p style="font-size: 17px; margin-bottom: 20px; font-weight: 600">用户名</p>
						<p style="font-size: 17px; margin-bottom: 20px; font-weight: 600">原密码</p>
						<p style="font-size: 17px; margin-bottom: 20px; font-weight: 600">新密码</p>
					</div>
				</div>
				<div class="col-md-5">
					<div class="inputControl">
						<div class="input-group input0">
						  <input type="text" class="form-control" placeholder="用户名" aria-describedby="sizing-addon2" id="uname" value="${userInfo.uname }">
						</div>
						
						<div class="input-group input1">
						  <input type="password" class="form-control" placeholder="原密码" aria-describedby="sizing-addon2" id="oldPwd" value="${userInfo.pwd }">
						</div>
						
						<div class="input-group input2">
						  <input type="text" class="form-control" placeholder="新密码" aria-describedby="sizing-addon2" id="newpassword" >
						</div>
						
						<button type="button" class="btn btn-primary" style="margin-top: 6px;margin-left: 90px;" id="changeBtn">修改密码</button>

					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		
		
		<script type="text/javascript">
			$(function(){
				$("#changeBtn").on("click",function(){
					var uname = $("#uname").val();
					var oldPwd = $("#oldPwd").val();
					var newpassword = $("#newpassword").val();
					
					$.ajax({
						url:"/ssm/user/changePwd.action",
						
						data:{
							uname:uname,
							oldPwd: oldPwd,
							newpassword: newpassword
						},
						
						type:"post",
						
						success: function(res){
							if(res.code == 1000){
								alert(res.msg);
							}else{
								alert(res.msg);
							}
							
															
						}
						
						
					})
					
					
				})
				
				
			})
		
		</script>
	</body>
</html>
