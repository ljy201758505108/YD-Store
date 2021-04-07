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
		<script src="/ssm/public/js/jquery3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
		
		<style>
			*{
				font-family: 宋体;
			}
			#cart{
				height: 600px;
				width: 100%;
				background-color: white;
				margin: 0 auto;
			}
			#shopCartContent{
				width: 100%;
			}
			.shopCar{
				width: 80%;
				height: 600px;
			}
			.shopItem{
				height: 80px;
				margin: 10px;
				background-color: snow
				
			}
			.shopItem input{
				width: 40px;
				height: 22px;
				text-align: center;
				margin: 29px auto;
			}
			.shopItems input{
				width: 40px;
				height: 22px;
				text-align: center;
				margin: 29px auto;
			}
			.shopItem img{
				height: 80px;
			}
			.shopItem p{
				margin: 5px;
			}
			.btn1{
				height: 22px;
				width: 22px;
				margin: 29px auto;
				vertical-align: top;
			}
			.delete{
				height: 22px;
				width: 50px;
				font-size: 13px;
				margin: 29px auto;
				border-radius: 3px;
			}
			.shopTitle input{
				width: 40px;
				height: 22px;
				text-align: center;
				margin: 29px auto;
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
		        <li><a href="#" id="shopcart" class="glyphicon glyphicon-shopping-cart">&nbsp;购物车</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

<div id="cart">
			<div class="container shopCar">
				<div class="row shopTitle">
					<div class="col-md-1 shopName">
						
						<input type="checkbox" >
					</div>
					<div class="col-md-7">
						<img src="/ssm/public/imgs/logo.png" >
					</div>
					<div class="col-md-2">
						<button type="button" id="su" style="margin: 28px 0;" class="btn-danger">收起</button>
					</div>
					<div class="col-md-2">
						<button type="button" id="sd" style="margin: 28px 0;" class="btn-primary">展开</button>
					</div>
				</div>
				
				<div id="shopCartContent">
				
				
				</div>
				
				<div class="row shopSum">
					<div class="col-md-2">
						
					</div>
					<div class="col-md-2">
						<p style="line-height: 80px;">总价格</p>
					</div>
					<div class="col-md-5">
						<p style="line-height: 80px;" class="glyphicon glyphicon-yen all">0</p>
					</div>
					<div class="col-md-3">
						<button type="button" class="btn-danger" style="width: 80px; margin: 25px auto;">去结算</button>
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


<script type="text/javascript">
	var uid = ${userInfo.uid}
	//console.log(uid);

	$.ajax({
		url:"/ssm/user/showShopCart.action",
		data:{
			uid
		},
		type:"post",
		success: function(res){
			
			//console.log(res);
			var len = res.length;
			
			for(var i=0;i<len;i++){
				 $(`<div class="row shopItem">
						<div class="col-md-1">
							<div class="mui-input-row mui-checkbox ">
								<input type="checkbox" class="abc">
							</div>
						</div>
						<div class="col-md-2">
							<img src="`+res[i].img+`" >
						</div>
						<div class="col-md-2">
							<p style="line-height: 80px;">`+res[i].prodName+`</p>
						</div>
						<div class="col-md-2">
							<p style="line-height: 80px;" class="glyphicon glyphicon-yen">`+res[i].price/100+`</p>
						</div>
						<div class="col-md-3">
							<button type="button" class="reduce">-</button>
							<input type="text" class="shopNum" value="0" />
							<button type="button" class="add">+</button>
						</div>
						<div class="col-md-1">
							<button type="button" class="btn-danger delete">删除</button>
						</div>
					</div>`
					).appendTo("#shopCartContent");
				 
					
			}
			var allsum= 0;
			var itemsum= 0;
			$(".add").on("click",function(){
				console.log("进入add");
				var price = parseInt(this.parentNode.parentNode.children[3].children[0].innerText);
				var inp = this.parentNode.children[1];
				var num = parseInt($(inp).val())+1
				$(inp).val(num);
				var sum = 0;
				
				var te = this.parentNode.parentNode.children[0].children[0].children[0];
				if(te.checked){
					sum = sum + price;
					allsum = allsum + sum;
				}
				//console.log(this.parentNode.parentNode.parentNode.parentNode.children[2].children[2].children[0]);
				var all = this.parentNode.parentNode.parentNode.parentNode.children[2].children[2].children[0];
				
				$(".all").text(allsum);
				
			})
			$(".reduce").on("click",function(){
				var price = parseInt(this.parentNode.parentNode.children[3].children[0].innerText);
				var inp = this.parentNode.children[1];
				var num = parseInt($(inp).val());
				if(num > 0){
					num=num-1;
					$(inp).val(num);
					var te = this.parentNode.parentNode.children[0].children[0].children[0];
					if(te.checked){
						allsum = allsum -price;
					}
				}
				var all = this.parentNode.parentNode.parentNode.parentNode.children[2].children[2].children[0];
				$(".all").text(allsum);
				
			})
			$(".delete").on("click",function(){
				console.log(this.parentNode);
				var item=this.parentNode.parentNode;
				var con=this.parentNode.parentNode.parentNode;
				con.removeChild(item);
			})
			
			$(".shopName > input").on("change",function(){
				var arr = this.parentNode.parentNode.parentNode.children;
				
				
				$(".abc").prop("checked",true)
				
				
				if($(this).prop("checked")){
					for(var i = 0;i<arr.length-1;i++){
						if(arr[i].className.includes("shopItem")){
							$(arr[i].children[0].children[0].children[0]).prop("checked",true);
						}
					}
				}else{
					for(var i = 0;i<arr.length-1;i++){
						if(arr[i].className.includes("shopItem")){
							$(arr[i].children[0].children[0].children[0]).prop("checked",false);
						}
					}
				}
			})
			
		}
	});
			
</script>
<script>
		$(document).ready(function(){
			$("#sd").click(function(){
				$(".shopItem").slideDown();
			});
			$("#su").click(function(){
				$(".shopItem").slideUp();
			});
		});
</script>

<script type="text/javascript">
		
		
</script>

</html>