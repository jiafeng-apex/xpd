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


    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/select/bootstrap-select.min.css">
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/moment.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"
            type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/select/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/js/form/statisticsReport.js" type="text/javascript"></script>


    <script language="JavaScript">
        function projectInfoTableActionFormatter(value, row) {
            if(hasWritePermission("MENU_PROJECT_INFO")){
                var content = '<div class="actionHolder" style="text-align: center;">';
                content += '<button type="button" class="btn btn-default btn-xs" style="margin-right: 5px;background-color: #286090;color: white;" onclick="javascript:removeProjectInfo(\'' + row.projectId + '\');">删除</button>';
                content += '</div>';
                return content;
            }
        }

        function projectTypeActionFormatter(value, row){
            if(value=="1"){
                return "本地工程";
            }else if(value=="2"){
                return "外地工程";
            }
        }
    </script>
    <title>新鹏都装饰后台管理专业版</title>
</head>
<style>
    html, body {
        height: 100%;
    }
    .cboxIpt{width: 2%;text-align: center;vertical-align: middle !important;}
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
                        <h4>统计报表</h4>
                        <div id="exportOrderList" class="pull-right">
                            <%--<c:if test="${sessionScope.PERMISSION_MENU_PROJECT_INFO_WRITE}">--%>
                            <%--<a href="#"><i class="icons-print"></i></a>--%>
                            <%--</c:if>--%>
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
                                        <input type="text" class="form-control" name="start" id="projectBeginTime" style="width: 120px;height: 31px;" readonly="readonly"/>
                                        <span class="input-group-addon">至</span>
                                        <input type="text" class="form-control" name="end" id="projectEndTime" style="width: 120px;height: 31px;" readonly="readonly"/>
                                    </div>
                                    <a id="btn-search-project" class="btn btn-sm btn-default glyphicon glyphicon-search"
                                       type="button" style="margin-top: -1px;">
                                    </a>
                                </div>

                                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_INFO_WRITE}">
                                    <div class="col-md-3" style="text-align: right;">
                                        <a id="export-project-data" class="btn btn-sm btn-default" style="background-color: #286090;color: white;">导出</a>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                        <table id="projectStatTable">
                            <thead>
                            <th data-field="pmName" data-halign="center" width="5%" data-align="center">项目经理</th>
                            <th data-field="partyName" data-halign="center" width="12%" data-align="center">甲方名称</th>
                            <th data-field="projectName" data-halign="center" width="12%" data-align="center">项目名称</th>
                            <th data-field="projectType" data-halign="center" width="12%" data-align="center" data-formatter="projectTypeActionFormatter">工程类型</th>
                            <th data-field="contractAcount" data-halign="center" width="5%" data-align="center">合同金额</th>
                            <th data-field="clearingAcount" data-halign="center" width="5%" data-align="center">汇入金额</th>
                            <th data-field="remarkOne" data-halign="center" width="5%" data-align="center">本项目余额</th>
                            <th data-field="remarkTwo" data-halign="center" width="5%" data-align="center">经理总余额</th>
                            <th data-field="signedDate" data-halign="center" width="5%" data-align="center">签订日期</th>
                            <th data-field="projectAddr" data-halign="center" width="12%" data-align="center">地址</th>
                            <%--<th data-field="action" width="5%" data-formatter="projectInfoTableActionFormatter">操作</th>--%>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 导出数据 -->
            <div id="exportProjectDataModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">导出数据</h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <!-- content start -->
                            <div class="form-group has-feedback">
                                <div style="text-align: center;">
                                    <div class="mt-radio-inline" style="padding: 0;">
                                        <label class="mt-radio">
                                            <input type="radio" name="openAllDay" id="openAllDayTrueEditGovModal" value="true">
                                            <span>项目单个或者多个统计</span>
                                        </label>
                                        <label class="mt-radio" style="margin-left: 5px;">
                                            <input type="radio" name="openAllDay" id="openAllDayFalseEditGovModal" value="false">
                                            <span>项目单个或者多个统计累计</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="parkInfoEditGovModal">工程信息</label><br/>
                                <input type="checkbox" class="col-md-1" style="width:5px;" id="parkInfoEditGovModal" name="parkInfo" ><label for="parkInfoEditGovModal"  class="col-md-2">项目经理</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;" id="parkInfoEditGovModal1" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">项目名称</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;" id="parkInfoEditGovModal2" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">甲方名称</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;" id="parkInfoEditGovModal3" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">工程地址</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;" id="parkInfoEditGovModal4" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">合同金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;" id="parkInfoEditGovModal5" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">结算金额</label>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="parkInfoEditGovModal">工程收费</label><br/>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa1" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">项目经理</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa2" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">项目名称</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa3" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">甲方名称</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa4" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">工程地址</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa5" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">合同金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa6" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">结算金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa7" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">本项目余额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa8" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">汇入金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa9" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">汇出金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">当地银行存款</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa10" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">扣管理费</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa11" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">扣保证金</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa12" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">已退质保金</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa13" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">增值税进项税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa14" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">汇回公司款</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa15" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">增值税销项税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa16" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">企业所得税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa17" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">个人所得税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa18" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">印花税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa19" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">城建税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa20" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">教育费附加</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa21" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">地方教育费附加</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa22" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">扣营业税及附加税</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa23" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">利息</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa24" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">扣其他款</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa25" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">发票金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa26" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">发票税款</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa27" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">收据金额</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa28" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">材料款</label>
                                <input type="checkbox" class="col-md-1" style="width:5px;"  id="parkInfoEditGovModa29" name="parkInfo" ><label for="parkInfoEditGovModal" class="col-md-2">劳务费</label>
                            </div>
                            <!-- content end -->
                        </div>
                        <div class="modal-footer">
                            <button id="exportProjectDataModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">导出</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>
<script type="text/javascript">
</script>
</body>
</html>
