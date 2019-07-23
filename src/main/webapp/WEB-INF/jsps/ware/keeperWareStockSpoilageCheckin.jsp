<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登记单</title>
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
</style>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./layui/layui.js"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-bg-green" style="height: 60px">
			<div style="text-align: center; font-size: 30px; padding-top: 20px">损耗登记</div>
		</div>
	</blockquote>
	<form class="layui-form" id="taskForm" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">名称</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">编号</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarterName" id="tStarter" required
					lay-verify="required" placeholder="编号" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">数量</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="数量" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="button" lay-submit lay-filter="saveDemo" class="layui-btn layui-btn-primary">保存</button>
				<button type="layui-btn"  id="resetForm"  class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(formDemo)', function(data) {
				$.ajax({
					url : './keeperWareStockSpoilageTask/startTask.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : $("#taskForm").serializeArray(),
					success : function(data) {
						alert("成功");
					},
					error : function() {
						alert("错误");
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});
			form.on('submit(saveDemo)', function(data) {
				$.ajax({
					url : './keeperWareStockSpoilageTask/saveTask.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : $("#taskForm").serializeArray(),
					success : function(data) {
						alert("成功");
					},
					error : function() {
						alert("错误");
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});
			$("#resetForm").on("click",function(){
				location.reload();
			});
		});
	</script>





</body>

</html>