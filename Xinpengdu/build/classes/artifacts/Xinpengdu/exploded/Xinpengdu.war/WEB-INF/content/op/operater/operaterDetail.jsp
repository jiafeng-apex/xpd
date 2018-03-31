<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">

    <jsp:include page="../admin/header.jsp"/>

    <title>新鹏都装饰后台管理专业版</title>
</head>
<style>
    html,body{
        height:100%;
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
                        <h4>用户信息
                            <small>User Informations</small>
                        </h4>
                        <div class="pull-right">
                            <a href="#"><i class="icons-print"></i></a>
                        </div>
                    </div>

                    <div id="operaterContainer" class="form-horizontal" style="width:100%;height:89vh;margin-top: 30px">
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">登录名称</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" >${operater.loginName}</p>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">操作员姓名</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" >${operater.operaterName}</p>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">部门</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" >${operater.deptName}</p>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="col-sm-3 control-label">岗位</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" >
                                    <c:if test="${operater.postId==1}">
                                        系统管理员
                                    </c:if>
                                    <c:if test="${operater.postId==2}">
                                        一般管理员
                                    </c:if>
                                </p>
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