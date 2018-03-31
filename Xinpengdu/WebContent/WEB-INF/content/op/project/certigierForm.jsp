<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="certigierId_projectCertigier" />
<!-- Add ProjectCertigier modal dialog -->
<div id="addProjectCertigierModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 40%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加授权人</h4>
            </div>
            <div class="modal-body form-horizontal projectCertigierAddModal">

                <div class="form-group has-feedback">
                    <label for="certigierNameAddModal_projectCertigier" class="col-sm-3 control-label">授权人:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left required" id="certigierNameAddModal_projectCertigier" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="授权人">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="certigierTelAddModal_projectCertigier" class="col-sm-3 control-label">授权人联系电话:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left required" id="certigierTelAddModal_projectCertigier" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="授权人联系电话">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="accreditStartAddModal_projectCertigier" class="col-sm-3 control-label">授权日期:</label>
                    <div class="input-daterange col-md-6" id="accreditStartDate_AddModal">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="accreditStartAddModal_projectCertigier" name="accreditStart" style="border-radius: 4px;" title="授权日期" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="accreditEndAddModal_projectCertigier" class="col-sm-3 control-label">授权到期日期:</label>
                    <div class="input-daterange col-md-6" id="accreditEndDate_AddModal">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="accreditEndAddModal_projectCertigier" name="accreditEnd" style="border-radius: 4px;" title="授权到期日期" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_projectCertigier" class="col-sm-3 control-label">备注:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_projectCertigier" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addProjectCertigierModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectCertigier modal dialog -->
<div id="editProjectCertigierModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 40%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">授权人信息</h4>
            </div>
            <div class="modal-body form-horizontal projectCertigierEditModal">

                <div class="form-group has-feedback">
                    <label for="certigierNameEditModal_projectCertigier" class="col-sm-3 control-label">授权人:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left required" id="certigierNameEditModal_projectCertigier" name="businessTax" maxLength="30" autocomplete="off" placeholder="" title="授权人">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="certigierTelEditModal_projectCertigier" class="col-sm-3 control-label">授权人联系电话:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left required" id="certigierTelEditModal_projectCertigier" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" title="授权人联系电话">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="accreditStartEditModal_projectCertigier" class="col-sm-3 control-label">授权日期:</label>
                    <div class="input-daterange col-md-6" id="accreditStartDate_EditModal">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="accreditStartEditModal_projectCertigier" name="accreditStart" style="border-radius: 4px;" title="授权日期" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="accreditEndEditModal_projectCertigier" class="col-sm-3 control-label">授权到期日期:</label>
                    <div class="input-daterange col-md-6" id="accreditEndDate_EditModal">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="accreditEndEditModal_projectCertigier" name="accreditEnd" style="border-radius: 4px;" title="授权到期日期" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_projectCertigier" class="col-sm-3 control-label">备注:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_projectCertigier" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editProjectCertigierModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove ProjectCertigier modal dialog -->
<div id="removeProjectCertigierModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除授权人信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该授权人信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeProjectCertigierModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addProjectCertigierModalSubmit").click(function(){
            addProjectCertigier();
        });
        $("#editProjectCertigierModalSubmit").click(function(){
            editProjectCertigier();
        });
        $("#removeProjectCertigierModalSubmit").click(function(){
            deleteProjectCertigier();
        });

        // 按下按键事件（只能输入数字）
        $("#certigierTelAddModal_projectCertigier,#certigierTelEditModal_projectCertigier").keyup(function(){
            this.value=this.value.replace(/[^\d]/g,'')
        });
    });

    function getProjectCertigier(id){
        $.post(baseUrl + '/op/projectCertigier/getInfo', {id: id}, function (response) {
            $("#certigierId_projectCertigier").val(response.certigierId);

            $("#certigierNameEditModal_projectCertigier").val(response.certigierName);
            $("#certigierTelEditModal_projectCertigier").val(response.certigierTel);
            $("#accreditStartEditModal_projectCertigier").val(response.accreditStart);
            $("#accreditEndEditModal_projectCertigier").val(response.accreditEnd);
            $("#remarkEditModal_projectCertigier").val(response.remark);
        }, 'json');
    }

    function addProjectCertigier(){
        if(!projectCertigierFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/projectCertigier/saveInfo', getProjectCertigierParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addProjectCertigierModal").modal('hide');
                refreshTable('projectCertigier');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editProjectCertigier(){
        if(!projectCertigierFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/projectCertigier/updateInfo', getProjectCertigierParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editProjectCertigierModal").modal('hide');
                refreshTable('projectCertigier');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getProjectCertigierParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                certigierId: $("#certigierId_projectCertigier").val(),
                certigierName: $("#certigierName" + op + "Modal_projectCertigier").val(),
                certigierTel: $("#certigierTel" + op + "Modal_projectCertigier").val(),
                accreditStart: $("#accreditStart" + op + "Modal_projectCertigier").val(),
                accreditEnd: $("#accreditEnd" + op + "Modal_projectCertigier").val(),
                remark: $("#remark" + op + "Modal_projectCertigier").val()
            })
        };
    }

    function deleteProjectCertigier() {
        var id = $("#certigierId_projectCertigier").val();
        $.post(baseUrl + '/op/projectCertigier/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeProjectCertigierModal").modal('hide');
                refreshTable('projectCertigier');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    // 授权人表单验证
    function projectCertigierFormValidate(op) {
        var formInfos = $(".projectCertigier" + op + "Modal .required");
        for (var i = 0; i < formInfos.length; i++) {
//            console.log(formInfos[i].id + "---" + formInfos[i].title);
            var idName = formInfos[i].id;
            var titleName = formInfos[i].title;
            var $ipt = $("#" + idName);
            var iptValue = $ipt.val();
            if (iptValue == "") {
                alert("请输入" + titleName + "!");
                $ipt.focus();
                return false;
            }
            // 验证电话号码
            if (idName.startsWith("certigierTel")) {
                var re = /^1\d{10}$/;
                if (!re.test(iptValue)) {
                    alert("请输入11位有效的联系电话!");
                    $ipt.focus();
                    return false;
                }
            }
        }
        return true;
    }


</script>