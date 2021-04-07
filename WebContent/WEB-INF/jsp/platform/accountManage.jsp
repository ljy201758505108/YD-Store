<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont.css"/>
		<script src="/ssm/public/js/jquery-1.12.4.js"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<style type="text/css">
		.head{
			margin-top: 10px;
			height: 30px;
			line-height: 30px;
		}
		.head span{
			font-family: "microsoft yahei";
			font-weight: bold;
		}
		.div-btn{
			padding-right: 30px;
			margin-top: 20px;
			color: white;
			overflow: hidden;
			margin-bottom: 25px;
		}
		.head-btn{
			height: 40px;
			/* float: right; */
			background-color: #3479B4;
			border-radius: 5px;
			border: 0;
			float: right;
			margin-right: 10px;
		}
		.content-tab{
			padding: 0 80px;
		}
		.content-tab button{
			margin: 0 3px;
		}
		.createAdmin input{
			margin: 0 auto;
			display: block;
			margin-bottom: 10px;
			color: black;
		}
	</style>
	<body>
		<div class="head container-fluid">
			<div class="row">
				<div class="col-md-4 col-xs-4">
					<span>账号</span>
					<input type="text" name="" id="account" value=""  placeholder="账号"/>
				</div>
				<div class="col-md-4 col-xs-4">
					<span>使用人</span>
					<input type="text" name="" id="accountName" value=""  placeholder="使用人"/>
				</div>
				<div class="col-md-4 col-xs-4">
					<div class="dropdown">
					<span>状态</span>
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					    <span id="selected">===请选择===</span>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="myList">
					    <li><a href="#" name="2">冻结</a></li>
					    <li><a href="#" name="1">正常</a></li>
					  </ul>
					</div>
				</div>
			</div>
		</div>
		<div class="div-btn">
			<button type="button" class="head-btn" id="search"><span>查询</span></button>
			<button type="button" class="head-btn" data-toggle="modal" data-target="#myModal"><span>创建管理员账号</span></button>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">创建管理员账户</h4>
			      </div>
			      <div class="modal-body createAdmin">
			        <input placeholder="账号" id="createAdminUname" type="text">
			        <input placeholder="使用人"	id="createAdminName" type="text">
			        <input placeholder="密码" id="createAdminPwd" type="password">
			        <input placeholder="请再输入一次" id="createAdminPwd" type="password">
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" class="btn btn-primary">确定</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<div class="content-tab">
			<table class="table table-striped content-tab">
				<thead>
				      <tr>
				         <th>账号</th>
				         <th>使用人</th>
				         <th>状态</th>
				         <th>操作</th>
				      </tr>
				</thead>	
				    <tbody id="tBody" class="tBody1">
				    <c:forEach items="${platformList.data}" var="item">
				        <tr id="dTl">
							<td>${item.accname}</td>
							<td>${item.name}</td>
				        	<c:if test="${item.status==1}">
				        	<td>正常</td>
				        	</c:if>
				        	<c:if test="${item.status==2}">
				        	<td>冻结</td>
				        	</c:if>
				        	<td><button type="button" style="background-color: deepskyblue; border: 1px solid skyblue; color: white; border-radius: 5px;" class="freezeBtns">冻结</button>
				        	<button type="button" style="background-color: red; border: 1px solid red; color: white; border-radius: 5px;" class="delete">删除</button>
				        	<button type="button" style="background-color: limegreen; border: 1px solid limegreen; color: white; border-radius: 5px;" class="changed" data-toggle="modal" data-target="#changedModal">修改归属</button>
				        	</td>
				        </tr>
				    </c:forEach>    
				      </tbody>    
			</table>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="changedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog myModal" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">修改归属</h4>
		      </div>
		      <div class="modal-body">
		        <div style="padding-left: 120px;">
		        	<span>新的使用人:</span><input placeholder="输入新使用人" class="newName">
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary okBtn">确定</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		  <!-- Nav tabs -->
		  <div id="divUl">
		  <ul id="pageInfo" class="pagination">
		 <li>
		     <a href="#" aria-label="Previous" id="num-pre" style="opacity: 0.2; display: true; pointer-events: none;">
		       <span aria-hidden="true">&laquo;</span>
		     </a>
     	</li>
  		<li class="num active"><a href="#home" data-toggle="tab" class="onLise">1</a></li>
 <c:forEach var="x" begin="1" end="${platformList.getAllPage()}">
 		<c:if test="${x>1}">
 		<li class="num"><a href="#home" data-toggle="tab" class="onLise">${x}</a></li>
 		</c:if>
 </c:forEach>
 <li>
       <a href="#" aria-label="Next" id="num-hou">
         <span aria-hidden="true">&raquo;</span>
       </a>
     </li>
