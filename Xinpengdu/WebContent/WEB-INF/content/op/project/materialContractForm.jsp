<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="materialContractId" />
<!-- Add MaterialContract modal dialog -->
<div id="addMaterialContractModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加材料合同</h4>
            </div>
            <div class="modal-body form-horizontal materialContractAddModal">
                <div class="form-group has-feedback">
                    <label for="supplierNameAddModal_materialContract" class="col-sm-2 control-label">供应商名称:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left required" id="supplierNameAddModal_materialContract" name="supplierName" maxLength="30" autocomplete="off" placeholder="" title="供应商名称">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="telephoneAddModal_materialContract" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="telephoneAddModal_materialContract" name="telephone" maxLength="30" autocomplete="off" placeholder="" title="电话">
                    </div>
                    <label for="addressAddModal_materialContract" class="col-sm-2 control-label">地址:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="addressAddModal_materialContract" name="address" maxLength="30" autocomplete="off" placeholder="" title="地址">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="openingBankAddModal_materialContract" class="col-sm-2 control-label">开户银行:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="openingBankAddModal_materialContract" name="openingBank" maxLength="30" autocomplete="off" placeholder="" title="开户银行">
                    </div>
                    <label for="accountNumberAddModal_materialContract" class="col-sm-2 control-label">开户账号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="accountNumberAddModal_materialContract" name="accountNumber" maxLength="30" autocomplete="off" placeholder="" title="开户账号">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="signingDateAddModal_materialContract" class="col-sm-2 control-label">签订日期:</label>
                    <div class="input-daterange col-md-4" id="signingDate_AddModal_materialGeld">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="signingDateAddModal_materialContract" name="signingDate" style="border-radius: 4px;" readonly="readonly" title="签订日期" />
                    </div>
                    <label for="materialNameAddModal_materialContract" class="col-sm-2 control-label">材料名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="materialNameAddModal_materialContract" name="materialName" maxLength="30" autocomplete="off" placeholder="" title="材料名称">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxIdentificationNumberAddModal_materialContract" class="col-sm-2 control-label">纳税识别号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="taxIdentificationNumberAddModal_materialContract" name="taxIdentificationNumber" maxLength="30" autocomplete="off" placeholder="" title="纳税识别号">
                    </div>
                    <label for="quantityAddModal_materialContract" class="col-sm-2 control-label">数量:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="quantityAddModal_materialContract" name="quantity" maxLength="30" autocomplete="off" placeholder="" title="数量">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="unitPriceAddModal_materialContract" class="col-sm-2 control-label">单价:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="unitPriceAddModal_materialContract" name="unitPrice" maxLength="30" autocomplete="off" placeholder="" title="单价">
                    </div>
                    <label for="contractAmountAddModal_materialContract" class="col-sm-2 control-label">合同金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="contractAmountAddModal_materialContract" name="contractAmount" maxLength="30" autocomplete="off" placeholder="" title="合同金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="settlementAmountAddModal_materialContract" class="col-sm-2 control-label">结算金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="settlementAmountAddModal_materialContract" name="settlementAmount" maxLength="30" autocomplete="off" placeholder="" title="结算金额">
                    </div>
                    <label for="remarkAddModal_materialContract" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_materialContract" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addMaterialContractModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit MaterialContract modal dialog -->
<div id="editMaterialContractModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">材料合同信息</h4>
            </div>
            <div class="modal-body form-horizontal materialContractEditModal">
                <div class="form-group has-feedback">
                    <label for="supplierNameEditModal_materialContract" class="col-sm-2 control-label">供应商名称:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left required" id="supplierNameEditModal_materialContract" name="supplierName" maxLength="30" autocomplete="off" placeholder="" title="供应商名称">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="telephoneEditModal_materialContract" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="telephoneEditModal_materialContract" name="telephone" maxLength="30" autocomplete="off" placeholder="" title="电话">
                    </div>
                    <label for="addressEditModal_materialContract" class="col-sm-2 control-label">地址:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="addressEditModal_materialContract" name="address" maxLength="30" autocomplete="off" placeholder="" title="地址">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="openingBankEditModal_materialContract" class="col-sm-2 control-label">开户银行:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="openingBankEditModal_materialContract" name="openingBank" maxLength="30" autocomplete="off" placeholder="" title="开户银行">
                    </div>
                    <label for="accountNumberEditModal_materialContract" class="col-sm-2 control-label">开户账号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="accountNumberEditModal_materialContract" name="accountNumber" maxLength="30" autocomplete="off" placeholder="" title="开户账号">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="signingDateEditModal_materialContract" class="col-sm-2 control-label">签订日期:</label>
                    <div class="input-daterange col-md-4" id="signingDate_EditModal_materialGeld">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="signingDateEditModal_materialContract" name="signingDate" style="border-radius: 4px;" readonly="readonly" title="签订日期"/>
                    </div>
                    <label for="materialNameEditModal_materialContract" class="col-sm-2 control-label">材料名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="materialNameEditModal_materialContract" name="materialName" maxLength="30" autocomplete="off" placeholder="" title="材料名称">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="taxIdentificationNumberEditModal_materialContract" class="col-sm-2 control-label">纳税识别号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="taxIdentificationNumberEditModal_materialContract" name="taxIdentificationNumber" maxLength="30" autocomplete="off" placeholder="" title="纳税识别号">
                    </div>
                    <label for="quantityEditModal_materialContract" class="col-sm-2 control-label">数量:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="quantityEditModal_materialContract" name="quantity" maxLength="30" autocomplete="off" placeholder="" title="数量">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="unitPriceEditModal_materialContract" class="col-sm-2 control-label">单价:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="unitPriceEditModal_materialContract" name="unitPrice" maxLength="30" autocomplete="off" placeholder="" title="单价">
                    </div>
                    <label for="contractAmountEditModal_materialContract" class="col-sm-2 control-label">合同金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="contractAmountEditModal_materialContract" name="contractAmount" maxLength="30" autocomplete="off" placeholder="" title="合同金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="settlementAmountEditModal_materialContract" class="col-sm-2 control-label">结算金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="settlementAmountEditModal_materialContract" name="settlementAmount" maxLength="30" autocomplete="off" placeholder="" title="结算金额">
                    </div>
                    <label for="remarkEditModal_materialContract" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_materialContract" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editMaterialContractModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove MaterialContract modal dialog -->
