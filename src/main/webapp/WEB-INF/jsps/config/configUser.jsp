<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<style type="text/css">
.navi {
	height: 60px;
	top: 5px;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

.layui-btn {
	margin-top: 15px;
	margin-bottom: 10px;
	margin-left: 10px;
}

.btnPos {
	margin-left: 50px;
}

#tablePos {
	margin-left: 20px;
	margin-right: 20px;
}
</style>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="./layui/css/layui.css"/>
<script src="./layui/layui.js"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<form class="layui-form form" action="" method="get">
			<div class="layui-inline" style="margin-left: 100px">
				<a class="layui-btn modal-iframe" onclick="add()">添加</a>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input type="text" value="" name="keyword" placeholder="用户名称"
						class="layui-input search_input">
				</div>
				<button lay-submit class="layui-btn" lay-filter="search">查找</button>
			</div>
			<div class="layui-inline" style="margin-left: 20px">
				<a class="layui-btn modal-iframe" onclick="modifyPwd()">密码修改</a>
			</div>
			<div class="layui-inline" style="margin-left: 20px">
				<a class="layui-btn modal-iframe" onclick="refreshData()">刷新</a>
			</div>
		</form>
	</blockquote>
	<table class="layui-table" lay-filter="demo">
		<thead>
			<tr>
				<th lay-data="{type: 'checkbox', fixed: 'left'}"></th>
				<th lay-data="{field:'id',width:80}" style="text-align: center">序号</th>
				<th lay-data="{field:'name',width:120, sort: true, edit: 'text'}"
					style="text-align: center">用户</th>
				<th lay-data="{field:'phone',width:120}" style="text-align: center">电话</th>
				<th lay-data="{field:'sex',width:80, edit: 'text'}"
					style="text-align: center">性别</th>
				<th lay-data="{field:'born',width:120}" style="text-align: center">生日</th>
				<th lay-data="{field:'addr',width:160}" style="text-align: center">地址</th>
				<th lay-data="{field:'deptId',width:120}" style="text-align: center">部门</th>
				<th lay-data="{field:'caozuo'}" style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	<div id="page1"></div>


	<!-- 删除的模态框 -->
	<div class="modal fade" id="trashModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 模糊框头部 -->
				<div class="modal-header layui-bg-red">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="text-align: center">警告！</h4>
				</div>
				<!-- 模糊框主体 -->
				<div class="modal-body">
					<strong>你确定要删除吗？</strong>
				</div>
				<!-- 模糊框底部 -->
				<div class="modal-footer">
					<button type="button" class="delSure btn btn-info"
						data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 编辑的模态框 -->
	<form class="form-horizontal" role="form" method="post"
		action="./userMana/update.do" id="form_edit">
		<div class="modal fade" id="editModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="margin-top: 60px;">
				<div class="modal-content">
					<div class="modal-header layui-bg-green">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="text-align: center">更改用户信息</h4>
					</div>
					<div class="modal-body" style="margin-left: 30px;">
						<input name="id" id="id" hidden="hidden" />
						<div class="form-group form-inline"
							style="float: left; margin-right: 10px">
							<label>姓名：</label> <input type="text" name="name"
								class="form-control" id="name" />
						</div>
						<div class="form-group form-inline">
							<label>电话：</label> <input type="text" name="phone"
								class="form-control" id="phone" />
						</div>
						<div class="form-group form-inline"
							style="float: left; margin-right: 10px">
							<label>性别：</label> <input type="text" name="sex"
								class="form-control" id="sex" />
						</div>
						<div class="form-group form-inline">
							<label>地址：</label> <input type="text" name="addr"
								class="form-control" id="addr" />
						</div>
						<div class="form-group form-inline">
							<label>生日：</label> <input type="text" class="layui-input"
								name="born" style="width: 60%; display: inline-block"
								class="form-control" id="born" />
						</div>
						<div class="form-group form-inline">
							<label>部门：</label> 
									<select name="deptId" id="deptIdEdit" style="width:300px;height:40px">
									</select>



						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="editSure btn btn-info"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 角色设置 -->
	<form class="form-horizontal" role="form" method="post"
		action="./userMana/update.do" id="form_edit">
		<div class="modal fade" id="roleSettings" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="margin-left: 50px; width: 950px">
				<div class="modal-content">
					<div class="modal-header layui-bg-green">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="text-align: center">设置用户角色</h4>
					</div>
					<div class="modal-body" style="margin-left: 30px;">
						<input name="id" id="id" hidden="hidden" />
						<div>
							<table class="layui-hidden" id="treeTable" lay-filter="treeTable"
								style="height: 50px"></table>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="editSure btn btn-info"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 添加用户模态框 -->
	<form class="form-horizontal" role="form" method="post"
		action="./userMana/add.do" id="form_add">
		<div class="modal fade" id="addModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header layui-bg-green">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="text-align: center">添加用户</h4>
					</div>
					<div class="modal-body" style="margin-left: 30px;">
						<input name="id" id="id" hidden="hidden" />
						<div class="form-group form-inline"
							style="float: left; margin-right: 10px">
							<label>姓名：</label> <input type="text" name="name"
								class="form-control" id="name" />
						</div>
						<div class="form-group form-inline">
							<label>电话：</label> <input type="text" name="phone"
								class="form-control" id="phone" />
						</div>
						<div class="form-group form-inline"
							style="float: left; margin-right: 10px">
							<label>性别：</label> <input type="text" name="sex"
								class="form-control" id="sex" />
						</div>
						<div class="form-group form-inline">
							<label>地址：</label> <input type="text" name="addr"
								class="form-control" id="addr" />
						</div>
						<div class="form-group form-inline">
							<label>生日：</label> <input type="text" class="layui-input"
								name="born" style="width: 60%; display: inline-block"
								class="form-control" id="born_add" />
						</div>
						<div class="form-group form-inline">
							<label>密码：</label> <input type="text" name="pwd"
								class="form-control" id="pwd" />
						</div>
						<div class="form-group form-inline">
							<label>部门：</label> 
									<select name="deptId" id="deptIdAdd" style="width:300px;height:40px">
									</select>
						</div>

					</div>
					<div class="modal-footer" style="margin-bottom: 10px">
						<button type="button" class="addSure btn btn-info"
							data-dismiss="modal">添加</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
