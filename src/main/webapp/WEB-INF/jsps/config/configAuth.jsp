<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>treeGrid</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
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
        height:65px;
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
        <%--top:90px;--%>
        position:absolute;
        z-index:10;
        bottom:5px;
    }
    .layui-btn-xstree {
        height: 35px;
        line-height: 35px;
        padding: 0px 5px;
        margin-left:100px;
        margin-right:40px;
        font-size: 12px;
    }
</style>
<body>
<div style="height: 100%">
	<blockquote class="dHead layui-elem-quote news_search">
		<form class="layui-form form" action="" method="get" style="margin-top:10px;margin-bottom:10px">
        <a class="layui-btn  layui-btn-xs layui-btn-xstree" style="width:60px" onclick="window.location.href='./authMana.do;">刷新</a>
        <a class="layui-btn  layui-btn-xs layui-btn-xstree"  style="width:60px" onclick="add(null);">新增一行</a>
        <a class="layui-btn  layui-btn-xs layui-btn-xstree" style="width:160px" onclick="openAll();">展开或折叠全部</a>
        <br>
        <br>
		</form>
	</blockquote>
    <div class="dBody">
        <table class="layui-hidden" id="treeTable" lay-filter="treeTable"></table>
    </div>
</div>
<script>
    var editObj=null,ptable=null,treeGrid=null,tableId='treeTable',layer=null;
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
            ,url:'./authMana/findAllAuth.do'
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
            ,isPage:false
            ,cols: [[
                {type:'numbers'}
                ,{type:'checkbox',sort:true}
                ,{field:'name', width:300, title: '标题',edit:'text',sort:true}
                ,{field:'descript', width:300, title: '标题',edit:'text'}
                ,{field:'id',width:100, title: 'id',sort:true}
                ,{field:'pId', title: 'pId',sort:true}
                ,{width:100,title: '操作', align:'center'/*toolbar: '#barDemo'*/
                    ,templet: function(d){
                        var html='';
                        var addBtn='<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="add">添加</a>';
                        var delBtn='<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>';
                        return addBtn+delBtn;
                    }
                }
            ]]
            ,parseData:function (res) {//数据加载后回调
                return res;
            }
            ,onClickRow:function (index, o) {
                console.log(index,o,"单击！");
            }
            ,onDblClickRow:function (index, o) {
                console.log(index,o,"双击");
            }
            ,onCheck:function (obj,checked,isAll) {//复选事件
                console.log(obj,checked,isAll);
            }
            ,onRadio:function (obj) {//单选事件
                console.log(obj);
            }
        });

        treeGrid.on('tool('+tableId+')',function (obj) {
            if(obj.event === 'del'){//删除行
                del(obj);
            }else if(obj.event==="add"){//添加行
                add(obj);
            }
        });
    });

    function del(obj) {
        layer.confirm("你确定删除数据吗？如果存在下级节点则一并删除，此操作不能撤销！", {icon: 3, title:'提示'},
            function(index){//确定回调
                obj.del();
                layer.close(index);
            },function (index) {//取消回调
               layer.close(index);
            }
        );
    }


    var i=1000000;
    //添加
    function add(pObj) {
        var pdata=pObj?pObj.data:null;
        var param={};
        param.name='水果'+Math.random();
        param.id=++i;
        param.pId=pdata?pdata.id:null;
        treeGrid.addRow(tableId,pdata?pdata[treeGrid.config.indexName]+1:0,param);
    }

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
    function radioStatus() {
        var data = treeGrid.radioStatus(tableId)
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
    
    function test() {
        console.log(treeGrid.cache[tableId],treeGrid.getClass(tableId));
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