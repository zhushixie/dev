<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>采购单</title>
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
			<div style="text-align: center; font-size: 30px; padding-top: 20px">采购任务详情</div>
		</div>
	</blockquote>
	<form class="layui-form" id="taskForm" method="post">
		<div class="layui-form-item" hidden>
			<label class="layui-form-label" style="width: 100px">任务名称</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="id" required lay-verify="required"
					placeholder="请输入任务标题" autocomplete="off" class="layui-input" value="${task.id}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">任务名称</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="请输入任务标题" autocomplete="off" class="layui-input" value="${task.TName}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">采购人</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarterName" id="tStarter" required
					lay-verify="required" placeholder="请输入标题" autocomplete="off"
					class="layui-input" value="${task.tStarterName}">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label" style="width: 100px">采购详情</label>
			<div class="layui-input-block">
				<textarea name="tContent" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px">${task.TContent}</textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text" id="apply1">
			<label class="layui-form-label" style="width: 100px">主管回复意见</label>
			<div class="layui-input-block">
				<textarea id="tReason1" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px">${task.tReasonf}</textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text" id="apply2">
			<label class="layui-form-label" style="width: 100px">经理回复意见</label>
			<div class="layui-input-block">
				<textarea id="tReason2" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px">${task.tReasons}</textarea>
			</div>
		</div>
				<div class="layui-form-item layui-form-text" id="apply3">
			<label class="layui-form-label" style="width: 100px">验收回复意见</label>
			<div class="layui-input-block">
				<textarea id="tReason3" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px">${task.tReasont}</textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text" id="applying">
			<label class="layui-form-label" style="width: 100px">我的意见</label>
			<div class="layui-input-block">
				<textarea id="tReason" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button id="agree" class="layui-btn" lay-submit lay-filter="agree">同意</button>
				<button id="disagree" class="layui-btn" lay-submit lay-filter="disagree">不同意</button>
			</div>
		</div>
	</form>
<script type="text/javascript">
var state = "${task.TState}";
if(state=='start'){
	$("#apply1").attr("hidden", "");
	$("#apply2").attr("hidden", "");
	$("#apply3").attr("hidden", "");
}else if(state=='apply'){
	$("#apply2").attr("hidden", "");
	$("#apply3").attr("hidden", "");
}else if(state=='agree'){
	$("#apply3").attr("hidden", "");
}
	
</script>
	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(agree)', function(data) {
				var wareView = {};
				wareView.tView = $('#tReason').val();
				wareView.tTaskid = '${task.id}';
				wareView.act = 'agree';
				$.ajax({
					url : './managerWareInTask/taskOperate.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : wareView,
					success : function(data) {
						layer.msg(data,{icon:1},function(){
			                parent.location.reload(); // 父页面刷新
			                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			                parent.layer.close(index);
			            });

					},
					error : function() {
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});
			form.on('submit(disagree)', function(data) {
				var wareView = {};
				wareView.tView = $('#tReason').val();
				wareView.tTaskid = '${task.id}';
				wareView.act = 'disagree';
				$.ajax({
					url : './managerWareInTask/taskOperate.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : wareView,
					success : function(data) {
						layer.msg(data,{icon:1},function(){
			                parent.location.reload(); // 父页面刷新
			                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			                parent.layer.close(index);
			            });

					},
					error : function() {
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});

		});
	</script>





</body>

</html>