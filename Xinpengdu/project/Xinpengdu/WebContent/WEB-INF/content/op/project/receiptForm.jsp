<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="receiptId_projectReceipt" />
<!-- Add ProjectReceipt modal dialog -->
<div id="addProjectReceiptModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 40%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加收据</h4>
            </div>
            <div class="modal-body form-horizontal projectReceiptAddModal">
                <div class="form-group has-feedback">
                    <label for="receiptDateAddModal_projectReceipt" class="col-sm-3 control-label">日期:</label>
                    <div class="input-daterange col-md-6" id="receiptDate_AddModal">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="receiptDateAddModal_projectReceipt"
                               name="receiptDate" style="border-radius: 4px;" title="日期" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="receiptNOAddModal_projectReceipt" class="col-sm-3 control-label">收据号:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left required" id="receiptNOAddModal_projectReceipt" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="收据号">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="receiptAmountAddModal_projectReceipt" class="col-sm-3 control-label">收据金额:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control required" id="receiptAmountAddModal_projectReceipt" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="收据金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_projectReceipt" class="col-sm-3 control-label">备注:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_projectReceipt" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addProjectReceiptModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectReceipt modal dialog -->
<div id="editProjectReceiptModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 40%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">收据信息</h4>
            </div>
            <input type="hidden" id="invoiceIdEditModal_projectToll" />
            <div class="modal-body form-horizontal projectReceiptEditModal">

                <div class="form-group has-feedback">
                    <label for="receiptDateEditModal_projectReceipt" class="col-sm-3 control-label">日期:</label>
                    <div class="input-daterange col-md-6" id="receiptDate_EditModal">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="receiptDateEditModal_projectReceipt"
                               name="receiptDate" style="border-radius: 4px;" title="日期" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="receiptNOEditModal_projectReceipt" class="col-sm-3 control-label">收据号:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left required" id="receiptNOEditModal_projectReceipt" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="收据号">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="receiptAmountEditModal_projectReceipt" class="col-sm-3 control-label">收据金额:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control required" id="receiptAmountEditModal_projectReceipt" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="收据金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_projectReceipt" class="col-sm-3 control-label">备注:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_projectReceipt" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editProjectReceiptModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove ProjectReceipt modal dialog -->
<div id="removeProjectReceiptModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除收据信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该收据信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeProjectReceiptModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addProjectReceiptModalSubmit").click(function(){
            addProjectReceipt();
        });
        $("#editProjectReceiptModalSubmit").click(function(){
            editProjectReceipt();
        });
        $("#removeProjectReceiptModalSubmit").click(function () {
            deleteProjectReceipt();
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("#receiptAmountAddModal_projectReceipt,#receiptAmountEditModal_projectReceipt").keyup(function () {
            clearNoNumOfAlert($(this));
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("#receiptAmountAddModal_projectReceipt,#receiptAmountEditModal_projectReceipt").focus(function () {
            if ($(this).val() != "") {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("#receiptAmountAddModal_projectReceipt,#receiptAmountEditModal_projectReceipt").blur(function () {
            $(this).val(formatAmountValue($(this).val(), true));
        });

    });

    function getProjectReceipt(id){
        $.post(baseUrl + '/op/projectReceipt/getInfo', {id: id}, function (response) {
            $("#receiptId_projectReceipt").val(response.receiptId);

            $("#receiptDateEditModal_projectReceipt").val(response.receiptDate);
            $("#receiptNOEditModal_projectReceipt").val(response.receiptNO);
            $("#receiptAmountEditModal_projectReceipt").val(response.receiptAmount);
            $("#remarkEditModal_projectReceipt").val(response.remark);
        }, 'json');
    }

    function addProjectReceipt(){
        if(!projectReceiptFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/projectReceipt/saveInfo', getProjectReceiptParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addProjectReceiptModal").modal('hide');
                refreshTable('projectReceipt');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editProjectReceipt(){
        if(!projectReceiptFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/projectReceipt/updateInfo', getProjectReceiptParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editProjectReceiptModal").modal('hide');
                refreshTable('projectReceipt');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getProjectReceiptParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                receiptId: $("#receiptId_projectReceipt").val(),
                receiptDate: $("#receiptDate" + op + "Modal_projectReceipt").val(),
                receiptNO: $("#receiptNO" + op + "Modal_projectReceipt").val(),
                receiptAmount: $("#receiptAmount" + op + "Modal_projectReceipt").val(),
                remark: $("#remark" + op + "Modal_projectReceipt").val()
            })
        };
    }

    function deleteProjectReceipt() {
        var id = $("#receiptId_projectReceipt").val();
        $.post(baseUrl + '/op/projectReceipt/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectReceiptModal").modal('hide');
                refreshTable('projectReceipt');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    // 工程收据表单验证
    function projectReceiptFormValidate(op) {
        var formInfos = $(".projectReceipt" + op + "Modal .required");
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