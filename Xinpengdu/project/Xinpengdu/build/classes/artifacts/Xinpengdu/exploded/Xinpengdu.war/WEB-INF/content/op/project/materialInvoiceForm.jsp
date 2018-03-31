<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="materialContractId" />
<input type="hidden" id="materialInvoiceId_materialInvoice" />
<!-- Add MaterialInvoice modal dialog -->
<div id="addMaterialInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加材料发票</h4>
            </div>
            <div class="modal-body form-horizontal materialInvoiceAddModal">

                <div class="form-group has-feedback">
                    <label for="invoiceNumberAddModal_materialInvoice" class="col-sm-2 control-label">发票号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="invoiceNumberAddModal_materialInvoice" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="发票号">
                    </div>
                    <label for="registrationDateAddModal_materialInvoice" class="col-sm-2 control-label">登记日期:</label>
                    <div class="input-daterange col-md-4" id="registrationDate_AddModal_materialInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="registrationDateAddModal_materialInvoice" name="registrationDate" style="border-radius: 4px;" readonly="readonly" title="登记日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="summaryAddModal_materialInvoice" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryAddModal_materialInvoice" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="invoiceDateAddModal_materialInvoice" class="col-sm-2 control-label">发票填开日期:</label>
                    <div class="input-daterange col-md-4" id="invoiceDate_AddModal_materialInvoice">
                        <input type="text" class="form-control col-md-12  dateSelect required" id="invoiceDateAddModal_materialInvoice" name="invoiceDate" style="border-radius: 4px;" readonly="readonly" title="发票填开日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="amountAddModal_materialInvoice" class="col-sm-2 control-label">金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="amountAddModal_materialInvoice" name="amount" maxLength="30" autocomplete="off" placeholder="" title="金额">
                    </div>
                    <label for="taxRateAddModal_materialInvoice" class="col-sm-2 control-label">税率:</label>
                    <div class="col-sm-3" style="width:32%;">
                        <div class="input-group" style="width:98%; float:left;">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    选择税率
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" data-toggle="taxRateAddModal_materialInvoice">
                                    <li>3</li>
                                    <li>6</li>
                                    <li>11</li>
                                    <li>17</li>
                                </ul>
                            </div><!-- /btn-group -->
                            <input type="text" class="form-control ipt_tax required" id="taxRateAddModal_materialInvoice" name="taxRate" title="税率" placeholder="输入其他税率">
                        </div><!-- /input-group -->
                        <span class="col-sm-1" style="line-height: 34px;width:5px;padding:0px; float:right;">%</span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxAmountAddModal_materialInvoice" class="col-sm-2 control-label">税额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxAmountAddModal_materialInvoice" name="taxAmount" maxLength="30" autocomplete="off" placeholder="" title="税额">
                    </div>
                    <label for="taxPriceAddModal_materialInvoice" class="col-sm-2 control-label">税价合计:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxPriceAddModal_materialInvoice" name="taxPrice" maxLength="30" autocomplete="off" placeholder="" title="税价合计">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="goodsNameAddModal_materialInvoice" class="col-sm-2 control-label">货物名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="goodsNameAddModal_materialInvoice" name="goodsName" maxLength="30" autocomplete="off" placeholder="" title="货物名称">
                    </div>
                    <label for="invoiceTypeAddModal_materialInvoice" class="col-sm-2 control-label">发票类型:</label>
                    <div class="col-sm-4">
                        <select id="invoiceTypeAddModal_materialInvoice" class="input-sm col-md-12" title="发票类型" >
                            <option value="1">普通发票</option>
                            <option value="2">专用发票</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_materialInvoice" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_materialInvoice" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addMaterialInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit MaterialInvoice modal dialog -->
