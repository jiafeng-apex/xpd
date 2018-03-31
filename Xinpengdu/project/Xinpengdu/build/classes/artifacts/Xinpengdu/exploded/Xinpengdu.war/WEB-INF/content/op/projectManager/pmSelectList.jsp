<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="pmId_selectProjectManager" />
<input type="hidden" id="pmName_selectProjectManager" />
<input type="hidden" id="tellPhone_selectProjectManager" />
<!-- Add ProjectManager modal dialog -->
<div id="selectProjectManagerModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">选择项目经理</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div class="row" style="margin-bottom: 5px;">
                    <form class="form-inline" role="form">
                        <div class="col-md-9">
                            <span class="down2">姓名：</span>
                            <input id="selectPmName" style="width: 40%;height: 30px" type="text" class="form-control" placeHolder="" title=""/>
                            <a id="searchSelectProjectManager" class="btn btn-sm btn-default glyphicon glyphicon-search"
                               type="button" style="margin-top: -1px;">
                            </a>
                        </div>
                    </form>
                </div>
                <table id="selectProjectManagerTable">
                    <thead>
                    <th data-field="pmName" data-halign="center" data-width="5%" data-align="center">姓名</th>
                    <th data-field="pmSex" data-halign="center" data-width="12%" data-align="center">性别</th>
                    <th data-field="pmPhone" data-halign="center" data-width="12%" data-align="center">手机号码</th>
                    <th data-field="pmTelphone" data-halign="center" data-width="5%" data-align="center">电话号码</th>
                    <th data-field="pmEmail" data-halign="center" data-width="5%" data-align="center">电子邮件</th>
                    <th data-field="projectTotal" data-halign="center" data-width="5%" data-align="center">项目总金额</th>
                    <th data-field="pmFax" data-halign="center" data-width="5%" data-align="center">传真</th>
                    </thead>
                </table>

            </div>
            <div class="modal-footer">
                <button id="selectProjectManagerModalSubmit" type="button" class="btn btn-primary" data-loading-text="确定&hellip;">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    $(document).ready(function () {
        // 加载表格
        $('#selectProjectManagerTable').bootstrapTable({
            url: baseUrl + '/op/projectManager/list',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            method: 'post',
            pagination: true,
            sidePagination: 'server',
            queryParams: getQueryParamsForSelectPm,
            pageSize: 10,
            pageList: [10],
            singleSelect: true,
            height: 350,
            striped: true,
            uniqueId: 'pmId',
            classes: 'table table-hover table-condensed',
            onClickRow: function (row, $element) {
                $element.siblings('tr').css('background-color', '');        // 删除其他兄弟元素的背景色
                $element.css('background-color', '#FBFEA0');                // 添加当前元素的背景色
                $("#pmId_selectProjectManager").val(row["pmId"]);
                $("#pmName_selectProjectManager").val(row["pmName"]);
                $("#tellPhone_selectProjectManager").val(row["pmPhone"]);
            },
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    $(this).bootstrapTable('removeAll');
                }
            }
        });

        $("#selectProjectManagerModalSubmit").click(function(){
            var pmId = $("#pmId_selectProjectManager").val();
            if(pmId == "" || pmId == null){
                alert("请选择项目经理！");
                return;
            }
            $("#pmId").val($("#pmId_selectProjectManager").val());
            $("#pmName").val($("#pmName_selectProjectManager").val());
            $("#tellPhone").val($("#tellPhone_selectProjectManager").val());
            $("#selectProjectManagerModal").modal('hide');
        });

        $("#searchSelectProjectManager").click(function(){
            refreshSelectProjectManagerTable();
        });

    });

    // 刷新表格
    function refreshSelectProjectManagerTable() {
        $('#selectProjectManagerTable').bootstrapTable('refresh', {
            query: {offset: 0},
            url: baseUrl + '/op/projectManager/list'
        });
    }

    function getQueryParamsForSelectPm(params) {
            return {offset: params.offset, limit: params.limit, pmName: $("#selectPmName").val()};
    }


</script>