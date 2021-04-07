<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
    <%@page import="com.yanda.bean.*" %>
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
		.li1{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l1.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
			}
			.li2{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l2.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
			}
			.li3{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l3.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
			}
			.li4{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l4.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
			}
			.li5{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l5.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
			}
			.li6{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l6.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
			}
			.li7{
				line-height: 32px;
				list-style: none;
				background: url("/ssm/public/imgs/l7.png") no-repeat;
				margin: 10px 5px;
				color: slategray;
				padding: 0 10px 0 35px;
				
			}
	</style>
</head>
		
<body>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



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
		        <li><a href="/ssm/user/shopCartPage.action"><p id="shopcart" class="glyphicon glyphicon-shopping-cart">&nbsp;购物车</p></a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<div class="container">
			<div class="row">
					<div class="col-md-2 col-sm-3 hidden-xs">
						<div class="box">
							<ul class="test">
								<li class="li1">电脑电视</li>
								<li class="li2">工作学习</li>
								<li class="li3">数码相机</li>
								<li class="li4">日用电器</li>
								<li class="li5">运动健康</li>
								<li class="li6">厨房小电</li>
								<li class="li7">智能家居</li>
							</ul>
						</div>
					</div>
					<div class="col-md-10 col-sm-9 col-xs-12">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						  <!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						  </ol>
						
						  <!-- 轮播图 -->
						  <div class="carousel-inner" role="listbox">
						    <div class="item active">
						      <img src="/ssm/public/imgs/lb1.jpg" alt="...">
						      <div class="carousel-caption">
						        
						      </div>
						    </div>
						    <div class="item">
						      <img src="/ssm/public/imgs/lb2.jpg" alt="...">
						      <div class="carousel-caption">
						        
						      </div>
						    </div>
							<div class="item">
							  <img src="/ssm/public/imgs/lb1.jpg" alt="...">
							  <div class="carousel-caption">
							    
							  </div>
							</div>
						  </div>
						
						  <!-- 轮播图左右按键 -->
						  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
					</div>
				</div>
			
		</div>
		<div class="hot">
			<img src="/ssm/public/imgs/hot.png" alt="">
		</div>
<div class="goods container">
	<div class="row prodlist">
		<c:forEach items="${page.data }" var="item">
			<div class="col-md-3 col-sm-4 col-xs-6">
				<div class="good">
					<img class="img"  onclick="to_shop_detail(this)" src="${item.img }">
					<div class="name"><span>${item.prodName }</span></div>
					<div class="price"><span>￥${item.price/100 }</span></div>
					<div class="store"><span>${item.shopName }</span></div>
					<input type="hidden" style="display: none" value="${item.prodId}">
				</div>
			</div>
		</c:forEach>
	</div>
</div>



<input id="currentPage" style="display: none" value="${page.currentPage }">
<%-- 


<c:out value="第${page.currentPage }页"></c:out>


 --%>

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
	$(function () {
		
		var f = true;
		//监听滚动条
		$(document).scroll(function () {
			var allHeight = $(document).height();
			
			var topHeight = $(window).scrollTop();
			
			var windowHeight = $(window).height();
			
			var currentPage = $('#currentPage').val();
			
			
			if ( allHeight - (topHeight+windowHeight) < 50)
			{
				console.log("true");
				if ( f )
				{
					var currentPage = $('#currentPage').val();
					f = false;
					$.ajax({
						url: '/ssm/user/findProductByPage.action',
						data: {
							currentPage: ++currentPage,
							everyPageNum: 4
						},
						success: function (res) {
							f = true;
							//设置当前页
							$('#currentPage').val(res.currentPage);
							//展示当前页内容
							//模板引擎
							for (var i=0;i<res.data.length;i++)
							{
								$(`<div class="col-md-3 col-sm-4 col-xs-6">
										<div class="good">
											<img class="img" onclick="to_shop_detail(this)" src="`
											+ res.data[i].img +
											`">
											<div class="name"><span>`+res.data[i].prodName+`</span></div>
											<div class="price"><span>￥`+res.data[i].price/100+`<span></div>
											<div class="store"><span>`+res.data[i].shopName+`<span></div>
											<input type="hidden" style="display: none" value="`+res.data[i].prodId+`">
										</div>
									</div>`
									).appendTo('.prodlist')
								
							}
							
						}
					})
				
				}
			}
			
		})
		
	})
	function to_shop_detail(pid){
		
		var pit = pid.parentNode.children[4].value;
		window.open("/ssm/user/shopDetailPage.action?"+pit);
		}
</script>

</html>