<div id="editMaterialInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">材料发票信息</h4>
            </div>
            <div class="modal-body form-horizontal materialInvoiceEditModal">

                <div class="form-group has-feedback">
                    <label for="invoiceNumberEditModal_materialInvoice" class="col-sm-2 control-label">发票号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="invoiceNumberEditModal_materialInvoice" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="发票号">
                    </div>
                    <label for="registrationDateEditModal_materialInvoice" class="col-sm-2 control-label">登记日期:</label>
                    <div class="input-daterange col-md-4" id="registrationDate_EditModal_materialInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="registrationDateEditModal_materialInvoice" name="registrationDate" style="border-radius: 4px;" readonly="readonly" title="登记日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="summaryEditModal_materialInvoice" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="summaryEditModal_materialInvoice" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="invoiceDateEditModal_materialInvoice" class="col-sm-2 control-label">发票填开日期:</label>
                    <div class="input-daterange col-md-4" id="invoiceDate_EditModal_materialInvoice">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="invoiceDateEditModal_materialInvoice" name="invoiceDate" style="border-radius: 4px;" readonly="readonly" title="发票填开日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="amountEditModal_materialInvoice" class="col-sm-2 control-label">金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="amountEditModal_materialInvoice" name="amount" maxLength="30" autocomplete="off" placeholder="" title="金额">
                    </div>
                    <label for="taxRateEditModal_materialInvoice" class="col-sm-2 control-label">税率:</label>
                    <div class="col-sm-3" style="width:32%;">
                        <div class="input-group" style="width:98%; float:left;">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    选择税率
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" data-toggle="taxRateEditModal_materialInvoice">
                                    <li>3</li>
                                    <li>6</li>
                                    <li>11</li>
                                    <li>17</li>
                                </ul>
                            </div><!-- /btn-group -->
                            <input type="text" class="form-control ipt_tax required" id="taxRateEditModal_materialInvoice" name="taxRate" title="税率" placeholder="输入其他税率">
                        </div><!-- /input-group -->
                        <span class="col-sm-1" style="line-height: 34px;width:5px;padding:0px; float:right;">%</span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxAmountEditModal_materialInvoice" class="col-sm-2 control-label">税额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxAmountEditModal_materialInvoice" name="taxAmount" maxLength="30" autocomplete="off" placeholder="" title="税额">
                    </div>
                    <label for="taxPriceEditModal_materialInvoice" class="col-sm-2 control-label">税价合计:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="taxPriceEditModal_materialInvoice" name="taxPrice" maxLength="30" autocomplete="off" placeholder="" title="税价合计">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="goodsNameEditModal_materialInvoice" class="col-sm-2 control-label">货物名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="goodsNameEditModal_materialInvoice" name="goodsName" maxLength="30" autocomplete="off" placeholder="" title="货物名称">
                    </div>
                    <label for="invoiceTypeEditModal_materialInvoice" class="col-sm-2 control-label">发票类型:</label>
                    <div class="col-sm-4">
                        <select id="invoiceTypeEditModal_materialInvoice" class="input-sm col-md-12" title="发票类型" >
                            <option value="1">普通发票</option>
                            <option value="2">专用发票</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_materialInvoice" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_materialInvoice" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editMaterialInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove MaterialInvoice modal dialog -->
