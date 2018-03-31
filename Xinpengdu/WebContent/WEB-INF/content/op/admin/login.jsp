<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">

	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/op/css/login/loginpage.css"/>

	<title>新鹏都装饰后台管理专业版</title>
</head>
<body>
<form method="post" action="<%= request.getContextPath() %>/op/login">
	<div id="land">
		<h1>
			<img src="<%= request.getContextPath() %>/op/img/login/logo2.png" width="187" height="127">
		</h1>
		<div class="land_con">
			<dl>
				<dt>新鹏都装饰后台管理专业版</dt>
				<dd>
					<p>请输入用户名：</p>
					<input name="loginName" type="text" id="loginName" class="land_input">
				</dd>
				<dd>
					<p>密 码：</p>
					<input name="operaterPwd" type="password" id="operaterPwd" class="land_input">
				</dd>
				<div class="input_c" id="error" style="display: none;color: red;width:200px;"></div>
				<dd>
					<input type="submit" name="btnLogin" value="" id="btnLogin" class="land_butt" onclick="return empltyValidate()">
					<input name="" type="reset" class="land_butt2" value=" ">
				</dd>
				<c:if test="${error}">
					<div class="alert alert-warning">
						<i class="icons-l-info"></i>账号或密码错误，请重试或联系管理员。
					</div>
				</c:if>

				<c:if test="${disabled}">
					<div class="alert alert-warning">
						<i class="icons-l-info"></i>该账号已禁止登陆
					</div>
				</c:if>
			</dl>
		</div>
		<div class="banquan">
			版权所有 深圳市新鹏都装饰有限公司 All Rights Reserved. 粤ICP备05140444号<br>
			技术支持：互联网科技
		</div>
	</div>
</form>
<script src="<%= request.getContextPath() %>/op/lib/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script>
	$(function() {
		$("#loginName").focus();

		// 处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外
		function banBackSpace(e) {
			var ev = e || window.event;// 获取event对象
			var obj = ev.target || ev.srcElement;// 获取事件源

			var t = obj.type || obj.getAttribute('type');// 获取事件源类型

			// 获取作为判断条件的事件类型
			var vReadOnly = obj.getAttribute('readonly');
			var vEnabled = obj.getAttribute('enabled');
			// 处理null值情况
			vReadOnly = (vReadOnly == null) ? false : true;
			vEnabled = (vEnabled == null) ? true : vEnabled;

			// 当敲Backspace键时，事件源类型为密码或单行、多行文本的，
			// 并且readonly属性为true或enabled属性为false的，则退格键失效
			var flag1 = (ev.keyCode == 8 && (t == "operaterPwd" || t == "text" || t == "textarea") && (vReadOnly || vEnabled != true)) ? true : false;

			// 当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
			var flag2 = (ev.keyCode == 8 && t != "operaterPwd" && t != "text" && t != "textarea") ? true : false;

			// 判断
			if (flag2) {
				return false;
			}
			if (flag1) {
				return false;
			}
		}

//		// 禁止后退键 作用于Firefox、Opera
//		document.onkeypress = banBackSpace;
//		// 禁止后退键 作用于IE、Chrome
//		document.onkeydown = banBackSpace;
		window.history.forward(1);// 屏蔽浏览器自带的后退键
	});
</script>
<!--[if lt IE 9]>
<script>
	$(function() {
		alert('浏览器版本偏低，建议使用IE9以上版本的浏览器或其他浏览器');
	});
</script>
<![endif]-->
<script type="text/javascript">

	var showError = function (msg) {
		$("#error").css("display", "block");
		$("#error").empty().append(msg);
	};

	$(function () {
		$("#loginName").focus();
		var code = "${param.code}";
		if (code) {
			try {
				var codeAsInt = parseInt(code, 10);
				switch (codeAsInt) {
					case 1:
						showError("用户名或密码错误！");
						break;
					default:
						showError("用户名或密码错误！");
						break;
				}
			} catch (e) {
				showError("用户名或密码错误！");
			}
		}
	});

	//输入为空的验证
	function empltyValidate() {
		if ($("#loginName")[0].value == "") {
			showError("请输入用户名！");
			$("#loginName")[0].focus();
			return false;
		}
		if ($("#operaterPwd")[0].value == "") {
			showError("请输入密码！");
			$("#operaterPwd")[0].focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>
