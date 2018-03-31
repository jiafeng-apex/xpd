<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/easyui/css/themes/bootstrap/easyui.css"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/easyui/css/themes/icon.css"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/op/lib/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/op/css/main.css"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/op/css/format/header.css"/>

<style type="text/css">
        table {
            font-size: 13px;
        }

        .fixed-table-loading, .page-list {
            font-size: 13px;
        }

        .page-list {
            margin-right: 20px;
        }

        .pagination-info{
            margin-top: -5px;
        }

        .separator{
            float: right;
            margin-right: 15px;
            height:30px;
            border-right: 1px solid #adadad;
        }
</style>
	
<script src="<%= request.getContextPath() %>/op/lib/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/lib/moment/moment.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/lib/jquery/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/lib/easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/op/lib/easyui/js/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<!-- 拖动弹出框js -->
<%--<script src="<%= request.getContextPath() %>/op/lib/jquery/jquery-ui.min.js" type="text/javascript"></script>--%>

<script src="<%= request.getContextPath() %>/op/js/format/header.js" type="text/javascript"></script>
<script language="JavaScript">
	function formatDate(date) {
		return moment(date).format("YYYY-MM-DD");
	}
	
	$.fn.datebox.defaults.formatter = formatDate;

	var baseUrl = '<%= request.getContextPath() %>';
	var currentUuid = '${sessionScope.accessInfo.operaterId}';

    //判断 是否拥有某个功能的写权限 permissionCode 功能编码
    function hasWritePermission(permissionCode){
        var result='${sessionScope.writePermission}';
        var obj = eval('(' + result + ')');
        return obj[permissionCode];
    }
    $(document).ready(function () {
        $(".modal-dialog").draggable({handle: ".modal-header"});//为模态对话框添加拖拽
        //    全局modal可拖拽JS
//        $(document).on("show.bs.modal", ".modal", function(){
//            $(this).draggable({
//                handle: ".modal-header"   // 只能点击头部拖动
//            });
//            $(this).css("overflow", "hidden"); // 防止出现滚动条，出现的话，你会把滚动条一起拖着走的
//        });
    });
</script>