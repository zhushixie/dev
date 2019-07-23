<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已保存的任务</title>
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
	<div style="text-align:center;font-size:30px;padding-top:20px;float:left">已保存的任务</div>
	<div style="float:right;font-size:30px;"><button id="refresh" class="layui-btn layui-bg-cyan" data-type="reload" style="font-size:30px;">刷新</button></div>
	</div>
	</blockquote>
	<table class="layui-hide" id="task" lay-filter="task"></table>
	<script id="barDemo" type="text/html">
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
  <a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#task'
    ,url:'./adminRouteSaveTask/list.do'
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
      ,{field:'ttime', width:100, title: '发布时间', sort: true}
      ,{field:'tstarter', width:100, title: '发布人',sort: true}
      ,{field:'tdepositor', width:100, title: '委托人',sort: true}
      ,{field:'tphone', title: '联系方式', minWidth: 100}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}

    ]]
    
  });
  table.on('tool(task)', function(obj){
	    var data = obj.data;
		if(obj.event === 'del'){
	      layer.confirm('真的删除此任务么', function(index){
				$.ajax({
					url : './routeMana/deleteTask.do?id='+data.id,
					type : 'POST',
					success : function(data) {
						layer.msg("任务已经删除");
					    obj.del();
					}
				});
	      });
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
		    		  content: './releaseTaskDetail.do?id='+data.id
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