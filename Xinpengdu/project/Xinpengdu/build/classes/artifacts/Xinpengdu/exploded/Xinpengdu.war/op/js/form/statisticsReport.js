$(document).ready(function () {

    // 加载表格
    $('#projectStatTable').bootstrapTable({
        url: baseUrl + '/op/statistics/list',
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'json',
        method: 'post',
        pagination: true,
        sidePagination: 'server',
        queryParams: getQueryParamsForProjectInfo,
        pageSize: 14,
        pageList: [14],
        singleSelect: true,
        height: 580,
        striped: true,
        uniqueId: 'projectId',
        classes: 'table table-hover table-condensed',
        onLoadSuccess: function (data) {
            if (data.total == 0) {
                $(this).bootstrapTable('removeAll');
            } else {
                initTableCheckbox();
            }
        }
    });



    // 搜索按钮
    $('#btn-search-project').click(function () {
        refreshProjectInfoTable();
    });

    // 为搜索框绑定enter按钮
    $("#projectContent,#projectAmountBegin,#projectAmountEnd,#projectBeginTime,#projectEndTime").keydown(function () {
        if (event.keyCode == 13) {
            refreshProjectInfoTable();
        }
    });

    // 设置选择时间初始值 ， 默认一年
    var startTimeText = formatDate(moment().add(-1, 'year'), 'day');
    var stopTimeText = formatDate(moment(), 'day');
    // 开始与结束日期的id
    $("#projectBeginTime").attr("value", startTimeText);
    $("#projectEndTime").attr("value", stopTimeText);

    // 开始时间
    $("#projectBeginTime").datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        pickerPosition: "bottom-left",
        startView: 2,
        minView: 2,
        todayBtn: 2,
        autoclose: 1,
        endDate: stopTimeText
    }).on('changeDate', function (e) {
        var endTime = e.date;
        $('#projectEndTime').datetimepicker('setStartDate', endTime);
        refreshProjectInfoTable();
    });

    // 结束时间
    $("#projectEndTime").datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        pickerPosition: "bottom-left",
        startView: 2,
        minView: 2,
        todayBtn: 1,
        autoclose: 1,
        startDate: startTimeText
    }).on('changeDate', function (e) {
        var startTime = e.date;
        $("#projectBeginTime").datetimepicker('setEndDate', startTime);
        refreshProjectInfoTable();
    });

    // 导出
    $("#export-project-data").click(function () {
        $('.exportProjectDataModal .alert').css('display', 'none');
        $('#exportProjectDataModal').modal({
            backdrop: 'static'
        });
    });

    //Remove ProjectInfo
    $('#exportProjectDataModalSubmit').click(function () {
        $('#exportProjectDataModalSubmit').button('loading');
        $.post(baseUrl + '/op/statistics/export', {id: $('#projectInfoIdRemoveModal').val()}, function (response) {
            $('#exportProjectDataModalSubmit').button('reset');
            if (response.result) {
                alert("删除成功!");
                refreshProjectInfoTable();
                $('#removeProjectInfoModal').modal('hide');
            } else {
                $('#removeProjectInfoModal .' + response.msg).fadeIn();
            }
        }, 'json');
    });

});


function initTableCheckbox() {
    var $thr = $('#projectStatTable thead tr');
    var $checkAllTh = $('<th class="cboxIpt"><input type="checkbox" id="checkAll" name="checkAll" /></th>');
    /*将全选/反选复选框添加到表头最前，即增加一列*/
    $thr.prepend($checkAllTh);
    /*“全选/反选”复选框*/
    var $checkAll = $thr.find('input');
    $checkAll.click(function (event) {
        /*将所有行的选中状态设成全选框的选中状态*/
        $tbr.find('input').prop('checked', $(this).prop('checked'));
        /*并调整所有选中行的CSS样式*/
        if ($(this).prop('checked')) {
            $tbr.find('input').parent().parent().addClass('warning');
        } else {
            $tbr.find('input').parent().parent().removeClass('warning');
        }
        /*阻止向上冒泡，以防再次触发点击操作*/
        event.stopPropagation();
    });
    /*点击全选框所在单元格时也触发全选框的点击操作*/
    $checkAllTh.click(function () {
        $(this).find('input').click();
    });
    var $tbr = $('#projectStatTable tbody tr');
    var $checkItemTd = $('<td class="cboxIpt"><input type="checkbox" name="checkItem" /></td>');
    /*每一行都在最前面插入一个选中复选框的单元格*/
    $tbr.prepend($checkItemTd);
    /*点击每一行的选中复选框时*/
    $tbr.find('input').click(function (event) {
        /*调整选中行的CSS样式*/
        $(this).parent().parent().toggleClass('warning');
        /*如果已经被选中行的行数等于表格的数据行数，将全选框设为选中状态，否则设为未选中状态*/
        $checkAll.prop('checked', $tbr.find('input:checked').length == $tbr.find('input').length ? true : false);
        /*阻止向上冒泡，以防再次触发点击操作*/
        event.stopPropagation();
    });
    /*点击每一行时也触发该行的选中操作*/
    $tbr.click(function () {
        $(this).find('input').click();
    });
}

function exportProjectData(projectId) {
    var rowData = $('#projectInfoTable').bootstrapTable('getRowByUniqueId', projectId);
    $('#projectInfoIdRemoveModal').val(rowData.projectId);
    $('#projectInfoNameRemoveModal').text(rowData.projectName);
    $('#removeProjectInfoModal').modal({
        backdrop: 'static'
    });
    $('.form-horizontal .alert').css('display', 'none');
}

// 获取查询参数
function getQueryParamsForProjectInfo(params) {
    return {
        offset: params.offset,
        limit: params.limit,
        projectContent: $('#projectContent').val(),
        projectAmountBegin: $('#projectAmountBegin').val(),
        projectAmountEnd: $("#projectAmountEnd").val(),
        projectBeginTime: $('#projectBeginTime').val(),
        projectEndTime: $("#projectEndTime").val()
    };
}

// 刷新表格
function refreshProjectInfoTable() {
    $('#projectInfoTable').bootstrapTable('refresh', {
        query: {offset: 0},
        url: baseUrl + '/op/statistics/list'
    });
}

// 格式化日期
function formatDate(date, dateType) {
    if (dateType == 'year') {
        return moment(date).format("YYYY");
    } else if (dateType == 'month') {
        return moment(date).format("YYYY-MM");
    } else {
        return moment(date).format("YYYY-MM-DD");
    }
}