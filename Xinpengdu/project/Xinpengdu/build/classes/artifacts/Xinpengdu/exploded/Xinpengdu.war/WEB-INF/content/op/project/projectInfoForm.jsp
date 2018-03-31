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

    <!--引入表格可拖动列插件 -->
    <%--<script src="<%= request.getContextPath() %>/op/lib/bootstrap/colResizable/colResizable-1.3.min.js" type="text/javascript"></script>--%>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/table/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>

    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/moment.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"
            type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

    <script src="<%= request.getContextPath() %>/op/lib/bootstrap/plugins/select/bootstrap-select.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/op/css/form/projectInfoForm.css">
    <style type="text/css">

        .fixed-table-body {
            /* overflow-x: auto; */
            overflow-y: auto;
            height: auto !important;
        }

        .fixed-table-container {
            position: relative;
            clear: both;
            border: 1px solid #ddd;
            border-radius: 0px;
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
            height: auto !important;
        }

        .bootstrap-table .table {
            margin-bottom: 0 !important;
            border-bottom: none !important;
            border-collapse: collapse !important;
            border-radius: 1px;
        }

        .projectbody select.input-sm {
            /*height: 25px !important;*/
            /*line-height: 30px;*/
        }

        .nav > li > a {
            position: relative;
            display: block;
            padding: 5px 10px;
            border: 1px solid #337ab7;
        }

        .fixed-table-container tbody td .th-inner, .fixed-table-container thead th .th-inner {
            padding: 2px 5px;
            line-height: 24px;
            vertical-align: top;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
            padding: 1px;
        }

        .fixed-table-pagination .pagination-detail, .fixed-table-pagination div.pagination {
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .form-group {
            margin-bottom: 8px;
        }

        /** form表单的列分散对齐 **/
        .form-horizontal .control-label,.projectRate_table .rate_left {
            padding-top: 7px;
            margin-bottom: 0;
            text-align: right;
            text-align: justify;
            text-align-last: justify;
        }

        .has-feedback .form-control {
            padding-right: 10px;
            text-align: right;
        }

        #invoiceStat_table td,#labourServiceFeeStat_table td,#materialContractStat_table td{
            border-right: 1px solid #ddd;
        }

        table input[type=checkbox]{
            margin: 0;
        }
    </style>

    <title>新鹏都装饰后台管理专业版</title>
</head>
<style>
    html, body {
        height: 100%;
    }
