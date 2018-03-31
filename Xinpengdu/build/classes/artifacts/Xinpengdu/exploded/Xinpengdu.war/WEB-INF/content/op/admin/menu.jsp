<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="<%= request.getContextPath() %>/op/css/format/menu.css"/>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function () {
        $.post(baseUrl + '/op/login/getMenuListData', {userId: '${sessionScope.accessInfo.operaterId}'}, function (response) {
            if (response && response.length > 0) {
                var html = '';
                for (var i = 0; i < response.length; i++) {
                    if (response[i].level == 1) {
                        html += '<li><a href="<%= request.getContextPath() %>' + response[i].menuUrl + '">' +
                                '<i class="icons-menu-system" ></i>' +
                                '<span class="title">' + response[i].menuName + '</span></a><ul class="sub-menu">';

                        for (var j = 0; j < response.length; j++) {
                            if (response[j].level == 2 && response[j].menuParentId == response[i].menuId) {
                                html += '<li><a href="<%= request.getContextPath() %>' + response[j].menuUrl + '"><i class="icons-menu '
                                        + response[j].menuIconClass + '"></i><span class="title">' + response[j].menuName + '</span></a></li>';
                            }
                        }

                        html += '</ul></li>';
                    }
                }

                $('.page-sidebar-menu').append(html);
            }
        }, 'json');
    });
</script>


<div class="page-sidebar">
    <ul class="page-sidebar-menu">
        <li class="logo">
            <img src="<%= request.getContextPath() %>/op/img/login/logo2.png" width="80px"/>
        </li>
        <li style="height: 80px;padding: 10px 10px 10px 15px;">
            <a href="<%= request.getContextPath() %>/op/operater/operaterDetail" style="padding: 0;">
                <img class="img-circle" src="<%= request.getContextPath() %>/op/img/format/user-icon.jpg"/>
            </a>
            <ul class="sub-menu">
                <li>
                    <a href="<%= request.getContextPath() %>/op/operater/operaterDetail">
                        <i class="icons-menu icons-menu-user-info"></i>
                        <span class="title">个人信息</span>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/op/operater/modifyPassword">
                        <i class="icons-menu icons-menu-modify-password"></i>
                        <span class="title">修改密码</span>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/op/logout">
                        <i class="icons-menu icons-menu-logout"></i>
                        <span class="title">退出登录</span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <p id="usernameHolder">${sessionScope.accessInfo.loginName}</p>
        </li>
    </ul>
</div>