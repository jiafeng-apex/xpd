<%@ page import="java.util.Locale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">

    <jsp:include page="../admin/header.jsp" />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.min.css">

    <script language="JavaScript">
        var viewDetailButtonText = '详情';
    </script>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/select/bootstrap-select.min.css">
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/moment.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/select/bootstrap-select.min.js" type="text/javascript"></script>


    <script language="JavaScript">

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
                        <h4>编辑项目</h4>
                        <div id="exportOrderList" class="pull-right">
                            <c:if test="${sessionScope.PERMISSION_MENU_OVERVIEW_ANALYZE_ORDER_WRITE}">
                                <a href="#"><i class="icons-print"></i></a>
                            </c:if>
                        </div>
                    </div>

                    <div id="orderContainer" style="width:100%;padding-bottom:15px;margin-top:10px;min-height: 610px;">
                        <div class="row" style="margin-bottom: 5px;">
                            <form class="form-inline" role="form">
                                <div class="col-md-9">
                                    <span class="down2">工程:</span>
                                    <input id="projectContent" style="width: 18%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                                    <span class="down2">金额:</span>
                                    <input id="projectAmountBegin" style="width: 10%;height: 30px" type="text" class="form-control" placeHolder=""
                                           title=""/>
                                    <span style="margin:0px 5px;">至</span>
                                    <input id="projectAmountEnd" style="width: 10%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                                    <div class="input-daterange input-group" id="datetype_day">
                                        <input type="text" class="form-control" name="start" id="projectBeginTime" style="width: 120px;height: 31px;"/>
                                        <span class="input-group-addon">至</span>
                                        <input type="text" class="form-control" name="end" id="projectEndTime" style="width: 120px;height: 31px;"/>
                                    </div>
                                    <a id="btn-search-project" class="btn btn-sm btn-default glyphicon glyphicon-search"
                                       type="button" style="margin-top: -1px;">
                                    </a>
                                </div>
                                <div class="col-md-3" style="text-align: right;">
                                    <a id="add-project" class="btn btn-sm btn-default">添加</a>
                                    <a id="del-project" class="btn btn-sm btn-default">删除</a>
                                </div>
                            </form>
                        </div>
                        <table id="projectInfoTable">
                            <thead>
                            <th data-field="pmName" data-halign="center" data-width="5%" data-align="center">项目经理</th>
                            <th data-field="partyName" data-halign="center" data-width="12%" data-align="center">甲方名称</th>
                            <th data-field="projectName" data-halign="center" data-width="12%" data-align="center">项目名称</th>
                            <th data-field="contractAcount" data-halign="center" data-width="5%" data-align="center">合同金额</th>
                            <th data-field="clearingAcount" data-halign="center" data-width="5%" data-align="center">汇入金额</th>
                            <th data-field="remarkOne" data-halign="center" data-width="5%" data-align="center">本项目余额</th>
                            <th data-field="remarkTwo" data-halign="center" data-width="5%" data-align="center">经理总余额</th>
                            <th data-field="signedDate" data-halign="center" data-width="5%" data-align="center">签订日期</th>
                            <th data-field="projectAddr" data-halign="center" data-width="12%" data-align="center">地址</th>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        // 加载表格
        $('#projectInfoTable').bootstrapTable({
            url: baseUrl + '/op/projectInfo/list',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: true,
            sidePagination: 'server',
            queryParams: getQueryParamsForProjectInfo,
            pageSize: 14,
            pageList: [14],
            singleSelect: true,
            height: 580,
            striped: true,
            uniqueId: 'projectId',
            classes: 'table table-hover table-condensed',
            onDblClickRow:onDblClickRow,
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });
        // 搜索按钮
        $('#btn-search-project').click(function(){
            refreshProjectInfoTable();
        });

        // 为搜索框绑定enter按钮
        $("#projectContent,#projectAmountBegin,#projectAmountEnd,#projectBeginTime,#projectEndTime").keydown(function(){
            if (event.keyCode == 13){
                refreshProjectInfoTable();
            }
        });

        // 设置选择时间初始值 ， 默认一个月
        var startTimeText = formatDate(moment().add(-1, 'month'), 'day');
        var stopTimeText = formatDate(moment(), 'day');
        // 开始与结束日期的id
        $("#projectBeginTime").attr("value", startTimeText);
        $("#projectEndTime").attr("value", stopTimeText);

        // 开始时间
        $("#projectBeginTime").datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            pickerPosition: "bottom-left",
            startView: 2,
            minView: 3,
            todayBtn: 2,
            autoclose: 1,
            endDate: stopTimeText
        }).on('changeDate', function (e) {
            var endTime = e.date;
            $('#projectEndTime').datetimepicker('setStartDate', endTime);
            refreshProjectInfoTable();
        });

        // 结束时间
        $("#projectEndTime").datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            pickerPosition: "bottom-left",
            startView: 2,
            minView: 3,
            todayBtn: 1,
            autoclose: 1,
            startDate: startTimeText
        }).on('changeDate', function (e) {
            var startTime = e.date;
            $("#projectBeginTime").datetimepicker('setEndDate', startTime);
            refreshProjectInfoTable();
        });

    });

    function onDblClickRow(row) {
        $('#timeShowModal').text(row.time);
        $('#actionCode1ShowModal').text('0x' + row.actionCode1);
        $('#actionCode2ShowModal').text('0x' + row.actionCode2);
        $('#debugData1ShowModal').text(row.dataFrame.substring(0, 33));
        $('#debugData2ShowModal').text(row.dataFrame.substring(33));
        $('#showDebugDataModal').modal({
            backdrop : 'static'
        });
    }

    // 获取查询参数
    function getQueryParamsForProjectInfo(params) {
        return {
            offset: params.offset,
            limit: params.limit,
            projectContent: $('#projectContent').val(),
            projectAmountBegin: $('#projectAmountBegin').val(),
            projectAmountEnd: $("#projectAmountEnd").val(),
            projectBeginTime: $('#projectBeginTime').val(),
            projectEndTime: $("#projectEndTime").val()
        };
    }

    // 刷新表格
    function refreshProjectInfoTable() {
        $('#projectInfoTable').bootstrapTable('refresh', {
            query: {offset: 0},
            url: baseUrl + '/op/projectInfo/list'
        });
    }

    // 格式化日期
    function formatDate(date, dateType) {
        if (dateType == 'year') {
            return moment(date).format("YYYY");
        } else if (dateType == 'month') {
            return moment(date).format("YYYY-MM");
        } else {
            return moment(date).format("YYYY-MM-DD");
        }
    }
</script>

</body>
</html>
