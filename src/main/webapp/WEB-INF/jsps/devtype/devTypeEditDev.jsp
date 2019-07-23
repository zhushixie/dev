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
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css"/>
<link rel="stylesheet" href="./js/font-awesome.min.css"/>
<script src="./js/bootstrap.min.js"></script>
</head>
<body class="layui-layout-body" style="overflow:scroll">
	<div class="layui-container" style="margin-top: 30px;">
    <form class="layui-form layui-form-pane" lay-filter="updateForm">
        <input type="text" name="seller_id" lay-verify="required" style="display: none;">
        <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备名称</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="name" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="code" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备类型</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required lay-verify="required" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>
         <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                    <label class="layui-form-label">生产厂家</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required lay-verify="required" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                <label class="layui-form-label">图纸文件</label>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 20px;">
                        <div id="uploadDwgFile" class="layui-upload">
                            <div class="layui-upload-list">
                                <img id="dwgshow" src="" alt="" class="layui-upload-img"
                                     style="height: 100px;width:100px;border:1px solid black;">
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-xs4" style="margin-left:100px">
                                    <button type="button" class="layui-btn layui-btn-sm" id="uploadDwg" >
                                        <i class="layui-icon">&#xe67c;</i>图纸更改
                                    </button>
                                </div>
                                <div id="startDwgDiv">
                                    <button type="button" class="layui-btn layui-hide layui-btn-sm" id="startUploadDwg"
                                            style="margin-left: 30px;">开始上传
                                    </button>
                                </div>
                            </div>
                        </div>
                        <input type="text" name="dwgId" id="dwgInput" lay-verify="required" style="display: none;">
                    </blockquote>
                </div>
            </div>
        </div>
               <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                <label class="layui-form-label">说明书：</label>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 20px;">
                        <div id="uploadInstructionFile" class="layui-upload">
                            <div class="layui-upload-list">
                            <div></div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-xs4" style="margin-left:100px">
                                    <button type="button" class="layui-btn layui-btn-sm" id="uploadInstruction" >
                                        <i class="layui-icon">&#xe67c;</i>说明书更改
                                    </button>
                                </div>
                                <div id="startInstructionDiv">
                                    <button type="button" class="layui-btn layui-hide layui-btn-sm" id="startUploadInstruction"
                                            style="margin-left: 30px;">开始上传
                                    </button>
                                </div>
                            </div>
                        </div>
                        <input type="text" name="instructionId" id="instructionInput" lay-verify="required" style="display: none;">
                    </blockquote>
                </div>
            </div>
        </div>
                       <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1">
                <div class="layui-form-item">
                <label class="layui-form-label">模型文件：</label>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 20px;">
                        <div id="uploadModelFile" class="layui-upload">
                            <div class="layui-upload-list">
                            <div></div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-xs4" style="margin-left:100px">
                                    <button type="button" class="layui-btn layui-btn-sm" id="uploadModel" >
                                        <i class="layui-icon">&#xe67c;</i>模型文件更改
                                    </button>
                                </div>
                                <div id="startModelDiv">
                                    <button type="button" class="layui-btn layui-hide layui-btn-sm" id="startUploadModel"
                                            style="margin-left: 30px;">开始上传
                                    </button>
                                </div>
                            </div>
                        </div>
                        <input type="text" name="modelId" id="modelInput" lay-verify="required" style="display: none;">
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs10 layui-col-xs-offset1" style="margin-top: 30px;">
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="addObject">确认保存</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['form', 'element', 'jquery', 'upload'], function () {
        var form = layui.form;
        var element = layui.element;
        var $ = layui.jquery;
        var upload = layui.upload;

        //单文件示例  选完文件后不自动上传
        var uploaddwg = upload.render({
            elem: '#uploaddwg'
            , url: '/web/api/upload/upload?option=4'
            , accept: 'images'  // 允许上传的文件类型
            , size: 2048        // 最大允许上传的文件大小  单位 KB
            , auto: false
            , bindAction: '#startUploadDwg'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#dwgshow').attr('src', result); //图片链接（base64）   
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) {
                    //上传成功
                    $("#dwgInput").val(res.data[0].fp_relative);
                    $("#uploadDwg").addClass("layui-hide");
                    var startDiv = $('#startDwgDiv');
                    startDiv.html('<span style="color: #5FB878;font-size: 17px;">修改成功</span>');
                } else {
                    this.error(index, upload);
                }
            }
            , error: function (index, upload) {
                //演示失败状态，并实现重传
                var startDiv = $('#startDwgDiv');
                startDiv.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>');
                startDiv.find('.demo-reload').on('click', function () {
                	uploaddwg.upload();
                });
            }
        });
        //单文件示例  选完文件后不自动上传
        var uploadInstruction = upload.render({
            elem: '#uploadInstruction'
            , url: '/web/api/upload/upload?option=4'
            , accept: 'pdf'  // 允许上传的文件类型
            , size: 2048        // 最大允许上传的文件大小  单位 KB
            , auto: false
            , bindAction: '#startUploadInstruction'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                   // $('#qrshow').attr('src', result); //图片链接（base64）   
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) {
                    //上传成功
                    $("#instructionInput").val(res.data[0].fp_relative);
                    $("#uploadInstruction").addClass("layui-hide");
                    var startDiv = $('#startInstructionDiv');
                    startDiv.html('<span style="color: #5FB878;font-size: 17px;">修改成功</span>');
                } else {
                    this.error(index, upload);
                }
            }
            , error: function (index, upload) {
                //演示失败状态，并实现重传
                var startDiv = $('#startInstructionDiv');
                startDiv.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>');
                startDiv.find('.demo-reload').on('click', function () {
                	uploadInstruction.upload();
                });
            }
        });
        //单文件示例  选完文件后不自动上传
        var uploadModel = upload.render({
            elem: '#uploadModel'
            , url: '/web/api/upload/upload?option=4'
            , accept: 'dae'  // 允许上传的文件类型
            , size: 2048        // 最大允许上传的文件大小  单位 KB
            , auto: false
            , bindAction: '#startUploadModel'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                   //' $('#show').attr('src', result); //图片链接（base64）   
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) {
                    //上传成功
                    $("#modelInput").val(res.data[0].fp_relative);
                    $("#uploadModel").addClass("layui-hide");
                    var startDiv = $('#startModelDiv');
                    startDiv.html('<span style="color: #5FB878;font-size: 17px;">修改成功</span>');
                } else {
                    this.error(index, upload);
                }
            }
            , error: function (index, upload) {
                //演示失败状态，并实现重传
                var startDiv = $('#startModelDiv');
                startDiv.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>');
                startDiv.find('.demo-reload').on('click', function () {
                	uploadModel.upload();
                });
            }
        });
        // 监听修改客服二维码事件
        $("#uploadInstruction").on("click", function () {
            $("#startUploadInstruction").removeClass('layui-hide');
        });
        $("#uploadDwg").on("click", function () {
            $("#startUploadDwg").removeClass('layui-hide');
        });
        $("#uploadModel").on("click", function () {
            $("#startUploadModel").removeClass('layui-hide');
        });
        // 绑定提交事件
        form.on("submit(addObject)", function (data) {
            $.ajax({
                url: "/web/api/seller/update",
                type: "post",
                data: data.field,
                dataType: "json",
                success: function (response) {
                    if (response["status"] == 0) {
                        layer.msg("更新成功", {
                            icon: 1,
                            time: 1500 // 1.5秒，默认三秒
                        }, function () { // 关闭回调，关闭层刷新页面
                            var index = parent.layer.getFrameIndex(window.name);  // 先得到当前iframe层的索引
                            parent.layer.close(index);
                        });
                    } else {
                        layer.msg(response["msg"], {
                            icon: 1,
                            time: 1500 // 1.5秒，默认三秒
                        });
                    }

                    return false;
                },
                error: function (response) {
                    layer.msg(response["msg"], {
                        icon: 1,
                        time: 1500 // 1.5秒，默认三秒
                    });
                    return false;
                }
            });

            return false; // 关闭表单提交
        });
    });


</script>
</body>
</html>
