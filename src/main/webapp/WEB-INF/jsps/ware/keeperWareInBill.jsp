<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>入库管理-仓管员</title>
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
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./layui/layui.js"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
</head>
<body>
<blockquote class="layui-elem-quote news_search">
		<div class="layui-bg-green" style="height: 60px">
			<div style="text-align: center; font-size: 30px; padding-top: 20px">入库单</div>
		</div>
	</blockquote>
	<form class="layui-form" id="taskForm" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">名称</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="零配件名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">编码</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tCode" required lay-verify="required"
					placeholder="编码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">数量</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tCount" id="tCount" required
					lay-verify="required" placeholder="数量" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label" style="width: 100px">描述</label>
			<div class="layui-input-block">
				<textarea name="tDescript" placeholder="介绍关于该零配件" class="layui-textarea"
					style="height: 300px"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button id="okSure"  class="layui-btn" lay-submit lay-filter="okSure">入库</button>
				<button id="quitSure" class="layui-btn" lay-submit lay-filter="cancelSure">取消</button>
			</div>
		</div>
	</form>
<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(okSure)', function(data) {
				$.ajax({
					url : './keeperWareInBill/submitBill.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : $("#taskForm").serializeArray(),
					success : function(data) {
						alert("成功");
						location.reload();
					},
					error : function() {
						alert("错误");
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});
			form.on('submit(cancelSure)', function(data) {
				layer.msg(JSON.stringify(data.field));
				location.reload();
				return false;
			});
		});
	</script>
</body>
	
</html>