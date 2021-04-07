<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/honor.css">
		<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
	</head>
	<style>
		.head{
			height: 70px;
		}
		.jiange{
			height: 2px;
			background-color: #FF6700;
		}
		.login{
			margin-top: 30px;
			width: 350px;
			height: 49.6px;
			background-color: rgba(0, 0, 0, 0.05);
			border: 0;
			font-size: 14px;
		}
		.body{
			margin-top: 55px;
		}
		
		.weibu1{
			height: 83px;
			background-color: snow;
			margin-bottom: 20px;
		}
		.weibu1 .row img{
			width: 38px;
			height: 38px;
			/* margin-top: 14px; */
			
		}
		.weibu1 >.row>div>div{
			line-height: 83px;
		}
		.weibu1 >.row>div>div>a>span{
			font-size: 17px;
		}
	</style>
	
	<body>
		<div class="container-fluid head">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-1">
					<div class="logo" style="margin-top: 20px;">
						<img src="/ssm/public/imgs/huawei.png" style="width: 120px;height: 40px;"/>
					</div>
				</div>
				<div class="col-md-2">
					<div class="order" style="color: #255625; margin-left: 20px; margin-top: 24px; font-size: 25px;font-family: Helvetica Neue,Helvetica,Arial,Microsoft Yahei,Hiragino Sans GB,Heiti SC,WenQuanYi Micro Hei,sans-serif;">生成订单</div>
				</div>
			</div>
		</div>
		
		<div class="jiange"></div>
		
		<div class="container-fluid body">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-5">
					<div style="font-size: 22px;">收货地址</div>
					<div class="goodsInfo">
						<div class="input-group input-group-lg login">
						  <input type="text" id="uname" class="form-control message" placeholder="姓名" aria-describedby="sizing-addon1">
						</div>
						
						<div class="input-group input-group-lg login">
						  <input type="text" id="tel" class="form-control message" placeholder="手机号" aria-describedby="sizing-addon1">
						</div>
						
						<div class="input-group input-group-lg login">
						  <input type="text" id="addrBig" class="form-control message" placeholder="选择省/市/区" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg login" >
						  <input type="text" id="addrSmall" style="height: 70px;" class="form-control message" placeholder="详细地址" aria-describedby="sizing-addon1">
						</div>
						
					</div>
					
				</div>
				<div class="col-md-4">
					<div style="font-size: 22px;">配送方式<span style="color:#FF6700; font-size: 18px;margin-left: 100px;">包邮</span></div>
					
					<div style="font-size: 22px; margin-top: 50px;">发票<span style="color:#FF6700; font-size: 18px;margin-left: 100px;">
电子普通发票&nbsp;&nbsp;&nbsp;个人&nbsp;&nbsp;&nbsp;商品明细</span></div>

					<!-- <div style="height:1px;background-color: red;margin-top:90px;"></div> -->
					
					<div style="margin-top: 100px;"><button id="return" style="border:0px; background-color: orange;color: white;width: 100px;height: 40px;">返回详情</button><button id="purchaseBtn" style="border:0px; margin-left: 80px; background-color: orange;color: white;width: 100px;height: 40px;">立即购买</button></div>
					
				</div>
			</div>
		</div>
		
		
		<div style="height: 90px;"></div>
		
		
		<!-- 尾部 -->
		<div class="container weibu1">
			<div class="row">
				<div class="col-md-3 col-xs-12">
					<div>
						<a href=""><img src="/ssm/public/imgs/xunzhang.png" alt=""><span>&nbsp;&nbsp;百强企业 品质保证</span></a>
					</div>
				</div>
				
				<div class="col-md-3 col-xs-12">
					<div>
						<a href=""><img src="/ssm/public/imgs/bianqian.png" alt=""><span>&nbsp;&nbsp;7天退货 15天换货</span></a>
					</div>
				</div>
				
				<div class="col-md-3 col-xs-12">
					<div>
						<a href=""><img src="/ssm/public/imgs/yunshu.png" alt=""><span>&nbsp;&nbsp; 48元起免运费</span></a>
					</div>
				</div>
				
				<div class="col-md-3 col-xs-12">
					<div>
						<a href=""><img src="/ssm/public/imgs/location.png" alt=""><span>&nbsp;&nbsp;2000家服务店 全国联保</span></a>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="container weibu2">
			<div class="row">
				<div class="col-md-2 foot1"></div>
				<div class="col-md-5 col-xs-12 foot2">
					<div class="copyright">
						<span>Copyright © 2011-2020 荣耀终端有限公司 版权所有 保留一切权利 | <img src="/ssm/public/imgs/guohui.png"/></span>
					</div>
				</div>
				<div class="col-md-3 col-xs-12 foot3">
					<div class="gongwang">
						<a href="">粤公网安备 44030702003093号</a>
					</div>
				</div>
				<div class="col-md-2 col-xs-12 foot4">
					<div class="ICP">
						<a href="">粤ICP备20047157号</a>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="container weibu3">
			<div class="row">
				<div class="col-md-4 foot5"></div>
				
				<div class="col-md-6 col-xs-12">
					
					<div class="footer">
						<a href="" class="yinsi">隐私声明</a>
						<a href="" class="use">使用条款</a>
						<a href="" class="cookies">关于cookies</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <script type="text/javascript">
			$(function(){
				$("#purchaseBtn").on("click",function(){
					var uname = $('#uname').val();
					var tel = $('#tel').val();
					var addrBig = $('#addrBig').val();
					var addrSmall = $('#addrSmall').val();
					
					$.ajax({
						url:"/ssm/user/orderAction.action",
						data:{
							uname:uname,
							tel:tel,
							addrBig:addrBig,
							addrSmall:addrSmall
						},
						type:"post",
						success:function(res){
							alert(res.msg);
						}
						
						
					})
			
				})
				
				
			}) -->
			
			
			//返回详情
			$("#return").on("click",function(){
				
				window.location.href="/ssm/user/shopDetailsPage.action";
			})
		
		</script>
		
	</body>
</html>
