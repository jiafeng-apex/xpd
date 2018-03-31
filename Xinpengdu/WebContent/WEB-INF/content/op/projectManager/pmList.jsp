<%@ page import="java.util.Locale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">

    <jsp:include page="../admin/header.jsp"/>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.min.css">

    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>

    <script language="JavaScript">

        function projectManagerTableActionFormatter(value, row) {
            if(hasWritePermission("MENU_PROJECT_PM")) {
                var content = '<div class="actionHolder" style="text-align: center;">';
                content += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 5px;background-color: #286090;color: white;" onclick="javascript:removeProjectManager(\'' + row.pmId + '\');">删除</button>';
                content += '</div>';
                return content;
            }
        }
    </script>
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
                        <h4>项目经理</h4>
                        <div id="exportOrderList" class="pull-right">
                            <%--<c:if test="${sessionScope.PERMISSION_MENU_PROJECT_PM_WRITE}">--%>
                                <%--<a href="#"><i class="icons-print"></i></a>--%>
                            <%--</c:if>--%>
                        </div>
                    </div>

                    <div id="orderContainer" style="width:100%;padding-bottom:15px;margin-top:10px;min-height: 610px;">

                        <div class="row" style="margin-bottom: 5px;">
                            <form class="form-inline" role="form">
                                <div class="col-md-9">
                                    <span class="down2">项目经理姓名:</span>
                                    <input id="pmName" style="width: 18%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                                    <a id="searchProjectManager" class="btn btn-sm btn-default glyphicon glyphicon-search"
                                       type="button" style="margin-top: -1px;">
                                    </a>
                                </div>

                                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_PM_WRITE}">
                                    <div class="col-md-3" style="text-align: right;">
                                        <a id="addProjectManager" class="btn btn-sm btn-default" style="background-color: #286090;color: white;">添加</a>
                                    </div>
                                </c:if>
                            </form>
                        </div>

                        <table id="projectManagerTable">
                            <thead>
                            <th data-field="pmName" data-halign="center" data-width="5%" data-align="left">姓名</th>
                            <th data-field="pmSex" data-halign="center" data-width="12%" data-align="left">性别</th>
                            <th data-field="pmPhone" data-halign="center" data-width="12%" data-align="left">手机号码</th>
                            <th data-field="pmTelphone" data-halign="center" data-width="5%" data-align="left">电话号码</th>
                            <th data-field="pmEmail" data-halign="center" data-width="5%" data-align="left">电子邮件</th>
                            <th data-field="projectTotal" data-halign="center" data-width="5%" data-align="right">项目总金额</th>
                            <th data-field="pmFax" data-halign="center" data-width="5%" data-align="left">传真</th>
                            <th data-field="action" data-halign="center" data-width="5%" data-formatter="projectManagerTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 删除项目经理 -->
            <div id="removeProjectManagerModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">删除项目经理</h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <input type="hidden" id="pmIdRemoveModal"/>
                            <p>准备删除项目经理 '<span id="pmNameRemoveModal"></span>'</p>
                            <div class="alert alert-danger projectManagerNotLost">不能删除，已关联项目工程!</div>
                        </div>
                        <div class="modal-footer">
                            <button id="removeProjectManagerModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 项目经理 -->
            <jsp:include page="pmForm.jsp"/>

            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        // 加载表格
        $('#projectManagerTable').bootstrapTable({
            url: baseUrl + '/op/projectManager/list',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: true,
            sidePagination: 'server',
            queryParams: getQueryParamsForPm,
            pageSize: 14,
            pageList: [14],
            singleSelect: true,
            height: 580,
            striped: true,
            uniqueId: 'pmId',
            classes: 'table table-hover table-condensed',
            onDblClickRow: function (row) {
                if(hasWritePermission("MENU_PROJECT_PM")) {//有写权限 才可以编辑
                    var rowUniqueId = row['pmId'];
                    $('#editProjectManagerModal').modal({
                        backdrop: 'static'
                    });
                    getProjectManager(rowUniqueId);
                }
            },
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });

        // 搜索按钮
        $('#searchProjectManager').click(function () {
            refreshProjectManagerTable();
        });

//        // 为搜索框绑定enter按钮
        $(".form-inline #pmName").keydown(function () {
            if (event.keyCode == 13) {
                $('#searchProjectManager').trigger("click");
                return false;
            }
        });

        //添加
        $("#addProjectManager").click(function () {
            $("#addProjectManagerModal").modal({
                backdrop: 'static'
            });
        });

        // 删除
        $("#removeProjectManagerModalSubmit").click(function(){
            deleteProjectManager();
        });

    });

    function removeProjectManager(pmId) {
        var rowData = $('#projectManagerTable').bootstrapTable('getRowByUniqueId', pmId);
        $('#pmIdRemoveModal').val(rowData.pmId);
        $('#pmNameRemoveModal').text(rowData.pmName);
        $('#removeProjectManagerModal').modal({
            backdrop: 'static'
        });
        $('.form-horizontal .alert').css('display', 'none');
    }

    function deleteProjectManager() {
        var id = $("#pmIdRemoveModal").val();
        $.post(baseUrl + '/op/projectManager/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectManagerModal").modal('hide');
                refreshProjectManagerTable();
            } else {
                $('#removeProjectManagerModal .' + response.msg).fadeIn();
            }
        }, 'json');
    }

    // 获取查询参数
    function getQueryParamsForPm(params) {
        return {
            offset: params.offset,
            limit: params.limit,
            pmName: $('#pmName').val()
        };
    }


    // 刷新表格
    function refreshProjectManagerTable() {
//        alert("111");
        $('#projectManagerTable').bootstrapTable('refresh', {
            query: {offset: 0, pmName: $('#pmName').val()},
            url: baseUrl + '/op/projectManager/list'
        });
    }


    $(document).keypress(function(e) {
        // 回车键事件
        if(e.which == 13) {
            $('#searchProjectManager').trigger("click");
        }
    });
</script>
</body>
</html>