</ul>
    	  </div>
	</body>
 	<script>
 	var g = function (id) {
        return document.getElementById(id);
    }
 	var account
 	var accountName
 	var status
 	var currentPage=0
 	var flag=0
 	var allPage
 	var changeAccname
 	var changeName
 	var testIt
 	var testIs
 	var searchPlatformAllPage
 	var lis=document.querySelectorAll(".num");
	$("#num-hou").on("click",function(){
		for(var i=currentPage;i<lis.length-1;i++){
			if(lis[i].className.indexOf("active")!=-1)
				{
					var change=$(lis).attr("class").split("active");
					$(lis[i]).attr("class",change[0]);
					lis[i+1].className=lis[i+1].className+" active";
					break;
				}
		}
		currentPage=currentPage+1
		if(flag==0)
			findPage(currentPage)
		if(flag==1)
			searchPage(account,accountName,status,currentPage)
	})
	$("#num-pre").on("click",function(){
		for(let i=currentPage;i<lis.length;i++){
			if(lis[i].className.indexOf("active")!=-1)
				{
					var change=$(lis).attr("class").split("active");
					$(lis[i]).attr("class",change[0]);
					lis[i-1].className=lis[i-1].className+" active";
					break;
				}
		}
		currentPage=currentPage-1
		if(flag==0)
			findPage(currentPage)
		if(flag==1)
			searchPage(account,accountName,status,currentPage)
	})
	var onLise=document.querySelectorAll(".onLise")
 	for(let i=0;i<onLise.length;i++)
		{
			$(onLise[i]).on("click",function(){
				currentPage=i
				if(flag==0)
					findPage(currentPage)
				if(flag==1)
					searchPage(account,accountName,status,currentPage)
					
			})
		}
	//寻找当前页数所对应的表格
	function findPage(currentPage) {
		var	allPage=${platformList.getAllPage()}
		if (currentPage==(allPage-1)) {
			$("#num-hou").css("opacity","0.2")
			$("#num-hou").attr("disabled",true).css("pointer-events","none")
		}
		else{
			$("#num-hou").css("opacity","") 
			$("#num-hou").attr("disabled",false).css("pointer-events","auto")
		}
		if (currentPage==0) {
			$("#num-pre").css("opacity","0.2")
			$("#num-pre").attr("disabled",true).css("pointer-events","none"); 
		}
		else if(currentPage!=0){
			$("#num-pre").css("opacity","")
			$("#num-pre").attr("disabled",false).css("pointer-events","auto")
		}
		$.ajax({
			url: '/ssm/platform/findPlatformByPage.action',
			data: {
				currentPage: currentPage,
				everyPageNum: 6
			},
			success: function (res) {
				insertTab(res.data)
			}
		})
	}
	$("#myList li").on("click",function(){
		status=$(this).children(":first").attr("name")
		if(status==1)
			$("#selected").text("正常")
		if(status==2)
			$("#selected").text("冻结")
	})
	/* 账户：account 使用人：accountName 在线：onLine 离线：outLine*/
	 $("#search").on("click",function(){
		flag=1
		currentPage=0;
		account=$("#account").val()
		accountName=$("#accountName").val()
		currentPage=0
		searchPage(account,accountName,status,currentPage)
		
	})
	 
	//每次插入新表格的方法
	function insertTab(newTab) {
		for (let i=0;i<6;i++)
		{
			 var dTl=$("#dTl")
			dTl.remove()
		}
		$(".myModal").remove()
		$(`<div class="modal-dialog myModal" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">修改归属</h4>
			      </div>
			      <div class="modal-body">
			        <div style="padding-left: 120px;">
			        	<span>新的使用人:</span><input placeholder="输入新使用人" class="newName">
			        </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" class="btn btn-primary okBtn">确定</button>
			      </div>
			    </div>
			  </div>`).appendTo("#changedModal")
		 $(".okBtn").on("click",function(){
		var newName=$(".newName").val()
		$.ajax({
			url:"/ssm/platform/updateName.action",
			type:"post",
			data:{
				newName: newName,
				accname:testIt,
				name:testIs
			},
		success:function(){
			$("#changedModal").modal('hide')
			alert("成功")
			if (flag==0) {
					findPage(currentPage)	
				}
				if(flag==1)
				{
					searchPage(account,accountName,status,currentPage)
				}
		}
		})
	})
		for(let i=0;i<newTab.length;i++)
			{
			if (newTab[i].status==1) {
		$(`
			<tr id="dTl">
			<td>`+newTab[i].accname+`</td>
			<td>`+newTab[i].name+`</td>
			<td>正常</td>
			<td>
			<button type="button" style="background-color: deepskyblue; border: 1px solid skyblue; color: white; border-radius: 5px;" class="freezeBtns">冻结</button>
			<button type="button" style="background-color: red; border: 1px solid red; color: white; border-radius: 5px;" class="delete">删除</button>
			<button type="button" style="background-color: limegreen; border: 1px solid limegreen; color: white; border-radius: 5px;" class="changed" data-toggle="modal" data-target="#changedModal">修改归属</button>
			</td>
		</tr>`).appendTo("#tBody")
	$(".freezeBtns").on("click",function(){
	var fAccname=this.parentNode.parentNode.children[0]
	var fName=this.parentNode.parentNode.children[1]
	var fStatus=this.parentNode.parentNode.children[2]
	fAccname=$(fAccname).text()
	fName=$(fName).text()
	fStatus=$(fStatus).text()
 	if(fStatus=='正常')
	{
 		fStatus='2'
	}
	if (fStatus=="冻结") 
	{
		fStatus='1'
	}
	   $.ajax({
		type:"post",
		url:"/ssm/platform/updateStatus.action",
		data:{
			status:fStatus,
			accname:fAccname,
			name:fName
		},
		success:function(){
			if (flag==0) {
				findPage(currentPage)	
			}
			if(flag==1)
			{
				searchPage(account,accountName,status,currentPage)
			}
		}
	}) 

})
$(".delete").on("click",function(){
		var fAccname=this.parentNode.parentNode.children[0]
		var fName=this.parentNode.parentNode.children[1]
		var fStatus=this.parentNode.parentNode.children[2]
		fAccname=$(fAccname).text()
		fName=$(fName).text()
		fStatus=$(fStatus).text()
	 	if(fStatus=='正常')
		{
	 		fStatus='2'
		}
		if (fStatus=="冻结") 
		{
			fStatus='1'
		}
		   $.ajax({
			type:"post",
			url:"/ssm/platform/deletePlatform.action",
			data:{
				accname:fAccname,
				name:fName
			},
			success:function(){
				if (flag==0) {
					findPage(currentPage)	
				}
				if(flag==1)
				{
					searchPage(account,accountName,status,currentPage)
				}
			}
		})
	})
	$(".changed").on("click",function(){
		testIt=$(this.parentNode.parentNode.children[0]).text()
		testIs=$(this.parentNode.parentNode.children[1]).text()
	})
		}
			
			
			else{
				$(`
						<tr id="dTl">
						<td>`+newTab[i].accname+`</td>
						<td>`+newTab[i].name+`</td>
						<td>冻结</td>
						<td>
						<button type="button" style="background-color: deepskyblue; border: 1px solid skyblue; color: white; border-radius: 5px; " class="freezeBtns">冻结</button>
						<button type="button" style="background-color: red; border: 1px solid red; color: white; border-radius: 5px;" class="delete">删除</button>
						<button type="button" style="background-color: limegreen; border: 1px solid limegreen; color: white; border-radius: 5px;" class="changed" data-toggle="modal" data-target="#changedModal">修改归属</button>
						</td>
					</tr>`).appendTo("#tBody")
	$(".freezeBtns").on("click",function(){
	var fAccname=this.parentNode.parentNode.children[0]
	var fName=this.parentNode.parentNode.children[1]
	var fStatus=this.parentNode.parentNode.children[2]
	fAccname=$(fAccname).text()
	fName=$(fName).text()
	fStatus=$(fStatus).text()
 	if(fStatus=='正常')
	{
 		fStatus='2'
	}
	if (fStatus=="冻结") 
	{
		fStatus='1'
	}
	   $.ajax({
		type:"post",
		url:"/ssm/platform/updateStatus.action",
		data:{
			status:fStatus,
			accname:fAccname,
			name:fName
		},
		success:function(){
			if (flag==0) {
				findPage(currentPage)	
			}
			if(flag==1)
			{
				searchPage(account,accountName,status,currentPage)
			}
		}
	}) 

})
$(".delete").on("click",function(){
		var fAccname=this.parentNode.parentNode.children[0]
		var fName=this.parentNode.parentNode.children[1]
		var fStatus=this.parentNode.parentNode.children[2]
		fAccname=$(fAccname).text()
		fName=$(fName).text()
		fStatus=$(fStatus).text()
	 	if(fStatus=='正常')
		{
	 		fStatus='2'
		}
		if (fStatus=="冻结") 
		{
			fStatus='1'
		}
		   $.ajax({
			type:"post",
			url:"/ssm/platform/deletePlatform.action",
			data:{
				accname:fAccname,
				name:fName
			},
			success:function(){
				if (flag==0) {
					findPage(currentPage)	
				}
				if(flag==1)
				{
					searchPage(account,accountName,status,currentPage)
				}
			}
		})
	})
	$(".changed").on("click",function(){
		testIt=$(this.parentNode.parentNode.children[0]).text()
		testIs=$(this.parentNode.parentNode.children[1]).text()
	})
			}
		}
	}
	function searchPage(account,accountName,status,currentPage) {
		if (currentPage==(allPage-1)) {
			$("#num-hou").css("opacity","0.2")
			$("#num-hou").attr("disabled",true).css("pointer-events","none")
		}
		else{
			$("#num-hou").css("opacity","") 
			$("#num-hou").attr("disabled",false).css("pointer-events","auto")
		}
		if (currentPage==0) {
			$("#num-pre").css("opacity","0.2")
			$("#num-pre").attr("disabled",true).css("pointer-events","none"); 
		}
		else if(currentPage!=0){
			$("#num-pre").css("opacity","")
			$("#num-pre").attr("disabled",false).css("pointer-events","auto")
		}
		$.ajax({
			url:"/ssm/platform/searchPlatform.action",
			data:{
				accname:account,
				name:accountName,
				status:status,
				currentPage:currentPage,
				everyPageNum: 6
			},
			success:function(res){
				insertTab(res.data)
				allPage=res.allPage;
			}
		})
	}
	$(".freezeBtns").on("click",function(){
		var fAccname=this.parentNode.parentNode.children[0]
		var fName=this.parentNode.parentNode.children[1]
		var fStatus=this.parentNode.parentNode.children[2]
		fAccname=$(fAccname).text()
		fName=$(fName).text()
		fStatus=$(fStatus).text()
	 	if(fStatus=='正常')
		{
	 		fStatus='2'
		}
		if (fStatus=="冻结") 
		{
			fStatus='1'
		}
		   $.ajax({
			type:"post",
			url:"/ssm/platform/updateStatus.action",
			data:{
				status:fStatus,
				accname:fAccname,
				name:fName
			},
			success:function(){
				if (flag==0) {
					findPage(currentPage)	
				}
				if(flag==1)
				{
					searchPage(account,accountName,status,currentPage)
				}
			}
		}) 

	})
	
	$(".delete").on("click",function(){
		var fAccname=this.parentNode.parentNode.children[0]
		var fName=this.parentNode.parentNode.children[1]
		var fStatus=this.parentNode.parentNode.children[2]
		fAccname=$(fAccname).text()
		fName=$(fName).text()
		fStatus=$(fStatus).text()
	 	if(fStatus=='正常')
		{
	 		fStatus='2'
		}
		if (fStatus=="冻结") 
		{
			fStatus='1'
		}
		   $.ajax({
			type:"post",
			url:"/ssm/platform/deletePlatform.action",
			data:{
				accname:fAccname,
				name:fName
			},
			success:function(){
				if (flag==0) {
					findPage(currentPage)	
				}
				if(flag==1)
				{
					searchPage(account,accountName,status,currentPage)
				}
			}
		})
	})
	//changed修改归属按钮的类名    newName 模态框里的input框的class类名 	okBtn模态框里的确认按钮的类名
	$(".changed").on("click",function(){
		testIt=$(this.parentNode.parentNode.children[0]).text()
		testIs=$(this.parentNode.parentNode.children[1]).text()
	})
	$(".okBtn").on("click",function(){
		var newName=$(".newName").val()
		$.ajax({
			url:"/ssm/platform/updateName.action",
			type:"post",
			data:{
				newName: newName,
				accname:testIt,
				name:testIs
			},
		success:function(){
			$("#changedModal").modal('hide')
			alert("成功")
			if (flag==0) {
					findPage(currentPage)	
				}
				if(flag==1)
				{
					searchPage(account,accountName,status,currentPage)
				}
		}
		})
	})
		
</script>
</html>
