<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="bankId_projectBank" />
<!-- Add ProjectBank modal dialog -->
<div id="addProjectBankModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加银行信息</h4>
            </div>
            <div class="modal-body form-horizontal projectBankAddModal">
                <div class="form-group has-feedback">
                    <label for="bankNameAddModal_projectBank" class="col-sm-2 control-label">户名全称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="bankNameAddModal_projectBank" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="户名全称">
                    </div>
                    <label for="depositBankAddModal_projectBank" class="col-sm-2 control-label">开户银行:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="depositBankAddModal_projectBank" name="id" maxLength="30" autocomplete="off" placeholder="" title="开户银行">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="bankAccountAddModal_projectBank" class="col-sm-2 control-label">银行帐号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="bankAccountAddModal_projectBank" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="银行帐号">
                    </div>
                    <label for="cachetAddModal_projectBank" class="col-sm-2 control-label">公章:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="cachetAddModal_projectBank" name="invoiceAmount" maxLength="30" autocomplete="off" placeholder="" title="公章">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="financialSealAddModal_projectBank" class="col-sm-2 control-label">财务章:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="financialSealAddModal_projectBank" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="财务章">
                    </div>
                    <label for="personalSealAddModal_projectBank" class="col-sm-2 control-label">私章:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="personalSealAddModal_projectBank" name="billNo" maxLength="30" autocomplete="off" placeholder="" title="私章">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="depositBankAddrAddModal_projectBank" class="col-sm-2 control-label">开户银行地址:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left required" id="depositBankAddrAddModal_projectBank" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="开户银行地址">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_projectBank" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_projectBank" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addProjectBankModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectBank modal dialog -->
<div id="editProjectBankModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">银行信息</h4>
            </div>
            <input type="hidden" id="invoiceIdEditModal_projectToll" />
            <div class="modal-body form-horizontal projectBankEditModal">

                <div class="form-group has-feedback">
                    <label for="bankNameEditModal_projectBank" class="col-sm-2 control-label">户名全称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="bankNameEditModal_projectBank" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="户名全称">
                    </div>
                    <label for="depositBankEditModal_projectBank" class="col-sm-2 control-label">开户银行:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="depositBankEditModal_projectBank" name="id" maxLength="30" autocomplete="off" placeholder="" title="开户银行">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="bankAccountEditModal_projectBank" class="col-sm-2 control-label">银行帐号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="bankAccountEditModal_projectBank" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="银行帐号">
                    </div>
                    <label for="cachetEditModal_projectBank" class="col-sm-2 control-label">公章:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="cachetEditModal_projectBank" name="invoiceAmount" maxLength="30" autocomplete="off" placeholder="" title="公章">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="financialSealEditModal_projectBank" class="col-sm-2 control-label">财务章:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="financialSealEditModal_projectBank" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="财务章">
                    </div>
                    <label for="personalSealEditModal_projectBank" class="col-sm-2 control-label">私章:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="personalSealEditModal_projectBank" name="billNo" maxLength="30" autocomplete="off" placeholder="" title="私章">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="depositBankAddrEditModal_projectBank" class="col-sm-2 control-label">开户银行地址:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left required" id="depositBankAddrEditModal_projectBank" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="开户银行地址">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_projectBank" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_projectBank" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_BANK_WRITE}">
                    <button id="editProjectBankModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                </c:if>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 删除项目经理 -->
<div id="removeProjectBankModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除银行账户</h4>
            </div>
            <div class="modal-body form-horizontal">
                <input type="hidden" id="bankIdRemoveModal"/>
                <p>准备删除银行账户 '<span id="bankNameRemoveModal"></span>'</p>
                <div class="alert alert-danger projectBankNotLost">不能删除该银行账户</div>
            </div>
            <div class="modal-footer">
                <button id="removeProjectBankModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addProjectBankModalSubmit").click(function(){
            addProjectBank();
        });
        $("#editProjectBankModalSubmit").click(function(){
            editProjectBank();
        });

        // 删除
        $("#removeProjectBankModalSubmit").click(function(){
            deleteProjectBank();
        });

    });

    function getProjectBank(id){
        $.post(baseUrl + '/op/projectBank/getInfo', {id: id}, function (response) {
            $("#bankId_projectBank").val(response.bankId);

            $("#bankNameEditModal_projectBank").val(response.bankName);
            $("#depositBankEditModal_projectBank").val(response.depositBank);
            $("#bankAccountEditModal_projectBank").val(response.bankAccount);
            $("#cachetEditModal_projectBank").val(response.cachet);
            $("#financialSealEditModal_projectBank").val(response.financialSeal);
            $("#personalSealEditModal_projectBank").val(response.personalSeal);
            $("#depositBankAddrEditModal_projectBank").val(response.depositBankAddr);
            $("#remarkEditModal_projectBank").val(response.remark);
        }, 'json');
    }

    function addProjectBank(){
        if(!projectBankFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/projectBank/saveInfo', getProjectBankParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addProjectBankModal").modal('hide');
                refreshProjectBankTable();
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editProjectBank(){
        if(!projectBankFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/projectBank/updateInfo', getProjectBankParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editProjectBankModal").modal('hide');
                refreshProjectBankTable();
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function deleteProjectBank() {
        var id = $("#bankId_projectBank").val();
        $.post(baseUrl + '/op/projectBank/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectBankModal").modal('hide');
                refreshTable('projectBank');
            } else {
                $('#removeProjectBankModal .' + response.msg).fadeIn();
            }
        }, 'json');
    }

    function getProjectBankParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                bankId: $("#bankId_projectBank").val(),
                bankName: $("#bankName" + op + "Modal_projectBank").val(),
                depositBank: $("#depositBank" + op + "Modal_projectBank").val(),
                bankAccount: $("#bankAccount" + op + "Modal_projectBank").val(),
                cachet: $("#cachet" + op + "Modal_projectBank").val(),
                financialSeal: $("#financialSeal" + op + "Modal_projectBank").val(),
                personalSeal: $("#personalSeal" + op + "Modal_projectBank").val(),
                depositBankAddr: $("#depositBankAddr" + op + "Modal_projectBank").val(),
                remark: $("#remark" + op + "Modal_projectBank").val()
            })
        };
    }


    // 银行表单验证
    function projectBankFormValidate(op) {
        var formInfos = $(".projectBank" + op + "Modal .required");
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


</script>