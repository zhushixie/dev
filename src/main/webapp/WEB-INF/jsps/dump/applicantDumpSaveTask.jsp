<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form class="form-horizontal" role="form" method="post"
		action="./userMana/update.do" id="form_edit">
		<div class="modal fade" id="replaceModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="margin-top: 60px;">
				<div class="modal-content">
					<div class="modal-header layui-bg-green">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="text-align: center">更换任务执行人</h4>
					</div>
					<div class="modal-body" style="margin-left: 30px;">
					<div class="form-group form-inline">
						<label>任务执行人：</label> 
						<select name="tDepositor" id="tDepositor">
						<option value='0'>请选择</option>
					    <c:forEach items="${checkList}" var="ele"> 
					    <option value="${ele.id}">${ele.name}</option>
					    </c:forEach>  
					</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="replaceSure btn btn-info"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<table class="layui-hide" id="task" lay-filter="task"></table>
		<script id="toolbar" type="text/html">
  	<div class="layui-btn-container">
    	<button class="layui-btn layui-btn-sm" lay-event="getCheckData">查看详情</button>
    	<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">批量删除</button>
    	<button class="layui-btn layui-btn-sm" lay-event="isAll">批量启动</button>
  	</div>
</script>
		<script id="barDemo" type="text/html">
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="stop">删除</a>
</script>
	<script>
	// 编辑信息的方法
	var replaceMan = null;
	function replaceDepositor(obj) {
		if (!obj.data.id) {
			alert("error");
		} else {
			$("#replaceModal").modal('show');
			replaceMan = obj;
		}
	}
	//提交表单的方法
	$(".replaceSure").click(function() {
		var tDepositor = $("#tDepositor").val();
		$.ajax({
			url : './routeMana/replaceDepositor.do?tDepositor='+tDepositor+'&id='+replaceMan.data.id,
			type : 'POST',
			success : function(data) {
				layer.msg("任务重新发布");
				replaceMan.del();
				location.reload();
			}
		});
	});
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#task'
    ,toolbar: '#toolbar'
    ,url:'./applicantDumpSaveTask/list.do'
    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
      //,curr: 5 //设定初始在第 5 页
      ,groups: 1 //只显示 1 个连续页码
      ,first: false //不显示首页
      ,last: false //不显示尾页
    }
    ,cols: [[
      {field:'id', width:100, title: '任务编号', sort: true}
      ,{field:'tname', width:300, title: '任务名称',sort: true}
      ,{field:'tdumptime', width:100, title: '发布时间', sort: true}
      ,{field:'tdevcode', title: '设备编号', minWidth: 100}
      ,{field:'tstate', title: '任务状态', minWidth: 100}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
    ]]
  });
  //头工具栏事件
  table.on('toolbar(task)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
    };
  });
  table.on('tool(task)', function(obj){
	    var data = obj.data;
		if(obj.event === 'stop'){
	      layer.confirm('真的要停止该任务么', function(index){
				$.ajax({
					url : './routeMana/operaTaskState.do?tType=stop&&id='+data.id,
					type : 'POST',
					success : function(data) {
						layer.msg("任务已经接受");
					    obj.del();
					}
				});
	      });
	    }else if(obj.event === 'replace'){
	    	replaceDepositor(obj);
	    }else if(obj.event === 'detail'){
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