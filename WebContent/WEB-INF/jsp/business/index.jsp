<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商家index</title>
<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont2.css">
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
		<script src="/ssm/public/js/jquery-1.12.4.js"></script>
<style type="text/css">
			*{
				font-family: 宋体;
				margin: 0;
				padding: 0;
				
			}
			#head{
				height: 78px;
				background-color: #1B6D85;
			}
			
			p{
				font-size: 36px;
				line-height: 68px;
				color: white;
			}
			p:hover{
				cursor: pointer;
			}
			
			
			.left,.center{
							list-style: none;
						}
						.leftArea{
							
							height: 595px;
							padding-right: 0;
							
							background-color: transparent;
						}
						.centerArea{
							
							height: 320px;
							padding-left: 0;
							width: 130px;
							background-color: #313944;
						}
						.left span{
							display: block;
						}
						.left>li{
							
							height: 64px;
							line-height: 44px;
							text-align: center;
							padding-top: 10px;
							background-color: #2c343f;
							color: white;
							
							
						}
						.center>li{
							width: 130px;
							height: 32px;
							text-align: center;
							line-height: 32px;
							color: white;
						}
						
						.now{
							color: #00BFFF;
							border-left: 2px solid deepskyblue;
						}
						.rightArea{
							padding: 0;
						}
						.index{
							width: 100%;
							height: 80px;
							background-color: #36424e;
							
						}
						.index>p{
							width: 220px;
							height: 40px;
							text-align: center;
							margin: 20px auto;
							font-size: 15px;
							line-height: 40px;
							border-radius: 5px;
							background-color: #2c343f;
						}
		
	
</style>

</head>
<body>

<div id="head">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<p class="glyphicon glyphicon-home" style="line-height: 68px;font-size: 36px; color: white;">&nbsp;JD后台管理系统</p>
						<a class="loginOut" href="/ssm/platform/loginOut.action">退出登录</a>
					</div>
					<div class="col-md-1">
						<p class="glyphicon glyphicon-user" style="font-size: 36px;line-height: 68px;"></p>
					</div>
					<div class="col-md-1">
						<p class="glyphicon glyphicon-cog" style="font-size: 36px;line-height: 68px;"></p>
					</div>
					<div class="col-md-1">
						<p class="glyphicon glyphicon-calendar" style="font-size: 36px;line-height: 68px;"></p>
					</div>
					<div class="col-md-1">
						<p class="glyphicon glyphicon-shopping-cart" style="font-size: 36px;line-height: 68px;"></p>
					</div>
				</div>
			</div>
		</div>
		<div id="body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2 col-lg-2">
						<div class="row">
							<div class="index col-md-12 col-lg-12">
								<p class="glyphicon glyphicon-home">&nbsp;首页</p>
							</div>
						</div>
						<div class="row" style="background-color: #36424e">
							<div class="col-md-5 col-lg-5 leftArea">
								
							</div>
							<div class="col-md-7 col-lg-7 centerArea">
								
							</div>
						</div>
					</div>
					<div class="col-md-10 col-lg-10 rightArea">
						<iframe src="" width="100%" height="671px"></iframe>
					</div>
				</div>
			</div>
			
		</div>
	


</body>


<script>

	$(function(){
		$("#loginBtn").on("click",function(){
			var account = $("#account").val();
			var pwd = $("#pwd").val();
			
			$.ajax({
				url:"/ssm/platform/login.action",
				data:{
					account,
					pwd
				},
				
				success:function(){
					
					if(res.code == 1000){
						
						if(res.data == 1){
							//跳转到平台首页
							window.location.href="";
						}else{
							
							alert("账号和密码不匹配");
						}
					}
				}
				
				
			})
			
		})
		
		
		
	})
</script>

<script>
		var data = [
					{name:"账号管理",
					icon:"glyphicon glyphicon-blackboard",
					items:[
						{name:"修改密码",index:"/ssm/user/changePwdPage.action"}],
					},
					{name:"商家管理",
					icon:"glyphicon glyphicon-th",
					items:[
						{name:"商家信息查询",index:"./html/b1.html"},
						{name:"商家店铺查询",index:"./html/b2.html"}],
					},
					{name:"店铺管理",
					icon:"glyphicon glyphicon-file",
					items:[
						{name:"店铺申请",index:"/ssm/business/shop_register.action"}],
					},
					{name:"用户管理",
					icon:"glyphicon glyphicon-user",
					items:[
						{name:"用户信息查询",index:"../../qwe.html"},
						{name:"用户订单查询",index:"../../qwe1.html"},
						{name:"用户申诉",index:"../../qwe2.html"},
						{name:"用户建议",index:"../../qwe2.html"},
						{name:"用户消费数据统计",index:"../../qwe3.html"}],
					},
					{name:"投诉管理",
						icon:"glyphicon glyphicon-remove",
						items:[
							{name:"商家投诉",index:"../../qwe2.html"},
							{name:"用户投诉",index:"../../qwe3.html"}],
					}

					
			];
			var ul = document.createElement("ul");
			for(var i = 0; i<data.length; i++){
				var li = document.createElement("li");
				var icon = document.createElement("span");
				var text = document.createElement("span");
				
				var $li = $(li);
				var $icon = $(icon).attr("class",data[i].icon);
				var $text = $(text).text(data[i].name);
				$(li).append($icon);
				$(li).append($text);
				
				$(ul).append($li);
			}
			
			console.log();
			
			$(".leftArea").append($(ul).attr("class","left"));
			
			
			var lis = document.querySelectorAll(".left>li");
			for(let i = 0; i < lis.length;i++){
				lis[i].onclick = function(){
					 $(this).addClass('now').siblings().removeClass('now');
					var arr = data[i].items
					insert(arr);
					change(arr);
					
					//console.log(data[i].items);
				}
			}
			
			function insert(data){
				$(".centerArea").html("")
				var ul = document.createElement("ul");
				
				for(var i= 0;i <data.length; i++){
					var li = document.createElement("li");
					
					$(ul).append($(li).text(data[i].name));
					
				}
				
				$(".centerArea").append($(ul).attr("class","center"));
			}
			var lefchose = document.querySelectorAll(".leftArea li");
			lefchose[0].click();
			 $(lefchose[0]).css("backgroundColor","#313944");
			
			
			
			//切换
			function change(arr1){
				var centerLis = document.querySelectorAll(".centerArea li");
				for(let i = 0;i<centerLis.length;i++){
					centerLis[i].onclick = function(){
						 $(this).addClass('now').siblings().removeClass('now');
						$("iframe").attr("src",arr1[i].index);
						
					}
				}
			}
			
			
			
	</script>
</html>