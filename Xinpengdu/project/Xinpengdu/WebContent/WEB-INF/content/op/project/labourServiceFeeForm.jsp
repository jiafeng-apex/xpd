<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="labourServiceFeeId" />
<input type="hidden" id="pay_Amount_Total" />
<input type="hidden" id="noPay_Amount_Total" />
<input type="hidden" id="contract_Amount" />
<input type="hidden" id="business_Name" />
<!-- Add LabourServiceFee modal dialog -->
<div id="addLabourServiceFeeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加劳务费</h4>
            </div>
            <div class="modal-body form-horizontal labourServiceFeeAddModal">

                <div class="form-group has-feedback">
                    <label for="serviceBusinessNameAddModal_labourServiceFee" class="col-sm-2 control-label">劳务商名称:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left required" id="serviceBusinessNameAddModal_labourServiceFee" name="serviceBusinessName" maxLength="30" autocomplete="off" placeholder="" title="劳务商名称">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="telephoneAddModal_labourServiceFee" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="telephoneAddModal_labourServiceFee" name="telephone" maxLength="30" autocomplete="off" placeholder="" title="电话">
                    </div>
                    <label for="addressAddModal_labourServiceFee" class="col-sm-2 control-label">地址:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="addressAddModal_labourServiceFee" name="address" maxLength="30" autocomplete="off" placeholder="" title="地址">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="companyOpeningBankAddModal_labourServiceFee" class="col-sm-2 control-label">开户银行:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="companyOpeningBankAddModal_labourServiceFee" name="companyOpeningBank" maxLength="30" autocomplete="off" placeholder="" title="开户银行">
                    </div>
                    <label for="accountOpeningAaccountAddModal_labourServiceFee" class="col-sm-2 control-label">开户账号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="accountOpeningAaccountAddModal_labourServiceFee" name="accountOpeningAaccount" maxLength="30" autocomplete="off" placeholder="" title="开户账号">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="signingDateAddModal_labourServiceFee" class="col-sm-2 control-label">签订日期:</label>
                    <div class="input-daterange col-md-4" id="registrationDate_AddModal_labourServiceFee">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="signingDateAddModal_labourServiceFee" name="registrationDate" style="border-radius: 4px;" readonly="readonly" title="签订日期"/>
                    </div>
                    <label for="laburServiceMaterialAddModal_labourServiceFee" class="col-sm-2 control-label">劳务材料:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="laburServiceMaterialAddModal_labourServiceFee" name="laburServiceMaterial" maxLength="30" autocomplete="off" placeholder="" title="劳务材料">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxIdentificationNumberAddModal_labourServiceFee" class="col-sm-2 control-label">纳税识别号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="taxIdentificationNumberAddModal_labourServiceFee" name="taxIdentificationNumber" maxLength="30" autocomplete="off" placeholder="" title="纳税识别号">
                    </div>
                    <label for="quantityAddModal_labourServiceFee" class="col-sm-2 control-label">数量:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="quantityAddModal_labourServiceFee" name="quantity" maxLength="30" autocomplete="off" placeholder="" title="数量">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="unitPriceAddModal_labourServiceFee" class="col-sm-2 control-label">单价:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="unitPriceAddModal_labourServiceFee" name="unitPrice" maxLength="30" autocomplete="off" placeholder="" title="单价">
                    </div>
                    <label for="contractAmountAddModal_labourServiceFee" class="col-sm-2 control-label">合同金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="contractAmountAddModal_labourServiceFee" name="contractAmount" maxLength="30" autocomplete="off" placeholder="" title="合同金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="settlementAmountAddModal_labourServiceFee" class="col-sm-2 control-label">结算金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="settlementAmountAddModal_labourServiceFee" name="settlementAmount" maxLength="30" autocomplete="off" placeholder="" title="结算金额">
                    </div>
                    <label for="remarkAddModal_labourServiceFee" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_labourServiceFee" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addLabourServiceFeeModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit LabourServiceFee modal dialog -->
