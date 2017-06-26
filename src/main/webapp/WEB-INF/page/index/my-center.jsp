<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人中心</title>
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="${root1 }/css/my_center.css" />
<link rel="stylesheet"
	href="${root1 }/js/My97DatePicker/skin/WdatePicker.css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" href="css/order_info.css" />
</head>

<body>
	<div class="header_box">
		<img src="${root1 }/img/header_R_img@2x.png" />
	</div>

	<div class="menu_ctn_box1">
		<c:if test="${isAdmin=='true' }">

			<a href="${root1}/index/preAddCource.do?openId=${openId}&shId=${shId}&typeId=1"
				class="menu_ctn1">
				<p>发布课程</p>

			</a>
			
			<a href="${root1}/index/orderList.do?openId=${openId}&shId=${shId}" class="menu_ctn2">
				<p>查看订单</p>
			</a> 
			
			<a href="${root1}/index/tkNoticeMain.do?openId=${openId}&shId=${shId}" class="menu_ctn3">
				<p>发布通知</p>
			</a>
		</c:if>
		
		<c:if test="${isAdmin!='true' }">
			<a href="${root1}/index/minCourstList.do?openId=${openId}&shId=${shId}"
				class="menu_ctn1">
				<p>课程列表</p>
			</a>
			<a href="${root1}/index/minCourstLCList.do?openId=${openId}&shId=${shId}"
				class="menu_ctn1">
				<p>学习经历</p>
			</a>
		</c:if>
		
		


	</div>
</body>

</html>