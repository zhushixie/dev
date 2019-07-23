<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport"/>
	<title>设备类型管理</title>
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

.layui-btn-container {
	margin-left: 10px;
}

.layui-btn {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
	<link href="./layui/css/layui.css" rel="stylesheet" />
</head>
</html>
<body class="layui-layout-body" >
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<a href="./main.html">
				<div class="layui-logo">设备类型管理</div>
			</a>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="./devState.html"> 设备状态
				</a></li>
				<li class="layui-nav-item"><a
					href="./envInfo.html"> 环境信息 </a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						class="layui-nav-img" src="http://t.cn/RCzsdCq"> kevin </img>
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
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-navi" data-id="a11"
						data-title="工业设备" data-type="tabAdd"
						data-url="./devTypeIndustry.do"><a href="javascript:;">
							工业设备 </a></li>
					<li class="layui-nav-item layui-navi" data-id="a" data-title="普通设备"
						data-type="tabAdd" data-url="./devTypeUniversal.do"><a
						href="javascript:;"> 通用设备 </a></li>
				</ul>
			</div>
		</div>
		<div class="layui-body" style="overflow-y: hidden">
			<div class="layui-tab" lay-allowclose="true" lay-filter="demo">
				<ul class="layui-tab-title" id="freshPage">
					<li id="home">首页</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<iframe data-frameid="homeSys" frameborder="0" scrolling="auto"
							src="./homeSys.html" style="width: 100%; height: 99%;">
						</iframe>
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
	</div>
	<script src="./layui/layui.js">
    </script>

	<script>
		layui.use('element',function() {
							var $ = layui.jquery;
							var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
							$("#home").children().remove();//移除home页删除按钮
							//$(rs[0]).removeClass("layui-tab-close layui-icon layui-unselect");
							//$(rs[0]).unbind();

							//触发事件
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
									CustomRightClick(id); //给tab绑定右击事件
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

							//当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
							$('.layui-navi')
									.on(
											'click',
											function() {

												var dataid = $(this);

												//这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
												if ($(".layui-tab-title li[lay-id]").length <= 0) {
													//如果比零小，则直接打开新的tab项
													active
															.tabAdd(
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

							function CustomRightClick(id) {
								//取消右键  rightmenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
								$('.layui-tab-title li').on('contextmenu',
										function() {
											return false;
										})
								$('.layui-tab-title,.layui-tab-title li')
										.click(function() {
											$('.rightmenu').hide();
										});
								//桌面点击右击 
								$('.layui-tab-title li').on(
												'contextmenu',
												function(e) {
													var popupmenu = $(".rightmenu");
													popupmenu.find("li").attr(
															"data-id", id); //在右键菜单中的标签绑定id属性

													//判断右侧菜单的位置 
													l = ($(document).width() - e.clientX) < popupmenu
															.width() ? (e.clientX - popupmenu
															.width())
															: e.clientX;
													t = ($(document).height() - e.clientY) < popupmenu
															.height() ? (e.clientY - popupmenu
															.height())
															: e.clientY;
													popupmenu.css({
														left : l,
														top : t
													}).show(); //进行绝对定位
													//alert("右键菜单")
													return false;
												});
							}

							$(".rightmenu li")
									.click(
											function() {

												//右键菜单中的选项被点击之后，判断type的类型，决定关闭所有还是关闭当前。
												if ($(this).attr("data-type") == "closethis") {
													//如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
													active.tabDelete($(this)
															.attr("data-id"))
												} else if ($(this).attr(
														"data-type") == "closeall") {
													var tabtitle = $(".layui-tab-title li");
													var ids = new Array();
													$
															.each(
																	tabtitle,
																	function(i) {
																		ids[i] = $(
																				this)
																				.attr(
																						"lay-id");
																	})
													//如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
													active.tabDeleteAll(ids);
												}

												$('.rightmenu').hide(); //最后再隐藏右键菜单
											})
							function FrameWH() {
								var h = $(window).height() - 41 - 10 - 60 - 10
										- 44 - 10;
								$("iframe").css("height", h + "px");
							}

							$(window).resize(function() {
								FrameWH();
							})
							//  $("#freshPage").click(function(){
							//     $("#home").children().remove();//移除home页删除按钮
							// })
						});
	</script>
</body>
