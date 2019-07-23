<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />    
<title>流程设计模型</title>
<style>
    label, input { display:block; text-align: left;}
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    textarea { margin:0 auto; width:100%; height:60px; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
          <table class="tableHue1" width="100%" border="1" bordercolor="#a4d5e3" cellspacing="0" cellpadding="0">
              <thead>
                <tr>
                  	<th>ID</th>
					<th>KEY</th>
					<th>Name</th>
					<th>Version</th>
					<th>创建时间</th>
					<th>最后更新时间</th>
					<th>元数据</th>
					<th>操作</th>
                </tr>
              </thead>
              <tbody id="tbody">
              <C:forEach items="${go}" var="model">
				<tr>
					<td>${model.id }</td>
					<td>${model.key }</td>
					<td>${model.name}</td>
					<td>${model.version}</td>
					<td>${model.createTime}</td>
					<td>${model.lastUpdateTime}</td>
					<td>${model.metaInfo}</td>
					<td>
						<a href="./service/editor?id=${model.id}" target="_blank">编辑</a>|
						<a href="./deploy.do?modelId=${model.id}">部署</a>|
						<a href="./export.do?modelId=${model.id}" target="_blank">导出</a>|
                        <a href="./delete.do?modelId=${model.id}">删除</a>
					</td>
				</tr>
			</C:forEach>
              </tbody>
          </table>
</body>
</html>