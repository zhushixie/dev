<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
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
<link href="./layui/css/layui.css" rel="stylesheet"/>
</head>
<body>
<!-- 
	<div class="layui-bg-cyan navi">
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
	 -->
<!--  <div class="demoTable">
    搜索商户：
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
	<div id="tablePos">
		<table id="demo" lay-filter="test"></table>
	</div>

	<script src="./layui/layui.js"></script>
	<script>
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#demo',
				height : 550,
				url : './findallEmp',
				page : true,
				limit:5,
				limits:[3,5,10,15],
				cols : [ [ {
					field : 'id',
					title : 'ID',
					width : 80,
					sort : true,
					fixed : 'left'
				}, {
					field : 'name',
					title : '姓名',
					width : 80
				}, {
					field : 'phone',
					title : '电话',
					width : 160,
					sort : true
				},{
					field : 'addr',
					title : '地址',
					width : 160,
					sort : true
				}  ] ]
			});
			var $ = layui.$, active = {
			        reload: function(){
			            var demoReload = $('#demoReload');

			            table.reload('demo', {
			                where: {
			                    keyword: demoReload.val()
			                }
			            });
			        }
			    };
			$('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			});


		});
		
	</script>-->
		<blockquote class="layui-elem-quote news_search">
		<form class="layui-form form" action="./userMana/page" method="get">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" name="keyword" placeholder="日志/用户" class="layui-input search_input">
		    </div>
		    <button lay-submit class="layui-btn" lay-filter="search">查找</button>
		</div>
		</form>
	</blockquote>
	<div class="layui-form links_list">
	  	<table class="layui-table">
		    <colgroup>
				<col>
				<col>
				<col>
				<col>
				<col>
				<col>
				<col width="16%">
		    </colgroup>
		    <thead>
				<tr>
					<th style="text-align:left;">用户名</th>
					<th>联系方式</th>
					<th>出生日期</th>
					<th>性别</th>
					<th>创建时间</th>
					<th>地址</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody id="list"></tbody>
		</table>
	</div>
	<div id="page"></div>
	<script src="./layui/layui.js"></script>
    <script id="list-tpl" type="text/html" data-params='{"url":"./userMana/page","pageid":"#page"}'>
	{{#  layui.each(d, function(index, it){ }}
	<tr>
		<td align="left">{{it.name}}</td>
		<td align="left">{{it.phone}} # {{it.logContent}}</td>
		<td align="left">{{it.born}}</td>
		<td align="left">{{it.sex}}</td>
		<td align="left">{{it.createtime}}</td>
		<td align="left">{{it.addr}}</td>
		<td align="left">
			<a class="layui-btn layui-btn-mini modal-iframe" data-params='{"content": "/log/params?id={{it.id}}", "title": "查看参数","full":false,"area":"600px,350px"}'><i class="iconfont icon-edit"></i> 查看参数</a>
		</td>
	</tr>
	{{#  }); }}

	{{#  if(d.length == 0){ }}
	  <tr><td colspan='5' align='left' style='color:#999999;'>未查到任何数据</td></tr>
	{{#  } }}
	</script>
	 <%@include file="/common/version.html" %>
	<script type="text/javascript">
		layui.use('list');
	</script>

</body>
</html>