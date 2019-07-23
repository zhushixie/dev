<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript">
</script>
</head>

<body>

<h2>Hello World!</h2>

<a href="./activiti.do">activiti</a>
  <form action="./create.do" method="get">
    <input type="text" id="name" name="name"></input>
    <input type="text" id="key" name="key"></input>
    <input type="text" id="description" name="description"></input>
    <input type="submit" value="提交">
  </form>
  <div>
  <button value="显示模板"></button>
  </div>
</body>
</html>
