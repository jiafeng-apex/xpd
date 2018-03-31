<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="labourServiceInvoiceId_labourServiceInvoice" />
<!-- Add LabourServiceInvoice modal dialog -->
<div id="addLabourServiceInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加劳务费发票</h4>
            </div>
            <div class="modal-body form-horizontal labourServiceInvoiceAddModal">

                <div class="form-group has-feedback">
                    <label for="invoiceNumberAddModal_labourServiceInvoice" class="col-sm-2 control-label">发票号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="invoiceNumberAddModal_labourServiceInvoice" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="发票号">
                    </div>
                    <label for="registrationDateAddModal_labourServiceInvoice" class="col-sm-2 control-label">登记日期:</label>
                    <div class="input-daterange col-md-4" id="registrationDate_AddModal_labourServiceInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="registrationDateAddModal_labourServiceInvoice" name="registrationDate" style="border-radius: 4px;" readonly="readonly" title="登记日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="summaryAddModal_labourServiceInvoice" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryAddModal_labourServiceInvoice" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="invoiceDateAddModal_labourServiceInvoice" class="col-sm-2 control-label">发票填开日期:</label>
                    <div class="input-daterange col-md-4" id="invoiceDate_AddModal_labourServiceInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="invoiceDateAddModal_labourServiceInvoice" name="invoiceDate" style="border-radius: 4px;" readonly="readonly" title="登记日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="amountAddModal_labourServiceInvoice" class="col-sm-2 control-label">金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="amountAddModal_labourServiceInvoice" name="amount" maxLength="30" autocomplete="off" placeholder="" title="金额">
                    </div>
                    <label for="taxRatesAddModal_labourServiceInvoice" class="col-sm-2 control-label">税率:</label>
                    <div class="col-sm-3" style="width:32%;">
                        <div class="input-group" style="width:98%; float:left;">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    选择税率
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" data-toggle="taxRatesAddModal_labourServiceInvoice">
                                    <li>3</li>
                                    <li>6</li>
                                    <li>11</li>
                                    <li>17</li>
                                </ul>
                            </div><!-- /btn-group -->
                            <input type="text" class="form-control ipt_tax required" id="taxRatesAddModal_labourServiceInvoice" name="taxRate" title="税率" placeholder="输入其他税率">
                        </div><!-- /input-group -->
                        <span class="col-sm-1" style="line-height: 34px;width:5px;padding:0px; float:right;">%</span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxAmountAddModal_labourServiceInvoice" class="col-sm-2 control-label">税额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxAmountAddModal_labourServiceInvoice" name="taxAmount" maxLength="30" autocomplete="off" placeholder="" title="税额">
                    </div>
                    <label for="taxPriceAmountAddModal_labourServiceInvoice" class="col-sm-2 control-label">税价合计:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxPriceAmountAddModal_labourServiceInvoice" name="taxPriceAmount" maxLength="30" autocomplete="off" placeholder="" title="税价合计">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="goodsNameAddModal_labourServiceInvoice" class="col-sm-2 control-label">货物名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="goodsNameAddModal_labourServiceInvoice" name="goodsName" maxLength="30" autocomplete="off" placeholder="" title="货物名称">
                    </div>
                    <label for="invoiceTypeAddModal_labourServiceInvoice" class="col-sm-2 control-label">发票类型:</label>
                    <div class="col-sm-4">
                        <select id="invoiceTypeAddModal_labourServiceInvoice" class="input-sm col-md-12" title="发票类型" >
                            <option value="1">普通发票</option>
                            <option value="2">专用发票</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_labourServiceInvoice" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_labourServiceInvoice" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addLabourServiceInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit LabourServiceInvoice modal dialog -->
