<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="evectionPostponeId_projectEvectionPostpone" />
<!-- Add ProjectEvectionPostpone modal dialog -->
<div id="addProjectEvectionPostponeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width:30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加外出证延期信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div class="form-group has-feedback">
                    <label for="postponeNumberAddModal_projectEvectionPostpone" class="col-sm-4 control-label" >外出证延期号码:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control ipt_content_left" id="postponeNumberAddModal_projectEvectionPostpone" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="外出证延期号码">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postponeStartDateAddModal_projectEvectionPostpone" class="col-sm-4 control-label">外出证延期日期:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control dateSelect" id="postponeStartDateAddModal_projectEvectionPostpone"
                               name="constructionTax" maxLength="30" autocomplete="off" placeholder="" title="外出证延期日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postponeEndDateAddModal_projectEvectionPostpone" class="col-sm-4 control-label">外出证延期后到期日期:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control dateSelect" id="postponeEndDateAddModal_projectEvectionPostpone"
                               name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="外出证延期后到期日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postponeAmountAddModal_projectEvectionPostpone" class="col-sm-4 control-label">延期后外出证金额:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="postponeAmountAddModal_projectEvectionPostpone" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="延期后外出证金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_projectEvectionPostpone" class="col-sm-4 control-label">备注:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="remarkAddModal_projectEvectionPostpone" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addProjectEvectionPostponeModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectEvectionPostpone modal dialog -->
<div id="editProjectEvectionPostponeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 30%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">外出证延期信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div class="form-group has-feedback">
                    <label for="postponeNumberEditModal_projectEvectionPostpone" class="col-sm-4 control-label">外出证延期号码:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control ipt_content_left" id="postponeNumberEditModal_projectEvectionPostpone" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="外出证延期号码">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postponeStartDateEditModal_projectEvectionPostpone" class="col-sm-4 control-label">外出证延期日期:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control dateSelect" id="postponeStartDateEditModal_projectEvectionPostpone"
                               name="constructionTax" maxLength="30" autocomplete="off" placeholder="" title="外出证延期日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postponeEndDateEditModal_projectEvectionPostpone" class="col-sm-4 control-label">外出证延期后到期日期:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control dateSelect" id="postponeEndDateEditModal_projectEvectionPostpone"
                               name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="外出证延期后到期日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postponeAmountEditModal_projectEvectionPostpone" class="col-sm-4 control-label">延期后外出证金额:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="postponeAmountEditModal_projectEvectionPostpone" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="延期后外出证金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_projectEvectionPostpone" class="col-sm-4 control-label">备注:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="remarkEditModal_projectEvectionPostpone" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="备注">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="editProjectEvectionPostponeModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove ProjectEvectionPostpone modal dialog -->
<div id="removeProjectEvectionPostponeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除外出证延期信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该外出证延期信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeProjectEvectionPostponeModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addProjectEvectionPostponeModalSubmit").click(function(){
            addProjectEvectionPostpone();
        });
        $("#editProjectEvectionPostponeModalSubmit").click(function(){
            editProjectEvectionPostpone();
        });
        $("#removeProjectEvectionPostponeModalSubmit").click(function(){
            deleteProjectEvectionPostpone();
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("#postponeAmountAddModal_projectEvectionPostpone,#postponeAmountEditModal_projectEvectionPostpone").keyup(function () {
            clearNoNumOfAlert($(this));
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("#postponeAmountAddModal_projectEvectionPostpone,#postponeAmountEditModal_projectEvectionPostpone").focus(function () {
            if ($(this).val() != "") {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("#postponeAmountAddModal_projectEvectionPostpone,#postponeAmountEditModal_projectEvectionPostpone").blur(function () {
            if ($(this).val() != "") {
                $(this).val(formatAmountValue($(this).val(), true));
            }
        });
    });

    function getProjectEvectionPostpone(id){
        $.post(baseUrl + '/op/projectEvectionPostpone/getInfo', {id: id}, function (response) {

            $("#evectionPostponeId_projectEvectionPostpone").val(id);
            $("#postponeNumberEditModal_projectEvectionPostpone").val(response.postponeNumber);
            $("#postponeStartDateEditModal_projectEvectionPostpone").val(response.postponeStartDate);
            $("#postponeEndDateEditModal_projectEvectionPostpone").val(response.postponeEndDate);
            $("#postponeAmountEditModal_projectEvectionPostpone").val(response.postponeAmount);
            $("#remarkEditModal_projectEvectionPostpone").val(response.remark);
        }, 'json');
    }

    function addProjectEvectionPostpone(){
        if(!evectionPostponeFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/projectEvectionPostpone/saveInfo', getProjectEvectionPostponeParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addProjectEvectionPostponeModal").modal('hide');
                refreshTable('projectEvectionPostpone');
                refreshTable('projectEvection');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editProjectEvectionPostpone(){
        if(!evectionPostponeFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/projectEvectionPostpone/updateInfo', getProjectEvectionPostponeParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editProjectEvectionPostponeModal").modal('hide');
                refreshTable('projectEvectionPostpone');
                refreshTable('projectEvection');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getProjectEvectionPostponeParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                evectionId: $("#evectionId_projectEvection").val(),
                postponeId: $("#evectionPostponeId_projectEvectionPostpone").val(),
                postponeNumber: $("#postponeNumber" + op + "Modal_projectEvectionPostpone").val(),
                postponeStartDate: $("#postponeStartDate" + op + "Modal_projectEvectionPostpone").val(),
                postponeEndDate: $("#postponeEndDate" + op + "Modal_projectEvectionPostpone").val(),
                postponeAmount: $("#postponeAmount" + op + "Modal_projectEvectionPostpone").val(),
                remark: $("#remark" + op + "Modal_projectEvectionPostpone").val()
            })
        };
    }

    function deleteProjectEvectionPostpone() {
        var id = $("#evectionPostponeId_projectEvectionPostpone").val();
        $.post(baseUrl + '/op/projectEvectionPostpone/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectEvectionPostponeModal").modal('hide');
                refreshTable('projectEvectionPostpone');
                refreshTable('projectEvection');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    // 表单验证
    function evectionPostponeFormValidate(op) {
        var id_strs = "postponeNumber" + op + "Modal_projectEvectionPostpone,postponeStartDate" + op + "Modal_projectEvectionPostpone,postponeEndDate" + op + "Modal_projectEvectionPostpone,postponeAmount" + op + "Modal_projectEvectionPostpone";
        var id_list = id_strs.split(",");
        for (var i = 0; i < id_list.length; i++) {
            var idName = id_list[i];
            var $ipt = $("#" + idName);
            var iptValue = $ipt.val();
            if (iptValue == "") {
                alert("请输入" + $ipt.attr("title") + "!");
                $ipt.focus();
                return false;
            }
        }
        return true;
    }
</script>