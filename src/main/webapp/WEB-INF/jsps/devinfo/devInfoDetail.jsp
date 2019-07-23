<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>layui</title>
  <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
  <link rel="stylesheet" href="./layui/css/layui.css"  media="all"/>
  <link rel="stylesheet" href="./js/bootstrap.min.css" />
<link rel="stylesheet" href="./js/font-awesome.min.css" />
<script src="./js/bootstrap.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>设备图片展示</legend>
</fieldset>    
 
<center><div class="layui-carousel" id="test10" style="">
  <div carousel-item="aa" id="carousel">
  </div>
</div></center>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>设备详情</legend>
</fieldset>    
<form class="layui-form" id="taskForm" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">设备名称</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tName" required lay-verify="required"
					placeholder="名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">设备类型</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="类型" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">设备编号</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="编号" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">购买时间</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="时间" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">保修到期时间</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="到期时间" autocomplete="off"
					class="layui-input">
			</div>
		</div>
				<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">供应商</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="供应商" autocomplete="off"
					class="layui-input">
			</div>
		</div>
			<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">部门</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="部门" autocomplete="off"
					class="layui-input">
			</div>
		</div>
					<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">所在位置</label>
			<div class="layui-input-block" style="width: 500px">
				<input type="text" name="tStarter" id="tStarter" required
					lay-verify="required" placeholder="位置" autocomplete="off"
					class="layui-input">
			</div>
		</div>

	</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>巡检记录</legend>
</fieldset> 

 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>故障记录</legend>
</fieldset> 	
<script src="./layui/layui.js" charset="utf-8"></script>
<script>
$.ajax({
	url : './devInfoMana/loadImg.do?id=1',
	type : 'POST',
	success : function(data) {
		$("#carousel").append(data);
	}
});
</script>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '778px'
    ,height: '440px'
    ,interval: 5000
  });
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });
  
  $('.demoSet').on('keyup', function(){
    var value = this.value
    ,options = {};
    if(!/^\d+$/.test(value)) return;
    
    options[this.name] = value;
    ins3.reload(options);
  });
  
  //其它示例
  $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>

</body>
</html>