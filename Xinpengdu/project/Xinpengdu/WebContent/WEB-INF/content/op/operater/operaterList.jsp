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


    <script language="JavaScript">
        var viewDetailButtonText = '详情';
    </script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.min.css">

    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>

    <script language="JavaScript">

        function operaterTableActionFormatter(value, row) {
            if(hasWritePermission("MENU_PROJECT_USER")) {
                var content = "";
                content += '<div class="actionHolder" style="text-align: left;margin-left: 20%;">';
                if (row.postId == 2) {//一般管理员
                    content += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 5px;background-color: #286090;color: white;" onclick="javascript:grant(\'' + row.operaterId + '\');">授权</button>';
                }
                if (row.loginName != "admin") {
                    content += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 5px;background-color: #286090;color: white;" onclick="javascript:removeOperater(\'' + row.operaterId + '\');">删除</button>';
                    content += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 5px;background-color: #286090;color: white;" onclick="javascript:resetOperater(\'' + row.operaterId + '\',\'' + row.operaterName + '\');">重置</button>';
                } else {
                    content += "";
                }
                content += '</div>';
                return content;
            }
        }

        function postFormatter(value, row){
            var post="";
            if(row.postId==1){
                post="系统管理员";
            }else if(row.postId==2){
                post="一般管理员";
            }else{
                post=row.postId;
            }
            return post;
        }

        function menuActionFormatter(value, row){
            var result="";
            result+="<div style='height: 20px; line-height: 20px;'>";
            if(row.READ=="Y"){
                result+="查询&nbsp;&nbsp;<input name='menu_cks' type='checkbox' checked='true' value='"+row.menuId+"_READ' style='zoom:125%;' onclick='javascript:unCheckWrite(this,\"" + row.menuId + "\");' /> &nbsp;&nbsp;";
            }else{
                result+="查询&nbsp;&nbsp;<input name='menu_cks' type='checkbox' value='"+row.menuId+"_READ' style='zoom:125%;'  onclick='javascript:unCheckWrite(this,\"" + row.menuId + "\");' /> &nbsp;&nbsp;";
            }
            if(row.WRITE=="Y"){
                result+="修改&nbsp;&nbsp;<input name='menu_cks' type='checkbox' checked='true' value='"+row.menuId+"_WRITE' style='zoom:125%;' onclick='javascript:checkRead(this,\"" + row.menuId + "\");' /> &nbsp;&nbsp;";
            }else{
                result+="修改&nbsp;&nbsp;<input name='menu_cks' type='checkbox' value='"+row.menuId+"_WRITE' style='zoom:125%;' onclick='javascript:checkRead(this,\"" + row.menuId + "\");' /> &nbsp;&nbsp;";
            }
            result+="</div>";
            return result;
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
                        <h4>用户</h4>
                        <div id="exportOrderList" class="pull-right">
                            <%--<c:if test="${sessionScope.PERMISSION_MENU_PROJECT_USER_WRITE}">--%>
                                <%--<a href="#"><i class="icons-print"></i></a>--%>
                            <%--</c:if>--%>
                        </div>
                    </div>

                    <div id="orderContainer" style="width:100%;padding-bottom:15px;margin-top:10px;min-height: 610px;">
                        <div class="row" style="margin-bottom: 5px;">
                            <form class="form-inline" role="form">
                                <div class="col-md-9">
                                    <span class="down2">登录名称：</span>
                                    <input id="loginName" style="width: 18%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                                    <span class="down2">操作员姓名：</span>
                                    <input id="operaterName" style="width: 18%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                                    <a id="searchOperater" class="btn btn-sm btn-default glyphicon glyphicon-search"
                                       type="button" style="margin-top: -1px;">
                                    </a>
                                </div>
                                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_USER_WRITE}">
                                    <div class="col-md-3" style="text-align: right;">
                                        <a id="addOperater" class="btn btn-sm btn-default" style="background-color: #286090;color: white;">添加</a>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                        <table id="operaterTable">
                            <thead>
                            <th data-field="operaterId" data-halign="center" data-width="5%" data-align="center">员工编号</th>
                            <th data-field="loginName" data-halign="center" data-width="12%" data-align="center">登录名称</th>
                            <th data-field="operaterName" data-halign="center" data-width="12%" data-align="center">姓名</th>
                            <th data-field="deptName" data-halign="center" data-width="5%" data-align="center">部门</th>
                            <th data-field="postId" data-halign="center" data-width="5%" data-align="center" data-formatter="postFormatter">岗位</th>
                            <th data-field="action" data-halign="center" data-width="5%" data-formatter="operaterTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 删除用户 -->
            <div id="removeOperaterModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">删除用户</h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <input type="hidden" id="operaterIdRemoveModal"/>
                            <p>准备删除用户 '<span id="operaterNameRemoveModal"></span>'</p>
                            <div class="alert alert-danger operaterNotLost">不能删除该用户</div>
                        </div>
                        <div class="modal-footer">
                            <button id="removeOperaterModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 重置用户密码 -->
            <div id="resetOperaterModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">重置用户密码</h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <input type="hidden" id="operaterIdResetModal"/>
                            <p>准备重置用户 '<span id="operaterNameResetModal"></span>' 密码</p>
                            <div class="alert alert-danger operaterNotExist">该用户密码不存在</div>
                            <div class="alert alert-danger operaterNotReset">不能重置该用户密码</div>
                        </div>
                        <div class="modal-footer">
                            <button id="resetOperaterModalSubmit" type="button" class="btn btn-primary" data-loading-text="重置&hellip;">重置</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 项目经理 -->
            <jsp:include page="operaterForm.jsp"/>

            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        // 加载表格
        $('#operaterTable').bootstrapTable({
            url: baseUrl + '/op/operater/list',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: true,
            sidePagination: 'server',
            queryParams: getQueryParamsForOperater,
            pageSize: 14,
            pageList: [14],
            singleSelect: true,
            height: 580,
            striped: true,
            uniqueId: 'operaterId',
            classes: 'table table-hover table-condensed',
            onDblClickRow: function (row) {
                if(hasWritePermission("MENU_PROJECT_USER")) {
                    var rowUniqueId = row['operaterId'];
                    $('#editOperaterModal').modal({
                        backdrop: 'static'
                    });
                    getOperater(rowUniqueId);
                }
            },
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });

        // 加载菜单权限表格
        $('#menu_table').bootstrapTable({
            url: baseUrl + '/op/operater/getAllMenuList',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: false,
            sidePagination: 'server',
            queryParams:"",
            singleSelect: true,
            clickToSelect: true,
            height: 450,
            striped: true,
            uniqueId: 'menuId',
            classes: 'table table-hover table-condensed',
            onDblClickRow: function (row) {
                /*var rowUniqueId = row['operaterId'];
                $('#editOperaterModal').modal({
                    backdrop: 'static'
                });*/
               /* var menuId = row['menuId'];
                refreshModelList(menuId);*/
            },
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });

        //初始化 模块列表
        loadModelList(1);

        // 搜索按钮
        $('#searchOperater').click(function () {
            refreshOperaterTable();
        });

        // 为搜索框绑定enter按钮
        $("#loginName,#operaterName").keydown(function () {
            if (event.keyCode == 13) {
                $('#searchOperater').trigger("click");
                return false;
            }
        });

        //添加
        $("#addOperater").click(function () {
            $("#addOperaterModal").modal({
                backdrop: 'static'
            });
        });

        //Remove Operater
        $('#removeOperaterModalSubmit').click(function () {
            $.post(baseUrl + '/op/operater/delete', {id: $('#operaterIdRemoveModal').val()}, function (response) {
                $('#removeOperaterModalSubmit').button('reset');
                if (response.result) {
                    alert("删除成功!");
                    refreshOperaterTable();
                    $('#removeOperaterModal').modal('hide');
                } else {
                    $('#removeOperaterModal .' + response.msg).fadeIn();
                }
            }, 'json');
        });

        //Reset Operater
        $('#resetOperaterModalSubmit').click(function () {
            $.post(baseUrl + '/op/operater/reset', {id: $('#operaterIdResetModal').val()}, function (response) {
                $('#resetOperaterModalSubmit').button('reset');
                if (response.result) {
                    alert("重置成功!");
                    refreshOperaterTable();
                    $('#resetOperaterModal').modal('hide');
                } else {
                    $('#resetOperaterModal .' + response.msg).fadeIn();
                }
            }, 'json');
        });

    });

    function removeOperater(operaterId) {
        var rowData = $('#operaterTable').bootstrapTable('getRowByUniqueId', operaterId);
        $('#operaterIdRemoveModal').val(rowData.operaterId);
        $('#operaterNameRemoveModal').text(rowData.operaterName);
        if(rowData.operaterName=="admin"){
            alert("该用户不允许删除！");
            return;
        }
        $('#removeOperaterModal').modal({
            backdrop: 'static'
        });
        $('.form-horizontal .alert').css('display', 'none');
    }

    function resetOperater(operaterId,operaterName) {
        $('#operaterIdRemoveModal').val(operaterId);
        $('#operaterNameRemoveModal').text(operaterName);
        if(operaterName == "admin"){
            alert("该用户不能重置密码！");
            return;
        }
        $('#resetOperaterModal').modal({
            backdrop: 'static'
        });
        $('.form-horizontal .alert').css('display', 'none');
    }

    // 获取查询参数
    function getQueryParamsForOperater(params) {
        return {
            offset: params.offset,
            limit: params.limit,
            loginName: $('#loginName').val(),
            operaterName: $('#operaterName').val()
        };
    }

    // 刷新表格
    function refreshOperaterTable() {
        $('#operaterTable').bootstrapTable('refresh', {
            query: {offset: 0, loginName: $('#loginName').val(), operaterName: $('#operaterName').val()},
            url: baseUrl + '/op/operater/list'
        });
    }

    function grant(userId){
        $('#operaterId_operater').val(userId);
        //刷新菜单列表
        refreshMenulList(userId);
        //刷新模块列表
        refreshModelList(1,userId);
        //弹出授权界面
        $("#grantModal").modal({
            backdrop: 'static'
        });
    }


    $(document).keypress(function(e) {
        // 回车键事件
        if(e.which == 13) {
            $('#searchOperater').trigger("click");
        }
    });

    function loadModelList(menuId){
        // 加载菜单权限表格
        $('#model_table').bootstrapTable({
            url: baseUrl + '/op/operater/getModelListByMenuId',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: false,
            sidePagination: 'server',
            queryParams:{menuId:menuId},
            singleSelect: true,
            height: 450,
            striped: true,
            uniqueId: 'menuId',
            classes: 'table table-hover table-condensed',
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });
    }

    // 刷新菜单列表
    function refreshMenulList(userId) {
        $('#menu_table').bootstrapTable('refresh', {
            query: {userId:userId},
            url: baseUrl + '/op/operater/getAllMenuList'
        });
    }

    // 刷新模块列表
    function refreshModelList(menuId,userId) {
        $('#model_table').bootstrapTable('refresh', {
            query: {menuId:menuId,userId:userId},
            url: baseUrl + '/op/operater/getModelListByMenuId'
        });
    }

    //当勾选 修改权限的时候  默认勾选上查询权限
    function checkRead(obj,menuId) {
        if(obj.checked){
            var v=menuId+"_READ";
            $("input[name='menu_cks'][value='"+v+"']").prop('checked',true);
        }
    }

    //当去掉查询权限时候  默认去掉修改权限
    function unCheckWrite(obj,menuId) {
        if(!obj.checked){
            var v=menuId+"_WRITE";
            $("input[name='menu_cks'][value='"+v+"']").prop('checked',false);
        }
    }


</script>
</body>
</html>
