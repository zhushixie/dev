<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发布任务</title>
<style type="text/css">
.navi {
	height: 60px;
	top: 5px;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

.layui-btn {
	margin-top: 15px;
	margin-bottom: 10px;
	margin-left: 10px;
}
</style>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./layui/layui.js"></script>
<link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="layui-container" style="margin-top: 30px;">

    <form class="layui-form layui-form-pane">
        <div class="layui-row">
            <div class="layui-col-xs8 layui-col-xs-offset2">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备名称<span style="color: red;font-size: 20px;">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="name" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs8 layui-col-xs-offset2">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="code" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs8 layui-col-xs-offset2">
                <div class="layui-form-item">
                    <label class="layui-form-label">生产厂家</label>
                    <div class="layui-input-block">
                        <input type="text" name="code" autocomplete="off" class="layui-input">
                    </div>
                  
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs8 layui-col-xs-offset2">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备图纸信息<span style="color: red;font-size: 20px;">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required lay-verify="required" autocomplete="off"
                               class="layui-input">
                        <a href="http://localhost:8080/dev/">查看详情</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs8 layui-col-xs-offset2">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备说明书<span style="color: red;font-size: 20px;">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="contact" required lay-verify="required|phone" autocomplete="off"
                               class="layui-input">
                               <a href="http://localhost:8080/dev/pdfs/${instructionId}">查看详情</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs8 layui-col-xs-offset2">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备模型<span style="color: red;font-size: 20px;">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="contact" required lay-verify="required|phone" autocomplete="off"
                               class="layui-input">
                               <a href="javascript:showModel()">查看详情</a>
                    </div>
                </div>
            </div>
        </div>
    </form>


</div>
<script>
function showModel(){
	window.open("http://localhost:8080/dev/showModel?model=${modelId}");
}
    layui.use(['table', 'form', 'element', 'upload'], function () {
        var table = layui.table;
        var form = layui.form;
        var element = layui.element;
        var $ = layui.jquery;
        var upload = layui.upload;

        //单文件示例  选完文件后不自动上传
        var uploadSingle = upload.render({
            elem: '#uploadQR'
            , url: '/web/api/upload/upload?option=4'
            , accept: 'images'  // 允许上传的文件类型
            , size: 2048        // 最大允许上传的文件大小  单位 KB
            , auto: false
            , bindAction: '#startUploadQR'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#qrshow').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) {
                    //上传成功
                    $("#qrInput").val(res.data[0].fp_relative);
                    var startDiv = $('#startDiv');
                    startDiv.html('<span style="color: #5FB878;">上传成功</span>');
                } else {
                    this.error(index, upload);
                }
            }
            , error: function (index, upload) {
                //演示失败状态，并实现重传
                var startDiv = $('#startDiv');
                startDiv.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>');
                startDiv.find('.demo-reload').on('click', function () {
                    uploadSingle.upload();
                });
            }
        });

        //多文件列表示例
        var demoListView = $('#imgList');
        var totalArray = new Array();
        var uploadInst = upload.render({
            elem: '#upload' //绑定元素
            , url: '/web/api/upload/upload?option=3' //上传接口
            , accept: 'images'  // 允许上传的文件类型
            // , acceptMime: 'image/jpg,image/png'   // (只支持jpg和png格式，多个用逗号隔开),
            , size: 5120        // 最大允许上传的文件大小  单位 KB
            , auto: false //选择文件后不自动上传
            , bindAction: '#startUpload' //指向一个按钮触发上传
            , multiple: true   // 开启多文件上传
            , number: 6    //  同时上传文件的最大个数
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                var arr = Object.keys(files);
                totalArray = totalArray.concat(arr);
                // 检查上传文件的个数
                if (totalArray.length <= 6) {
                    //读取本地文件
                    obj.preview(function (index, file, result) {
                        var tr = $(['<tr id="upload-' + index + '">'
                            , '<td><img src="' + result + '" alt="' + file.name + '" class="layui-upload-img" style="height: 66px;width:100px;"></td>'
                            , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                            , '<td>等待上传</td>'
                            , '<td>'
                            , '<button class="layui-btn demo-reload layui-hide">重传</button>'
                            , '<button class="layui-btn layui-btn-danger demo-delete">删除</button>'
                            , '</td>'
                            , '</tr>'].join(''));

                        //单个重传
                        tr.find('.demo-reload').on('click', function () {
                            obj.upload(index, file);
                        });

                        //删除
                        tr.find('.demo-delete').on('click', function () {
                            delete files[index]; //删除对应的文件
                            tr.remove();
                            uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                        });

                        demoListView.append(tr);
                    });
                } else {
                    // 超出上传最大文件
                    layer.msg("上传文件最大不超过6个")
                }

            }
            , done: function (res, index, upload) {
                console.log("res", res);
                if (res.code == 0) { //上传成功
                    // 上传成功后将图片路径拼接到input中，多个路径用","分割
                    var inputVal = document.getElementById("imgInput").value;
                    var valData = "";
                    if (inputVal) {
                        valData = inputVal + "," + res.data[0].fp_relative;
                    } else {
                        valData = res.data[0].fp_relative;
                    }
                    document.getElementById("imgInput").value = valData;
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件

                }
                this.error(index, upload);
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });
        form.on("submit(addObject)", function (data) {
            $.ajax({
                url: "/web/api/seller/add",
                type: "post",
                data: data.field,
                dataType: "json",
                success: function (response) {
                    if (response["code"] == 0) {
                        layer.msg("添加成功", {
                            icon: 1,
                            time: 2500 // 默认三秒
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
                }
            });

            return false; // 关闭表单提交
        });
    });
</script>
</body>
</html>