<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
                <title>
                    设备状态
                </title>
                <style type="text/css">
                    .site-doc-icon li{width: 222px;}

        .site-doc-icon li .layui-anim{width: 150px; height: 150px; line-height: 150px; margin: 0 auto 10px; text-align: center; background-color: #7f7f7f; cursor: pointer; color: #fff; border-radius: 50%;

        }      .mfunc .func{
float:left; /* 往左浮动 */
}
        }
                </style>
                <link href="./layui/css/layui.css" rel="stylesheet">
                </link>
            </meta>
        </meta>
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <a href="./main.html">
                    <div class="layui-logo">
                        设备信息管理系统
                    </div>
                </a>
                <!-- 头部区域（可配合layui已有的水平导航） -->
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item layui-bg-green">
                        <a href="./devState.html">
                            设备状态
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="./envInfo.html">
                            环境信息
                        </a>
                    </li>
                </ul>
                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <img class="layui-nav-img" src="http://t.cn/RCzsdCq">
                                kevin
                            </img>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="./personInfo.html">
                                    基本资料
                                </a>
                            </dd>
                            <dd>
                                <a href="./pwdModify.html">
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
                <div class="envMsg">
                    <div class="layui-bg-black" style="height: 60px; margin-left: 20px;margin-right: 20px">
                        <div class="layui-logo" style="margin-top: 20px;position: relative">
                            设备状态
                        </div>
                    </div>
                    <div style="height: 300px;background: yellow">
                    </div>
                </div>
            </div>
            <div class="layui-footer" style="left: 0px;text-align: center">
                © 华中科技大学C511实验室
            </div>
        </div>
        <script src="./layui/layui.js">
        </script>
        <script>
            //JavaScript代码区域
        layui.use('element', function(){
          var element = layui.element;
  
        });
        </script>
    </body>
</html>