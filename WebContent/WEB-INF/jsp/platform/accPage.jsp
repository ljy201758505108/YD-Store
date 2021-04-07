<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="/ssm/public/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/ssm/public/css/iconfont.css"/>
		<script src="/ssm/public/js/jquery-1.12.4.js"></script>
		<script src="/ssm/public/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		
		
		<style type="text/css">
			*{
				font-family: 宋体;
				font-size: 15px;
			}
			
			.a2{
				height: fit-content;
				width: 80%;
				margin: 0 auto;
			}
			.a22{
				height: fit-content;
				width: 80%;
				margin: 0 auto;
			}
			td{
				width: 40px;
			}
			.a2 button{
				border-radius: 3px;
			}
			.title{
				padding: 30px 0 ;
			}
			.title button{
				margin: 10px 5px;
				border-radius: 3px;
			}
			.user{
				margin: 12px 0;
			}
			.user input{
				height: 36px;
				border: 1px solid lightgrey;
				border-radius: 3px;
			}
		</style>
</head>
<body>
<div class="a22">
			<div class="row title">
				<div class="col-md-4 user">
					<label>账号</label>
					<input type="text" placeholder="账号">
				</div>
				<div class="col-md-4 user">
					<label>使用人</label>
					<input type="text" placeholder="使用人">
				</div>
				<div class="col-md-4 form-inline user">
						<label>状态</label>
						<select class="form-control">
						  <option>==请选择==</option>
						  <option>冻结</option>
						  <option>删除</option>
						  <option>修改归属</option>
						</select>
					
				</div>
				<button type="button" class="btn-primary">创建管理员账号</button>
				<button type="button" class="btn-primary">查询</button>
			</div>
		</div>
		<div class="a2">
			<!-- Tab panes -->
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="home1">
				  <table class="table table-striped">
					  <tr>
						  <td>账号</td>
						  <td>使用人</td>
						  <td>状态</td>
						  <td>操作</td>
					  </tr>
					  <tr>
						  <td>admin</td>
						  <td>管理员</td>
						  <td>正常</td>
						  <td>
							  <button class="btn-info">冻结</button>
							  <button class="btn-danger">删除</button>
							  <button class="btn-success" data-toggle="modal" data-target="#myModal">修改归属</button>
							  <!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
								      </div>
								      <div class="modal-body">
								        ...
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								        <button type="button" class="btn btn-primary">Save changes</button>
								      </div>
								    </div>
								  </div>
								</div>
						  </td>
					  </tr>
					  <tr>
									  <td>0001</td>
									  <td>张三</td>
									  <td>正常</td>
									  <td>
										  <button class="btn-info">冻结</button>
										  <button class="btn-danger">删除</button>
										  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
									  </td>
					  </tr>
					  
			
			</table>
			</div>
			  <div role="tabpanel" class="tab-pane" id="home2">
				  <table class="table table-striped">
				  		  <tr>
				  			  <td>账号</td>
				  			  <td>使用人</td>
				  			  <td>状态</td>
				  			  <td>操作</td>
				  		  </tr>
				  		  <tr>
				  						  <td>0004</td>
				  						  <td>李四</td>
				  						  <td>正常</td>
				  						  <td>
				  							  <button class="btn-info">冻结</button>
				  							  <button class="btn-danger">删除</button>
				  							  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
				  						  </td>
				  		  </tr>
				  		  <tr>
				  			  <td>0009</td>
				  			  <td>王五</td>
				  			  <td>冻结</td>
				  			  <td>
				  				  <button class="btn-info">冻结</button>
				  				  <button class="btn-danger">删除</button>
				  				  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
				  			  </td>
				  		  </tr>
				  
				  </table>
			  </div>
			  <div role="tabpanel" class="tab-pane" id="home3">
				  <table class="table table-striped">
				  		  <tr>
				  			  <td>账号</td>
				  			  <td>使用人</td>
				  			  <td>状态</td>
				  			  <td>操作</td>
				  		  </tr>
				  		  
				  		  <tr>
				  		  				  			  <td>5555</td>
				  		  				  			  <td>广东</td>
				  		  				  			  <td>冻结</td>
				  		  				  			  <td>
				  		  				  				  <button class="btn-info">冻结</button>
				  		  				  				  <button class="btn-danger">删除</button>
				  		  				  				  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
				  		  				  			  </td>
				  		  </tr>
				  		  <tr>
				  			  <td>0779</td>
				  			  <td>王五</td>
				  			  <td>冻结</td>
				  			  <td>
				  				  <button class="btn-info">冻结</button>
				  				  <button class="btn-danger">删除</button>
				  				  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
				  			  
							  </td>
				  		  </tr>
				  </table>
			  </div>
			  <div role="tabpanel" class="tab-pane" id="home4">
				  <table class="table table-striped">
				  		  <tr>
				  			  <td>账号</td>
				  			  <td>使用人</td>
				  			  <td>状态</td>
				  			  <td>操作</td>
				  		  </tr>
				  		  <tr>
				  			  <td>0000</td>
				  			  <td>AAA</td>
				  			  <td>正常</td>
				  			  <td>
				  				  <button class="btn-info">冻结</button>
				  				  <button class="btn-danger">删除</button>
				  				  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
								  
									
							  </td>
				  		  </tr>
				  		  <tr>
				  						  <td>0077</td>
				  						  <td></td>
				  						  <td>正常</td>
				  						  <td>
				  							  <button class="btn-info">冻结</button>
				  							  <button class="btn-danger">删除</button>
				  							  <button class="btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">修改归属</button>
				  						  </td>
				  		  </tr>
				  		  
				  
				  </table>
			  </div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-8">
			</div>
			<div class="col-md-4 fenye">
				<div>
				
				  <!-- Nav tabs -->
				  <nav aria-label="Page navigation">
				    <ul class="pagination">
				      <li>
				        <a href="#" aria-label="Previous">
				          <span aria-hidden="true">&laquo;</span>
				        </a>
				      </li>
				      <li class="active"><a href="#home1" data-toggle = "tab">1</a></li>
				      <li><a href="#home2" data-toggle = "tab">2</a></li>
					  <li><a href="#home3" data-toggle = "tab">3</a></li>
					  <li><a href="#home4" data-toggle = "tab">4</a></li>
						
				      <li>
				        <a href="#" aria-label="Next">
				          <span aria-hidden="true">&raquo;</span>
				        </a>
				      </li>
				    </ul>
				  </nav>
				
				</div>
			</div>
		</div>
		
</body>

<script type="text/javascript">
		var act = document.querySelectorAll(".fenye li");
		var pal = document.querySelectorAll(".tab-content>.tab-pane")
		//console.log(pal);
		act[0].onclick = function(){
			for(var i=1;i<pal.length;i++){
				if($(pal[i]).hasClass("active")){
					var last = act[i].parentNode.children;
					$(pal[i-1]).addClass('active').siblings().removeClass('active');
					$(last[i]).addClass('active').siblings().removeClass('active');
				}
			}
		}
		act[5].onclick = function(){
			for(var i=0;i<pal.length-1;i++){
				if($(pal[i]).hasClass("active")){
					var next = act[i].parentNode.children;
					$(pal[i+1]).addClass('active').siblings().removeClass('active');
					$(next[i+2]).addClass('active').siblings().removeClass('active');
					return
				}
			}
		}
	
		
	</script>
</html>