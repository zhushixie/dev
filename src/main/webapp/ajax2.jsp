<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="50%" border="1" cellspacing="1" cellpadding="1" align="center">
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
    </tr>
<C:forEach items="${go}" var="h">
    <tr>
        <td>${h.name}</td>    
        <td>${h.age}</td>
        <td>${h.sex}</td>
    </tr>
</C:forEach>
</table>
</body>
</html>