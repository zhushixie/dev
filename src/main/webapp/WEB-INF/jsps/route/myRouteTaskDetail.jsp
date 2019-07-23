<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>任务详情</title>
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
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-bg-green" style="height: 60px">
			<div style="text-align: center; font-size: 30px; padding-top: 20px">任务</div>
		</div>
	</blockquote>
	<form class="layui-form" id="taskForm" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">任务名称</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required" value='${detail.TName}'
					placeholder="请输入任务标题" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">任务发布人</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="请输入标题" autocomplete="off"
					class="layui-input">
			</div>
		</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 100px">任务执行人</label>
				<div class="layui-input-block" style="width: 500px">
					<select name="tDepositor" id="tDepositor" value='${detail.tDepositorId}'>
						<option value='0'>请选择</option>
					    <c:forEach items="${checkList}" var="ele"> 
					    <option value="${ele.id}">${ele.name}</option>
					    </c:forEach>  
					</select>
				</div>
			</div>

		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label" style="width: 100px">任务详情</label>
			<div class="layui-input-block">
				<textarea name="tContent" id="tContent" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px">${detail.TContent}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="button" lay-submit lay-filter="saveDemo" class="layui-btn layui-btn-primary">保存</button>
			</div>
		</div>
	</form>
		<div class="layui-form-item layui-form-text" id="reject">
			<label class="layui-form-label" style="width: 100px">拒绝缘由</label>
			<div class="layui-input-block">
				<textarea name="tReason" id="tReason" placeholder="输入具体任务内容" class="layui-textarea"
					style="height: 300px">${detail.TReason}</textarea>
			</div>
		</div>
<script type="text/javascript">
	//InitRouteExecutor();
	$("#tStarter").val("${sessionScope.user}");
	$("#tStarter").attr("readonly", "readonly");
	if('${editAll}'=='false'){
		$("#tStarter").attr("readonly", "readonly");
		$("#tDepositor").attr("readonly", "readonly");
		$("#tName").attr("readonly", "readonly");
		$("#tContent").attr("readonly", "readonly");
		$("button[lay-submit]").attr("hidden", "");
		$("#reject").removeAttr("hidden");
		$("#tReason").attr("readonly", "readonly");
	}else{
		$("#reject").attr("hidden", "");
	}
	var id = ${detail.id};
	$("option[value='${detail.tDepositorId}']").attr("selected","");
	layui.use('form', function() {
		var form = layui.form;
			//监听提交
		form.on('submit(formDemo)', function(data) {
			$.ajax({
				url : './routeMana/submitTaskDetail.do?id='+id,
				type : 'POST',
				dateType : 'json',
				contentType : 'application/x-www-form-urlencoded',
				data : $("#taskForm").serializeArray(),
				success : function(data) {
					alert("成功");
					parent.location.reload();
				},
				error : function() {
					alert("错误");
				}
			});
			return false;
			
		});
		form.on('submit(saveDemo)', function(data) {
			$.ajax({
				url : './routeMana/updateTaskDetail.do?id='+id,
				type : 'POST',
				dateType : 'json',
				contentType : 'application/x-www-form-urlencoded',
				data : $("#taskForm").serializeArray(),
				success : function(data) {
					parent.location.reload();
				},
				error : function() {
					alert("错误");
				}
			});
			layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
</script>





</body>

</html>