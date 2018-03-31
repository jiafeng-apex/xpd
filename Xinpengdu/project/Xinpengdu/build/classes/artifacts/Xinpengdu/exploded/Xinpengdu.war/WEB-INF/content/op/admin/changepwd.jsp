<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>添加/编辑操作员</title>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/common-header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/resources/js/admin.js"></script>
</head>
<body>
	<form:form method="post" id="form">
		<input type="hidden" name="_method" value="${_method }" />
		<h3 class="page-title">修改密码</h3>
		<div class="title-line"></div>
		<div class="databox">
			<table class="actionbody">
				<tr>
				    <input type="hidden" id="operaterId" name="operaterId" value="${operaterId }" />
					<td class="tdtitle"><span class="red">*</span>原密码：</td>
					<td class="tdright">
					<input type="password" id="operaterPwd" name="operaterPwd" class="ipt ipt-size2" /></td>
				</tr>
				<tr>
                    <td class="tdtitle"><span class="red">*</span>新密码：</td>
                    <td class="tdright">
                    <input type="password" id="operaterNewPwd" name="operaterNewPwd" class="ipt ipt-size2"/></td>
                </tr>
                <tr>
                    <td class="tdtitle"><span class="red">*</span>确认密码：</td>
                    <td class="tdright">
	                    <input type="password" id="operaterNewPwd1" name="operaterNewPwd1" class="ipt ipt-size2" onblur="pwdValidate()" />
                    </td>
                </tr>
				<tr>
					<td></td>
					<td colspan="2"><input id="ok" type="submit" value="确定" class="btn" onclick="return formValidate()"  />&nbsp; 
				</tr>
			</table>
		</div>
	</form:form>
	<script type="text/javascript" src="${ctx}/resources/js/jquery-validation/jquery.validate.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/jquery-validation/localization/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			//提示信息：
	        var type = "${message.type}";
	        var text = "${message.text}";
	        if(type && text){
	            if(type == "error"){
	                sy.error(text);
	            }else{
	                sy.success(text);
	            }
	        }
			$("#form").validate();
			$("#back").click(function() {
				location.href = "${ctx}/operater/list";
			});
		});
		
		//当失去焦点时对确认密码的验证
        function pwdValidate(){
            if($("#operaterNewPwd").val() == ""){
                sy.success("请输入确认密码!");
                $("#operaterNewPwd").focus();
                return false;
            }
        	if($("#operaterNewPwd").val() != $("#operaterNewPwd1").val()){
                sy.success("两次密码输入不一致，请重新输入!");
                $("#operaterNewPwd").focus();
                return false;
            }
        	return true;
		}
		
		//输入为空的验证
        function formValidate(){
        	if($("#operaterPwd").val() == ""){
                sy.success("请输入原密码!");
                $("#operaterPwd").focus();
                return false;
            }
            if($("#operaterNewPwd").val() == ""){
                sy.success("请输入新密码!");
                $("#operaterNewPwd").focus();
                return false;
            }
            if($("#operaterNewPwd1").val() == ""){
                sy.success("请输入确认密码!");
                $("#operaterNewPwd1").focus();
                return false;
            }
            if($("#operaterNewPwd").val() != $("#operaterNewPwd1").val()){
                sy.success("两次密码输入不一致，请重新输入!");
                $("#operaterNewPwd").focus();
                return false;
            }
            return true;
		}
	</script>
</body>
</html>