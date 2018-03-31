<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="operaterId_operater" />
<!-- Add Operater modal dialog -->
<div id="addOperaterModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">增加用户</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div class="form-group has-feedback">
                    <label for="loginNameAddModal_operater" class="col-sm-4 control-label">登录名称:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="loginNameAddModal_operater" name="loginName" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="operaterPwdAddModal_operater" class="col-sm-4 control-label">登录密码:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="operaterPwdAddModal_operater" name="operaterPwd" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="passwordAddModal_operater" class="col-sm-4 control-label">确认密码:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="passwordAddModal_operater" name="password" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="operaterNameAddModal_operater" class="col-sm-4 control-label">操作员姓名:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="operaterNameAddModal_operater" name="operaterName" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="deptNameAddModal_operater" class="col-sm-4 control-label">部门:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="deptNameAddModal_operater" name="deptName" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postIdAddModal_operater" class="col-sm-4 control-label">岗位:</label>
                    <div class="col-sm-6">
                        <select id="postIdAddModal_operater" name="postId" class="form-control" title="岗位">
                            <option value="1">系统管理员</option>
                            <option value="2" selected="true">一般管理员</option>
                        </select>
                        <%--<input type="text" class="form-control" id="postIdAddModal_operater" name="postId" maxLength="30" autocomplete="off" placeholder="">--%>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <c:if test="${sessionScope.PERMISSION_MENU_PROJECT_USER_WRITE}">
                    <button id="addOperaterModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                </c:if>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit Operater modal dialog -->
<div id="editOperaterModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">用户信息</h4>
            </div>
            <div class="modal-body form-horizontal">

                <div class="form-group has-feedback">
                    <label for="loginNameEditModal_operater" class="col-sm-4 control-label">登录名称:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="loginNameEditModal_operater" name="loginName" maxLength="30" autocomplete="off" placeholder="" readonly="true">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="operaterNameEditModal_operater" class="col-sm-4 control-label">操作员姓名:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="operaterNameEditModal_operater" name="operaterName" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="deptNameEditModal_operater" class="col-sm-4 control-label">部门:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="deptNameEditModal_operater" name="deptName" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="postIdEditModal_operater" class="col-sm-4 control-label">岗位:</label>
                    <div class="col-sm-6">
                        <select id="postIdEditModal_operater" name="postId" class="form-control" title="岗位" disabled="true">
                            <option value="1">系统管理员</option>
                            <option value="2">一般管理员</option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editOperaterModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove Operater modal dialog -->
<div id="removeOperaterModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除用户信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该用户信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeOperaterModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div id="grantModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">用户授权</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div style="text-align: center; float: left; border: 1px #AAAAAA solid; width: 45%;">
                    <div>菜单功能</div>
                    <table id="menu_table">
                        <thead>
                        <th data-field="menuName" data-halign="center" data-width="50%" data-align="center">功能模块</th>
                        <th data-field="action" data-halign="center" data-width="50%" data-align="center" data-formatter="menuActionFormatter" >勾选权限</th>
                        </thead>
                    </table>
                </div>

                <div style="text-align: center; float: left; margin-left: 30px; border: 1px #AAAAAA solid; width: 48%;" >
                    <div>子模块功能</div>
                    <table id="model_table">
                        <thead>
                        <th data-field="menuName" data-halign="center" data-width="50%" data-align="center">功能模块</th>
                        <th data-field="action" data-halign="center" data-width="50%" data-align="center" data-formatter="menuActionFormatter" >勾选权限</th>
                        </thead>
                    </table>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div class="modal-footer">
                <button id="grantModalSubmit" type="button" class="btn btn-primary" data-loading-text="确定&hellip;">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {
        $("#addOperaterModalSubmit").click(function(){
            addOperater();
        });
        $("#editOperaterModalSubmit").click(function(){
            editOperater();
        });
        $("#removeOperaterModalSubmit").click(function(){
            deleteOperater();
        });
        $("#grantModalSubmit").click(function(){
            grantOperater();
        });
    });

    function getOperater(id){
        $.post(baseUrl + '/op/operater/getInfo', {id: id}, function (response) {
            $("#operaterId_operater").val(id);
            $("#loginNameEditModal_operater").val(response.loginName);
            $("#operaterPwdEditModal_operater").val(response.operaterPwd);
            $("#passwordEditModal_operater").val(response.password);
            $("#operaterNameEditModal_operater").val(response.operaterName);
            $("#deptNameEditModal_operater").val(response.deptName);
            $("#postIdEditModal_operater").val(response.postId);
        }, 'json');
    }

    function addOperater(){
        $.post(baseUrl + '/op/operater/saveInfo', getOperaterParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addOperaterModal").modal('hide');
                refreshOperaterTable();
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editOperater(){
        $.post(baseUrl + '/op/operater/updateInfo', getOperaterParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editOperaterModal").modal('hide');
                refreshOperaterTable();
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getOperaterParams(op) {
        return {
            data: JSON.stringify({
                operaterId: $("#operaterId_operater").val(),
                loginName: $("#loginName" + op + "Modal_operater").val(),
                operaterPwd: $("#operaterPwd" + op + "Modal_operater").val(),
                password: $("#password" + op + "Modal_operater").val(),
                operaterName: $("#operaterName" + op + "Modal_operater").val(),
                deptName: $("#deptName" + op + "Modal_operater").val(),
                postId: $("#postId" + op + "Modal_operater").val()
            })
        };
    }

    function deleteOperater() {
        var id = $("#operaterId_operater").val();
        $.post(baseUrl + '/op/operater/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeOperaterModal").modal('hide');
                refreshOperaterTable();
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    function grantOperater() {
        var chk_value =[];
        $('input[name="menu_cks"]:checked').each(function(){
            chk_value.push($(this).val());
        });
        var chkValues=chk_value.join(";");
        var userId=  $('#operaterId_operater').val()
        var id = $("#operaterId_operater").val();

        $.post(baseUrl + '/op/operater/grant', {userId: userId,chkValues:chkValues}, function (response) {
            if (response.result) {
                alert("授权成功");
                $("#grantModal").modal('hide');
                refreshOperaterTable();
            } else {
                alert("授权失败!");
            }
        }, 'json');
    }
</script>