<div id="editLabourServiceFeeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">劳务费信息</h4>
            </div>
            <div class="modal-body form-horizontal labourServiceFeeEditModal">

                <div class="form-group has-feedback">
                    <label for="serviceBusinessNameEditModal_labourServiceFee" class="col-sm-2 control-label">劳务商名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="serviceBusinessNameEditModal_labourServiceFee" name="serviceBusinessName" maxLength="30" autocomplete="off" placeholder="" title="劳务商名称">
                    </div>
                    <label for="telephoneEditModal_labourServiceFee" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="telephoneEditModal_labourServiceFee" name="telephone" maxLength="30" autocomplete="off" placeholder="" title="电话">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="companyOpeningBankEditModal_labourServiceFee" class="col-sm-2 control-label">开户银行:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="companyOpeningBankEditModal_labourServiceFee" name="companyOpeningBank" maxLength="30" autocomplete="off" placeholder="" title="开户银行">
                    </div>
                    <label for="accountOpeningAaccountEditModal_labourServiceFee" class="col-sm-2 control-label">开户账号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="accountOpeningAaccountEditModal_labourServiceFee" name="accountOpeningAaccount" maxLength="30" autocomplete="off" placeholder="" title="开户账号">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="signingDateEditModal_labourServiceFee" class="col-sm-2 control-label">签订日期:</label>
                    <div class="input-daterange col-md-4" id="registrationDate_EditModal_labourServiceFee">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="signingDateEditModal_labourServiceFee" name="registrationDate" style="border-radius: 4px;" readonly="readonly" title="签订日期"/>
                    </div>
                    <label for="laburServiceMaterialEditModal_labourServiceFee" class="col-sm-2 control-label">劳务材料:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="laburServiceMaterialEditModal_labourServiceFee" name="laburServiceMaterial" maxLength="30" autocomplete="off" placeholder="" title="劳务材料">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxIdentificationNumberEditModal_labourServiceFee" class="col-sm-2 control-label">纳税识别号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="taxIdentificationNumberEditModal_labourServiceFee" name="taxIdentificationNumber" maxLength="30" autocomplete="off" placeholder="" title="纳税识别号">
                    </div>
                    <label for="quantityEditModal_labourServiceFee" class="col-sm-2 control-label">数量:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="quantityEditModal_labourServiceFee" name="quantity" maxLength="30" autocomplete="off" placeholder="" title="数量">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="unitPriceEditModal_labourServiceFee" class="col-sm-2 control-label">单价:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="unitPriceEditModal_labourServiceFee" name="unitPrice" maxLength="30" autocomplete="off" placeholder="" title="单价">
                    </div>
                    <label for="contractAmountEditModal_labourServiceFee" class="col-sm-2 control-label">合同金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="contractAmountEditModal_labourServiceFee" name="contractAmount" maxLength="30" autocomplete="off" placeholder="" title="合同金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="settlementAmountEditModal_labourServiceFee" class="col-sm-2 control-label">结算金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="settlementAmountEditModal_labourServiceFee" name="settlementAmount" maxLength="30" autocomplete="off" placeholder="" title="结算金额">
                    </div>
                    <label for="remarkEditModal_labourServiceFee" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_labourServiceFee" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editLabourServiceFeeModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove LabourServiceFee modal dialog -->
