<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function addIframe(){
	var iframe = document.createElement('iframe'); 
	iframe.src="//www.jb51.net";  
	var rs = document.getElementById('add');
	rs.appendChild(iframe);
	
}
</script>
<button onclick="addIframe()">测试iframe页面添加</button>
<div id="add"></div>
<iframe src="http://localhost:8080/dev/"></iframe>

</body>
</html>