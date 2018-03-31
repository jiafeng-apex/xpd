<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">

    <jsp:include page="../admin/header.jsp"/>

    <script src="<%= request.getContextPath() %>/op/js/form/modifyPassword.js" type="text/javascript"></script>

    <title>新鹏都装饰后台管理专业版</title>
</head>
<style>
    html, body {
        height: 100%;
    }
</style>
<body>

<jsp:include page="../admin/menu.jsp"/>

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="content-inner">
            <!-- 注释范围内填充页面正文部分 -->

            <div id="um_user_management">
                <div class="col-md-12 alarm-page status-view user-management">
                    <div class="page-title">
                        <i class="icons-alarm"></i>
                        <h4>修改密码
                            <small>Modify password</small>
                        </h4>
                        <div class="pull-right">
                            <a href="#"><i class="icons-print"></i></a>
                        </div>
                    </div>

                    <div id="modifyPasswordContainer" class="form-horizontal" style="width:100%;height:89vh;margin-top: 30px">
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">* 旧密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="oldPasswordInput" name="oldPassword" maxLength="50" placeholder="">
                                <div class="alert alert-danger oldPasswordError">旧密码验证错误</div>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">* 新密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="newPasswordInput" name="newPassword" maxLength="50" placeholder="">
                                <div class="alert alert-danger passwordEmpty">密码不能为空</div>
                                <div class="alert alert-danger passwordMinLength">密码长度不能小于6</div>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">* 确认密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="repeatPasswordInput" name="repeatPassword" maxLength="50" placeholder="">
                                <div class="alert alert-danger repeatPasswordDifferent">两次输入密码不一致</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button id="submitButton" class="btn btn-primary" data-loading-text="提交">提交</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>
</body>
</html>