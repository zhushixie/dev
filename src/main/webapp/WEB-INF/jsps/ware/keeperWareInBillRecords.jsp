<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的巡检记录</title>
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
	<div class="layui-bg-green" style="height:60px">
	<div style="text-align:center;font-size:30px;padding-top:20px;float:left">我的入库记录</div>
	<div style="float:right;font-size:30px;"><button id="refresh"  class="layui-btn layui-bg-cyan" data-type="reload" style="font-size:30px;">刷新</button></div>
	</div>
	</blockquote>
	<table class="layui-hide" id="task"></table>
	<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#task'
    ,url:'./keeperWareInBillRecords/list'
    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
      //,curr: 5 //设定初始在第 5 页
      ,groups: 1 //只显示 1 个连续页码
      ,first: false //不显示首页
      ,last: false //不显示尾页
      
    }
    ,cols: [[
      {field:'id', width:100, title: '编号', sort: true}
      ,{field:'ttime', width:200, title: '入库时间', sort: true}
      ,{field:'tUsername', width:100, title: '登记人',sort: true}
      ,{field:'tcontent',title: '详情'}
      ,{field:'ttype', title: '类型', width:100}
    ]]
  });
});
$("#refresh").on("click",function(){
	location.reload();
});
</script>
	</body>
	
</html>