<div id="editLabourServiceInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">劳务费发票信息</h4>
            </div>
            <div class="modal-body form-horizontal labourServiceInvoiceEditModal">

                <div class="form-group has-feedback">
                    <label for="invoiceNumberEditModal_labourServiceInvoice" class="col-sm-2 control-label">发票号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="invoiceNumberEditModal_labourServiceInvoice" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="发票号">
                    </div>
                    <label for="registrationDateEditModal_labourServiceInvoice" class="col-sm-2 control-label">登记日期:</label>
                    <div class="input-daterange col-md-4" id="registrationDate_EditModal_labourServiceInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="registrationDateEditModal_labourServiceInvoice" name="registrationDate" style="border-radius: 4px;" readonly="readonly" title="登记日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="summaryEditModal_labourServiceInvoice" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryEditModal_labourServiceInvoice" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="invoiceDateEditModal_labourServiceInvoice" class="col-sm-2 control-label">发票填开日期:</label>
                    <div class="input-daterange col-md-4" id="invoiceDate_EditModal_labourServiceInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="invoiceDateEditModal_labourServiceInvoice" name="invoiceDate" style="border-radius: 4px;" readonly="readonly" title="登记日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="amountEditModal_labourServiceInvoice" class="col-sm-2 control-label">金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="amountEditModal_labourServiceInvoice" name="amount" maxLength="30" autocomplete="off" placeholder="" title="金额">
                    </div>
                    <label for="taxRatesEditModal_labourServiceInvoice" class="col-sm-2 control-label">税率:</label>
                    <div class="col-sm-3" style="width:32%;">
                        <div class="input-group" style="width:98%; float:left;">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    选择税率
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" data-toggle="taxRatesEditModal_labourServiceInvoice">
                                    <li>3</li>
                                    <li>6</li>
                                    <li>11</li>
                                    <li>17</li>
                                </ul>
                            </div><!-- /btn-group -->
                            <input type="text" class="form-control ipt_tax required" id="taxRatesEditModal_labourServiceInvoice" name="taxRate" title="税率" placeholder="输入其他税率">
                        </div><!-- /input-group -->
                        <span class="col-sm-1" style="line-height: 34px;width:5px;padding:0px; float:right;">%</span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxAmountEditModal_labourServiceInvoice" class="col-sm-2 control-label">税额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxAmountEditModal_labourServiceInvoice" name="taxAmount" maxLength="30" autocomplete="off" placeholder="" title="税额">
                    </div>
                    <label for="taxPriceAmountEditModal_labourServiceInvoice" class="col-sm-2 control-label">税价合计:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxPriceAmountEditModal_labourServiceInvoice" name="taxPriceAmount" maxLength="30" autocomplete="off" placeholder="" title="税价合计">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="goodsNameEditModal_labourServiceInvoice" class="col-sm-2 control-label">货物名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="goodsNameEditModal_labourServiceInvoice" name="goodsName" maxLength="30" autocomplete="off" placeholder="" title="货物名称">
                    </div>
                    <label for="invoiceTypeEditModal_labourServiceInvoice" class="col-sm-2 control-label">发票类型:</label>
                    <div class="col-sm-4">
                        <select id="invoiceTypeEditModal_labourServiceInvoice" class="input-sm col-md-12" title="发票类型" >
                            <option value="1">普通发票</option>
                            <option value="2">专用发票</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_labourServiceInvoice" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_labourServiceInvoice" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editLabourServiceInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove LabourServiceInvoice modal dialog -->
