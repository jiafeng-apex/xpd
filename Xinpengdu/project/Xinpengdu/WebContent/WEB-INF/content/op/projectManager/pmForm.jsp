<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="pmId_projectManager" />
<!-- Add ProjectManager modal dialog -->
<div id="addProjectManagerModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">新增项目经理</h4>
            </div>
            <div class="modal-body form-horizontal">

                <div class="form-group has-feedback">
                    <label for="pmNameAddModal_projectManager" class="col-sm-2 control-label">姓名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmNameAddModal_projectManager" name="pmName" maxLength="30" autocomplete="off" placeholder="" title="姓名">
                    </div>
                    <label for="pmSexAddModal_projectManager" class="col-sm-2 control-label">性别:</label>
                    <div class="col-sm-4">
                        <select id="pmSexAddModal_projectManager" class="input-sm col-md-12" title="性别">
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="pmPhoneAddModal_projectManager" class="col-sm-2 control-label">手机:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmPhoneAddModal_projectManager" name="pmPhone" maxLength="30" autocomplete="off" placeholder="" title="手机">
                    </div>
                    <label for="pmTelphoneAddModal_projectManager" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmTelphoneAddModal_projectManager" name="pmTelphone" maxLength="30" autocomplete="off" placeholder="" title="电话">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="pmEmailAddModal_projectManager" class="col-sm-2 control-label">邮箱:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmEmailAddModal_projectManager" name="pmEmail" maxLength="30" autocomplete="off" placeholder="" title="邮箱">
                    </div>
                    <label for="pmFaxAddModal_projectManager" class="col-sm-2 control-label">传真:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmFaxAddModal_projectManager" name="pmFax" maxLength="30" autocomplete="off" placeholder="" title="传真">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_projectManager" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="remarkAddModal_projectManager" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_PM_WRITE}">
                    <button id="addProjectManagerModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                </c:if>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectManager modal dialog -->
<div id="editProjectManagerModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">项目经理信息</h4>
            </div>
            <div class="modal-body form-horizontal">

                <div class="form-group has-feedback">
                    <label for="pmNameEditModal_projectManager" class="col-sm-2 control-label">姓名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmNameEditModal_projectManager" name="pmName" maxLength="30" autocomplete="off" placeholder="" title="姓名">
                    </div>
                    <label for="pmSexEditModal_projectManager" class="col-sm-2 control-label">性别:</label>
                    <div class="col-sm-4">
                        <select id="pmSexEditModal_projectManager" class="input-sm col-md-12" title="性别">
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="pmPhoneEditModal_projectManager" class="col-sm-2 control-label">手机:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmPhoneEditModal_projectManager" name="pmPhone" maxLength="30" autocomplete="off" placeholder="" title="手机">
                    </div>
                    <label for="pmTelphoneEditModal_projectManager" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmTelphoneEditModal_projectManager" name="pmTelphone" maxLength="30" autocomplete="off" placeholder="" title="电话">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="pmEmailEditModal_projectManager" class="col-sm-2 control-label">邮箱:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmEmailEditModal_projectManager" name="pmEmail" maxLength="30" autocomplete="off" placeholder="" title="邮箱">
                    </div>
                    <label for="pmFaxEditModal_projectManager" class="col-sm-2 control-label">传真:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="pmFaxEditModal_projectManager" name="pmFax" maxLength="30" autocomplete="off" placeholder="" title="传真">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_projectManager" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="remarkEditModal_projectManager" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button id="editProjectManagerModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#addProjectManagerModalSubmit").click(function(){
            addProjectManager();
        });
        $("#editProjectManagerModalSubmit").click(function(){
            editProjectManager();
        });
    });

    function getProjectManager(id){
        $.post(baseUrl + '/op/projectManager/getInfo', {id: id}, function (response) {
            $("#pmId_projectManager").val(id);
            $("#pmNameEditModal_projectManager").val(response.pmName);
            $("#pmSexEditModal_projectManager").val(response.pmSex);
            $("#pmPhoneEditModal_projectManager").val(response.pmPhone);
            $("#pmTelphoneEditModal_projectManager").val(response.pmTelphone);
            $("#pmEmailEditModal_projectManager").val(response.pmEmail);
            $("#pmFaxEditModal_projectManager").val(response.pmFax);
            $("#remarkEditModal_projectManager").val(response.remark);
        }, 'json');
    }

    function addProjectManager(){
        if(!pmFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/projectManager/saveInfo', getProjectManagerParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addProjectManagerModal").modal('hide');
                refreshProjectManagerTable();
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editProjectManager(){
        if(!pmFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/projectManager/updateInfo', getProjectManagerParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editProjectManagerModal").modal('hide');
                refreshProjectManagerTable();
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getProjectManagerParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                pmId: $("#pmId_projectManager").val(),
                pmName: $("#pmName" + op + "Modal_projectManager").val(),
                pmSex: $("#pmSex" + op + "Modal_projectManager").val(),
                pmPhone: $("#pmPhone" + op + "Modal_projectManager").val(),
                pmTelphone: $("#pmTelphone" + op + "Modal_projectManager").val(),
                pmEmail: $("#pmEmail" + op + "Modal_projectManager").val(),
                pmFax: $("#pmFax" + op + "Modal_projectManager").val(),
                remark: $("#remark" + op + "Modal_projectManager").val()
            })
        };
    }

    // 表单验证
    function pmFormValidate(op) {
        var id_strs = "pmName" + op + "Modal_projectManager,pmSex" + op + "Modal_projectManager,pmPhone" + op + "Modal_projectManager,pmTelphone" + op + "Modal_projectManager,pmEmail" + op + "Modal_projectManager,pmFax" + op + "Modal_projectManager";
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