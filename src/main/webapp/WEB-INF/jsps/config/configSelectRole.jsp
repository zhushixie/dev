<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>treeGrid</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
    <script src="./layui/layui.js"></script>
</head>
<style>
    html, body {
        height: 100%;
        margin:0;padding:0;
        font-size: 12px;
    }
    div{
        -moz-box-sizing: border-box;  /*Firefox3.5+*/
        -webkit-box-sizing: border-box; /*Safari3.2+*/
        -o-box-sizing: border-box; /*Opera9.6*/
        -ms-box-sizing: border-box; /*IE8*/
        box-sizing: border-box; /*W3C标准(IE9+，Safari5.1+,Chrome10.0+,Opera10.6+都符合box-sizing的w3c标准语法)*/
    }
    .dHead {
        height:85px;
        width:100%;
        position: fixed;
        z-index:5;
        top:0;
        overflow-x: auto;
        padding: 10px;
    }
    .dBody {
        width:100%;
        overflow:auto;
        top:90px;
        position:absolute;
        z-index:10;
        bottom:5px;
    }
    .layui-btn-xstree {
        height: 35px;
        line-height: 35px;
        padding: 0px 5px;
        font-size: 12px;
    }
</style>
<body>
<div style="height: 100%">
    <div class="dBody">
        <table class="layui-hidden" id="treeTable" lay-filter="treeTable"></table>
    </div>
        <div class="dHead">
        <a class="layui-btn layui-bg-green layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="reload()">重新加载</a>
        <a class="layui-btn layui-bg-green layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="query()">query</a>
        <a class="layui-btn  layui-bg-green layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="getCheckData();">获取选中行数据</a>
        <a class="layui-btn layui-bg-green layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="getCheckLength();">获取选中数目</a>
        <a class="layui-btn layui-bg-green layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="openAll();">展开或折叠全部</a>
    </div>
</div>
<script>
    var editObj=null,ptable=null,treeGrid=null,tableId='treeTable',layer=null;
    var operateEle = false,selectOne = true;
    layui.config({
        base: 'layui/extend/'
    }).extend({
        treeGrid:'treeGrid'
    });
    layui.use(['jquery','treeGrid','layer'], function(){
        var $=layui.jquery;
        treeGrid = layui.treeGrid;//很重要
        layer=layui.layer;
        ptable=treeGrid.render({
            id:tableId
            ,elem: '#'+tableId
            ,url:'./roleMana/findSelectedRoles.do?id=${requestScope.id}'
            ,cellMinWidth: 100
            ,idField:'id'//必須字段
            ,treeId:'id'//树形id字段名称
            ,treeUpId:'pId'//树形父id字段名称
            ,treeShowName:'name'//以树形式显示的字段
            ,heightRemove:[".dHead",10]//不计算的高度,表格设定的是固定高度，此项不生效
            ,height:'100%'
            ,isFilter:false
            ,iconOpen:true//是否显示图标【默认显示】
            ,isOpenDefault:true//节点默认是展开还是折叠【默认展开】
            ,loading:true
            ,method:'post'
            ,isPage:true
            ,cols: [[
                {type:'numbers'}
                ,{type:'checkbox',sort:true}
                ,{field:'name', width:200, title: '角色名称',edit:'text',sort:true}
                ,{field:'descript', width:200, title: '角色描述',edit:'text',sort:true}
                ,{field:'id',width:100, title: 'id',sort:true}
                ,{field:'pId', title: 'pid',sort:true}
            ]]
            ,parseData:function (res) {//数据加载后回调
                return res;
            }
            ,onCheck:function (obj,checked,isAll) {//复选事件
            	//检查选择状况
           var checkStatus = treeGrid.checkStatus(tableId),data = checkStatus.data;
            if(!operateEle){
            	return;
            }
            	var userRole = new Object();
            	userRole.userId = ${requestScope.id};
            	userRole.roleId = obj.id;
            	userRole.id = 0; 
                console.log(obj,checked,isAll);
          
            	if(checked){
    				$.ajax({
    					url : './roleMana/addUserRole.do',
    					type : 'POST',
    					dateType : 'json',
    					contentType : 'application/x-www-form-urlencoded',
    					data : userRole,
    					success : function(data) {
    					    layui.use('layer', function(){
  					    	  var layer = layui.layer;
  	    						if(data=="success"){
  	    							 layer.msg('添加角色成功');
  	    						}else{
  	    							 layer.msg('添加角色失败');
  	    						}
  					   
  					    	});
    					},
    					error : function() {
    						alert("错误");
    					}
    				});
            	}else{
    				$.ajax({
    					url : './roleMana/deleteUserRole.do',
    					type : 'POST',
    					dateType : 'json',
    					contentType : 'application/x-www-form-urlencoded',
    					data : userRole,
    					success : function(data) {
    					    layui.use('layer', function(){
    					    	  var layer = layui.layer;
    	    						if(data=="success"){
    	    							 layer.msg('删除角色成功');
    	    						}else{
    	    							 layer.msg('删除角色失败');
    	    						}
    					   
    					    	});

    					},
    					error : function() {
    						alert("错误");
    					}
    				});
            		
            	}
            }
            ,onRadio:function (obj) {//单选事件
                console.log(obj);
            }
        });
    });

    function print() {
        console.log(treeGrid.cache[tableId]);
        var loadIndex=layer.msg("对象已打印，按F12，在控制台查看！", {
            time:3000
            ,offset: 'auto'//顶部
            ,shade: 0
        });
    }
    
    
    function openorclose() {
        var map=treeGrid.getDataMap(tableId);
        var o= map['102'];
        treeGrid.treeNodeOpen(tableId,o,!o[treeGrid.config.cols.isOpen]);
    }
    function openAll() {
        var treedata=treeGrid.getDataTreeList(tableId);
        treeGrid.treeOpenAll(tableId,!treedata[0][treeGrid.config.cols.isOpen]);
    }
    function getCheckData() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.alert(JSON.stringify(data));
    }
    function getCheckLength() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
    }

    function reload() {
        treeGrid.reload(tableId,{
            page:{
                curr:1
            }
        });
    }
    function query() {
        treeGrid.query(tableId,{
            where:{
                name:'sdfsdfsdf'
            }
        });
    }
</script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?e2af8415b6ffbaeb52de4d080cb4ba85";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>