<div id="removeLabourServiceInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除劳务费发票信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该劳务费发票信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeLabourServiceInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove LabourServiceInvoice modal dialog -->
<div id="syncLabourServiceInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <input type="hidden" id="syncLabourServiceInvoiceIds" />
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">同步劳务费发票信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">日期:</label>
                    <div class="col-sm-9">
                        <p class="form-control ipt_content_left" name="syncDate" style="border: 0;-webkit-box-shadow:none;"></p>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">金额:</label>
                    <div class="input-daterange col-md-9">
                        <p class="form-control ipt_content_left" name="syncAmount" style="border: 0;-webkit-box-shadow:none;"></p>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">税额:</label>
                    <div class="input-daterange col-md-9">
                        <p class="form-control ipt_content_left" name="syncTaxAmount" style="border: 0;-webkit-box-shadow:none;"></p>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">税价合计:</label>
                    <div class="input-daterange col-md-9">
                        <p class="form-control ipt_content_left" name="syncTaxPriceAmount" style="border: 0;-webkit-box-shadow:none;"></p>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">摘要:</label>
                    <div class="input-daterange col-md-9" >
                        <input type="text" class="form-control ipt_content_left" id="syncLabourServiceInvoiceRemark" name="syncRemark" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="syncLabourServiceInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="同意&hellip;">同意</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addLabourServiceInvoiceModalSubmit").click(function(){
            addLabourServiceInvoice();
        });
        $("#editLabourServiceInvoiceModalSubmit").click(function(){
            editLabourServiceInvoice();
        });
        $("#removeLabourServiceInvoiceModalSubmit").click(function(){
            deleteLabourServiceInvoice();
        });
        $("#syncLabourServiceInvoiceModalSubmit").click(function(){
            syncLabourServiceInvoice();
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("input[id$='Modal_labourServiceInvoice']").keyup(function () {
            if (isFormatIptData_labourServiceInvoice($(this).attr("id"))) {
                clearNoNumOfAlert($(this));
            }
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("input[id$='Modal_labourServiceInvoice']").focus(function () {
            if ($(this).val() != "" && isFormatIptData_labourServiceInvoice($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("input[id$='Modal_labourServiceInvoice']").blur(function () {
            if ($(this).val() != "" && isFormatIptData_labourServiceInvoice($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), true));
            }
        });

    });

    function getLabourServiceInvoice(id){
        $.post(baseUrl + '/op/labourServiceInvoice/getInfo', {id: id}, function (response) {
            $("#labourServiceFeeId").val(response.labourServiceFeeId);
            $("#labourServiceInvoiceId_labourServiceInvoice").val(id);
            $("#invoiceNumberEditModal_labourServiceInvoice").val(response.invoiceNumber);
            $("#registrationDateEditModal_labourServiceInvoice").val(response.registrationDate);
            $("#summaryEditModal_labourServiceInvoice").val(response.summary);
            $("#invoiceDateEditModal_labourServiceInvoice").val(response.invoiceDate);
            $("#amountEditModal_labourServiceInvoice").val(response.amount);
            $("#taxRatesEditModal_labourServiceInvoice").val(response.taxRates);
            $("#taxAmountEditModal_labourServiceInvoice").val(response.taxAmount);
            $("#taxPriceAmountEditModal_labourServiceInvoice").val(response.taxPriceAmount);
            $("#goodsNameEditModal_labourServiceInvoice").val(response.goodsName);
            $("#invoiceTypeEditModal_labourServiceInvoice").val(response.invoiceType);
            $("#remarkEditModal_labourServiceInvoice").val(response.remark);
        }, 'json');
    }

    function addLabourServiceInvoice(){
        if(!labourServiceInvoiceFormValidate('Add')){
            return;
        }

        $.post(baseUrl + '/op/labourServiceInvoice/saveInfo', getLabourServiceInvoiceParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addLabourServiceInvoiceModal").modal('hide');
                refreshTable('labourServiceInvoice');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editLabourServiceInvoice(){
        if(!labourServiceInvoiceFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/labourServiceInvoice/updateInfo', getLabourServiceInvoiceParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editLabourServiceInvoiceModal").modal('hide');
                refreshTable('labourServiceInvoice');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getLabourServiceInvoiceParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                labourServiceFeeId: $("#labourServiceFeeId").val(),
                labourServiceInvoiceId: $("#labourServiceInvoiceId_labourServiceInvoice").val(),
                invoiceNumber: $("#invoiceNumber" + op + "Modal_labourServiceInvoice").val(),
                registrationDate: $("#registrationDate" + op + "Modal_labourServiceInvoice").val(),
                summary: $("#summary" + op + "Modal_labourServiceInvoice").val(),
                invoiceDate: $("#invoiceDate" + op + "Modal_labourServiceInvoice").val(),
                amount: $("#amount" + op + "Modal_labourServiceInvoice").val(),
                taxRates: $("#taxRates" + op + "Modal_labourServiceInvoice").val(),
                taxAmount: $("#taxAmount" + op + "Modal_labourServiceInvoice").val(),
                taxPriceAmount: $("#taxPriceAmount" + op + "Modal_labourServiceInvoice").val(),
                goodsName: $("#goodsName" + op + "Modal_labourServiceInvoice").val(),
                invoiceType: $("#invoiceType" + op + "Modal_labourServiceInvoice").val(),
                remark: $("#remark" + op + "Modal_labourServiceInvoice").val()
            })
        };
    }

    function deleteLabourServiceInvoice() {
        var id = $("#labourServiceInvoiceId_labourServiceInvoice").val();
        $.post(baseUrl + '/op/labourServiceInvoice/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeLabourServiceInvoiceModal").modal('hide');
                refreshTable('labourServiceInvoice');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    function syncLabourServiceInvoice(){
        var ids=$("#syncLabourServiceInvoiceIds").val();
        var remark=$("#syncLabourServiceInvoiceRemark").val();
        $.post(baseUrl + '/op/labourServiceInvoice/syncInvoice', {ids: ids,remark:remark}, function (response) {
            if (response.result) {
                alert("发票转入成功");
                $("#syncLabourServiceInvoiceModal").modal('hide');
                refreshTable('labourServiceInvoice');
            } else {
                alert("发票转入失败!");
            }
        }, 'json');
    }

    // 材料支付款表单验证
    function labourServiceInvoiceFormValidate(op) {
        var formInfos = $(".labourServiceInvoice" + op + "Modal .required");
        for (var i = 0; i < formInfos.length; i++) {
            var idName = formInfos[i].id;
            var titleName = formInfos[i].title;
            var $ipt = $("#" + idName);
            var iptValue = $ipt.val();
            if (iptValue == "") {
                alert("请输入" + titleName + "!");
                $ipt.focus();
                return false;
            }
        }
        return true;
    }

    function isFormatIptData_labourServiceInvoice(objId){
        var index = objId.indexOf("AddModal");
        if(index <= 0){
            index = objId.indexOf("EditModal");
        }
        var objField = objId.substring(0,index);
        if(objField == "amount" || objField == "taxAmount" || objField == "taxPrice"){
            return true;
        }
        return false;
    }


</script>