<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./layui/layui.js"></script>
</head>
<body>
<table class="layui-hide" id="log"></table>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#log'
    ,url:'./logMana/tableList.do'
    ,title: '用户数据表'
    ,height: 612
    ,page: true
    ,cols: [[
      {field:'id', width:100, title: 'ID', sort: true}
      ,{field:'tuser', width:150, title: '用户名'}
      ,{field:'tauth', width:450, title: '权限方法'}
      ,{field:'ttime', title: '时间'}
    ]]

  });
});
</script>

</body>
</html>