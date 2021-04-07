<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>商家登录</title>
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont2.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/head.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/foot.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/index.css">
		<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
		<style>
			*{
				font-family: 宋体;
			}
			#login{
				height: 450px;
				background-color: lightcoral;
			}
			.log_in{
				width: 80%;
				height: 450px;
				margin: 0 auto;
				background-color: white
			}
			#jd{
				margin: 80px auto;
				height: 128px;
				width: 128px;
			}
			
</style>
	</head>
	<body>
		<div id="title">
			<div class="title">
				<div class="left-title">
					
						<li class="glyphicon glyphicon-home">&nbsp;京东首页</li>
						<li class="glyphicon glyphicon-map-marker">&nbsp;山东</li>
					
				</div>
				<div class="right-title">
						<li id="sign1">免费注册</li>
						<li id="login1">立即登录</li>
						<li>我的订单</li>
						<li>我的京东</li>
						<li>京东会员</li>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
			  
		      
			  <img src="/ssm/public/imgs/logo.png" alt="">
			  
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="#">电器商城</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">全部分类<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">电脑电视</a></li>
					<li role="separator" class="divider"></li>
		            <li><a href="#">工作学习</a></li>
					<li role="separator" class="divider"></li>
		            <li><a href="#">数码相机</a></li>
					<li role="separator" class="divider"></li>
		            <li><a href="#">智能家居</a></li>
		          </ul>
		        </li>
		      </ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="小米电视">
					</div>
					<button type="submit" class="btn btn-danger">搜索</button>
				</form>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#"class="glyphicon glyphicon-shopping-cart" id="shopcart1">&nbsp;购物车</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<div id="login">
			<div class="log_in">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 hidden-xs">
						<div id="jd"><img src="/ssm/public/imgs/logo.png" alt=""></div>
						
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<h3>欢迎来到商家登录界面</h3>
						
						<div style="width:300px">
						
						<span class="tel">账号：</span><input type="text" id="tel" class="form-control"><br>
						<span class="tel">邮箱：</span><input type="text" id="email" class="form-control"><br>
						<span class="pwd">密码：</span><input type="password" id="pwd"  class="form-control"><br>
						</div>
						
						
						<div class="checkbox">
							    <label>
							      <input type="checkbox" id="isRemember"> 记住我
							    </label>
						</div>
					
					<div class="btn">
						<button id="loginBtn" type="button" class="btn btn-info">登录</button>
						<button id="btn2" type="button" class="btn btn-info">注册</button>
					
					</div>
						
					</div>
				</div>
				
			</div>
		</div>
		<div id="foot">
			<div class="container">
				<div class="row">
					<div class="col-md-2 col-sm-2 col-xs-2">
						<div class="s1">
							<p>关于我们</p>
						</div>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<p>联系我们</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<p>友情链接</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<p>合作招聘</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<p>隐私政策</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<p>京东公益</p>
					</div>
				</div>
				<div class="footer">
					<img src="/ssm/public/imgs/gh.png" >
					<span>京公网安备 11000002000088号|</span>
					<span>网络文化经营许可证京网文[2014]2148-348号|</span>
					<span>京ICP证070359号</span>
				</div>
				<div class="footer">
					<span>新出发京零 字第大120007号|</span>
					<span>互联网出版许可证编号新出网证(京)字150号</span>
					
				</div>
				<div class="footer">
					<span>Copyright © 2004 - 2020  京东JD.com 版权所有|</span>
					<span>消费者维权热线：4006067733</span>
				</div>
			</div>
		</div>
		
		
		
	</body>
	
	
	
	
	
		<script>
			var btn=document.getElementById("btn2");
			btn.onclick=function(){
				window.location.href="/ssm/business/registerPage.action";
			};
		</script>
		
		
		
		<!-- 登录功能实现 -->
		<script>
		$(function() {
			$("#loginBtn").on("click",function(){
				var tel = $('#tel').val();
				var email = $("#email").val();
				var pwd = $('#pwd').val();
				/* var isRemember = $("#isRemember").prop("checked"); */
				
				/* alert(isRemember); */
			
				$.ajax({
					url: "/ssm/business/login.action",
					type: 'post',
					data:{
						pwd: pwd,
						tel: tel,
						email:email
						/* isRemember:isRemember */
					},
					
					success: function(res){
						if(res.code == 1000){
							alert(res.msg);
							//页面跳转到主页
							window.location.href='/ssm/business/index.action';
						}else{
							alert(res.msg);
						}
						
					}
					
					
				})
				
			})
			
			
		})

		</script>
		
</html>
