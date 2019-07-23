<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="./style/dialog.css"/>
<style>
.t{
width: 200px; height: 50px; border-radius: 20px; text-align:center;line-height: 50px;
}
.cl{
background:#363636;margin:0 auto;
color: #59c35d;
}

</style>
<script type="text/javascript">
function g(id){
	return document.getElementById(id);
};
function autoCenter(el){
    //获取可见窗口大小
    var bodyW = document.documentElement.clientWidth;
    var bodyH = document.documentElement.clientHeight;
    //获取对话框宽、高
    var elW = el.offsetWidth;
    var elH = el.offsetHeight;
    el.style.left = (bodyW - elW)/2 + 'px';
    el.style.top = (bodyH - elH)/2 + 'px';
};
//声明需要用到的变量
var mx = 0,my = 0;      //鼠标x、y轴坐标（相对于left，top）
var dx = 0,dy = 0;      //对话框坐标（同上）
var isDraging = false;      //不可拖动
</script>
</head>
<body>
<div style=""><h1>流程测试</h1></div>
<div id="callout" class="t"><a href="#">创建模型</a></div>
<div class="dialog" id="dialog">
    <div class="dialog_head" id="move_part">模型定义</div>
    <div class="dialog_content">
    <form action="./create.do" method="get" style="height:80%">
    <div style="height:80%;top:20%;width:60%;margin:0 auto">
  	 	<div style="margin:10px auto">名称 :<input type="text" id="name" name="name" placeholder="name"></input></div>
    	<div style="margin:10px auto">I&nbsp&nbsp&nbsp&nbspD:<input type="text" id="key" name="key" placeholder="id"></input></div>
     	<div style="margin:10px auto">描述 :<input type="text" id="description" name="description" placeholder="description"></input></div>
    </div>
    <div style="left:50px"><input class="button cl" type="submit" value="提交" id="submit"></div>
	</form>
    </div>
</div>
<div class="t"><a href="./listModel.do">模型列表</a></div>

<div class="t"><a href="#">流程列表</a></div>

<div class="t"><a href="#">我的申请</a></div>

<div class="t"><a href="#">我的任务</a></div>

<div class="t"><a href="#">历史任务</a></div>

<div class="t"><a href="#">创建表单</a></div>

<div class="t"><a href="##">表单列表</a></div>
<div id="mask" class="mask"></div>
</body>
<script type="text/javascript" src="./js/dialog.js"></script>

</html>