<script type="text/javascript">
function modifyPwd(){
	
}

//初始化用户部门列表
function InitDepart(){
	//$('#deptId').remove();//清空select列表数据
	$.ajax({
		type : 'POST',
		url : './deptMana/listName.do',
		dataType : 'JSON',
		data : {},
		success : function(msg) {
			$('#deptIdAdd').empty();//清空select列表数据
			$('#deptIdEdit').empty();//清空select列表数据
			$("#deptIdAdd").prepend("<option value='0'>请选择</option>");//添加第一个option值
			$("#deptIdEdit").prepend("<option value='0'>请选择</option>");//添加第一个option值
			for (var i = 0; i < msg.list.length; i++) {
				$("#deptIdAdd").append("<option value='"+msg.list[i].id+"'>"+msg.list[i].name+"</option>");
				$("#deptIdEdit").append("<option value='"+msg.list[i].id+"'>"+msg.list[i].name+"</option>");
			}
		},
  		error:function(){
			alertLayer("获取数据失败","error");
		}
	});
}






	var editObj = null, ptable = null, treeGrid = null, tableId = 'treeTable', layer = null;
	layui.config({
		base : 'layui/extend/'
	}).extend({
		treeGrid : 'treeGrid'
	});

	//初始化日期组件
	layui.use('laydate', function() {
		var laydate = layui.laydate;

		//执行一个laydate实例,渲染多个日期实例
		laydate.render({
			elem : '#born' //指定元素
		});
		laydate.render({
			elem : '#born_add' //指定元素
		});
	});
	$(function() {
		initLayPage();
		InitDepart();
	});

	/**
	 * 初始化layui分页
	 */
	function initLayPage(pageConf) {
		if (!pageConf) {
			pageConf = {};
			pageConf.pageSize = 6;
			pageConf.page = 1;

		}
		$.post("./userMana/list", pageConf, function(data) {
			layui.use([ 'laypage', 'layer' ], function() {
				var page = layui.laypage;
				page
						.render({
							elem : 'page1',
							count : data.total,
							curr : pageConf.page,
							limit : pageConf.pageSize,
							limits : [ 2, 4, 6, 8, 10, 12, 16, 20 ],
							first : "首页",
							last : "尾页",
							layout : [ 'count', 'prev', 'page', 'next',
									'limit', 'skip' ],
							jump : function(obj, first) {
								if (!first) {
									pageConf.page = obj.curr;
									pageConf.pageSize = obj.limit;
									initLayPage(pageConf);
								}
							}
						});
				fillTable(data.rows, (pageConf.page - 1) * pageConf.pageSize); //页面填充

			})

			$('.layui-btn.layui-btn-mini').click(function() {
				alert("测试");
			});
		});

	}

	//填充表格数据
	function fillTable(dataList, num) {
		var info = '';
		$
				.each(
						dataList,
						function(index, obj) {
							// id 很多时候并不是连续的，如果为了显示比较连续的记录数，可以这样根据当前页和每页条数动态的计算记录序号
							index = index + num + 1;
							info += '<tr style="height:40px"><td style="text-align:center"><input type="checkbox" name="id" value='+obj.id+' lay-skin="primary" ></td>'
									+ '<td>'
									+ obj.id
									+ '</td><td>'
									+ obj.name
									+ '</td><td>'
									+ obj.phone
									+ '</td>'
									+ '</td><td>'
									+ obj.sex
									+ '</td>'
									+ '</td><td>'
									+ obj.born
									+ '</td>'
									+ '</td><td>'
									+ obj.addr
									+ '</td>'
									+ '</td><td>'
									+ obj.deptName
									+ '</td>'
									+ '<td style="padding-top:1px;padding-bottom:1px" align="left">'
									+ '<a class="layui-btn layui-btn-mini" style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px;" onclick="edit('
									+ obj.id
									+ ')"><i class="iconfont icon-edit"></i> 编辑</a>'
									+ '<a class="layui-btn layui-btn-danger layui-btn-mini" style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" onclick="trash('
									+ obj.id
									+ ')" ><i class="layui-icon">&#xe640;</i> 删除</a>'
									+ '<a class="layui-btn layui-btn-mini" style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" onclick="selectRole('
									+ obj.id
									+ ')"><i class="iconfont icon-edit"></i>选择角色</a>'
									+ '</td></tr>';
						});
		$("#tbody").html(info);
		tableTest();
	}
	//用户密码修改
	
	//添加用户界面
	function add() {
		$(".addSure").click(function() {
			$.ajax({
				url : './userMana/add.do',
				type : 'POST',
				dateType : 'json',
				contentType : 'application/x-www-form-urlencoded',
				data : $("#form_add").serializeArray(),
				success : function(data) {
					alert("成功");
					initLayPage(pageConf);
				},
				error : function() {
					alert("错误");
				}
			});
		});
		$("#addModal").modal('show');
	}

	// 编辑信息的方法
	function selectRole(id) {
		if (!id) {
			alert("error");
		} else {
		    layui.use('layer', function(){
		    	  var layer = layui.layer;
		    	  layer.open({
		    		  type: 2,
		    		  skin: 'layui-layer-lan',
		    		  area: ['600px', '600px'],
		    		  title:['选择角色','background:0x889600'],
		    		  fixed: false, //不固定
		    		  maxmin: true,
		    		  resize:true,
		    		  content: './selectRole.do?id='+id
		    		});
		    	});
		}
	}

	function trash(id) {

		if (!id) {
			alert("error");
		} else {
			$(".delSure").click(function() {
				$.ajax({
					url : './userMana/delete.do?id=' + id,
					type : 'POST',
					success : function(data) {
						initLayPage(pageConf);
					}
				});
			});
			$("#trashModal").modal('show');
		}
	}
	// 编辑信息的方法
	function edit(id) {
		if (!id) {
			alert("error");
		} else {
			// 先去查询数据
			$.ajax({
				url : './userMana/findById.do',
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				data : JSON.stringify({
					id : id
				}),
				success : function(res) {
					$("#id").val(res.id);
					$("#name").val(res.name);
					$("#phone").val(res.phone);
					$("#addr").val(res.addr);
					$("#born").val(res.born);
					$("#sex").val(res.sex);
					if(res.deptName!=null){
						$("#deptIdEdit").val(res.deptId);
					}else{
						$("#deptIdEdit").val("0");
					}
					$("#editModal").modal('show');
				},
				error : function() {
					alert("错误");
				}
			});
		}
	}
	//提交表单的方法
	$(".editSure").click(function() {
		$.ajax({
			url : './userMana/editUser.do',
			type : 'POST',
			dateType : 'json',
			contentType : 'application/x-www-form-urlencoded',
			data : $("#form_edit").serializeArray(),
			success : function(data) {
				layer.msg("更新成功");
				refreshData();
			},
			error : function() {
				layer.msg("更新失败");
			}
		});
	});
	function refreshData() {
		initLayPage();
	}
	function tableTest() {
		layui.use('table', function() {

			var table = layui.table;
			//转换静态表格
			table.init('demo', {
				height : 450 //设置高度
				,
				limit : 20
			//注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
			//支持所有基础参数
			});
		});
	}
</script>
</html>