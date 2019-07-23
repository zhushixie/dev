<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的任务</title>
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
	<div class="layui-bg-green" style="height:60px">
	<div style="text-align:center;font-size:30px;padding-top:20px;float:left">我的任务</div>
	<div style="float:right;font-size:30px;"><button  id="refresh" class="layui-btn layui-bg-cyan" data-type="reload" style="font-size:30px;">刷新</button></div>
	</div>
	</blockquote>
		<form class="form-horizontal" role="form" method="post"
		action="./userMana/update.do" id="form_edit">
		<div class="modal fade" id="rejectModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="margin-top: 60px;">
				<div class="modal-content">
					<div class="modal-header layui-bg-green">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="text-align: center">任务拒绝</h4>
					</div>
					<div class="modal-body" style="margin-left: 30px;">
							<div class="layui-form-item layui-form-text" id="reject">
			<label class="layui-form-label" style="width: 100px">拒绝缘由:</label>
			<div class="layui-input-block">
				<textarea name="tReason" id="tReason" placeholder="拒绝缘由" class="layui-textarea"
					style="height: 300px"></textarea>
			</div>
		</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="rejectSure btn btn-info"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<table class="layui-hide" id="task" lay-filter="task"></table>
		<script id="barDemo" type="text/html">
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-xs" lay-event="accept">接受</a>
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="reject">拒绝</a>
</script>
	<script>
	// 编辑信息的方法
	var rejectTask = null;
	function reject(obj) {
		if (!obj.data.id) {
			alert("error");
		} else {
			$("#rejectModal").modal('show');
			rejectTask = obj;
		}
	}
	//提交表单的方法
	$(".rejectSure").click(function() {
		var tReason = $("#tReason").val();
		$.ajax({
			url : './routeMana/submitRouteReason.do?tReason='+tReason+'&id='+rejectTask.data.id,
			type : 'POST',
			success : function(data) {
				layer.msg("任务已经拒绝");
				rejectTask.del();
			}
		});
	});
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#task'
    ,url:'./myRouteTask/list'
    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
      //,curr: 5 //设定初始在第 5 页
      ,groups: 1 //只显示 1 个连续页码
      ,first: false //不显示首页
      ,last: false //不显示尾页
      
    }
    ,cols: [[
      {field:'id', width:100, title: '任务编号', sort: true}
      ,{field:'tname', width:200, title: '任务名称',sort: true}
      ,{field:'ttime', width:100, title: '发布时间', sort: true}
      ,{field:'tstarter', width:100, title: '发布人',sort: true}
      ,{field:'tdepositor', width:100, title: '委托人',sort: true}
      ,{field:'tphone', title: '联系方式', minWidth: 100}
      ,{field:'ttype', title: '任务状态', minWidth: 100}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
    ]]
    
  });
  table.on('tool(task)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'accept'){
	      layer.msg('ID：'+ data.id + ' 的查看操作');
			$.ajax({
				url : './routeMana/operaTaskState.do?tType=accept&&id='+data.id,
				type : 'POST',
				success : function(data) {
					layer.msg("任务已经接受");
				    obj.del();
				}
			});
	    } else if(obj.event === 'reject'){
	    	  	reject(obj);
	    	  	
	    } else if(obj.event === 'detail'){
	      //layer.alert('编辑行：<br>'+ JSON.stringify(data))
		    layui.use('layer', function(){
		    	  var layer = layui.layer;
		    	  layer.open({
		    		  type: 2,
		    		  skin: 'layui-layer-lan',
		    		  area: ['600px', '600px'],
		    		  title:['查看详情','background:0x889600'],
		    		  fixed: false, //不固定
		    		  maxmin: true,
		    		  resize:true,
		    		  content: './taskDetail.do?id='+data.id
		    		});
		    	});
	    }
});
});
$("#refresh").on("click",function(){
	location.reload();
});
</script>
	</body>
	
</html>