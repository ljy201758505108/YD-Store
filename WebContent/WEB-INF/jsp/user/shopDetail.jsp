<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/head.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/foot.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/index.css">
		<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
		
		<style>
			*{
				font-family: 宋体;
			}
			#detail{
				
				margin: 0 auto;
				
			}
			.left_detail{
				height: 420px;
				background-color: white;
				margin-top: 20px;
				padding: 0;
			}
			.right_detail{
				height: 420px;
				background-color: snow;
				margin-top: 20px;
				padding: 0;
			}
			.leftshop{
				
				width: 360px;
				padding: 10px 20px;
				border: 1px solid;
				border-color: ghostwhite;
			}
			
			.left_detail img{
				height: 320px;
				width: 320px;
				margin: 0 auto;
			}
			p{
				line-height: 35px;
				margin: 20px;
				font-size: 20px;
			}
			#price{
				color: #FFA500;
			}
			#price2{
				display: inline-block;
				color: #FFA500;
				margin-left: 50px;
			}
			#sum2{
				margin-left: 50px;
				display: inline-block;
			}
			.btn1{
				background-color: lightcoral;
				color: white;
				height: 60px;
				width: 160px;
				margin-left: 20px;
				
				font-size: 20px;
				border-radius: 10px 0 0 10px;
				border: white;
			}
			.btn2{
				background-color: #FF0000;
				color: white;
				height: 60px;
				width: 160px;
				font-size: 20px;
				border-radius: 0 10px 10px 0;
				border: white;
			}
		</style>
	
</head>

<body>
<div id="title">
		<div id="title">
			<div class="title">
				<div class="left-title">
						<li class="glyphicon glyphicon-home">&nbsp;京东首页</li>
						<li class="glyphicon glyphicon-map-marker">&nbsp;山东</li>
				</div>
				<div class="right-title">
						<li>我的订单</li>
						<li>我的京东</li>
						<li>京东会员</li>
						
						<%if(session.getAttribute("userInfo")==null) {%>
							<li><a href="/ssm/user/registerPage.action">免费注册</a></li>
							<li><a href="/ssm/user/loginPage.action">立即登录</a></li>
			
						<% } else{%>
							<li><a href="/ssm/user/loginOut.action">退出登录</a></li>
							<li>&nbsp;</li>
							<li><a href="/ssm/user/backManagePage.action">${userInfo.uname }</a></li>
							<li>欢迎您:</li>
						<% }%>
						
						
				</div>
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
		        <li><a href="/ssm/user/shopCartPage.action" id="shopcart" class="glyphicon glyphicon-shopping-cart">&nbsp;购物车</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

		<div id="detail">
			<div class="container">
				<h1 align="center">商品详情</h1>
				<div class="row">
					<div class="col-md-1 col-xs-1 hidden-sm"></div>
					<div class="col-md-5 col-xs-11 col-sm-6 left_detail">
						<div class="leftshop">
							<img alt="" src="" class="prod_img">
							<p id="name"></p>
						</div>
					</div>
					<div class="col-md-5 col-sm-6 hidden-xs right_detail">
						<div class="rightshop">
							<p id="inf"></p>
							<p id="price" class="glyphicon glyphicon-yen"></p>
							<p id="sum"></p>
							<button type="button" class="btn1">加入购物车</button>
							<button type="button" class="btn2">立即购买</button>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="hidden-md hidden-lg hidden-sm col-xs-12 buy">
						<p id="price2" class="glyphicon glyphicon-yen"></p>
						<p id="sum2"></p>
						<div>
							<button type="button" class="btn1">加入购物车</button>
							<button type="button" class="btn2">立即购买</button>
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
					<img src="/ssm/public/imgs/guohui.png" >
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
			var str=window.location.href;
			console.log(str);
			var id=str.split("?")[1];
			console.log(id);
			
			$.ajax({
				url:"/ssm/user/shopDetail.action",
				data:{
					id
				},
				type:"post",
				success: function(res){
					console.log(res);
					
					
					$(".prod_img").attr("src",res.img);
					$("#name").text(res.prodName);
					$("#sum").text("库存："+res.number);
					$("#sum2").text("库存："+res.number);
					document.getElementById("price").innerHTML=res.price/100;
					document.getElementById("price2").innerHTML=res.price/100;
					document.getElementById("inf").innerHTML=res.prodInfo;
				}
			});
			
			 $(".btn1").on("click",function(){
				 $.ajax({
						url:"/ssm/user/shopCart.action",
						data:{
							id
						},
						type:"post",
						success: function(res){
							
							alert("添加成功");
						}
					});
				 
			 })
</script>

</html>