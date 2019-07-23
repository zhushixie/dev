<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>jsTree</title>
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet"
	href="./js/bootstrap.min.css" />
<link rel="stylesheet"
	href="./static/dist/themes/default/style.min.css" />
<link rel="stylesheet" href="./static/dist/themes/default/docs.css" />

<script>
	window.$q = [];
	window.$ = window.jQuery = function(a) {
		window.$q.push(a);
	};
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport">
	<title>系统配置</title>
	<style type="text/css">
.site-doc-icon li {
	width: 222px;
}

.site-doc-icon li .layui-anim {
	width: 150px;
	height: 150px;
	line-height: 150px;
	margin: 0 auto 10px;
	text-align: center;
	background-color: #7f7f7f;
	cursor: pointer;
	color: #fff;
	border-radius: 50%;
}

.mfunc .func {
	float: left; /* 往左浮动 */
}
}
</style>
	<link href="./layui/css/layui.css" rel="stylesheet"></link>
</meta>
</meta>
<style>
.t {
	width: 200px;
	height: 50px;
	border-radius: 20px;
	text-align: center;
	line-height: 50px;
}

.cl {
	background: #363636;
	margin: 0 auto;
	color: #59c35d;
}
</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<a href="./main.html">
				<div class="layui-logo">设备信息管理系统</div>
			</a>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="./devState.html"> 设备状态
				</a></li>
				<li class="layui-nav-item"><a href="./envInfo.html"> 环境信息 </a>
				</li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						class="layui-nav-img" src="http://t.cn/RCzsdCq"> ${sessionScope.user} </img>
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="./personInfo.html"> 基本资料 </a>
						</dd>
						<dd>
							<a href="./pwdModify.html"> 修改密码 </a>
						</dd>
						<dd>
							<a href=""> 退出 </a>
						</dd>
					</dl></li>
			</ul>
		</div>
				<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul lay-filter="test">
						<div id="jstree_demo"
							style="margin-top: 1em; min-height: 200px;font-color:white;"></div>
				</ul>
			</div>
		</div>
		<div class="layui-body" style="overflow-y: hidden;background:white">
		<div class="layui-bg-green" style="padding-top:10px;padding-bottom:10px">
						<div class="row">
					<div class="col-md-4 col-sm-8 col-xs-8">
						<button type="button" class="btn btn-success btn-sm" onclick="demo_create();"><i class="glyphicon glyphicon-asterisk"></i> 创建设备</button>
						<button type="button" class="btn btn-warning btn-sm" onclick="demo_rename();"><i class="glyphicon glyphicon-pencil"></i> 修改名称</button>
						<button type="button" class="btn btn-danger btn-sm" onclick="demo_delete();"><i class="glyphicon glyphicon-remove"></i> 删除节点</button>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4" style="text-align:right;">
						<input type="text" value="" style="color:black;box-shadow:inset 0 0 4px #eee; width:120px; margin:0; padding:6px 12px; border-radius:4px; border:1px solid black; font-size:1.1em;" id="demo_q" placeholder="查找节点" />
					</div>
				</div>
		</div>
			<div class="layui-tab" lay-filter="demo" lay-allowclose="true" >
				<ul class="layui-tab-title" id="freshPage">
					<li id="home">首页</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<iframe data-frameid="homeSys" scrolling="no" frameborder="0"
							src="./homeSys.do" style="width: 100%; height: 99%;"></iframe>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer"
			style="left: 0px; width: 100%; z-index: 9999; text-align: center">
			<!-- 底部固定区域 -->
			© 华中科技大学C511实验室
		</div>
	</div>
		<script>
		function demo_create() {
			var ref = $('#jstree_demo').jstree(true),
				sel = ref.get_selected();
			if(!sel.length) { return false; }
			sel = sel[0];
			sel = ref.create_node(sel, {"type":"file"});
			if(sel) {
				ref.edit(sel);
			}
		};
		function demo_rename() {
			var ref = $('#jstree_demo').jstree(true),
				sel = ref.get_selected();
			if(!sel.length) { return false; }
			sel = sel[0];
			ref.edit(sel);
		};
		function demo_delete() {
			var ref = $('#jstree_demo').jstree(true),
				sel = ref.get_selected();
			if(!sel.length) { return false; }
			ref.delete_node(sel);
		};
			$(function() {
				var to = false;
				$('#demo_q').keyup(function() {
					if (to) {
						clearTimeout(to);
					}
					to = setTimeout(function() {
						var v = $('#demo_q').val();
						$('#jstree_demo').jstree(true).search(v);
					}, 250);
				});

				$('#jstree_demo')
						.on(
								'changed.jstree',
								function(e, data) {
									var i, j, r = [];
									for (i = 0, j = data.selected.length; i < j; i++) {
										r
												.push(data.instance
														.get_node(data.selected[i]).text);
									}
									if(!(data.node!==undefined)||!(data.node.id!==undefined)||data.node.parent=="#"){
										return;
									}else{
										if ($(".layui-tab-title li[lay-id]").length <= 0) {
											//如果比零小，则直接打开新的tab项
											active.tabAdd("",data.node.id,r);
										} else {
											//否则判断该tab项是否以及存在

											var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
											$
													.each(
															$(".layui-tab-title li[lay-id]"),
															function() {
																//如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
																if ($(
																		this)
																		.attr(
																				"lay-id") == data.node.id) {
																	isData = true;
																}
															})
											if (isData == false) {
												//标志为false 新增一个tab项
												active
														.tabAdd("",data.node.id,r);
											}
										}
										//最后不管是否新增tab，最后都转到要打开的选项页面上
										active.tabChange(data.node.id);

										$("#home").children().remove();//删除home页按钮
									}

									
								})
						.jstree(
								{
									"core" : {
										"animation" : 0,
										"check_callback" : true,
										'force_text' : true,
										"themes" : {
											"stripes" : true
										},
										'data' : {
											'url' : function(node) {
												return node.id === '#' ? './assets/ajax_demo_roots.do'
														: './assets/ajax_demo_children.do';
											},
											'data' : function(node) {
												return {
													'id' : node.id
												};
											}
										}
									},
									"types" : {
										"#" : {
											"max_children" : 1,
											"max_depth" : 4,
											"valid_children" : [ "root" ]
										},
										"root" : {
											"icon" : "./static/tree_icon.png",
											"valid_children" : [ "default" ]
										},
										"default" : {
											"valid_children" : [ "default",
													"file" ]
										},
										"file" : {
											"icon" : "glyphicon glyphicon-file",
											"valid_children" : []
										}
									},
									"plugins" : [ "contextmenu", "dnd",
											"search", "state", "types",
											"wholerow" ]
								});
			});
		</script>
		<script src="//static.jstree.com/3.3.7/assets/jquery-1.10.2.min.js"></script>
		<script src="//static.jstree.com/3.3.7/assets/jquery.address-1.6.js"></script>
		<script src="//static.jstree.com/3.3.7/assets/vakata.js"></script>
		<script src="./static/dist/jstree.js"></script>
		<script src="./static/site.js"></script>
		<script>$.each($q,function(i,f){$(f)});$q=null;</script>
		<script src="./layui/layui.js">
	</script>
	<script>
	var element = null;
	function FrameWH() {
		var h = $(window).height() - 41 - 10 - 60 - 10
				- 44 - 10;
		$("iframe").css("height", h + "px");
	}
	var active = {
			//在这里给active绑定几项事件，后面可通过active调用这些事件
			tabAdd : function(url, id, name) {
				//新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
				//关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
				element
						.tabAdd(
								'demo',
								{
									title : name,
									content : '<iframe data-frameid="'
											+ id
											+ '" scrolling="no" frameborder="0" src="'
											+ url
											+ '" style="width:100%;height:99%;"></iframe>',
									id : id
								//规定好的id
								})
				FrameWH(); //计算ifram层的大小
			},
			tabChange : function(id) {
				//切换到指定Tab项
				element.tabChange('demo', id); //根据传入的id传入到指定的tab项
			},
			tabDelete : function(id) {
				element.tabDelete("demo", id);//删除
			},
			tabDeleteAll : function(ids) {//删除所有
				$.each(ids, function(i, item) {
					element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
				})
			}
	};
		layui
				.use(
						'element',
						function() {
							var $ = layui.jquery;
							element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
							$("#home").children().remove();//移除home页删除按钮
							//$(rs[0]).removeClass("layui-tab-close layui-icon layui-unselect");
							//$(rs[0]).unbind();

							//触发事件

							//当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
							$('.layui-navi')
									.on(
											'click',
											function() {

												var dataid = $(this);

												//这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
												if ($(".layui-tab-title li[lay-id]").length <= 0) {
													//如果比零小，则直接打开新的tab项
													active.tabAdd(
																	dataid
																			.attr("data-url"),
																	dataid
																			.attr("data-id"),
																	dataid
																			.attr("data-title"));
												} else {
													//否则判断该tab项是否以及存在

													var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
													$
															.each(
																	$(".layui-tab-title li[lay-id]"),
																	function() {
																		//如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
																		if ($(
																				this)
																				.attr(
																						"lay-id") == dataid
																				.attr("data-id")) {
																			isData = true;
																		}
																	})
													if (isData == false) {
														//标志为false 新增一个tab项
														active
																.tabAdd(
																		dataid
																				.attr("data-url"),
																		dataid
																				.attr("data-id"),
																		dataid
																				.attr("data-title"));
													}
												}
												//最后不管是否新增tab，最后都转到要打开的选项页面上
												active.tabChange(dataid
														.attr("data-id"));

												$("#home").children().remove();//删除home页按钮
											});
			
							$(window).resize(function() {
								FrameWH();
							})
						});
	</script>
</body>
</html>
