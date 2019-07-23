<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport"/>
                <title>
                    环境信息
                </title>
                <style type="text/css">
                    .site-doc-icon li{width: 222px;}

        .site-doc-icon li .layui-anim{width: 150px; height: 150px; line-height: 150px; margin: 0 auto 10px; text-align: center; background-color: #7f7f7f; cursor: pointer; color: #fff; border-radius: 50%;

        }      .mfunc .func{
float:left; /* 往左浮动 */
}
        }
                </style>
                <link href="./layui/css/layui.css" rel="stylesheet"/>
                <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
                <script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
                 <script src="js/select.js" type="text/javascript" charset="utf-8"></script>
                 <link rel="stylesheet" type="text/css" href="css/select.css" />
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <a href="./main.do">
                    <div class="layui-logo">
                        设备信息管理系统
                    </div>
                </a>
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
                                <a href="./myNotify.do">
                                    消息通知
                                </a>
                            </dd>
                            <dd>
                                <a href="./pwdModify.do">
                                    修改密码
                                </a>
                            </dd>
                            <dd>
                                <a href="">
                                    退出
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-body" style="left: 1%">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>位置信息</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="">
        <div class="layui-inline" style="padding-left: 9.1%;padding-top: 2%">
            <form class="layui-form layui-form-pane" action="javascript:;">
                <div class="layui-form-item" id="addressDiv">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-inline">
                        <select name="P1" lay-filter="province" id="province">
                            <option></option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="C1" lay-filter="city" id="city">
                            <option></option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="A1" lay-filter="area" id="area">
                            <option></option>
                        </select>
                    </div>
                    <div class="layui-btn" onclick="selectMsg()">
                    确定/刷新
                    </div>
                </div>
            </form>
            </div>
    </form>
<fieldset class="layui-elem-field layui-field-title" style="padding-left: 10px;">
  <legend>今天天气信息</legend>
</fieldset>
<div id="msg">
<div class="layui-form-item">
    <label class="layui-form-label">更新时间</label>
    <div class="layui-input-block" style="width:600px">
      <input type="text" name="updateTime" id="updateTime" required  lay-verify="required" placeholder="最近更新时间" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">气温</label>
    <div class="layui-input-block" style="width:800px">
      <input type="text" name="temperature" id="temperature" required  lay-verify="required" placeholder="当天的气温" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">概况</label>
    <div class="layui-input-block" style="width:800px">
      <input type="text" name="condition" id="condition" required  lay-verify="required" placeholder="概况" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">风向和风力</label>
    <div class="layui-input-block" style="width:800px">
      <input type="text" name="windDirectionAndSize"  id="windDirectionAndSize" required  lay-verify="required" placeholder="风向和风力" autocomplete="off" class="layui-input" >
</div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">天气实况</label>
    <div class="layui-input-block" style="width:800px">
      <input type="text" name="realCondition"  id="realCondition" required  lay-verify="required" placeholder="现在的天气实况" autocomplete="off" class="layui-input">
</div>
</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label" style="width: 100px">生活指数</label>
			<div class="layui-input-block">
				<textarea name="lifeCondition"  id="lifeCondition"  placeholder="生活指数" class="layui-textarea"
					style="height: 300px"></textarea>
			</div>
		</div>
            </div>
            <div class="layui-footer" style="left: 0px;text-align: center">
                © 华中科技大学C511实验室
            </div>
        </div>

        
    </body>
    
    <script>
    function selectMsg() {
			// 先去查询数据
		var cityVal = $("#city").val();
    	$.ajax({
			url : './getWeatherMsg.do?city='+cityVal,
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(res) {
				$("#updateTime").val(res.updateTime);
				$("#temperature").val(res.temperature);
				$("#condition").val(res.condition);
				$("#windDirectionAndSize").val(res.windDirectionAndSize);
				$("#realCondition").val(res.realCondition);
				$("#lifeCondition").val(res.lifeCondition);
			},
			error : function() {
				alert("错误");
			}
		});
    }
    </script>
</html>