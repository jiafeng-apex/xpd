<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>  
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%response.setStatus(200);%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/resources/css/common.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" rel="stylesheet" />
<title>500 程序错误</title>
</head>
<body>
	<h3 class="page-title">系统信息</h3>
	<div class="title-line"></div>
	<div class="databox">
		<div class="databox-title">错误提示&nbsp;</div>
		<div class="databox-body">
			<div class="changepwd formbox">
				<div class="form-group">
					<p id="current">程序错误，请查看日志！</p>
					<br/>
					<%= exception %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
