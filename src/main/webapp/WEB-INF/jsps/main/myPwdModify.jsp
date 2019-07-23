<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
                <title>
                    密码修改
                </title>
                <style type="text/css">
                    .site-doc-icon li{width: 222px;}

        .site-doc-icon li .layui-anim{width: 150px; height: 150px; line-height: 150px; margin: 0 auto 10px; text-align: center; background-color: #7f7f7f; cursor: pointer; color: #fff; border-radius: 50%;

        }      .mfunc .func{
float:left; /* 往左浮动 */
}
        }
                </style>
                <link href="layui/css/layui.css" rel="stylesheet">
                </link>
            </meta>
        </meta>
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <a href="./sysMain.do"><div class="layui-logo">
                    密码修改
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
                                <a href="./myNotify.do">
                                    消息通知
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
            <div class="layui-body" style="left: 15%;font-size:20px">
                <!-- 内容主体区域 -->
                <form class="layui-form" id="taskForm" method="post" style="margin-top:200px">
		<div class="layui-form-item" style="margin-top:20px">
			<label class="layui-form-label" >旧密码</label>
			<div class="layui-input-block" style="width: 800px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="旧密码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item"  style="margin-top:20px">
		<label class="layui-form-label" >新密码</label>
			<div class="layui-input-block" style="width: 800px">
				<input type="text" name="tCode" id="tCode" required
					lay-verify="required" placeholder="新密码" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item"  style="margin-top:20px">
		<label class="layui-form-label">再次输入</label>
			<div class="layui-input-block" style="width: 800px">
				<input type="text" name="tStarterName" id="tStarter" required
					lay-verify="required" placeholder="再次输入" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">确认更改</button>
				<button type="layui-btn"  id="resetForm"  class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form>

	<script type="text/javascript">
	$("#tStarter").val("${sessionScope.user}");
	$("#tStarter").attr("readonly", "readonly");
		layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(formDemo)', function(data) {
				$.ajax({
					url : './applicantFixTask/startTask.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : $("#taskForm").serializeArray(),
					success : function(data) {
						alert("成功");
					},
					error : function() {
						alert("错误");
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});
			form.on('submit(saveDemo)', function(data) {
				$.ajax({
					url : './applicantFixTask/saveTask.do',
					type : 'POST',
					dateType : 'json',
					contentType : 'application/x-www-form-urlencoded',
					data : $("#taskForm").serializeArray(),
					success : function(data) {
						alert("成功");
					},
					error : function() {
						alert("错误");
					}
				});
				layer.msg(JSON.stringify(data.field));
				return false;
			});
			$("#resetForm").on("click",function(){
				location.reload();
			});
		});
	</script>
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
        layui.use('jquery', function(){

          var $ = layui.$;

 

        //演示动画

        $('.site-doc-icon .layui-anim').on('click', function(){

            var othis = $(this), anim = othis.data('anim');

            if(othis.hasClass('layui-anim-loop')){

                return othis.removeClass(anim);

            }
            othis.removeClass(anim);
            setTimeout(function(){

                othis.addClass(anim);

            });

            if(anim === 'layui-anim-fadeout'){

                setTimeout(function(){

                    othis.removeClass(anim);

                }, 1300);

            }

        });

    });
        </script>
    </body>
</html>