<div id="removeMaterialContractModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除材料合同信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该材料合同信息？</p>
                <div class="alert alert-danger materialGeldError">该材料合同下存在材料支付款!</div>
                <div class="alert alert-danger materialInvoiceError">该材料合同下存在材料发票!</div>
                <div class="alert alert-danger Error">删除失败，请联系管理员!</div>
            </div>
            <div class="modal-footer">
                <button id="removeMaterialContractModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addMaterialContractModalSubmit").click(function(){
            addMaterialContract();
        });
        $("#editMaterialContractModalSubmit").click(function(){
            editMaterialContract();
        });
        $("#removeMaterialContractModalSubmit").click(function(){
            deleteMaterialContract();
        });

        $('#removeMaterialContractModal').on('hidden.bs.modal', function (e) {
            $('#removeMaterialContractModal .alert').hide();
        });

        // 只能输入数字
        $("#telephoneAddModal_materialContract,#telephoneEditModal_materialContract,#quantityAddModal_materialContract,#quantityEditModal_materialContract").keyup(function () {
            this.value = this.value.replace(/[^\d]/g, "");
            if (this.value.length > 11) {
                this.value = this.value.substring(0, 11);
            }
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("input[id$='Modal_materialContract']").keyup(function () {
            if (isFormatIptData_materialContract($(this).attr("id"))) {
                clearNoNumOfAlert($(this));
            }
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("input[id$='Modal_materialContract']").focus(function () {
            if ($(this).val() != "") {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("input[id$='Modal_materialContract']").blur(function () {
            if ($(this).val() != "" && isFormatIptData_materialContract($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), true));
            }
        });


    });

    function getMaterialContract(id){
        $.post(baseUrl + '/op/materialContract/getInfo', {id: id}, function (response) {
            $("#materialContractId").val(id);
            $("#supplierNameEditModal_materialContract").val(response.supplierName);
            $("#telephoneEditModal_materialContract").val(response.telephone);
            $("#addressEditModal_materialContract").val(response.address);
            $("#openingBankEditModal_materialContract").val(response.openingBank);
            $("#accountNumberEditModal_materialContract").val(response.accountNumber);
            $("#signingDateEditModal_materialContract").val(response.signingDate);
            $("#materialNameEditModal_materialContract").val(response.materialName);
            $("#taxIdentificationNumberEditModal_materialContract").val(response.taxIdentificationNumber);
            $("#quantityEditModal_materialContract").val(response.quantity);
            $("#unitPriceEditModal_materialContract").val(response.unitPrice);
            $("#contractAmountEditModal_materialContract").val(response.contractAmount);
            $("#settlementAmountEditModal_materialContract").val(response.settlementAmount);
            $("#remarkEditModal_materialContract").val(response.remark);
        }, 'json');
    }

    function addMaterialContract(){
        if(!materialContractFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/materialContract/saveInfo', getMaterialContractParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addMaterialContractModal").modal('hide');
                refreshTable('materialContract');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editMaterialContract(){
        if(!materialContractFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/materialContract/updateInfo', getMaterialContractParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editMaterialContractModal").modal('hide');
                refreshTable('materialContract');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getMaterialContractParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                materialContractId: $("#materialContractId").val(),
                supplierName: $("#supplierName" + op + "Modal_materialContract").val(),
                telephone: $("#telephone" + op + "Modal_materialContract").val(),
                address: $("#address" + op + "Modal_materialContract").val(),
                openingBank: $("#openingBank" + op + "Modal_materialContract").val(),
                accountNumber: $("#accountNumber" + op + "Modal_materialContract").val(),
                signingDate: $("#signingDate" + op + "Modal_materialContract").val(),
                materialName: $("#materialName" + op + "Modal_materialContract").val(),
                taxIdentificationNumber: $("#taxIdentificationNumber" + op + "Modal_materialContract").val(),
                quantity: $("#quantity" + op + "Modal_materialContract").val(),
                unitPrice: $("#unitPrice" + op + "Modal_materialContract").val(),
                contractAmount: $("#contractAmount" + op + "Modal_materialContract").val(),
                settlementAmount: $("#settlementAmount" + op + "Modal_materialContract").val(),
                remark: $("#remark" + op + "Modal_materialContract").val()
            })
        };
    }

    function deleteMaterialContract() {
        var id = $("#materialContractId").val();
        $.post(baseUrl + '/op/materialContract/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeMaterialContractModal").modal('hide');
                $("#materialContractId").val("");
                refreshTable('materialContract');
            } else {
                $('#removeMaterialContractModal .' + response.msg).fadeIn();
            }
        }, 'json');
    }

    // 材料合同表单验证
    function materialContractFormValidate(op) {
        var formInfos = $(".materialContract" + op + "Modal .required");
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

        var $telephone = $("#telephone" + op + "Modal_materialContract");
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

    function isFormatIptData_materialContract(objId){
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