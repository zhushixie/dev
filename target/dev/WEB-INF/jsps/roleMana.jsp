<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>角色管理</title>
	<style type="text/css">
	.navi{
		height: 60px;
		top: 5px;
		margin-top: 20px;
		margin-left: 20px;
		margin-right: 20px;

	}
	.layui-btn{
		margin-top: 15px;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	.btnPos{
		margin-left: 50px;
	}
	#tablePos{
		margin-left: 20px;
		margin-right: 20px;
	}

		
	</style>
	                <link href="./layui/css/layui.css" rel="stylesheet">
                </link>
</head>
<body>

<div  class="layui-bg-cyan navi">
	<div class="btnPos">
  <button class="layui-btn layui-btn-sm">
    <i class="layui-icon">&#xe654;</i>
  </button>
  <button class="layui-btn layui-btn-sm">
    <i class="layui-icon">&#xe642;</i>
  </button>
  <button class="layui-btn layui-btn-sm">
    <i class="layui-icon">&#xe640;</i>
  </button>
  </div>
</div>
<div class="demoTable">
    搜索商户：
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<div id="tablePos"><table id="demo" lay-filter="test"></table>
	</div>
 
<script src="./layui/layui.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;

  
  //第一个实例
table.render({
    elem: '#demo'
    ,height: 312
    ,url: 'http://localhost:8080/OnlinePaperSys/table' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'name', title: '用户名', width:80}
      ,{field: 'age', title: '年龄', width:80, sort: true}
    ]]
  });
  
});
</script>

</body>
</html>