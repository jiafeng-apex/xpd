<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="labourServiceGeldId_labourServiceGeld" />
<!-- Add LabourServiceGeld modal dialog -->
<div id="addLabourServiceGeldModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加劳务费支付款</h4>
            </div>
            <div class="modal-body form-horizontal labourServiceGeldAddModal">

                <div class="form-group has-feedback">
                    <label for="summaryAddModal_labourServiceGeld" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryAddModal_labourServiceGeld" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="payDateAddModal_labourServiceGeld" class="col-sm-2 control-label">日期:</label>
                    <div class="input-daterange col-md-4" id="payDate_AddModal_labourServiceGeld">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="payDateAddModal_labourServiceGeld" name="payDate" style="border-radius: 4px;" readonly="readonly" title="日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="payAmountAddModal_labourServiceGeld" class="col-sm-2 control-label">支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control again_input required" id="payAmountAddModal_labourServiceGeld" name="payAmount" maxLength="30" autocomplete="off" placeholder="" title="支付金额">
                    </div>
                    <label for="cumulativePayAmountAddModal_labourServiceGeld" class="col-sm-2 control-label">累计支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="cumulativePayAmountAddModal_labourServiceGeld" name="cumulativePayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="累计支付金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="noPayAmountAddModal_labourServiceGeld" class="col-sm-2 control-label">未付款金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="noPayAmountAddModal_labourServiceGeld" name="noPayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="未付款金额">
                    </div>
                    <label for="isAutoTransferAddModal_labourServiceGeld" class="col-sm-2 control-label">是否自动转入:</label>
                    <div class="col-sm-4">
                        <select id="isAutoTransferAddModal_labourServiceGeld" class="input-sm col-md-12" title="是否自动转入">
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_labourServiceGeld" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_labourServiceGeld" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addLabourServiceGeldModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit LabourServiceGeld modal dialog -->
<div id="editLabourServiceGeldModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">劳务费支付款信息</h4>
            </div>
            <div class="modal-body form-horizontal labourServiceGeldEditModal">

                <div class="form-group has-feedback">
                    <label for="summaryEditModal_labourServiceGeld" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryEditModal_labourServiceGeld" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="payDateEditModal_labourServiceGeld" class="col-sm-2 control-label">日期:</label>
                    <div class="input-daterange col-md-4" id="payDate_EditModal_labourServiceGeld">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="payDateEditModal_labourServiceGeld" name="payDate" style="border-radius: 4px;" readonly="readonly" title="日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="payAmountEditModal_labourServiceGeld" class="col-sm-2 control-label">支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control again_input required" id="payAmountEditModal_labourServiceGeld" name="payAmount" maxLength="30" autocomplete="off" placeholder="" title="支付金额">
                    </div>
                    <label for="cumulativePayAmountEditModal_labourServiceGeld" class="col-sm-2 control-label">累计支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="cumulativePayAmountEditModal_labourServiceGeld" name="cumulativePayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="累计支付金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="noPayAmountEditModal_labourServiceGeld" class="col-sm-2 control-label">未付款金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="noPayAmountEditModal_labourServiceGeld" name="noPayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="未付款金额">
                    </div>
                    <label for="isAutoTransferEditModal_labourServiceGeld" class="col-sm-2 control-label">是否自动转入:</label>
                    <div class="col-sm-4">
                        <select id="isAutoTransferEditModal_labourServiceGeld" class="input-sm col-md-12" title="是否自动转入">
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_labourServiceGeld" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_labourServiceGeld" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editLabourServiceGeldModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove LabourServiceGeld modal dialog -->
<div id="removeLabourServiceGeldModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除劳务费支付款信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该劳务费支付款信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeLabourServiceGeldModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var oldPayAmount=0;
    var oldCumulativePayAmount=0;
    var oldNoPayAmount=0;
    $(document).ready(function () {

        $("#addLabourServiceGeldModalSubmit").click(function(){
            addLabourServiceGeld();
        });
        $("#editLabourServiceGeldModalSubmit").click(function(){
            editLabourServiceGeld();
        });
        $("#removeLabourServiceGeldModalSubmit").click(function(){
            deleteLabourServiceGeld();
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("input[id$='Modal_labourServiceGeld']").keyup(function () {
            if (isFormatIptData_labourServiceGeld($(this).attr("id"))) {
                clearNoNumOfAlert($(this));
            }
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("input[id$='Modal_labourServiceGeld']").focus(function () {
            if ($(this).val() != "" && isFormatIptData_labourServiceGeld($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });


        $("#payAmountAddModal_labourServiceGeld").blur(function () {
            var payAmountTotal=parseFloat(formatAmountValue($("#pay_Amount_Total").val(),false));
            var noPayAmountTotal=parseFloat(formatAmountValue($("#noPay_Amount_Total").val(),false));
            var contractAmount=parseFloat(formatAmountValue($("#contract_Amount").val(),false));
            //计算 累计支付金额 和 未支付金额 --add
            console.log("contractAmount:"+contractAmount);
            if($(this).val() != ""){
                var payAmount=parseFloat(formatAmountValue($(this).val(), false));
                $("#cumulativePayAmountAddModal_labourServiceGeld").val(formatAmountValue(payAmountTotal+payAmount,true));
                $("#noPayAmountAddModal_labourServiceGeld").val(formatAmountValue(contractAmount-(payAmountTotal+payAmount),true));
            }
        });

        //计算 累计支付金额 和 未支付金额 --edit
        $("#payAmountEditModal_labourServiceGeld").blur(function () {
            var payAmountTotal=parseFloat(formatAmountValue($("#pay_Amount_Total").val(),false));
            var noPayAmountTotal=parseFloat(formatAmountValue($("#noPay_Amount_Total").val(),false));
            var contractAmount=parseFloat(formatAmountValue($("#contract_Amount").val(),false));
            //计算 累计支付金额 和 未支付金额 --add
            console.log("contractAmount:"+contractAmount);
            if($(this).val() != ""){
                var payAmount=parseFloat(formatAmountValue($(this).val(), false))
                if(payAmount!=oldPayAmount){
                    var differVal=payAmount-oldPayAmount;//本次修改 和原支付金额的差值
                    var cumulativePayAmount=parseFloat(formatAmountValue($("#cumulativePayAmountEditModal_labourServiceGeld").val(),false));
                    var noPayAmount=parseFloat(formatAmountValue($("#noPayAmountEditModal_labourServiceGeld").val(),false));
                    $("#cumulativePayAmountEditModal_labourServiceGeld").val(formatAmountValue(oldCumulativePayAmount+differVal,true));
                    $("#noPayAmountEditModal_labourServiceGeld").val(formatAmountValue(oldNoPayAmount-differVal,true));
                }
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("input[id$='Modal_labourServiceGeld']").blur(function () {
            if ($(this).val() != "" && isFormatIptData_labourServiceGeld($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), true));
                // 如果是支付金额，需要再次确认输入的值
                var idName = $(this).attr("id");
                if (idName == "payAmountAddModal_labourServiceGeld" || idName == "payAmountEditModal_labourServiceGeld") {
                    againInputAmount($(this));
                }
            }
        });
    });

    function getLabourServiceGeld(id){
        $.post(baseUrl + '/op/labourServiceGeld/getInfo', {id: id}, function (response) {
            $("#labourServiceFeeId").val(response.labourServiceFeeId);
            $("#labourServiceGeldId_labourServiceGeld").val(id);
            $("#summaryEditModal_labourServiceGeld").val(response.summary);
            $("#payDateEditModal_labourServiceGeld").val(response.payDate);
            $("#payAmountEditModal_labourServiceGeld").val(response.payAmount);
            $("#cumulativePayAmountEditModal_labourServiceGeld").val(response.cumulativePayAmount);
            $("#noPayAmountEditModal_labourServiceGeld").val(response.noPayAmount);
            $("#isAutoTransferEditModal_labourServiceGeld").val(response.isAutoTransfer);
            $("#remarkEditModal_labourServiceGeld").val(response.remark);

            oldPayAmount=parseFloat(formatAmountValue(response.payAmount,false));//修改的时候 原本支付金额
            oldCumulativePayAmount=parseFloat(formatAmountValue(response.cumulativePayAmount));
            oldNoPayAmount=parseFloat(formatAmountValue(response.noPayAmount));
        }, 'json');
    }

    function addLabourServiceGeld(){
        if(!labourServiceGeldFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/labourServiceGeld/saveInfo', getLabourServiceGeldParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addLabourServiceGeldModal").modal('hide');
                refreshTable('labourServiceGeld');
                refreshTable('labourServiceFee');
                // 刷新工程收费表格
                refreshTable('projectToll');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editLabourServiceGeld(){
        if(!labourServiceGeldFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/labourServiceGeld/updateInfo', getLabourServiceGeldParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editLabourServiceGeldModal").modal('hide');
                refreshTable('labourServiceGeld');
                refreshTable('labourServiceFee');
                // 刷新工程收费表格
                refreshTable('projectToll');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getLabourServiceGeldParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                labourServiceFeeId: $("#labourServiceFeeId").val(),
                labourServiceGeldId: $("#labourServiceGeldId_labourServiceGeld").val(),
                summary: $("#summary" + op + "Modal_labourServiceGeld").val(),
                payDate: $("#payDate" + op + "Modal_labourServiceGeld").val(),
                payAmount: $("#payAmount" + op + "Modal_labourServiceGeld").val(),
                cumulativePayAmount: $("#cumulativePayAmount" + op + "Modal_labourServiceGeld").val(),
                noPayAmount: $("#noPayAmount" + op + "Modal_labourServiceGeld").val(),
                isAutoTransfer: $("#isAutoTransfer" + op + "Modal_labourServiceGeld").val(),
                remark: $("#remark" + op + "Modal_labourServiceGeld").val()
            })
        };
    }

    function deleteLabourServiceGeld() {
        var id = $("#labourServiceGeldId_labourServiceGeld").val();
        $.post(baseUrl + '/op/labourServiceGeld/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeLabourServiceGeldModal").modal('hide');
                refreshTable('labourServiceGeld');
                refreshTable('labourServiceFee');
                // 刷新工程收费表格
                refreshTable('projectToll');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    // 表单验证
    function labourServiceGeldFormValidate(op) {
        var formInfos = $(".labourServiceGeld" + op + "Modal .required");
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

    function isFormatIptData_labourServiceGeld(objId){
        var index = objId.indexOf("AddModal");
        if(index <= 0){
            index = objId.indexOf("EditModal");
        }
        var objField = objId.substring(0,index);
        if(objField == "payAmount" || objField == "cumulativePayAmount" || objField == "noPayAmount"){
            return true;
        }
        return false;
    }


</script>