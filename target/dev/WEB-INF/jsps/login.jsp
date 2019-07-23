<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="style/login.css"/>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="./layui/css/layui.css" media="all" />
<link rel="stylesheet" href="./css/login.css" media="all" />
<link rel="stylesheet" href="./css/base.css" media="all" />
</head>
<body>
	<div class="layui-header login-header header">
		<div class="layui-main">
			<div class="login-logo">
				<a class="logo" href="/"> 设备信息管理系统 </a>
			</div>
		</div>
	</div>
<div id="home">
    <label id="tips"></label>
    <form id="login"  class="current1 layui-form" method="post">           
        <h3>用户登入</h3>
        <img class="avator" src="res/head.jpg" width="96" height="96"/>
        <label>邮箱/名称<input type="text" name="ac_name" id="userName" style="width:215px;" /><span>邮箱为空</span></label>
        <label>密码<input type="password" id="pwd" name="ac_pwd"  /><span>密码为空</span></label>
        <button type="button" id="suubmitbt" class="layui-btn" lay-filter="login">登入</button>   

    </form> 
</div>
<script type="text/javascript" src="./layui/layui.js"></script>

<script type="text/javascript">

	layui.use(['layer','form'], function(){
		var $ = layui.jquery,
		layer = layui.layer;
		
		function loginSuccess() {
			layer.msg("登录成功", {icon:6, time:1000}, function(index){
	            layer.close(index);
	            window.location.href = './main';
	        });
		}
		function loginError(msg) {
			layer.msg(msg, {icon:5, time:2000}, function(index){
	            layer.close(index);
	        });
		}
		$("#login").addClass("current");    
	    
	    /**
	     * 正则检验邮箱
	     * email 传入邮箱
	     * return true 表示验证通过
	     */
	    function check_email(email) {
	        if (/^[\w\-\.]+@[\w\-]+(\.[a-zA-Z]{2,4}){1,2}$/.test(email)){
	            return true;
	        }
	    }
	    
	    /**
	     * input 按键事件keyup
	     */
	    $("input[name]").keyup(function(e){
	          //禁止输入空格  把空格替换掉(空格的ASCII为32)
	        if($(this).attr('name')=="pwd" && e.keyCode==32){
	            $(this).val(function(i,v){
	                return $.trim(v);
	            });
	        }
	        if($.trim($(this).val())!=""){
	            $(this).nextAll('span').eq(0).css({display:'none'}); 
	        }
	    });
	    
	    //错误信息
	    var succ_arr=[];
	    
	    /**
	     * input失去焦点事件focusout
	     * 这跟blur事件区别在于，他可以在父元素上检测子元素失去焦点的情况。
	     */
	    $("input[name]").focusout(function(e){
	        var msg="";
	        if($.trim($(this).val())==""){
	            if($(this).attr('name')=='userName'){
	                succ_arr[0]=false;
	                msg="登入名为空";
	            }else if($(this).attr('name')=='pwd'){
	                succ_arr[1]=false;
	                msg="密码为空";
	            }     
	        }else{
	            if($(this).attr('name')=='userName'){
	                succ_arr[0]=true; 
	            }else if($(this).attr('name')=='pwd'){
	                succ_arr[1]=true;
	            }
	        }
	        $(this).nextAll('span').eq(0).css({display:'block'}).text(msg);
	    });
	//    

	    $("button[type='button']").click(function(){
	        $("input[name]").focusout();  //让所有的input标记失去一次焦点来设置msg信息
	        for (x in succ_arr){
	            if(succ_arr[x]==false) return;
	        }
	  		var $btnLogin = $("button[lay-filter='login']");
	  		$btnLogin.addClass('layui-btn-disabled').text('登录中...');
	  		
	        var Username = $("#userName").val();  
	        var Pwd = $("#pwd").val();
	        
	        var $btnLogin = $("button[lay-filter='login']");
	        $.post("doLogin.do", {ac_name:Username,ac_pwd:Pwd}, function (rs) {
	        	ret = JSON.parse(rs);
				if (ret.status == 200) {
					loginSuccess();
				} else {
					loginError(ret.msg);
				}
				$btnLogin.removeClass('layui-btn-disabled').text('立即登录');
	        });

	    });
	    $("#login").submit(function(){
	    	$("input[name]").focusout(); 
	    	if(succ_arr[0]==false||succ_arr[1]==false){
	    		return false;
	    	}	
	    	return true;
	    });
	});
	</script>

</body>
</html>