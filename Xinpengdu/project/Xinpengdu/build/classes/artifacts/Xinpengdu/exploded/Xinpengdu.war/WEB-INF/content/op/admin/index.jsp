<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta content="IE=11;IE=10;IE=9;IE=8;" http-equiv="X-UA-Compatible">
<meta content="width=device-width" name="viewport">
<meta content="no-cache" http-equiv="Pragma">
<meta content="no-cache" http-equiv="Cache-Control">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta content="0" http-equiv="Expires">
<title>新鹏都装饰后台管理专业版</title>
<%@include file="/common/taglibs.jsp"%>
<link type="text/css" rel="stylesheet" href="${ctx}/resources/css/indexpage.css"/>
<%@include file="/common/common-header.jsp"%>
<style type="text/css">
*{ list-style:none; margin:0; padding:0;}
html{ height:100%; overflow:hidden;}
body{ background:#fff; height:100%;}
#header,#sidebar,#main-content,#footer{position:absolute;}

#header{ height:90px; left:0px; top:0px; right:0px;}
#sidebar{ width:153px; left:0px; top:90px; bottom:27px;background: #0289DE;}
#sidebar a{font-size: 14px;color: white;font-weight: bolder;}
#main-content{ left:150px; min-width:400px; right:0px; top:92px; bottom:27px;background: #f3f3f4;}
#footer{height:27px; left:0px; right:0px; bottom:0px;}
</style>
</head>
<body>
	<!-- Header Start -->
	<div id="header" class="navbar">
			<div class="navlogo" style="top: 0px;"><img alt="新鹏都" src="${ctx}/resources/img/logo2.png"/></div>
			<div class="navuser">
				<span style="margin-right:10px;color: white;" ></span>
				<a href="javascript:void(0);" id="exit" onclick="exit()" style="font-weight: bolder;font-size: 16px;">
				        退出
				</a>
			</div>
			<div class="navmenu" style="width:100%">
				<ul id="topmenu">
					<!-- <li id="current" class="current">
					    <a href="javascript:void(0);" target="frame_center">项目经理1</a>
	                    <a href="javascript:void(0);" target="frame_center">项目经理2</a>
	                    <a href="javascript:void(0);" target="frame_center">项目经理3</a>
	                    <a href="javascript:void(0);" target="frame_center">项目经理4</a>
	                    <a href="javascript:void(0);" target="frame_center">项目经理5</a>
	                    <a href="javascript:void(0);" target="frame_center">项目经理6</a>
					</li> -->
				<%-- <c:forEach var="item" items="${menuTree}" varStatus="status">
					<li  <c:if test="${status.index eq 0}">id="current" class="current"</c:if>>
					<c:if test="${not empty item.children}">
						<a href="javascript:void(0);" onclick="doMenu('${item.id}');">${item.name}</a>
					</c:if>
					<c:if test="${empty item.children}">
					<a href="javascript:void(0);" target="frame_center">${item.name}</a>
					</c:if>
					</li>
				</c:forEach> --%>
				</ul>
			</div>
		<!-- </div> -->
	</div>
	<!-- Header End -->
	<!-- Container Start -->
	<!-- <div id="container"> -->
		<div id="sidebar">
		  <ul>
        <li id="current" class="current">
          <a href="${ctx}/project/list" target="frame_center">
            <img src="${ctx}/resources/img/ico1.png" width="25" height="24">
                                                  工程核算
          </a>
        </li>
        <li id="current" class="current">
          <a href="${ctx}/statistic/index" target="frame_center">
           <img src="${ctx}/resources/img/ico3.png" width="25" height="24">
                                             统计报表
          </a>
        </li>
        <li id="current" class="current">
          <a href="${ctx}/projectManager/list" target="frame_center">
            <img src="${ctx}/resources/img/ico4.png" width="25" height="24">
                                                项目经理
          </a>
        </li>
        <li id="current" class="current">
          <a href="${ctx}/bank/list" target="frame_center">
            <img src="${ctx}/resources/img/ico6.png" width="25" height="24">
                                                 银行账户
          </a>
        </li>
        <li id="current" class="current">
          <a href="${ctx}/operater/list" target="frame_center">
            <img src="${ctx}/resources/img/ico7.png" width="25" height="24">
                                                 用户管理
          </a>
        </li>
        <li id="current" class="current">
          <a href="${ctx}/admin/changepwd" target="frame_center">
            <img src="${ctx}/resources/img/ico8.png" width="25" height="24">
                                                 密码修改
          </a>
        </li>
      </ul>  
		</div>
		<div id="main-content" style="padding: 0;margin-left:4px;">
			<iframe id="frame_center" name="frame_center" marginwidth=0 marginheight=0 allowtransparency="true" width="100%" height="100%" 
			scrolling="yes" frameborder="0" src="${ctx}/project/list"></iframe>
		</div>
	<!-- </div> -->
	<!-- Container End -->
	<!-- Footer Start -->
	<div id="footer">
		<p class="cpr">Copyright © 2016 版权所有.</p>
	</div>
	<!-- Footer End -->
	<script type="text/javascript">
		$(function() {
			alertleft();
			function alertleft() {
				var allwidth = $(window).width();
				var alertwidth = $(".alert").width();
				var leftwith = allwidth - alertwidth;
				$(".alert").css("left", leftwith / 2);
			}

			$(window).resize(function() {
				alertleft();
			});
			/*模拟checkbox*/
			$(".checker span").click(function() {
				$(this).toggleClass("checked");
			});
			/*导入弹出框*/
			$(".export-btn").click(function() {
				$("#fullbg").show();
				$("#export-file").show();
			});
			/*模拟上传文件*/
			$("input[type=file]").change(function() {
				$(this).parents(".uploader").find(".filename").val($(this).val());
			});
			$("input[type=file]").each(function() {
				if ($(this).val() == "") {
					$(this).parents(".uploader").find(".filename").val("您还没有选择文件...");
				}
			});
			
			$("#topmenu a").click(function(){
				var $pli = $(this).parent("li");
				$pli.siblings().removeClass().removeAttr("id");
				$pli.attr("id", "current").addClass("current");
			}).mouseover(function() {
				var $pli = $(this).parent("li");
				if ($pli.attr("id") != "current") {
					$pli.addClass("current");
				}
			}).mouseout(function() {
				var $pli = $(this).parent("li");
				if ($pli.attr("id") != "current") {
					$pli.removeClass("current");
				}
			});
			//左侧菜单被单击
			$('#sidebar ul li a').click(function()
			{
				/****设置背景颜色or文字为默认 ******/
				$('#sidebar li').css({background:"none"});
				$('#sidebar li a').css({color:"white"});
				/****单击后的背景色or文字色*****/
				$(this).css({color:"#2DAEB8"});
				$(this).parent('li').css({background:"#fff"});
			});
			// 页面加载进来后使第一个被单击
			$('#sidebar ul li a:first').click();
		});
		
		function doMenu(val){
			$("#"+val).show().siblings().hide();
			 var i=0; 
			 //单击导航默认进入左侧第一个选项
			 $("#sidebar ul li a").each(function(e){
				   if(val==$(this).parent('li').parent('ul').attr('id'))
					{
					   if(i==0)
						 {
						   $("#frame_center").attr("src",$(this).attr("href"));
						   /****选中背景 or 文字 颜色 ******/
						   $(this).css({color:"#03a1ea"});
						   $(this).css({background:"#e9e9e9"});
						   //$(this).parent('li').css({background:"#e9e9e9"});
						  } 
						i++;
					}
				   if(e==0)
					{
					   /****设置背景颜色or文字为默认 ******/
					   $('#sidebar li').css({background:"none"});
					   $('#sidebar li a').css({color:"#635f5f"});
					   /****设置选中背景颜色or文字  ******/
					   $(this).css({color:"#03a1ea"});
					   $(this).parent('li').css({background:"#e9e9e9"});
					 }
			 });
		}
		
		function exit(){
			sy.confirm("你确定要退出系统吗？", function(r) {
				if (r) {
					location.href = "../../../../";
					return false;
				}
			});
		}
	</script>
</body>
</html>