</style>
<body>
<jsp:include page="../admin/menu.jsp"/>
<div class="page-content-wrapper" style="background-color: #043297;height: auto">
    <div class="page-content">
        <div class="content-inner" style="background-color: #ffffff;height: auto;padding-top: 5px;">
            <!-- 注释范围内填充页面正文部分 -->
            <div class="page-title">
                <i class="icons-alarm"></i>
                <h4>
                    <c:if test="${projectId eq null}">
                        添加项目
                    </c:if>
                    <c:if test="${projectId ne null}">
                        编辑项目
                    </c:if>
                </h4>
                <div class="pull-right">
                    <%--<button id="returnPrjectList" class="btn btn-primary"--%>
                            <%--style="padding: 3px 6px;background-color: #001F84;border: 1px solid #001F84;margin: 10px 22px;">--%>
                        <%--<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>返回--%>
                    <%--</button>--%>
                </div>
            </div>

            <!-- 项目信息start -->
            <div class="databox boxinfo" id="projectBasicInfo" style="padding-bottom:5px;">
                <div>
                    <ul id="project_pills" class="nav nav-pills" role="tablist" style="display: inline-block;">
                        <li id="projectInfo_project" role="presentation" class="active li_1">
                            <a href="#">工程信息</a>
                        </li>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALCONTRACT_READ}">
                            <li id="materialContract_project" role="presentation" class="li_2">
                                <a href="#">材料合同</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEFEE_READ}">
                            <li id="labourServiceFee_project" role="presentation" class="li_3">
                                <a href="#">劳务费</a>
                            </li>
                        </c:if>
                    </ul>
                    <div class="btn_content" style="margin:5px 10px;float: right">
                        <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_INFO_WRITE}">
                            <div class="btn_1">
                                <button id="saveProjectInfo_info" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>保存
                                </button>
                                <button id="updateProjectRate_info" class="btn btn-primary" style="float: right;margin-right: 5px;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>更新费率
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALCONTRACT_WRITE}">
                            <div class="btn_2" style="display: none;">
                                <button id="addMaterialContract_info" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEFEE_WRITE}">
                            <div class="btn_3" style="display: none;">
                                <button id="addLabourServiceFee_info" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div class="title-line"></div>
                <div class="tab_content">
                    <!-- 工程信息start -->
                    <input id="projectId" type="hidden" value="${projectId}"/>
                    <input id="projectRateId" type="hidden"/>
                    <div id="project_projectInfo" class="tab_1">
                        <table class="projectbody" style="width: 100%;">
                            <tr>
                                <td class="tdtitle" style="width:5%;"><span class="red">*</span>项目经理：</td>
                                <td class="tdright">
                                    <input id="pmName" class="form-control input_height required" title="项目经理" ondblclick="showPmList()" placeholder="请双击选择"/>
                                    <hidden id="pmId"/>
                                </td>
                                <td class="tdtitle"><span class="red">*</span>联系电话：</td>
                                <td class="tdright">
                                    <input id="tellPhone" class="form-control input_height tellPhone_check amount_keyup_event required" title="联系电话"/>
                                </td>
                                <td class="tdtitle"><span class="red">*</span>签订日期：</td>
                                <td class="tdright" style="padding-right: 0px;">
                                    <div class="input-daterange input-group col-md-12" id="datetype_day">
                                        <input type="text" class="form-control input_height col-md-12 dateSelect required" name="signedDate" id="signedDate"
                                               style="border-radius: 4px;" readonly="readonly"/>
                                    </div>
                                </td>
                                <td class="tdtitle"><span class="red">*</span>工程类型：</td>
                                <td class="tdright" style="padding-right: 0px;">
                                    <select id="projectType" class="input-sm col-md-12" title="工程类型" <c:if test="${projectId ne null}">disabled="disabled" </c:if> >
                                        <option value="1">本地工程</option>
                                        <option value="2">外地工程</option>
                                    </select>
                                </td>
                                <td class="tdtitle"><span class="red">*</span>增值税类型：</td>
                                <td class="tdright" style="padding-right: 0px;">
                                    <select id="addValueTaxType" class="input-sm col-md-12" title="增值税类型" <c:if test="${projectId ne null}">disabled="disabled" </c:if> >
                                        <option value="1">简易征收</option>
                                        <option value="2" selected="selected">一般计征</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdtitle" style="width:5%;"><span class="red">*</span>项目名称：</td>
                                <td class="tdright" colspan="3">
                                    <input id="projectName" class="form-control input_height required" title="项目名称"/>
                                </td>
                                <td class="tdtitle" style="width:5%;"><span class="red">*</span>甲方名称：</td>
                                <td class="tdright" colspan="3">
                                    <input id="partyName" class="form-control input_height required" title="甲方名称"/>
                                </td>
                                <td class="tdtitle"><span class="red">*</span>是否添加银行：</td>
                                <td class="tdright" style="padding-right: 0px;">
                                    <select id="isAddBankInfo" class="input-sm col-md-12" title="是否添加银行" >
                                        <option value="1">是</option>
                                        <option value="2" selected="selected">否</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdtitle" style="width:5%;"><span class="red">*</span>工程地址：</td>
                                <td class="tdright">
                                    <input id="projectAddr" class="form-control input_height required" title="工程地址"/>
                                </td>
                                <td class="tdtitle"><span class="red">*</span>合同金额：</td>
                                <td class="tdright">
                                    <input id="contractAcount" class="form-control input_height ipt_content_right amount_keyup_event amount_blur_event amount_focus_event required" title="合同金额"/>
                                </td>
                                <td class="tdtitle">结算金额：</td>
                                <td class="tdright" style="padding-right: 0px;">
                                    <input id="clearingAcount" class="form-control input_height ipt_content_right amount_keyup_event amount_blur_event amount_focus_event" title="结算金额"/>
                                </td>
                                <td class="tdtitle">是否完工：</td>
                                <td class="tdright" style="padding-right: 0px;">
                                    <select id="isFinish" class="input-sm col-md-12" title="是否完工">
                                        <option value="1">是</option>
                                        <option value="2">否</option>
                                    </select>
                                </td>
                                <td class="tdtitle" id="certigierName_titleName" style="width:5%;">授权人：</td>
                                <td class="tdright" id="certigierName_value">
                                    <input id="certigierName" class="form-control input_height" title="授权人" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdtitle" style="width:5%;">备注1：</td>
                                <td class="tdright" colspan="3"><input id="remarkOne" class="form-control input_height" title="备注1"/></td>
                                <td class="tdtitle" style="width:5%;">备注2：</td>
                                <td class="tdright" colspan="3"><input id="remarkTwo" class="form-control input_height" style="color: red;" title="备注2"/></td>
                                <td class="tdtitle" id="accreditEnd_titleName">授权到期时间：</td>
                                <td class="tdright" id="accreditEnd_value">
                                    <input id="accreditEnd" class="form-control input_height" title="授权到期时间" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdtitle" style="width:5%;">费率与税率：</td>
                                <td class="tdright col-md-12" colspan="9" style="white-space:normal;">
                                    <table id="projectRate_table" class="projectRate_table">
                                        <tr>
                                            <td class="rate_left" style="width:5%">管理费率</td>
                                            <td class="rate_right"><input id="manageRate" class="form-control rate_size ipt_content_right amount_keyup_event required" title="管理费率"/>%</td>
                                            <td class="rate_left">质保金额</td>
                                            <td class="rate_right"><input id="warrantyRate" class="form-control rate_size ipt_content_right amount_keyup_event required" title="质保金额"/>%</td>
                                            <td class="rate_left">增值税销项税</td>
                                            <td class="rate_right"><input id="vatSalesTax" class="form-control rate_size ipt_content_right amount_keyup_event required" title="增值税销项税"/>%</td>
                                            <td class="rate_left">企业所得税</td>
                                            <td class="rate_right"><input id="corporateIncomeTax" class="form-control rate_size ipt_content_right amount_keyup_event required" title="企业所得税"/>%</td>
                                            <td class="rate_left">个人所得税</td>
                                            <td class="rate_right"><input id="individualIncomeTax" class="form-control rate_size ipt_content_right amount_keyup_event required" title="个人所得税"/>%</td>
                                            <td class="rate_left">印花税税率</td>
                                            <td class="rate_right"><input id="stampDutyRate" class="form-control rate_size ipt_content_right amount_keyup_event required" title="印花税税率"/>%</td>
                                        </tr>
                                        <tr>
                                            <td class="rate_left">城市维建税</td>
                                            <td class="rate_right"><input id="cityBuildTax" class="form-control rate_size ipt_content_right amount_keyup_event required" title="城市维护建设税"/>%</td>
                                            <td class="rate_left">地方教育附加</td>
                                            <td class="rate_right"><input id="localEducationAttached" class="form-control rate_size ipt_content_right amount_keyup_event required" title="地方教育附加"/>%</td>
                                            <td class="rate_left">教育费附加</td>
                                            <td class="rate_right"><input id="educationSurcharge" class="form-control rate_size ipt_content_right amount_keyup_event required" title="教育费附加"/>%</td>
                                            <td class="rate_left">水利建设收入</td>
                                            <td class="rate_right"><input id="waterBuildIncome" class="form-control rate_size ipt_content_right amount_keyup_event" title="水利建设专项收入"/>%</td>
                                            <td class="rate_left" style="width:5%">其他税税率</td>
                                            <td class="rate_right"><input id="otherTaxRate" class="form-control rate_size ipt_content_right amount_keyup_event" title="其他税税率"/>%</td>
                                            <td class="rate_left">营业税及附加</td>
                                            <td class="rate_right"><input id="supplementaryBusinessTax" class="form-control rate_size ipt_content_right amount_keyup_event" title="营业税及附加"/>%</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- 工程信息 end -->

                    <!-- 材料合同 start -->
                    <div id="project_materialContract" class="tab_2" style="display: none">
                        <table id="materialContract_table" style="width:100%;margin-top: 10px" idField="materialContractId"
                               url="<%= request.getContextPath() %>/op/materialContract/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="supplierName" width="40" align="left">供应商名称</th>
                            <th field="telephone" width="40" align="left">电话</th>
                            <th field="address" width="40" align="left">地址</th>
                            <th field="openingBank" width="40" align="left">开户银行</th>
                            <th field="accountNumber" width="40" align="left">开户账号</th>
                            <th field="signingDate" width="40" align="left">签订日期</th>
                            <th field="materialName" width="40" align="left">材料名称</th>
                            <th field="taxIdentificationNumber" width="40" align="left">纳税识别号</th>
                            <th field="quantity" width="40" align="right">数量</th>
                            <th field="unitPrice" width="40" align="right">单价</th>
                            <th field="contractAmount" width="40" align="right">合同金额</th>
                            <th field="settlementAmount" width="40" align="right">结算金额</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="payAmountTotal" width="40" align="right">累计支付金额</th>
                            <th field="noPayAmountTotal" width="40" align="right">未支付金额</th>
                            <th field="amountTotal" width="40" align="right">不含税金额</th>
                            <th field="taxAmountTotal" width="40" align="right">税额</th>
                            <th field="taxPriceTotal" width="40" align="right">税价合计</th>
                            <th field="action" width="40" align="center" formatter="materialContractTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    <!-- 材料合同 end -->

                    <!-- 劳务费 start -->
                    <div id="project_labourServiceFee" class="tab_3" style="display: none">
                        <table id="labourServiceFee_table" style="width:100%;margin-top: 10px" idField="labourServiceFeeId"
                               url="<%= request.getContextPath() %>/op/labourServiceFee/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="serviceBusinessName" width="50" align="left">劳务商名称</th>
                            <th field="telephone" width="40" align="left">电话</th>
                            <th field="address" width="40" align="left">地址</th>
                            <th field="companyOpeningBank" width="40" align="left">开户银行</th>
                            <th field="accountOpeningAaccount" width="40" align="left">开户账号</th>
                            <th field="signingDate" width="40" align="left">签订日期</th>
                            <th field="laburServiceMaterial" width="40" align="left">劳务材料</th>
                            <th field="taxIdentificationNumber" width="50" align="left">纳税识别号</th>
                            <th field="quantity" width="30" align="right">数量</th>
                            <th field="unitPrice" width="30" align="right">单价</th>
                            <th field="contractAmount" width="40" align="right">合同金额</th>
                            <th field="settlementAmount" width="40" align="right">结算金额</th>
                            <th field="payAmountTotal" width="40" align="right">累计支付金额</th>
                            <th field="noPayAmountTotal" width="40" align="right">未支付金额</th>
                            <th field="amountTotal" width="40" align="right">不含税金额</th>
                            <th field="taxAmountTotal" width="40" align="right">税额</th>
                            <th field="taxPriceAmountTotal" width="40" align="right">税价合计</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="30" align="center" formatter="labourServiceFeeTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    <!-- 劳务费 end -->
                </div>
            </div>
            <!-- 项目信息 end -->

            <div style="clear: both;"></div>
            <!-- 各种tab start -->
            <div class="databox boxinfo" style="margin-top: 10px;padding-bottom:5px;">
                <div id="data_pills">
                    <ul id="projedctInfo_pills" class="nav nav-pills" role="tablist" style="display: inline-block;">
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_TOLL_READ}">
                            <li id="projectInfo_toll" role="presentation" class="active li_1">
                                <a href="#">工程收费</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_INVOICE_READ}">
                            <li id="projectInfo_invoice" role="presentation" class="li_2">
                                <a href="#">工程发票</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_CERTIGIER_READ}">
                            <li id="projectInfo_certigier" role="presentation" class="li_3">
                                <a href="#">授权人</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_RECEIPT_READ}">
                            <li id="projectInfo_receipt" role="presentation" class="li_4">
                                <a href="#">工程收据</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_BANK_READ}" >
                            <li id="projectInfo_bank" role="presentation" class="li_5">
                                <a href="#">银行</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_EVECTION_READ}">
                            <li id="projectInfo_evection" role="presentation" class="li_6">
                                <a href="#">外出证</a>
                            </li>
                        </c:if>
                    </ul>
                    <ul id="materialContract_pills" class="nav nav-pills" role="tablist" style="display: none;">
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALGELD_READ}">
                            <li id="materialContract_toll" role="presentation" class="li_7">
                                <a href="#">材料支付款</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALINVOICE_READ}">
                            <li id="materialContract_invoice" role="presentation" class="li_8">
                                <a href="#">材料发票</a>
                            </li>
                        </c:if>
                    </ul>
                    <ul id="labourServiceFee_pills" class="nav nav-pills" role="tablist" style="display: none;">
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEGELD_READ}">
                            <li id="labourServiceFee_toll" role="presentation" class="li_9">
                                <a href="#">劳务支付款</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEINVOICE_READ}">
                            <li id="labourServiceFee_invoice" role="presentation" class="li_10">
                                <a href="#">劳务费发票</a>
                            </li>
                        </c:if>
                    </ul>
                    <div id="btn_content" class="btn_content" style="margin:5px 10px;float: right">
                        <!-- 添加工程收费btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_TOLL_WRITE}">
                            <div class="btn_1">
                                <button id="addProjectToll_toll" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加工程发票btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_INVOICE_WRITE}">
                            <div class="btn_2" style="display: none;">
                                <button id="addProjectInvoice_invoice" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加授权人btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_CERTIGIER_WRITE}">
                            <div class="btn_3" style="display: none;">
                                <button id="addProjectCertigier_certigier" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加工程收据btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_RECEIPT_WRITE}">
                            <div class="btn_4" style="display: none;">
                                <button id="addProjectReceipt_receipt" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加银行btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_BANK_WRITE}">
                            <div class="btn_5" style="display: none;">
                                <button id="addProjectBank_bank" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加外出证btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_EVECTION_WRITE}">
                            <div class="btn_6" style="display: none;">
                                <button id="addProjectEvection_evection" class="btn btn-primary" style="float: right;">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加材料支付款btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALGELD_WRITE}">
                            <div class="btn_7" style="display: none;">
                                <button id="addMaterialGeld_toll" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 同步材料发票btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALINVOICE_WRITE}">
                            <div class="btn_8" style="display: none;">
                                <button id="syncMaterialInvoice_invoice" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>发票转入
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加材料发票btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALINVOICE_WRITE}">
                            <div class="btn_8" style="display: none;">
                                <button id="addMaterialInvoice_invoice" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加劳务支付款btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEGELD_WRITE}">
                            <div class="btn_9" style="display: none;">
                                <button id="addLabourServiceGeld_toll" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>

                        <!-- 同步劳务费发票btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEINVOICE_WRITE}">
                            <div class="btn_10" style="display: none;">
                                <button id="syncLabourServiceInvoice_invoice" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>发票转入
                                </button>
                            </div>
                        </c:if>
                        <!-- 添加劳务费发票btn -->
                        <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEINVOICE_WRITE}">
                            <div class="btn_10" style="display: none;">
                                <button id="addLabourServiceInvoice_invoice" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div class="title-line"></div>
                <div id="tab_content" class="tab_content">
                    <!-- 工程收费 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_TOLL_READ}">
                    <div id="toll_projectToll" class="tab_1">
                        <table id="projectToll_table" style="width:100%;margin-top: 10px" idField="projectTollId"
                               url="<%= request.getContextPath() %>/op/projectToll/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <tr>
                                <th field="projectTollDate" width="40" align="left">日期</th>
                                <th field="summary" width="40" align="left">摘要</th>
                                <th field="importAmount" width="40" align="right" formatter="amountIs0Formatter">汇入金额</th>
                                <th field="exportAmount" width="40" align="right" formatter="amountIs0Formatter">汇出金额</th>
                                <th field="balance" width="40" align="right" formatter="amountIs0Formatter">余额</th>
                                <th field="vatIncomeTax" width="40" align="right">增值税进项税</th>
                                <th field="manageCost" width="40" align="right">扣管理费</th>
                                <th field="warrantyAmount" width="40" align="right">扣质保金</th>
                                <th field="backWarrantyAmount" width="40" align="right">已退质保金</th>
                                <th field="vatSalesTax" width="40" align="right">增值税销项税</th>
                                <th field="materialGeld" width="40" align="right">材料款</th>
                                <th field="labourServiceFee" width="40" align="right">劳务费</th>
                                <th field="cityBuildTax" width="40" align="right">城市维护建设税</th>
                                <th field="educationSurcharge" width="40" align="right">教育费附加</th>
                                <th field="localEducationAttached" width="40" align="right">地方教育附加</th>
                                <th field="stampDuty" width="40" align="right">扣印花税</th>
                                <th field="individualIncomeTax" width="40" align="right">扣个人所得税</th>
                                <th field="corporateIncomeTax" width="40" align="right">扣企业所得税</th>
                                <th field="waterBuildIncome" width="40" align="right">水利建设专项收入</th>
                                <th field="otherTax" width="40" align="right">其他税</th>
                                <th field="supplementaryBusinessTax" width="40" align="right">扣营业税及附加税</th>
                                <th field="otherAmount" width="40" align="right">扣其他款</th>
                                <th field="interest" width="40" align="right">扣利息</th>
                                <th field="companyFunds" width="40" align="right">汇回公司款</th>
                                <th field="localBankDeposit" width="40" align="right">当地银行存款</th>
                                <th field="action" width="45" align="center" formatter="projectTollTableActionFormatter">操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 工程收费 end -->

                    <!-- 工程发票 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_INVOICE_READ}">
                    <div id="invoice_projectInvoice" style="display: none" class="tab_2">
                        <table id="projectInvoice_table" style="width:100%;margin-top: 10px" idField="invoiceId"
                               url="<%= request.getContextPath() %>/op/projectInvoice/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="invoiceNumber" width="40" align="left">发票号</th>
                            <th field="invoiceDate" width="40" align="left">日期</th>
                            <th field="summary" width="40" align="left">摘要</th>
                            <th field="taxRate" width="40" align="right">税率</th>
                            <th field="invoiceAmount" width="40" align="right">金额</th>
                            <th field="taxTotal" width="40" align="right">税价合计</th>
                            <th field="tax" width="40" align="right">税额</th>
                            <th field="invoiceType" width="40" align="left" formatter="invoiceTypeFormatter">发票类型</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40"align="center" formatter="projectInvoiceTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 工程发票 end -->

                    <!-- 工程授权人 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_CERTIGIER_READ}">
                    <div id="certigier_projectCertigier" style="display: none" class="tab_3">
                        <table id="projectCertigier_table" style="width:100%;margin-top: 10px" idField="certigierId"
                               url="<%= request.getContextPath() %>/op/projectCertigier/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="certigierName" width="40" align="left">授权人</th>
                            <th field="certigierTel" width="40" align="left">授权人联系电话</th>
                            <th field="accreditStart" width="40" align="left">授权日期</th>
                            <th field="accreditEnd" width="40" align="left">授权到期日期</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="projectCertigierTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 工程授权人 end -->

                    <!-- 工程收据 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_RECEIPT_READ}">
                    <div id="receipt_projectReceipt" style="display: none" class="tab_4">
                        <table id="projectReceipt_table" style="width:100%;margin-top: 10px" idField="receiptId"
                               url="<%= request.getContextPath() %>/op/projectReceipt/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="receiptDate" width="40" align="left">日期</th>
                            <th field="receiptNO" width="40" align="left">收据号</th>
                            <th field="receiptAmount" width="40" align="right">收据金额</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="projectReceiptTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 工程收据 end -->

                    <!-- 工程银行 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_BANK_READ}">
                    <div id="bank_projectBank" style="display: none" class="tab_5">
                        <table id="projectBank_table" style="width:100%;margin-top: 10px" idField="bankId"
                               url="<%= request.getContextPath() %>/op/projectBank/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="bankName" width="40" align="left">户名全称</th>
                            <th field="depositBank" width="40" align="left">开户银行</th>
                            <th field="bankAccount" width="40" align="left">银行帐号</th>
                            <th field="cachet" width="40" align="left">公章</th>
                            <th field="financialSeal" width="40" align="left">财务章</th>
                            <th field="personalSeal" width="40" align="left">私章</th>
                            <th field="depositBankAddr" width="40" align="left">开户银行地址</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="projectBankTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 工程银行 end -->

                    <!-- 工程外出证 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_EVECTION_READ}">
                    <div id="evection_projectEvection" style="display: none" class="tab_6">
                        <table id="projectEvection_table" style="width:100%;margin-top: 10px" idField="evectionId"
                               url="<%= request.getContextPath() %>/op/projectEvection/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="evectionNO" width="40" align="left">外出证号</th>
                            <th field="startDate" width="40" align="left">外出证开出日期</th>
                            <th field="endDate" width="40" align="left">外出证到期日期</th>
                            <th field="evectionAmount" width="40" align="right">外出证金额</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="postponeNumber" width="40" align="left">外出证延期号码</th>
                            <th field="postponeStartDate" width="40" align="left">外出证延期日期</th>
                            <th field="postponeEndDate" width="40" align="left">外出证延期后到期日期</th>
                            <th field="postponeAmount" width="40" align="right">延期后外出证金额</th>
                            <th field="postponeRemark" width="40" align="left">延期备注</th>
                            <th field="action" width="40" align="center" formatter="projectEvectionTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 工程外出证 end -->

                    <!-- 材料支付款 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALGELD_READ}">
                    <div id="toll_materialGeld" style="display: none" class="tab_7">
                        <table id="materialGeld_table" style="width:100%;margin-top: 10px" idField="materialGeldId"
                               url="<%= request.getContextPath() %>/op/materialGeld/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="summary" width="40" align="left">摘要</th>
                            <th field="payDate" width="40" align="left">支付日期</th>
                            <th field="payAmount" width="40" align="right">支付金额</th>
                            <th field="cumulativePayAmount" width="40" align="right">累计支付金额</th>
                            <th field="noPayAmount" width="40" align="right">未付款金额</th>
                            <th field="isAutoTransfer" width="40" align="left" formatter="isAutoTransferFormatter">是否自动转入</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="materialGeldTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 材料支付款 end -->

                    <!-- 材料发票 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_MATERIALINVOICE_READ}">
                    <div id="invoice_materialInvoice" style="display: none" class="tab_8">
                        <table id="materialInvoice_table" style="width:100%;margin-top: 10px" idField="materialInvoiceId"
                               url="<%= request.getContextPath() %>/op/materialInvoice/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true" selectOnCheck="false" checkOnSelect="false">
                            <thead>
                            <th field="materialInvoice_ck" checkbox="true" width="40" align="center"></th>
                            <th field="invoiceNumber" width="40" align="left">发票号</th>
                            <th field="registrationDate" width="40" align="left">登记日期</th>
                            <th field="summary" width="40" align="left">摘要</th>
                            <th field="invoiceDate" width="40" align="left">发票填开日期</th>
                            <th field="amount" width="40" align="right">金额</th>
                            <th field="taxRate" width="40" align="right">税率</th>
                            <th field="taxAmount" width="40" align="right">税额</th>
                            <th field="taxPrice" width="40" align="right">税价合计</th>
                            <th field="goodsName" width="40" align="left">货物名称</th>
                            <th field="invoiceType" width="40" align="left"  formatter="invoiceTypeFormatter">发票类型</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="materialInvoiceTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 材料发票 end -->

                    <!-- 劳务费支付款 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEGELD_READ}">
                    <div id="toll_labourServiceGeld" style="display: none" class="tab_9">
                        <table id="labourServiceGeld_table" style="width:100%;margin-top: 10px" idField="labourServiceGeldId"
                               url="<%= request.getContextPath() %>/op/labourServiceGeld/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true">
                            <thead>
                            <th field="summary" width="40" align="left">摘要</th>
                            <th field="payDate" width="40" align="left">日期</th>
                            <th field="payAmount" width="40" align="right">支付金额</th>
                            <th field="cumulativePayAmount" width="40" align="right">累计支付金额</th>
                            <th field="noPayAmount" width="40" align="right">未付款金额</th>
                            <th field="isAutoTransfer" width="40" align="left" formatter="isAutoTransferFormatter">是否自动转入</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="labourServiceGeldTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 劳务费支付款 end -->

                    <!-- 劳务费发票 start -->
                    <c:if test="${sessionScope.PERMISSION_MODEL_PROJECT_LABOURSERVICEINVOICE_READ}">
                    <div id="invoice_labourServiceInvoice" style="display: none" class="tab_10">
                        <table id="labourServiceInvoice_table" style="width:100%;margin-top: 10px" idField="labourServiceInvoiceId"
                               url="<%= request.getContextPath() %>/op/labourServiceInvoice/list" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                               singleSelect="true" selectOnCheck="false" checkOnSelect="false">
                            <thead>
                            <th field="labourServiceInvoice_ck" checkbox="true" width="40" align="center"></th>
                            <th field="invoiceNumber" width="40" align="left">发票号</th>
                            <th field="registrationDate" width="40" align="left">登记日期</th>
                            <th field="summary" width="40" align="left">摘要</th>
                            <th field="invoiceDate" width="40" align="left">发票填开日期</th>
                            <th field="amount" width="40" align="right">金额</th>
                            <th field="taxRates" width="40" align="right">税率</th>
                            <th field="taxAmount" width="40" align="right">税额</th>
                            <th field="taxPriceAmount" width="40" align="right">税价合计</th>
                            <th field="goodsName" width="40" align="left">货物名称</th>
                            <th field="invoiceType" width="40" align="left" formatter="invoiceTypeFormatter">发票类型</th>
                            <th field="remark" width="40" align="left">备注</th>
                            <th field="action" width="40" align="center" formatter="labourServiceInvoiceTableActionFormatter">操作</th>
                            </thead>
                        </table>
                    </div>
                    </c:if>
                    <!-- 劳务费发票 end -->

                </div>
            </div>
            <!-- 各种tab end -->

            <!-- 合计 start -->
            <!-- 工程合计 start -->
            <div id="stat_projectStat_div" class="databox boxinfo" style="margin-top: 10px;margin-bottom: 20px;padding: 0px;">
                <div style="margin:5px;padding-left: 5px; height: 30px; line-height: 30px;">
                    <a href="#" style="font-size:18px;">合计</a>
                </div>
                <div style="clear: both;"></div>
                <div class="tab_content">
                    <div id="stat_projectStat">
                        <table class="table" id="projectStat_table" style="margin-bottom: 0px;">
                            <tr>
                                <td class="statTd" style="border-left-style: none; text-align: right;">项目经理总余额</td>
                                <td id="pmTotalAmount"></td>
                                <td class="statTd" style="text-align: right;">扣管理费</td>
                                <td id="manageRateStat"></td>
                                <td class="statTd" style="text-align: right;">增值税销项税</td>
                                <td id="vatSalesTaxStat"></td>
                                <td class="statTd" style="text-align: right;">教育费附加</td>
                                <td id="educationSurchargeStat"></td>
                                <td class="statTd" style="text-align: right;">发票金额</td>
                                <td id="invoiceAmountStat"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="border-left-style: none; text-align: right;">本项目余额</td>
                                <td id="projectTotalBalance"></td>
                                <td class="statTd" style="text-align: right;">扣保证金</td>
                                <td id="warrantyRateStat"></td>
                                <td class="statTd" style="text-align: right;">企业所得税</td>
                                <td id="corporateIncomeTaxStat"></td>
                                <td class="statTd" style="text-align: right;">地方教育费附加</td>
                                <td id="localEducationAttachedStat"></td>
                                <td class="statTd" style="text-align: right;">发票税款</td>
                                <td id="taxStat"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="border-left-style: none; text-align: right;">汇入金额</td>
                                <td id="importAmountStat"></td>
                                <td class="statTd" style="text-align: right;">已退质保金</td>
                                <td id="backWarrantyAmountStat"></td>
                                <td class="statTd" style="text-align: right;">个人所得税</td>
                                <td id="individualIncomeTaxStat"></td>
                                <td class="statTd" style="text-align: right;">扣营业税及附加税</td>
                                <td id="supplementaryBusinessTaxStat"></td>
                                <td class="statTd" style="text-align: right;">收据金额</td>
                                <td id="receiptAmountStat"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="border-left-style: none; text-align: right;">汇出金额</td>
                                <td id="exportAmountStat"></td>
                                <td class="statTd" style="text-align: right;">增值税进项税</td>
                                <td id="vatIncomeTaxStat"></td>
                                <td class="statTd" style="text-align: right;">印花税</td>
                                <td id="stampDutyRateStat"></td>
                                <td class="statTd" style="text-align: right;">利息</td>
                                <td id="interestStat"></td>
                                <td class="statTd" style="text-align: right;">材料款</td>
                                <td id="materialGeldStat"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="border-left-style: none; text-align: right;">当地银行存款</td>
                                <td id="localBankDepositStat"></td>
                                <td class="statTd" style="text-align: right;">汇回公司款</td>
                                <td id="companyFundsStat"></td>
                                <td class="statTd" style="text-align: right;">城建税</td>
                                <td id="cityBuildTaxStat"></td>
                                <td class="statTd" style="text-align: right;">扣其他款</td>
                                <td id="otherTaxRateStat"></td>
                                <td class="statTd" style="text-align: right;">劳务费</td>
                                <td id="labourServiceFeeStat"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 工程合计 end -->

            <!-- 发票合计 start -->
            <div id="stat_invoiceStat_div" class="databox boxinfo" style="margin-top: 10px;margin-bottom: 20px;padding: 0px; display: none;">
                <div style="margin:5px;padding-left: 5px; height: 30px; line-height: 30px;">
                    <a href="#" style="font-size:18px;">合计</a>
                </div>
                <div style="clear: both;"></div>
                <div class="tab_content">
                    <div id="stat_invoiceStat" class="">
                        <table class="table" id="invoiceStat_table" style="margin-bottom: 0px; border-right: 0px;">
                            <tr>
                                <td class="statTd" style="text-align: center;" rowspan="2">发票合计</td>
                                <td class="statTd" style="text-align: center;" colspan="3">不含税价</td>
                                <td class="statTd" style="text-align: center;" colspan="3">税额</td>
                                <td class="statTd" style="text-align: center;" colspan="3">税价合计</td>
                            </tr>
                            <tr>
                                <td id="invoice_invoiceAmountStat" style="text-align: center;" colspan="3"></td>
                                <td id="invoice_taxStat" style="text-align: center;" colspan="3"></td>
                                <td id="invoice_taxTotalStat" style="text-align: center;" colspan="3"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;"></td>
                                <td class="statTd" style="text-align: center;">增值税</td>
                                <td class="statTd" style="text-align: center;">企业所得税</td>
                                <td class="statTd" style="text-align: center;">个人所得税</td>
                                <td class="statTd" style="text-align: center;">印花税</td>
                                <td class="statTd" style="text-align: center;">城建税</td>
                                <td class="statTd" style="text-align: center;">教育费附加</td>
                                <td class="statTd" style="text-align: center;">地方教育附加</td>
                                <td class="statTd" style="text-align: center;">水利建设收入</td>
                                <td class="statTd" style="text-align: center;">其他税</td>
                            </tr>

                            <tr>
                                <td class="statTd" style="text-align: center;">当地</td>
                                <td id="addedValueTaxValueStat_local" style="text-align: center;"></td>
                                <td id="corporateIncomeTaxValueStat_local" style="text-align: center;"></td>
                                <td id="individualIncomeTaxValueStat_local" style="text-align: center;"></td>
                                <td id="stampDutyValueStat_local" style="text-align: center;"></td>
                                <td id="constructionTaxValueStat_local" style="text-align: center;"></td>
                                <td id="educationalSurtaxValueStat_local" style="text-align: center;"></td>
                                <td id="areaEducationalSurtaxValueStat_local" style="text-align: center;"></td>
                                <td id="waterBuildTaxValueStat_local" style="text-align: center;"></td>
                                <td id="otherTaxValueStat_local" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">外地</td>
                                <td id="addedValueTaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="corporateIncomeTaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="individualIncomeTaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="stampDutyValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="constructionTaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="educationalSurtaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="areaEducationalSurtaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="waterBuildTaxValueStat_nonlocal" style="text-align: center;"></td>
                                <td id="otherTaxValueStat_nonlocal" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">小计</td>
                                <td id="addedValueTaxValueStat_total" style="text-align: center;"></td>
                                <td id="corporateIncomeTaxValueStat_total" style="text-align: center;"></td>
                                <td id="individualIncomeTaxValueStat_total" style="text-align: center;"></td>
                                <td id="stampDutyValueStat_total" style="text-align: center;"></td>
                                <td id="constructionTaxValueStat_total" style="text-align: center;"></td>
                                <td id="educationalSurtaxValueStat_total" style="text-align: center;"></td>
                                <td id="areaEducationalSurtaxValueStat_total" style="text-align: center;"></td>
                                <td id="waterBuildTaxValueStat_total" style="text-align: center;"></td>
                                <td id="otherTaxValueStat_total" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">总合计</td>
                                <td id="totalInvoice" style="text-align: left; padding-left: 20px;" colspan="9"></td>
                            </tr>
                        </table>
                    </div>
              </div>
            </div>
            <!-- 发票合计 end -->

            <!-- 材料合同 start -->
            <div id="stat_materialContractStat_div" class="databox boxinfo" style="margin-top: 10px;margin-bottom: 20px;padding: 0px; display: none;">
                <div style="margin:5px;padding-left: 5px; height: 30px; line-height: 30px;">
                    <a href="#" style="font-size:18px;">合计</a>
                </div>
                <div style="clear: both;"></div>
                <div class="tab_content">
                    <div id="stat_materialContractStat" class="">
                        <table class="table" id="materialContractStat_table" style="margin-bottom: 0px; border-right: 0px;">
                            <tr>
                                <td class="statTd" style="text-align: center;">支付合计：</td>
                                <td class="statTd" style="text-align: center;">累计支付金额</td>
                                <td name="payAmountTotal" style="text-align: center;" colspan="2"></td>
                                <td class="statTd" style="text-align: center;">累计未付金额</td>
                                <td name="noPayAmountTotal" style="text-align: center;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">发票合计：</td>
                                <td class="statTd" style="text-align: center;">3%</td>
                                <td class="statTd" style="text-align: center;">6%</td>
                                <td class="statTd" style="text-align: center;">11%</td>
                                <td class="statTd" style="text-align: center;">17%</td>
                                <td class="statTd" style="text-align: center;">其他</td>
                                <td class="statTd" style="text-align: center;">合计</td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">不含税金额</td>
                                <td name="amountStat3" style="text-align: center;"></td>
                                <td name="amountStat6" style="text-align: center;"></td>
                                <td name="amountStat11" style="text-align: center;"></td>
                                <td name="amountStat17" style="text-align: center;"></td>
                                <td name="amountStatOther" style="text-align: center;"></td>
                                <td name="amountStatTotal" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">税额</td>
                                <td name="taxAmountStat3" style="text-align: center;"></td>
                                <td name="taxAmountStat6" style="text-align: center;"></td>
                                <td name="taxAmountStat11" style="text-align: center;"></td>
                                <td name="taxAmountStat17" style="text-align: center;"></td>
                                <td name="taxAmountStatOther" style="text-align: center;"></td>
                                <td name="taxAmountStatTotal" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">税价合计</td>
                                <td name="taxPriceAmountStat3" style="text-align: center;"></td>
                                <td name="taxPriceAmountStat6" style="text-align: center;"></td>
                                <td name="taxPriceAmountStat11" style="text-align: center;"></td>
                                <td name="taxPriceAmountStat17" style="text-align: center;"></td>
                                <td name="taxPriceAmountStatOther" style="text-align: center;"></td>
                                <td name="taxPriceAmountStatTotal" style="text-align: center;"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 材料合同合计 end -->

            <!-- 劳务费合计 start -->
            <div id="stat_labourServiceFeeStat_div" class="databox boxinfo" style="margin-top: 10px;margin-bottom: 20px;padding: 0px; display: none;">
                <div style="margin:5px;padding-left: 5px; height: 30px; line-height: 30px;">
                    <a href="#" style="font-size:18px;">合计</a>
                </div>
                <div style="clear: both;"></div>
                <div class="tab_content">
                    <div id="stat_labourServiceFeeStat" class="">
                        <table class="table" id="labourServiceFeeStat_table" style="margin-bottom: 0px; border-right: 0px;">
                            <tr>
                                <td class="statTd" style="text-align: center;">支付合计：</td>
                                <td class="statTd" style="text-align: center;">累计支付金额</td>
                                <td name="payAmountTotal" style="text-align: center;" colspan="2"></td>
                                <td class="statTd" style="text-align: center;">累计未付金额</td>
                                <td name="noPayAmountTotal" style="text-align: center;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">发票合计：</td>
                                <td class="statTd" style="text-align: center;">3%</td>
                                <td class="statTd" style="text-align: center;">6%</td>
                                <td class="statTd" style="text-align: center;">11%</td>
                                <td class="statTd" style="text-align: center;">17%</td>
                                <td class="statTd" style="text-align: center;">其他</td>
                                <td class="statTd" style="text-align: center;">合计</td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">不含税金额</td>
                                <td name="amountStat3" style="text-align: center;"></td>
                                <td name="amountStat6" style="text-align: center;"></td>
                                <td name="amountStat11" style="text-align: center;"></td>
                                <td name="amountStat17" style="text-align: center;"></td>
                                <td name="amountStatOther" style="text-align: center;"></td>
                                <td name="amountStatTotal" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">税额</td>
                                <td name="taxAmountStat3" style="text-align: center;"></td>
                                <td name="taxAmountStat6" style="text-align: center;"></td>
                                <td name="taxAmountStat11" style="text-align: center;"></td>
                                <td name="taxAmountStat17" style="text-align: center;"></td>
                                <td name="taxAmountStatOther" style="text-align: center;"></td>
                                <td name="taxAmountStatTotal" style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td class="statTd" style="text-align: center;">税价合计</td>
                                <td name="taxPriceAmountStat3" style="text-align: center;"></td>
                                <td name="taxPriceAmountStat6" style="text-align: center;"></td>
                                <td name="taxPriceAmountStat11" style="text-align: center;"></td>
                                <td name="taxPriceAmountStat17" style="text-align: center;"></td>
                                <td name="taxPriceAmountStatOther" style="text-align: center;"></td>
                                <td name="taxPriceAmountStatTotal" style="text-align: center;"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 劳务费合计 end -->
            <!-- 合计 end -->

            <!-- 收费表单 -->
            <jsp:include page="../projectManager/pmSelectList.jsp"/>
            <!-- 收费表单 -->
            <jsp:include page="tollForm.jsp"/>
            <!-- 发票表单 -->
            <jsp:include page="invoiceForm.jsp"/>
            <!-- 收据表单 -->
            <jsp:include page="receiptForm.jsp"/>
            <!-- 银行表单 -->
            <jsp:include page="../bank/bankForm.jsp"/>
            <!-- 外出证表单 -->
            <jsp:include page="evectionForm.jsp"/>
            <!-- 外出证延期表单 -->
            <jsp:include page="evectionPostponeForm.jsp"/>
            <!-- 授权人表单 -->
            <jsp:include page="certigierForm.jsp"/>

            <!-- 材料合同表单 -->
            <jsp:include page="materialContractForm.jsp"/>
            <!-- 材料支付款表单 -->
            <jsp:include page="materialGeldForm.jsp"/>
            <!-- 材料发票表单 -->
            <jsp:include page="materialInvoiceForm.jsp"/>

            <!-- 劳务费表单 -->
            <jsp:include page="labourServiceFeeForm.jsp"/>
            <!-- 劳务费支付款表单 -->
            <jsp:include page="labourServiceGeldForm.jsp"/>
            <!-- 劳务费发票表单 -->
            <jsp:include page="labourServiceInvoiceForm.jsp"/>

            <!-- Input again amount modal dialog -->
            <div id="againInputAmountModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" style="width: 260px;top: 30%;">
                    <div class="modal-content">
                        <div class="modal-header" style="padding: 10px 0px 5px 20px;">
                            <h4 class="modal-title" id="againInputAmountTitle"></h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <input id="againInputAmountValue" class="form-control input_height" style="text-align: right;height: 35px;"/>
                            <div class="alert alert-danger againInputAmountDiff">两次输入不一致，请确认!</div>
                        </div>
                        <div class="modal-footer" style="padding:5px;">
                            <button id="againInputAmountModalSubmit" type="button" class="btn btn-primary" data-loading-text="确定&hellip;">确定</button>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 注释范围内填充页面正文部分 -->
        </div>
    </div>
</div>

<script src="<%= request.getContextPath() %>/op/js/form/projectInfoForm.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/js/form/formInfo.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/js/form/invoiceForm.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/js/form/tollForm.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/js/form/projectStat.js" type="text/javascript"></script>
</body>
</html>
