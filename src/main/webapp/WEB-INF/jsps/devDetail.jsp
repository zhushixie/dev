<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设备检查</title>
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
			<div style="text-align: center; font-size: 30px; padding-top: 20px">设备检查</div>
		</div>
	</blockquote>
	<form class="layui-form" id="taskForm" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">设备名称:</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="请输入任务标题" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">编码:</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tCode" id="tCode" required
					lay-verify="required" placeholder="请输入标题" autocomplete="off"
					class="layui-input">
			</div>
		</div>
				<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">巡检人:</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tChecker" id="tChecker" required
					lay-verify="required" placeholder="请输入标题" autocomplete="off"
					class="layui-input">
			</div>
		</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 100px">设备运行状况</label>
				<div class="layui-input-block" style="width: 500px">
					<select name="tType" id="tType">
						<option value='0'>正常</option>
						<option value='1'>故障</option>
						<option value='2'>保养</option>
					</select>
				</div>
			</div>

		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label" style="width: 100px">设备详情</label>
			<div class="layui-input-block">
				<textarea name="tContent" id="tContent" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="layui-btn"  id="resetForm"  class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	//InitRouteExecutor();
	$("#tChecker").val("${sessionScope.user}");
	$("#tChecker").attr("readonly", "readonly");
		layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(formDemo)', function(data) {
				$.ajax({
					url : './routeMana/myCheckDev.do',
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