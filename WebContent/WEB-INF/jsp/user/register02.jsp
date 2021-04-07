<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			#signin{
				height: 450px;
				background-color: lightcoral
			}
			.sign_in{
				width: 80%;
				height: 450px;
				background-color: white;
				margin: 0 auto;
			}
			.input-group{
				margin: 20px 30px;
			}
			#jd{
				margin: 80px auto;
				height: 128px;
				width: 128px;
			}
			.btn-sign{
				background-color: #dd4545;
				border: 0;
				height: 40px;
				width: 240px;
				color: white;
				font-size: 15px;
				border-radius: 5px;
				margin: 0 30px;
			}
			.btn-sign:focus,
			.btn-sign:active{
				outline: none;
				color: black;
			}
			.boxxx{
				width: 300px;
			}
			.btn-le{
				margin-left: 30px;
				font-size: 14px;
			}
			._info{
				margin-left: 30px;
				font-size: 14px;
				color: red;
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


<div id="signin">
			<div class="sign_in">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 hidden-xs">
						<div id="jd"><img src="/ssm/public/imgs/logo2.png" alt=""></div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="boxxx">
							<h3 align="center">请注册</h3>
							<div class="input-group input-group-md">
							  <span class="input-group-addon glyphicon glyphicon-user" id="sizing-addon1"></span>
							  <input id="tel" type="text" class="form-control" placeholder="手机号码" aria-describedby="sizing-addon1">
							</div>
							
							<div class="input-group input-group-md">
							  <span class="input-group-addon glyphicon glyphicon-lock" id="sizing-addon1"></span>
							  <input id="addr" type="text" class="form-control" placeholder="地址" aria-describedby="sizing-addon1">
							</div>
							
							<div class="input-group input-group-md">
							  <span class="input-group-addon glyphicon glyphicon-lock" id="sizing-addon1"></span>
							  <input id="pwd" type="password" class="form-control" placeholder="密码" aria-describedby="sizing-addon1">
							</div>
							<p style="display: none;" class="password_info _info">hahaa</p>
							<div class="input-group input-group-md">
							  <span class="input-group-addon glyphicon glyphicon-lock" id="sizing-addon1"></span>
							  <input id="pwd2" type="password" class="form-control" placeholder="确认密码" aria-describedby="sizing-addon1">
							</div>
							<p style="display: none;" class="password_info2 _info">hahaa</p>
							<div class="mui-checkbox btn-le">
								
								<input name="Checkbox" type="checkbox" id="agree" checked>
								<lable>阅读并同意</lable>
								<label data-toggle="modal" data-target="#myModal">用户协议和隐私政策</label>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">用户协议和隐私政策</h4>
							      </div>
							      <div class="modal-body">
							        <textarea rows="20" cols="75">
							        	一、服务条款的确认及接受
							        	
							        	1、京东网站（指jd.com及其移动客户端软件、应用程序，以下称“本网站”）各项电子服务的所有权和运作权归属于“京东”所有，本网站提供的服务将完全按照其发布的服务条款和操作规则严格执行。您确认所有服务条款并完成注册程序时，本协议在您与本网站间成立并发生法律效力，同时您成为本网站正式用户。
							        	
							        	2、根据国家法律法规变化及本网站运营需要，京东有权对本协议条款及相关规则不时地进行修改，修改后的内容一旦以任何形式公布在本网站上即生效，并取代此前相关内容，您应不时关注本网站公告、提示信息及协议、规则等相关内容的变动。您知悉并确认，如您不同意更新后的内容，应立即停止使用本网站；如您继续使用本网站，即视为知悉变动内容并同意接受。
							        	
							        	二、服务需知
							        	
							        	1、本网站运用自身开发的操作系统通过国际互联网络为用户提供购买商品等服务。使用本网站，您必须：
							        	
							        	（1）自行配备上网的所需设备，包括个人手机、平板电脑、调制解调器、路由器等；
							        	
							        	（2）自行负担个人上网所支付的与此服务有关的电话费用、网络费用等；
							        	
							        	（3）选择与所安装终端设备相匹配的软件版本，包括但不限于iOS、Android、iPad、Windows Phone等多个京东发布的应用版本。
							        	
							        	2、基于本网站所提供的网络服务的重要性，您确认并同意：
							        	
							        	（1）提供的注册资料真实、准确、完整、合法有效，注册资料如有变动的，应及时更新；
							        	
							        	（2）如果您提供的注册资料不合法、不真实、不准确、不详尽的，您需承担因此引起的相应责任及后果，并且京东保留终止您使用本网站各项服务的权利。
							        </textarea>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-danger btn-test">同意</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal">拒绝</button>
							      </div>
							    </div>
							  </div>
							</div>
							<button type="button" id="registerBtn" class="btn-sign">立即注册</button>
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

<script>
	$(function(){
		
		//校验手机号是否存在
		$("#tel").on("change",function(){
			var tel = $(this).val();
			
			//再校验手机号格式是否正确
			var reg = /^1[3456789]\d{9}$/
			
			if(!reg.test(tel)){
				alert("手机号格式不正确");
				return;
			}
			
			$.ajax({
				url: "/ssm/user/isTelExist.action",
				data:{
					tel: tel
				},
				
				success: function(res){
					// code--状态码  msg--信息  data--数据
					if ( res.code == 1000 )
					{
						if (res.data == 1)
						{
							alert('该手机号已存在');
						}
					}
					else
					{
						alert(res.msg);
					}
					
				}
				
			})
			
		})
		
		//注册功能实现
		$("#registerBtn").on("click",function(){
			var tel = $('#tel').val();
			var pwd = $('#pwd').val();
			var addr = $("#addr").val();
			
			if(!tel){
				alert("请输入手机号");
				return;
			}else if(!pwd){
				alert("请输入密码");
				return;
			}
			
			$.ajax({
				url: "/ssm/user/register02.action",
				type: 'post',
				data:{
					pwd: pwd,
					tel: tel,
					addr: addr
				},
				
				success: function(res){
					if(res.code == 1000){
						//页面跳转到主页
						window.location.href='/ssm/user/loginPage.action';
					}else{
						alert(res.msg);
					}
					
				}
				
				
			})
			
		})
		
		
		
	})
	
	
	
	
	

</script>
<script type="text/javascript">
		var mm=null;
		$("#pwd").on("click",function(){
					$(".password_info").text(null)
					$(".password_info2").text(null)
				})
		$("#pwd").on("blur",function(){
					var str1 = $("#password").val();
					if(str1.length < 6){
						$(".password_info").css("display","block")
						$(".password_info").text("密码长度不小于6位")
					}
				})
		$("#pwd2").on("click",function(){
					$(".password_info").text(null)
					$(".password_info2").text(null)
				})
		$("#pwd2").on("blur",function(){
					var str1 = $("#password").val();
					var str2 = $("#password2").val();
					console.log(str1);
					console.log(str2);
					if(str1 != str2){
						$(".password_info2").css("display","block")
						$(".password_info2").text("两次密码不一致")
					}
				})
		
		$(".btn-test").on("click",function(){
			console.log(1)
			$("#agree").prop("checked",true);
			$('#myModal').modal('hide');
		})	
	</script>

</body>
</html>