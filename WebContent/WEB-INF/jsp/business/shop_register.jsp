<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont2.css">
<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
<style type="text/css">
	.head{
			height: 70px;
		}
		.jiange{
			height: 2px;
			background-color: #FF6700;
		}
		.rowControl{
			height:500px;
			
		}
		.inputCtrl,.selectCtrl{
			border-radius: 8px !important;
		}
		.shopName,.shopInfo,.shopClass,.shopType,.addr,.postal_code,.shopIntroduction{
			margin-top: 30px;
			width: 350px;
			height: 49.6px;
			border: 0;
			font-size: 14px;
		}
		
	
		.img_wp{
		     width:310px; 
		    cursor:pointer;
		}
		.id_img_wp .img_wp>img{
			margin-top: 30px;
		    width:100px;
		    height: 100px;
		}
		.img_intro{
		    color:#383838;
		    /* text-align:center; */
		    font-family:"微软雅黑";
		    padding:10px 0 10px 0;
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
		.btn{
			margin-top: 30px;
		}
		.register{
			margin-left: 30px;
		}

</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row rowControl">
			<div class="col-md-4"></div>
			<div class="col-md-5">
				<div class="register">
					<div class="input-group input-group-lg shopName">
					  <input type="text" id="shopName" class="form-control inputCtrl" placeholder="店铺名称" aria-describedby="sizing-addon1">
					</div>
					
					<div class="id_img_wp">
					   <input type="file" accept="image/*" onchange="getShopLogo(this)" style="display:none" value="" id="img_logo" name="shopLogo"/>
					   <div class="img_wp" onclick="shopLogo()" style=" display: inline;">
					       <span class="img_intro" style="color: #999999;font-size: 18px;">店铺标志&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><img src="/ssm/public/imgs/logo2.png" id="shop_logo" title="点击上传你的店铺logo吧"/>
					   </div>
					   <div style="display: inline; margin-left: 35px;"><button id="uploadBtn">上传</button></div>
					</div>
					
					<div class="input-group input-group-lg shopClass">
					  <select style="color: #999999;" type="text" id="shopClass" class="form-control selectCtrl" value="店铺种类" aria-describedby="sizing-addon1">
						  <option>请选择店铺的种类</option>
						  <option>服装</option>
						  <option>书籍</option>
						  <option>小吃</option>
						  <option>数码产品</option>
					  </select>
					</div>
					
					<div class="input-group input-group-lg shopInfo">
					  <input type="text" id="shopInfo" class="form-control inputCtrl" placeholder="店铺简介" aria-describedby="sizing-addon1">
					</div>
					
					<div class="input-group input-group-lg shopType">
					  <input type="text" id="shopType" class="form-control inputCtrl" placeholder="店铺类型" aria-describedby="sizing-addon1">
					</div>
					
					<div class="input-group input-group-lg addr">
					  <input type="text" id="addr" class="form-control inputCtrl" placeholder="联系地址" aria-describedby="sizing-addon1">
					</div>
					
					<div class="input-group input-group-lg postal_code">
					  <input type="text" id="postal_code" class="form-control inputCtrl" placeholder="邮政编码" aria-describedby="sizing-addon1">
					</div>
					
					<div class="input-group input-group-lg shopIntroduction">
					  <input style="height: 80px;"  type="text" id="shopIntroduction" class="form-control inputCtrl" placeholder="店铺介绍" aria-describedby="sizing-addon1">
					</div>
					
					<div class="btn">
						<button style="width:200px; margin-left: 50px;" id="registerBtn" type="button" class="btn btn-info">立即注册</button>
					</div>
			</div>
		</div>
		
	</div>
	</div>
	
		
		
	<script>
		//店铺标志
		function shopLogo(){
		    $('#img_logo').click();
		}
		function getShopLogo(imgFile){
				 
		    var file = imgFile.files[0];
				 
		    var reader = new FileReader();
		    reader.readAsDataURL(file);//将文件读取为Data URL小文件   这里的小文件通常是指图像与 html 等格式的文件
		    reader.onload = function(e){
		        $("#shop_logo").attr("src",e.target.result);
		    }
		}
		
		//申请
		function checkForm(){
		    
		    if($('#img_logo').val()==null||$('#img_logo').val()==''){
		        alert('请上传店铺标志！');
		        return false;
		    }
		    //提交表单
		}
		
		
		//店铺注册
		$("#registerBtn").on("click",function(){
			var bid = ${businessInfo.bid};
			
			var shopName = $("#shopName").val();
			
			var shopClass = $("#shopClass").val();
			
			var shopInfo = $("#shopInfo").val();
			
			var shopType = $("#shopType").val();
			
			var addr = $("#addr").val();
			
			var postal_code = $("#postal_code").val();
			
			var shopIntroduction = $("#shopIntroduction").val();
			
			$.ajax({
				url:"/ssm/business/shopRegister.action",
				data:{
					shopName,
					shopClass,
					shopInfo,
					shopType,
					addr,
					postal_code,
					shopIntroduction,
					bid
				},
				type:"post",
				success:function(res){
					alert(res.msg);
					
				}
				
			})
			
		})
		
		//店铺标志注册
		$("#uploadBtn").on("click", function () {
		
		var f = $("#img_logo")[0].files[0]
		
		
		var fd = new FormData()
		
		fd.append("shopLogo",f)
		fd.append("uname","zhangsan")
		
		$.ajax({
			url: "/ssm/business/uploadShopLogo.action",
			data: fd,
			type: "post",
			processData: false,
			contentType: false,
			success: function (res){
				alert(res.msg);
			}
			
		})
		
		
	})
		
	</script>
</body>
</html>
