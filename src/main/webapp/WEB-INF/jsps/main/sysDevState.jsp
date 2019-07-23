<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport"/>
                <title>
                    设备信息系统主页
                </title>
                <style type="text/css">
                    .site-doc-icon li{width: 222px;}

        .site-doc-icon li .layui-anim{width: 150px; height: 150px; line-height: 150px; margin: 0 auto 10px; text-align: center; background-color: #7f7f7f; cursor: pointer; color: #fff; border-radius: 50%;

        }      .mfunc .func{
float:left; /* 往左浮动 */
}
        }
                </style>
                <link href="layui/css/layui.css" rel="stylesheet"/>
                <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="./layui/css/layui.css"/>
<script src="./layui/layui.js"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <a href="./main.do"><div class="layui-logo">
                    设备信息管理系统
                </div></a>
                <!-- 头部区域（可配合layui已有的水平导航） -->
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item">
                        <a href="./sysDevState.do">
                            设备状态
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="./sysEnvInfo.do">
                            环境信息
                        </a>
                    </li>
                </ul>
                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <img class="layui-nav-img" src="http://t.cn/RCzsdCq">
                                ${sessionScope.user}
                            </img>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="./myInformation.do">
                                    基本资料
                                </a>
                            </dd>
                            <dd>
                                <a href="./myPwdModify.do">
                                    修改密码
                                </a>
                            </dd>
                            <dd>
                                <a href="./loginOut.do">
                                    退出
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-body" style="left: 1%;top:2%">
                <!-- 内容主体区域 -->
                <div style="padding: 15px;">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>设备状态</legend>
</fieldset>   
                <table class="layui-hide" id="task" lay-filter="task"></table>
				<script id="barDemo" type="text/html">
  						<a style="height:25px;margin-top:5px;margin-bottom:5px;line-height:20px" class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
				</script>
	<script>
layui.use('table', function(){
  var table = layui.table;
  table.render({
    elem: '#task'
    ,url:'./applicantFixSaveTask/list'
    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
      //,curr: 5 //设定初始在第 5 页
      ,groups: 1 //只显示 1 个连续页码
      ,first: false //不显示首页
      ,last: false //不显示尾页
      
    }
  ,cols: [[
           {field:'id', width:100, title: '任务编号', sort: true}
           ,{field:'tname', title: '设备名称',sort: true}
           ,{field:'tcode', width:100, title: '设备编号', sort: true}
           ,{field:'ttime', width:400, title: '发布时间',sort: true}
           ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
         ]]
    
  });
  table.on('tool(task)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'edit'){
	      layer.msg('ID：'+ data.id + ' 的查看操作');
	    } else if(obj.event === 'del'){
	      layer.confirm('真的删除行么', function(index){
	    	  
	        obj.del();
	        layer.close(index);
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
</script>
                </div>
            </div>
            <div class="layui-footer" style="left: 0px;text-align: center">
                © 华中科技大学C511实验室
            </div>
        </div>
    </body>
</html>