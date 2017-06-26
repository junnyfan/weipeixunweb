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
<title>我的学习历程</title>
<link rel="stylesheet" type="text/css" href="${root1 }/css/fault_order_track.css" />
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<script src="${root1 }/js/fault_order_track.js"></script>
<script type="text/javascript" src="${root1 }/js/jquery.rotate.min.js"></script>
<script type="text/javascript">
$(function(){
})
</script>
</head>
<body>
<div class="myClassList">
		我的学习历程
</div>
<div class="glay_box"></div>


<div class="order_flow_ctn_box">
		<c:forEach var="obj" items="${dataList.data}" varStatus="stat">
			<div class="order_flow_ctn1">
				<div class="order_flow_ctn_R">
					<img class="flow_mark_img" src="${root1 }/image/flow_mark_clock.png" />
					<div class="lineInfo">
						<h1>${obj.year }${obj.courseName }</h1>
						<p>日期：${obj.startDate }－－${obj.endDate }</p>
						<p>时间:${obj.teachTime }</p>
						<p>地点:${obj.teachAddress}</p>

					</div>
					<li></li>
				</div>
			</div>
		</c:forEach>
		<div class="order_flow_ctn1">
				<div class="order_flow_ctn_R">
					<img class="flow_mark_img" src="${root1 }/image/flow_mark_clock.png" />
					<div class="lineInfo">
						<h1>2016年暑期毛笔入门班</h1>
						<p>日期：2016-06-01－－2016－07－01</p>
						<p>时间：每天晚上7:00--8:00</p>
						<p>地点：美林海岸花园</p>

					</div>
					<li></li>
				</div>
			</div>
</div>
<%-- 
<div class="ifrRight">
	<!-- main -->
	<div class="yjBox">
		
		<div class="yjMain">
				
				<div id="tTab">
					<!--今日bengin-->
					<div class="sjMain active">
						<span class="tjTip">统计区间：<em >${dataList.times }</em></span>
						<div class="tjBox">
							<div class="tjTop">截至当天<em id="timer">23：50</em>为止，共有学习历程 <b>${dataList.sizes}</b> 件</div>
							<div class="tjCen">
								<dl id="yzCls">
								 <c:forEach var="obj" items="${dataList.data}" varStatus="stat">
								 
								 	<dd>
										<img class="dTip" src="../image/icon_tj_top.png"/>
										<!-- <span>2015-04-12</span> -->
										<div class="bInfo">
											<p class="border_corr"></p>
											<dl>
												<dt>${obj.startDate }&nbsp;&nbsp;${obj.courseName }<em>${obj.totalCourse }课时</em>
												<c:if test="">
												<br/>
												 <em><a href="javascript:isLogin('${openId }','${shId }','${obj.courseId }')">缴费</a></em>
												 </c:if>
												<i></i></dt>
												<dd>
													<p>
														学习奖项(此功能后续完善)
													</p>
													<a href="#" >查看信息</a>
												</dd>
											</dl>
										</div>
									</dd>
								 	
								 </c:forEach>
								<c:if test="${dataList.sizes==0 }">
								<dd>
										<img class="dTip" src="../image/icon_tj_top.png"/>
										<!-- <span>2015-04-12</span> -->
										<div class="bInfo">
											<p class="border_corr"></p>
											<dl>
												<dt style="color:red">
												您暂无学习历程，赶快购买课程去学习吧!
												</dt>
												
											</dl>
										</div>
									</dd>
								</c:if>
								</dl>
							</div>
							<div class="tjBot"><img src="${root1 }/image/icon_tj_bot.png"/></div>
						</div>
					</div>
					<!--今日end-->
				
				</div>
			<!--时间纬度end-->
		</div>
	</div>
	<!--main end-->
</div> --%>
</body>
</html>