<div id="removeLabourServiceFeeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除劳务费信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该劳务费信息？</p>
                <div class="alert alert-danger labourServiceGeldError">该劳务费下存在劳务支付款!</div>
                <div class="alert alert-danger labourServiceInvoiceError">该劳务费下存在劳务发票!</div>
                <div class="alert alert-danger Error">删除失败，请联系管理员!</div>
            </div>
            <div class="modal-footer">
                <button id="removeLabourServiceFeeModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addLabourServiceFeeModalSubmit").click(function(){
            addLabourServiceFee();
        });
        $("#editLabourServiceFeeModalSubmit").click(function(){
            editLabourServiceFee();
        });
        $("#removeLabourServiceFeeModalSubmit").click(function(){
            deleteLabourServiceFee();
        });

        $('#removeLabourServiceFeeModal').on('hidden.bs.modal', function (e) {
            $('#removeLabourServiceFeeModal .alert').hide();
        });

        // 只能输入数字
        $("#telephoneAddModal_labourServiceFee,#telephoneEditModal_labourServiceFee,#quantityAddModal_labourServiceFee,#quantityEditModal_labourServiceFee").keyup(function () {
            this.value = this.value.replace(/[^\d]/g, "");
            if (this.value.length > 11) {
                this.value = this.value.substring(0, 11);
            }
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("input[id$='Modal_labourServiceFee']").keyup(function () {
            if (isFormatIptData_labourServiceFee($(this).attr("id"))) {
                clearNoNumOfAlert($(this));
            }
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("input[id$='Modal_labourServiceFee']").focus(function () {
            if ($(this).val() != "" && isFormatIptData_labourServiceFee($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("input[id$='Modal_labourServiceFee']").blur(function () {
            if ($(this).val() != "" && isFormatIptData_labourServiceFee($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), true));
            }
        });

    });

    function getLabourServiceFee(id){
        $.post(baseUrl + '/op/labourServiceFee/getInfo', {id: id}, function (response) {
            $("#labourServiceFeeId").val(id);
            $("#serviceBusinessNameEditModal_labourServiceFee").val(response.serviceBusinessName);
            $("#telephoneEditModal_labourServiceFee").val(response.telephone);
            $("#companyOpeningBankEditModal_labourServiceFee").val(response.companyOpeningBank);
            $("#accountOpeningAaccountEditModal_labourServiceFee").val(response.accountOpeningAaccount);
            $("#signingDateEditModal_labourServiceFee").val(response.signingDate);
            $("#laburServiceMaterialEditModal_labourServiceFee").val(response.laburServiceMaterial);
            $("#taxIdentificationNumberEditModal_labourServiceFee").val(response.taxIdentificationNumber);
            $("#quantityEditModal_labourServiceFee").val(response.quantity);
            $("#unitPriceEditModal_labourServiceFee").val(response.unitPrice);
            $("#contractAmountEditModal_labourServiceFee").val(response.contractAmount);
            $("#settlementAmountEditModal_labourServiceFee").val(response.settlementAmount);
            $("#remarkEditModal_labourServiceFee").val(response.remark);
        }, 'json');
    }

    function addLabourServiceFee(){
        if(!labourServiceFeeFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/labourServiceFee/saveInfo', getLabourServiceFeeParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addLabourServiceFeeModal").modal('hide');
                refreshTable('labourServiceFee');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editLabourServiceFee(){
        if(!labourServiceFeeFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/labourServiceFee/updateInfo', getLabourServiceFeeParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editLabourServiceFeeModal").modal('hide');
                refreshTable('labourServiceFee');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getLabourServiceFeeParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                labourServiceFeeId: $("#labourServiceFeeId").val(),
                serviceBusinessName: $("#serviceBusinessName" + op + "Modal_labourServiceFee").val(),
                telephone: $("#telephone" + op + "Modal_labourServiceFee").val(),
                companyOpeningBank: $("#companyOpeningBank" + op + "Modal_labourServiceFee").val(),
                accountOpeningAaccount: $("#accountOpeningAaccount" + op + "Modal_labourServiceFee").val(),
                signingDate: $("#signingDate" + op + "Modal_labourServiceFee").val(),
                laburServiceMaterial: $("#laburServiceMaterial" + op + "Modal_labourServiceFee").val(),
                taxIdentificationNumber: $("#taxIdentificationNumber" + op + "Modal_labourServiceFee").val(),
                quantity: $("#quantity" + op + "Modal_labourServiceFee").val(),
                unitPrice: $("#unitPrice" + op + "Modal_labourServiceFee").val(),
                contractAmount: $("#contractAmount" + op + "Modal_labourServiceFee").val(),
                settlementAmount: $("#settlementAmount" + op + "Modal_labourServiceFee").val(),
                remark: $("#remark" + op + "Modal_labourServiceFee").val()
            })
        };
    }

    function deleteLabourServiceFee() {
        var id = $("#labourServiceFeeId").val();
        $.post(baseUrl + '/op/labourServiceFee/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeLabourServiceFeeModal").modal('hide');
                $("#labourServiceFeeId").val("");
                refreshTable('labourServiceFee');
            } else {
                $('#removeLabourServiceFeeModal .' + response.msg).fadeIn();
            }
        }, 'json');
    }

    // 表单验证
    function labourServiceFeeFormValidate(op) {
        var formInfos = $(".labourServiceFee" + op + "Modal .required");
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

        var $telephone = $("#telephone" + op + "Modal_labourServiceFee");
        var telephoneValue = $telephone.val();
        if (telephoneValue != "") {
            var re = /^1\d{10}$/;
            if (!re.test(telephoneValue)) {
                alert("请输入11位有效的联系电话!");
                $telephone.focus();
                return false;
            }
        }
        return true;
    }

    function isFormatIptData_labourServiceFee(objId){
        var index = objId.indexOf("AddModal");
        if(index <= 0){
            index = objId.indexOf("EditModal");
        }
        var objField = objId.substring(0,index);
        if(objField == "contractAmount" || objField == "settlementAmount" || objField == "unitPrice"){
            return true;
        }
        return false;
    }



</script>