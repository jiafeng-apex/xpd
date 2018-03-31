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

        function projectBankTableActionFormatter(value, row) {
            if(hasWritePermission("MENU_PROJECT_BANK")) {
                var content = '<div class="actionHolder" style="text-align: center;">';
                content += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 5px;background-color: #286090;color: white;" onclick="javascript:removeProjectBank(\'' + row.bankId + '\');">删除</button>';
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
                        <h4>银行账户</h4>
                        <div id="exportOrderList" class="pull-right">
                            <%--<c:if test="${sessionScope.PERMISSION_MENU_PROJECT_BANK_WRITE}">--%>
                                <%--<a href="#"><i class="icons-print"></i></a>--%>
                            <%--</c:if>--%>
                        </div>
                    </div>

                    <div id="orderContainer" style="width:100%;padding-bottom:15px;margin-top:10px;min-height: 610px;">
                        <div class="row" style="margin-bottom: 5px;">
                            <form class="form-inline" role="form">
                                <div class="col-md-9">
                                    <span class="down2">银行名称：</span>
                                    <input id="bankName" style="width: 18%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                                    <a id="searchProjectBank" class="btn btn-sm btn-default glyphicon glyphicon-search"
                                       type="button" style="margin-top: -1px;">
                                    </a>
                                </div>
                                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_BANK_WRITE}">
                                    <div class="col-md-3" style="text-align: right;">
                                        <a id="addProjectBank" class="btn btn-sm btn-default" style="background-color: #286090;color: white;">添加</a>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                        <table id="projectBankTable">
                            <thead>
                            <th data-field="bankName" data-halign="center" data-width="5%" data-align="left">户名全称</th>
                            <th data-field="depositBank" data-halign="center" data-width="12%" data-align="left">开户银行</th>
                            <th data-field="bankAccount" data-halign="center" data-width="12%" data-align="left">银行帐号</th>
                            <th data-field="cachet" data-halign="center" data-width="5%" data-align="left">公章</th>
                            <th data-field="financialSeal" data-halign="center" data-width="5%" data-align="left">财务章</th>
                            <th data-field="personalSeal" data-halign="center" data-width="5%" data-align="left">私章</th>
                            <th data-field="depositBankAddr" data-halign="center" data-width="5%" data-align="left">开户银行地址</th>
                            <th data-field="remark" data-halign="center" data-width="5%" data-align="left">备注</th>
                            <th data-field="action" data-halign="center" data-width="5%" data-formatter="projectBankTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 删除项目经理 -->
            <div id="removeProjectBankModalForList" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">删除银行账户</h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <input type="hidden" id="bankIdRemoveModalForList"/>
                            <p>准备删除银行账户 '<span id="bankNameRemoveModalForList"></span>'</p>
                            <div class="alert alert-danger projectBankNotLost">不能删除该银行账户</div>
                        </div>
                        <div class="modal-footer">
                            <button id="removeProjectBankModalSubmitForList" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 项目经理 -->
            <jsp:include page="bankForm.jsp"/>
            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        // 加载表格
        $('#projectBankTable').bootstrapTable({
            url: baseUrl + '/op/projectBank/list',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: true,
            sidePagination: 'server',
            queryParams: getQueryParamsForBank,
            pageSize: 14,
            pageList: [14],
            singleSelect: true,
            height: 580,
            striped: true,
            uniqueId: 'bankId',
            classes: 'table table-hover table-condensed',
            onDblClickRow: function (row) {
                if(hasWritePermission("MENU_PROJECT_BANK")) {
                    var rowUniqueId = row['bankId'];
                    $('#editProjectBankModal').modal({
                        backdrop: 'static'
                    });
                    getProjectBank(rowUniqueId);
                }
            },
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });

        // 搜索按钮
        $('#searchProjectBank').click(function () {
            refreshProjectBankTable();
        });

        // 为搜索框绑定enter按钮
        $("#bankName").keydown(function () {
            if (event.keyCode == 13) {
                $('#searchProjectBank').trigger("click");
                return false;
            }
        });

        //添加
        $("#addProjectBank").click(function () {
            $("#addProjectBankModal").modal({
                backdrop: 'static'
            });
        });

        // 删除
        $("#removeProjectBankModalSubmitForList").click(function(){
            deleteProjectBankForList();
        });

    });

    function removeProjectBank(bankId) {
        var rowData = $('#projectBankTable').bootstrapTable('getRowByUniqueId', bankId);
        $('#bankIdRemoveModalForList').val(rowData.bankId);
        $('#bankNameRemoveModalForList').text(rowData.bankName);
        $('#removeProjectBankModalForList').modal({
            backdrop: 'static'
        });
        $('.form-horizontal .alert').css('display', 'none');
    }

    function deleteProjectBankForList() {
        var id = $("#bankIdRemoveModalForList").val();
        $.post(baseUrl + '/op/projectBank/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectBankModalForList").modal('hide');
                refreshProjectBankTable();
            } else {
                $('#removeProjectBankModalForList .' + response.msg).fadeIn();
            }
        }, 'json');
    }


    // 获取查询参数
    function getQueryParamsForBank(params) {
        return {
            offset: params.offset,
            limit: params.limit,
            searchContent: $('#bankName').val()
        };
    }

    // 刷新表格
    function refreshProjectBankTable() {
        $('#projectBankTable').bootstrapTable('refresh', {
            query: {offset: 0,searchContent: $('#bankName').val()},
            url: baseUrl + '/op/projectBank/list'
        });
    }


    $(document).keypress(function(e) {
        // 回车键事件
        if(e.which == 13) {
            $('#searchProjectBank').trigger("click");
        }
    });
</script>
</body>
</html>
