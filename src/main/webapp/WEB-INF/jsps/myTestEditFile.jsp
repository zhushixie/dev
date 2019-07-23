<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>部门管理</title><style type="text/css">.navi {	height: 60px;	top: 5px;	margin-top: 20px;	margin-left: 20px;	margin-right: 20px;}.layui-btn {	margin-top: 15px;	margin-bottom: 10px;	margin-left: 10px;}.btnPos {	margin-left: 50px;}#tablePos {	margin-left: 20px;	margin-right: 20px;}</style><link href="./layui/css/layui.css" rel="stylesheet" /><script src="js/jquery-3.3.1.js" type="text/javascript"></script><script type="text/javascript" src="./layui/layui.js"></script><link rel="stylesheet" href="./js/bootstrap.min.css"/><link rel="stylesheet" href="./js/font-awesome.min.css"/><script src="./js/bootstrap.min.js"></script></head><body>	<div class="layui-container" style="margin-top: 30px;">    <form class="layui-form layui-form-pane" lay-filter="updateForm">        <input type="text" name="seller_id" lay-verify="required" style="display: none;">        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1">                <div class="layui-form-item">                    <label class="layui-form-label">商铺名称</label>                    <div class="layui-input-block">                        <input type="text" lay-verify="required" name="name" autocomplete="off" class="layui-input">                    </div>                </div>            </div>        </div>        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1">                <div class="layui-form-item">                    <label class="layui-form-label">商铺编号</label>                    <div class="layui-input-block">                        <input type="text" name="code" autocomplete="off" class="layui-input">                    </div>                </div>            </div>        </div>        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1">                <div class="layui-form-item">                    <label class="layui-form-label">详细地址</label>                    <div class="layui-input-block">                        <input type="text" name="address" required lay-verify="required" autocomplete="off"                               class="layui-input">                    </div>                </div>            </div>        </div>        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1">                <div class="layui-form-item">                    <label class="layui-form-label">联系方式</label>                    <div class="layui-input-block">                        <input type="text" name="contact" required lay-verify="required|phone" autocomplete="off"                               class="layui-input">                    </div>                </div>            </div>        </div>        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1">                <div class="layui-form-item">                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">                        <div id="uploadQRcode" class="layui-upload">                            <div class="layui-upload-list">                                <img id="qrshow" src="" alt="" class="layui-upload-img"                                     style="height: 100px;width:100px;border:1px solid black;">                            </div>                            <div class="layui-row">                                <div class="layui-col-xs4">                                    <button type="button" class="layui-btn layui-btn-sm" id="uploadQR">                                        <i class="layui-icon">&#xe67c;</i>修改客服二维码                                    </button>                                </div>                                <div id="startDiv">                                    <button type="button" class="layui-btn layui-hide layui-btn-sm" id="startUploadQR"                                            style="margin-left: 30px;">开始上传                                    </button>                                </div>                            </div>                            <div style="color: #c2c2c2;margin:10px 0;">温馨提示: 每次最多上传一张图片, 单张图片的大小不超过2MB</div>                        </div>                        <input type="text" name="old_cli_qrcode" style="display: none;">                        <input type="text" name="cli_qrcode" id="qrInput" lay-verify="required" style="display: none;">                    </blockquote>                </div>            </div>        </div>        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1">                <div class="layui-form-item">                    <div id="uploadImg" class="layui-upload">                        <div class="layui-upload-list">                            <table class="layui-table" style="text-align: center;">                                <thead>                                <tr>                                    <th style="text-align: center;">图片预览</th>                                    <th style="text-align: center;">状态</th>                                    <th style="text-align: center;">操作</th>                                </tr>                                </thead>                                <tbody id="imgList"></tbody>                            </table>                        </div>                        <div class="layui-row">                            <div class="layui-col-xs4">                                <button type="button" class="layui-btn layui-btn-sm" id="upload">                                    <i class="layui-icon">&#xe67c;</i>添加商铺图片                                </button>                            </div>                            <div class="layui-col-xs3 layui-col-xs-offset5">                                <button type="button" class="layui-btn layui-btn-fluid layui-btn-sm" id="startUpload">                                    开始上传                                </button>                            </div>                        </div>                        <div style="color: #c2c2c2;margin:10px 0;">温馨提示: 每次最多上传六张图片, 单张图片的大小不超过5MB, 长宽比例推荐1.5:1,                            推荐上传图片长675px,宽450px                        </div>                    </div>                    <input type="text" name="old_face_img" style="display: none;">                    <input type="text" name="face_img" id="imgInput" lay-verify="required" style="display: none;">                </div>            </div>        </div>        <div class="layui-row">            <div class="layui-col-xs10 layui-col-xs-offset1" style="margin-top: 30px;">                <div class="layui-form-item">                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="addObject">确认保存</button>                </div>            </div>        </div>    </form></div><script src="{{static_url('layui/layui.js')}}" charset="utf-8"></script><!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --><script>    layui.use(['form', 'element', 'jquery', 'upload'], function () {        var form = layui.form;        var element = layui.element;        var $ = layui.jquery;        var upload = layui.upload;        //单文件示例  选完文件后不自动上传        var uploadSingle = upload.render({            elem: '#uploadQR'            , url: '/web/api/upload/upload?option=4'            , accept: 'images'  // 允许上传的文件类型            , size: 2048        // 最大允许上传的文件大小  单位 KB            , auto: false            , bindAction: '#startUploadQR'            , choose: function (obj) {                //预读本地文件示例，不支持ie8                obj.preview(function (index, file, result) {                    $('#qrshow').attr('src', result); //图片链接（base64）                });            }            , done: function (res, index, upload) {                if (res.code == 0) {                    //上传成功                    $("#qrInput").val(res.data[0].fp_relative);                    $("#uploadQR").addClass("layui-hide");                    var startDiv = $('#startDiv');                    startDiv.html('<span style="color: #5FB878;font-size: 17px;">修改成功</span>');                } else {                    this.error(index, upload);                }            }            , error: function (index, upload) {                //演示失败状态，并实现重传                var startDiv = $('#startDiv');                startDiv.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>');                startDiv.find('.demo-reload').on('click', function () {                    uploadSingle.upload();                });            }        });        //多文件列表示例        var demoListView = $('#imgList');        var totalArray = new Array();        var uploadInst = upload.render({            elem: '#upload' //绑定元素            , url: '/web/api/upload/upload?option=3' //上传接口            , accept: 'images'  // 允许上传的文件类型            // , acceptMime: 'image/jpg,image/png'   // (只支持jpg和png格式，多个用逗号隔开),            , size: 5120        // 最大允许上传的文件大小  单位 KB            , auto: false //选择文件后不自动上传            , bindAction: '#startUpload' //指向一个按钮触发上传            , multiple: true   // 开启多文件上传            , number: 6    //  同时上传文件的最大个数            , choose: function (obj) {                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列                var totalArray = Object.keys(files);                // 检查上传文件的个数                if (totalArray.length < (7 - demoListView.data("choiceTotal"))) {                    //读取本地文件                    obj.preview(function (index, file, result) {                        var tr = $(['<tr id="upload-' + index + '">'                            , '<td><img src="' + result + '" alt="' + file.name + '" class="layui-upload-img" style="height: 66px;width:100px;"></td>'                            , '<td>等待上传</td>'                            , '<td>'                            , '<button class="layui-btn layui-btn-sm demo-reload layui-hide">重传</button>'                            , '<button class="layui-btn layui-btn-sm layui-btn-danger demo-delete">删除</button>'                            , '</td>'                            , '</tr>'].join(''));                        //单个重传                        tr.find('.demo-reload').on('click', function () {                            obj.upload(index, file);                        });                        //删除                        tr.find('.demo-delete').on('click', function () {                            delete files[index]; //删除对应的文件                            tr.remove();                            uploadInst.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选                            totalArray.splice(totalArray.indexOf(index), 1);                        });                        demoListView.append(tr);                    });                } else {                    // 超出上传最大文件                    layer.msg("上传文件最大不超过6个");                    totalArray.pop();                }            }            , done: function (res, index, upload) {                if (res.code == 0) { //上传成功                    // 上传成功后将图片路径拼接到input中，多个路径用","分割                    var inputVal = document.getElementById("imgInput").value;                    var valData = "";                    if (inputVal) {                        valData = inputVal + "," + res.data[0].fp_relative;                    } else {                        valData = res.data[0].fp_relative;                    }                    document.getElementById("imgInput").value = valData;                    var tr = demoListView.find('tr#upload-' + index)                        , tds = tr.children();                    tds.eq(1).html('<span style="color: #5FB878;">上传成功</span>');                    tds.eq(2).html(''); //清空操作                    return delete this.files[index]; //删除文件队列已经上传成功的文件                }                this.error(index, upload);            }            , error: function (index, upload) {                var tr = demoListView.find('tr#upload-' + index)                    , tds = tr.children();                tds.eq(1).html('<span style="color: #FF5722;">上传失败</span>');                tds.eq(2).find('.demo-reload').removeClass('layui-hide'); //显示重传            }        });        // 监听修改客服二维码事件        $("#uploadQR").on("click", function () {            $("#startUploadQR").removeClass('layui-hide');        });        // 处理图片的修改        demoListView.on('click', '.edit-btn', function () {            var csid = $(this).attr("csid");            var startid = $(this).attr("startid");            var currentIndex = parseInt(csid.split("_")[1]);            var $currentTr = $(this).parent().parent();            $(this).addClass("layui-hide");            $("#" + csid).removeClass("layui-hide");            $("#" + startid).removeClass("layui-hide");            var uploadEdit = upload.render({                elem: '#' + csid                , url: '/web/api/upload/upload?option=3'                , accept: 'images'  // 允许上传的文件类型                , size: 2048        // 最大允许上传的文件大小  单位 KB                , auto: false                , bindAction: '#' + startid                , choose: function (obj) {                    //预读本地文件示例，不支持ie8                    obj.preview(function (index, file, result) {                        $currentTr.children().eq(0).html('<img src="' + result + '" alt="" class="layui-upload-img" style="height: 66px;width:100px;">') //图片链接（base64）                    });                }                , done: function (res, index, upload) {                    if (res.code == 0) {                        //上传成功                        var InputTag = $("#imgInput");                        var oldInputStrList = InputTag.val().split(",");                        oldInputStrList[currentIndex] = res.data[0].fp_relative;                        var newInputStr = oldInputStrList.join(",");                        InputTag.val(newInputStr);                        $currentTr.children().eq(1).text("修改成功");                        $currentTr.children().eq(2).html("");                    } else {                        this.error(index, upload);                    }                }                , error: function (index, upload) {                    //演示失败状态，并实现重传                    var fileHtml = '<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>';                    $currentTr.children().eq(2).html(fileHtml);                    $currentTr.find('.demo-reload').on('click', function () {                        uploadEdit.upload();                    });                }            });        });        // 处理图片的删除        demoListView.on("click", '.delete-btn', function () {            var delid = this.id;            var currentDelIndex = parseInt(delid.split("_")[1]);            var theCurrentTr = $(this).parent().parent();            // 更新表格中当前行后面每一行的序号            // 找到当前行后面的每一行            theCurrentTr.nextAll().each(function () {                // each中的this和外面的this不一样了!                var oldCsid = $(this).children().eq(2).find(".edit-btn").attr("csid");                var oldStarid = $(this).children().eq(2).find(".edit-btn").attr("startid");                var oldChoiceid = $(this).children().eq(2).find(".choice-btn").attr("id");                var oldUploadid = $(this).children().eq(2).find(".upload-btn").attr("id");                var oldDelid = $(this).children().eq(2).find(".delete-btn").attr("id");                if (oldDelid && oldCsid) {                    $(this).children().eq(2).find(".edit-btn").attr("csid", oldCsid.split("_")[0] + "_" + (oldCsid.split("_")[1] - 1));                    $(this).children().eq(2).find(".edit-btn").attr("startid", oldStarid.split("_")[0] + "_" + (oldStarid.split("_")[1] - 1));                    $(this).children().eq(2).find(".choice-btn").attr("id", oldChoiceid.split("_")[0] + "_" + (oldChoiceid.split("_")[1] - 1));                    $(this).children().eq(2).find(".upload-btn").attr("id", oldUploadid.split("_")[0] + "_" + (oldUploadid.split("_")[1] - 1));                    $(this).children().eq(2).find(".delete-btn").attr("id", oldDelid.split("_")[0] + "_" + (oldDelid.split("_")[1] - 1));                }            });            // 找到当前行,删除            theCurrentTr.remove();            // 修改新的input框中的值            var delInputTag = $("#imgInput");            var oldDelInputStrList = delInputTag.val().split(",");            oldDelInputStrList.splice(currentDelIndex, 1);            var delnewInputStr = oldDelInputStrList.join(",");            delInputTag.val(delnewInputStr);            // 修改全局可上传文件的总个数            var $currentTotal = demoListView.data("choiceTotal");            demoListView.data("choiceTotal", $currentTotal - 1);        });        // 填充管理员详情        $.ajax({            url: "/web/api/seller/detail?seller_id={{seller_id}}",            type: "get",            dataType: "json",            success: function (response) {                console.log(response);                $("#qrshow").attr("src", response.data.qrcode_url);                var faceList = response.data.face_url_list;                demoListView.data("choiceTotal", faceList.length);                if (faceList) {                    for (var i = 0; i < faceList.length; i++) {                        var trEle = document.createElement("tr");                        var trHtml = '<td><img src="' + faceList[i] + '" alt="" class="layui-upload-img" style="height: 66px;width:100px;"></td>'                            + '<td>等待修改</td><td><button type="button" class="layui-btn layui-btn-sm edit-btn" csid="choice_' + i                            + '" startid="startUpload_' + i + '">修改</button><button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-hide choice-btn" id="choice_' + i                            + '" style="margin-right: 10px;">选择图片</button><button type="button" class="layui-btn layui-btn-sm layui-hide upload-btn" id="startUpload_' + i + '">上传</button>' +                            '<button type="button" class="layui-btn layui-btn-sm delete-btn" id="delete_' + i + '">删除</button></td>';                        trEle.innerHTML = trHtml;                        $("#imgList").append(trEle);                    }                }                form.val("updateForm", {                    "seller_id": response.data.id,                    "name": response.data.name,                    "code": response.data.code,                    "address": response.data.address,                    "contact": response.data.contact,                    "cli_qrcode": response.data.cli_qrcode,                    "old_cli_qrcode": response.data.cli_qrcode,                    "face_img": response.data.face_img,                    "old_face_img": response.data.face_img                });                form.render();            }        });        // 绑定提交事件        form.on("submit(addObject)", function (data) {            $.ajax({                url: "/web/api/seller/update",                type: "post",                data: data.field,                dataType: "json",                success: function (response) {                    if (response["code"] == 0) {                        layer.msg("更新成功", {                            icon: 1,                            time: 1500 // 1.5秒，默认三秒                        }, function () { // 关闭回调，关闭层刷新页面                            var index = parent.layer.getFrameIndex(window.name);  // 先得到当前iframe层的索引                            parent.layer.close(index);                        });                    } else {                        layer.msg(response["msg"], {                            icon: 1,                            time: 1500 // 1.5秒，默认三秒                        });                    }                    return false;                },                error: function (response) {                    layer.msg(response["msg"], {                        icon: 1,                        time: 1500 // 1.5秒，默认三秒                    });                    return false;                }            });            return false; // 关闭表单提交(注意：此处不能省略，此处不能省略，此处不能省略。。。 否则页面刷新有问题)        });    });</script></body></html>