<div id="removeMaterialInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除材料发票信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该材料发票信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeMaterialInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div id="syncMaterialInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <input type="hidden" id="syncMaterialInvoiceIds" />
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">同步材料发票信息</h4>
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
                        <input type="text" class="form-control ipt_content_left" id="syncMaterialInvoiceRemark" name="syncRemark" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="syncMaterialInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="同意&hellip;">同意</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addMaterialInvoiceModalSubmit").click(function(){
            addMaterialInvoice();
        });
        $("#editMaterialInvoiceModalSubmit").click(function(){
            editMaterialInvoice();
        });
        $("#removeMaterialInvoiceModalSubmit").click(function(){
            deleteMaterialInvoice();
        });

        $("#syncMaterialInvoiceModalSubmit").click(function(){
            syncMaterialInvoice();
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("input[id$='Modal_materialInvoice']").keyup(function () {
            if (isFormatIptData_materialInvoice($(this).attr("id"))) {
                clearNoNumOfAlert($(this));
            }
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("input[id$='Modal_materialInvoice']").focus(function () {
            if ($(this).val() != "" && isFormatIptData_materialInvoice($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("input[id$='Modal_materialInvoice']").blur(function () {
            if ($(this).val() != "" && isFormatIptData_materialInvoice($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), true));
            }
        });

    });

    function getMaterialInvoice(id){
        $.post(baseUrl + '/op/materialInvoice/getInfo', {id: id}, function (response) {
            $("#materialContractId").val(response.materialContractId);
            $("#materialInvoiceId_materialInvoice").val(id);
            $("#invoiceNumberEditModal_materialInvoice").val(response.invoiceNumber);
            $("#registrationDateEditModal_materialInvoice").val(response.registrationDate);
            $("#summaryEditModal_materialInvoice").val(response.summary);
            $("#invoiceDateEditModal_materialInvoice").val(response.invoiceDate);
            $("#amountEditModal_materialInvoice").val(response.amount);
            $("#taxRateEditModal_materialInvoice").val(response.taxRate);
            $("#taxAmountEditModal_materialInvoice").val(response.taxAmount);
            $("#taxPriceEditModal_materialInvoice").val(response.taxPrice);
            $("#goodsNameEditModal_materialInvoice").val(response.goodsName);
            $("#invoiceTypeEditModal_materialInvoice").val(response.invoiceType);
            $("#remarkEditModal_materialInvoice").val(response.remark);
        }, 'json');
    }

    function addMaterialInvoice(){
        if(!materialInvoiceFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/materialInvoice/saveInfo', getMaterialInvoiceParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addMaterialInvoiceModal").modal('hide');
                refreshTable('materialInvoice');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editMaterialInvoice(){
        if(!materialInvoiceFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/materialInvoice/updateInfo', getMaterialInvoiceParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editMaterialInvoiceModal").modal('hide');
                refreshTable('materialInvoice');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getMaterialInvoiceParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                materialContractId: $("#materialContractId").val(),
                materialInvoiceId: $("#materialInvoiceId_materialInvoice").val(),
                invoiceNumber: $("#invoiceNumber" + op + "Modal_materialInvoice").val(),
                registrationDate: $("#registrationDate" + op + "Modal_materialInvoice").val(),
                summary: $("#summary" + op + "Modal_materialInvoice").val(),
                invoiceDate: $("#invoiceDate" + op + "Modal_materialInvoice").val(),
                amount: $("#amount" + op + "Modal_materialInvoice").val(),
                taxRate: $("#taxRate" + op + "Modal_materialInvoice").val(),
                taxAmount: $("#taxAmount" + op + "Modal_materialInvoice").val(),
                taxPrice: $("#taxPrice" + op + "Modal_materialInvoice").val(),
                goodsName: $("#goodsName" + op + "Modal_materialInvoice").val(),
                invoiceType: $("#invoiceType" + op + "Modal_materialInvoice").val(),
                remark: $("#remark" + op + "Modal_materialInvoice").val()
            })
        };
    }

    function deleteMaterialInvoice() {
        var id = $("#materialInvoiceId_materialInvoice").val();
        $.post(baseUrl + '/op/materialInvoice/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeMaterialInvoiceModal").modal('hide');
                refreshTable('materialInvoice');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    function syncMaterialInvoice(){
        var ids=$("#syncMaterialInvoiceIds").val();
        var remark=$("#syncMaterialInvoiceRemark").val();
        $.post(baseUrl + '/op/materialInvoice/syncInvoice', {ids: ids,remark:remark}, function (response) {
            if (response.result) {
                alert("发票转入成功");
                $("#syncMaterialInvoiceModal").modal('hide');
                refreshTable('materialInvoice');
            } else {
                alert("发票转入失败!");
            }
        }, 'json');
    }


    // 材料支付款表单验证
    function materialInvoiceFormValidate(op) {
        var formInfos = $(".materialInvoice" + op + "Modal .required");
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

    function isFormatIptData_materialInvoice(objId){
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