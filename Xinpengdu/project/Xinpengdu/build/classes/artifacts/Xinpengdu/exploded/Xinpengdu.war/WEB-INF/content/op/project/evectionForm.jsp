<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="evectionId_projectEvection" />
<!-- Add ProjectEvection modal dialog -->
<div id="addProjectEvectionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加外出证</h4>
            </div>
            <div class="modal-body form-horizontal projectEvectionAddModal">
                <div class="form-group has-feedback">
                    <label for="evectionNOAddModal_projectEvection" class="col-sm-2 control-label">外出证证号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="evectionNOAddModal_projectEvection" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="外出证证号">
                    </div>
                    <label for="startDateAddModal_projectEvection" class="col-sm-2 control-label">外出证开出日期:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control dateSelect required" id="startDateAddModal_projectEvection" name="id" maxLength="30" autocomplete="off" placeholder="" title="外出证开出日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="evectionAmountAddModal_projectEvection" class="col-sm-2 control-label">外出证金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="evectionAmountAddModal_projectEvection" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" title="外出证金额">
                    </div>
                    <label for="endDateAddModal_projectEvection" class="col-sm-2 control-label">外出证到期日期:</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control dateSelect required" id="endDateAddModal_projectEvection" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="外出证到期日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_projectEvection" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="remarkAddModal_projectEvection" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addProjectEvectionModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectEvection modal dialog -->
<div id="editProjectEvectionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">外出证信息</h4>
            </div>
            <div class="modal-body form-horizontal projectEvectionEditModal">
                <div class="form-group has-feedback">
                    <label for="evectionNOEditModal_projectEvection" class="col-sm-2 control-label">外出证证号:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left required" id="evectionNOEditModal_projectEvection" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="外出证证号">
                    </div>
                    <label for="startDateEditModal_projectEvection" class="col-sm-2 control-label">外出证开出日期:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control dateSelect required" id="startDateEditModal_projectEvection" name="id" maxLength="30" autocomplete="off" placeholder="" title="外出证开出日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="evectionAmountEditModal_projectEvection" class="col-sm-2 control-label">外出证金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="evectionAmountEditModal_projectEvection" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" title="外出证金额">
                    </div>
                    <label for="endDateEditModal_projectEvection" class="col-sm-2 control-label">外出证到期日期:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control dateSelect required" id="endDateEditModal_projectEvection" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="外出证到期日期" readonly="readonly">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_projectEvection" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="remarkEditModal_projectEvection" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder=""  style="text-align: left;" title="备注">
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="border-top: 0; padding-top: 0px;">
                <button id="editProjectEvectionModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>

            <div  class="modal-footer">
                <div>
                    <h4 class="modal-title" style="width: 50%; float: left; text-align: left; height: 34px;line-height: 34px;">外出证延期信息</h4>
                    <div style="width: 50%; float: right; text-align: right;" class="btn_content">
                        <button id="addProjectEvectionPostpone_postpone" class="btn btn-primary">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>添加延期
                        </button>
                    </div>
                </div>
                <div style="margin-top: 10px;">
                    <table id="projectEvectionPostpone_table" style="margin-top: 10px;width: 100%" idField="postponeId"
                           url="<%= request.getContextPath() %>/op/projectEvectionPostpone/list2" pagination="true" pageSize="10" rownumbers="false" fitColumns="true"
                           singleSelect="true">
                        <thead>
                        <th field="postponeNumber" align="center" width="40" align="center">外出证延期号码</th>
                        <th field="postponeStartDate" align="center" width="40" align="center">外出证延期日期</th>
                        <th field="postponeEndDate" align="center" width="40" align="center">外出证延期后到期日期</th>
                        <th field="postponeAmount" align="center" width="30" align="center">延期后外出证金额</th>
                        <th field="remark" align="center" width="50" align="center">备注</th>
                        <th field="action" width="30" align="center" formatter="evectionPostponeTableActionFormatter">操作</th>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Remove ProjectEvection modal dialog -->
<div id="removeProjectEvectionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除外出证信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该外出证信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeProjectEvectionModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addProjectEvectionModalSubmit").click(function(){
            addProjectEvection();
        });
        $("#editProjectEvectionModalSubmit").click(function(){
            editProjectEvection();
        });
        $("#removeProjectEvectionModalSubmit").click(function(){
            deleteProjectEvection();
        });


        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("#evectionAmountAddModal_projectEvection,#evectionAmountEditModal_projectEvection").keyup(function () {
            clearNoNumOfAlert($(this));
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("#evectionAmountAddModal_projectEvection,#evectionAmountEditModal_projectEvection").focus(function () {
            if ($(this).val() != "") {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("#evectionAmountAddModal_projectEvection,#evectionAmountEditModal_projectEvection").blur(function () {
            if ($(this).val() != "") {
                $(this).val(formatAmountValue($(this).val(), true));
            }
        });


    });

    function getProjectEvection(id){
        $.post(baseUrl + '/op/projectEvection/getInfo', {id: id}, function (response) {
            $("#evectionId_projectEvection").val(id);
            $("#evectionNOEditModal_projectEvection").val(response.evectionNO);
            $("#startDateEditModal_projectEvection").val(response.startDate);
            $("#evectionAmountEditModal_projectEvection").val(response.evectionAmount);
            $("#endDateEditModal_projectEvection").val(response.endDate);
            $("#remarkEditModal_projectEvection").val(response.remark);
            //加载外出证延期列表
            loadEasyUITable($('#projectEvectionPostpone_table'),id, 'postponeId');
//            $('#projectEvectionPostpone_table').datagrid('resize');
            refreshTable('projectEvectionPostpone');
        }, 'json');

    }

    function addProjectEvection(){
        if(!projectEvectionFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/projectEvection/saveInfo', getProjectEvectionParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addProjectEvectionModal").modal('hide');
                refreshTable('projectEvection');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editProjectEvection(){
        if(!projectEvectionFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/projectEvection/updateInfo', getProjectEvectionParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editProjectEvectionModal").modal('hide');
                refreshTable('projectEvection');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getProjectEvectionParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                evectionId: $("#evectionId_projectEvection").val(),
                evectionNO: $("#evectionNO" + op + "Modal_projectEvection").val(),
                startDate: $("#startDate" + op + "Modal_projectEvection").val(),
                evectionAmount: $("#evectionAmount" + op + "Modal_projectEvection").val(),
                endDate: $("#endDate" + op + "Modal_projectEvection").val(),
                remark: $("#remark" + op + "Modal_projectEvection").val()
            })
        };
    }

    function deleteProjectEvection() {
        var id = $("#evectionId_projectEvection").val();
        $.post(baseUrl + '/op/projectEvection/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectEvectionModal").modal('hide');
                refreshTable('projectEvection');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }


    // 表单验证
    function projectEvectionFormValidate(op) {
        var formInfos = $(".projectEvection" + op + "Modal .required");
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