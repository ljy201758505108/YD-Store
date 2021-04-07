<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ssm/public/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont2.css">
<script src="/ssm/public/js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
<style type="text/css">
	.head{
			margin-top: 10px;
			margin-bottom:120px;
			height: 30px;
			line-height: 30px;
		}
		.head span{
			font-family: "microsoft yahei";
			font-weight: bold;
		}
		.div-btn{
			color: white;
			overflow: hidden;
			
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
		.td{
			width:220px;
		
		}


</style>
</head>
<body>

	<div class="head container-fluid">
			<div class="row">
				<div class="col-md-4 col-xs-4">
					<span>手机号</span>
					<input type="text" name="" id="tel" value=""  placeholder="手机号"/>
				</div>
				<div class="col-md-6 col-xs-4">
					<span>商家姓名</span>
					<input type="text" name="" id="bname" value=""  placeholder="商家姓名"/>
					
					<div class="div-btn">
						<button type="button" class="head-btn" id="search"><span>查询</span></button>
					</div>
				</div>
				
			</div>
			
			
			
			
		</div>
		
		
		

	<div class="content-tab" style="margin-left:40px;">
			<table class="table table-striped content-tab">
				<thead>
				      <tr>
				         <th>姓名</th>
				         <th>手机号</th>
				         <th>邮箱</th>
				         <th>身份证号</th>
				         <th>操作</th>
				      </tr>
				</thead>	
				   <tbody id="tBody" class="tBody1">
				    <c:forEach items="${businessList.data}" var="item">
				        <tr id="dTl">
							<td  class="td">${item.bname}</td>
							<td  class="td">${item.tel}</td>
				        	<td  class="td">${item.email}</td>
				        	<td  class="td" id="idcardHide">${item.idcard}</td>
				        	<td>
				        		<button type="button" style="background-color: deepskyblue; border: 1px solid skyblue; color: white; border-radius: 5px;" class="freezeBtns">查询店铺</button>
				        	</td>
				        </tr>
				     </c:forEach>
				  </tbody>    
			</table>
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
				 <c:forEach var="x" begin="1" end="${businessList.getAllPage()}">
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
		
		<script type="text/javascript">
			
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
					searchPage(tel,bname,currentPage)
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
					searchPage(tel,bname,currentPage)
			})
			var onLise=document.querySelectorAll(".onLise")
		 	for(let i=0;i<onLise.length;i++)
				{
					$(onLise[i]).on("click",function(){
						currentPage=i
						if(flag==0)
							findPage(currentPage)
						if(flag==1)
							searchPage(tel,bname,currentPage)
							
					})
				}
			
			//寻找当前页数所对应的表格
			function findPage(currentPage) {
				var	allPage=${businessList.getAllPage()}
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
					url: '/ssm/platform/findBusinessByPage.action',
					data: {
						currentPage: currentPage,
						everyPageNum: 6
					},
					success: function (res) {
						insertTab(res.data)
					}
				})
			}
			
			/* 账户：account 使用人：accountName 在线：onLine 离线：outLine*/
			 $("#search").on("click",function(){
				flag=1
				currentPage=0;
				tel=$("#tel").val()
				bname=$("#bname").val()
				currentPage=0
				searchPage(tel,bname,currentPage)
			})
			 
			//每次插入新表格的方法
			function insertTab(newTab) {
				for (let i=0;i<6;i++)
				{
					 var dTl=$("#dTl")
					 dTl.remove()
				}
				
				 
				for(let i=0;i<newTab.length;i++)
					{
						$(`
								<tr id="dTl">
								<td>`+newTab[i].bname+`</td>
								<td>`+newTab[i].tel+`</td>
								<td  class="td">`+newTab[i].email+`</td>
					        	<td  class="td" id="idcardHide">`+newTab[i].idcard+`</td>
								<td>
									<button type="button" style="background-color: deepskyblue; border: 1px solid skyblue; color: white; border-radius: 5px;" class="freezeBtns">查询店铺</button>
								</td>
							</tr>`).appendTo("#tBody")
			
			//点击店铺查询
			$(".changed").on("click",function(){
				alert("11111");
			})
					
				}
			}
			
			//模糊查询
			function searchPage(tel,bname,currentPage) {
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
					url:"/ssm/platform/searchBusiness.action",
					data:{
						tel:tel,
						bname:bname,
						currentPage:currentPage,
						everyPageNum: 6
					},
					success:function(res){
						insertTab(res.data)
						allPage=res.allPage
						
					}
				})
			}
			
		
		</script>

</body>
</html>