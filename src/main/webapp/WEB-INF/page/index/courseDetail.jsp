<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的课程详情</title>
<link rel="stylesheet" href="${root1 }/css/mui.min.css">
<link rel="stylesheet" type="text/css" href="${root1 }/css/order_info.css" />
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.tcont dd .bfo:odd').css('background-color','#f9fefa');
	$('.top10 tr').find('td').slice(0,10).addClass('tdCol');
	$('#ckBox .panel div:first').css('min-width','600px');
});

function closeWindow(){
	WeixinJSBridge.call('closeWindow');
}
</script>

</head>
<body>
<input type="hidden" id="openId" name="openId" value="${openId }"/> 
<!-- <input type="hidden" id="openId" name="openId" value="oUDNMwBwAOoiYp0JrqHOx6BFiupo"/> -->



<div class="filter_box">
			<p>${dataList.year}-${dataList.courseName }</p>
		</div>

		<div style=" height: 52px;"></div>

		<div class="order_box">

			<div class="order_ctn_box">
				<div class="product_img" style="border-radius:70%" >
					<img src="${root1 }/image/product_phone.png" />
				</div>
				<div class="order_ctn">
					<div class="order_number">
						<h1>学期：</h1>
						<p><c:if test="${dataList.semester==1 }">春季</c:if><c:if test="${dataList.semester==2 }">暑假</c:if><c:if test="${dataList.semester==3}">秋季</c:if><c:if test="${dataList.semester==4 }">寒假</c:if></p>
					</div>
					
					<div class="business_number">
						<h1>日期：</h1>
						<p>${dataList.startDate } – ${dataList.endDate }</p>
					</div>
					<div class="order_time">
						<h1>时间：</h1>
						<p>${dataList.teachTime }</p>
					</div>
					<div class="work_address">
						<h1>地址：</h1>
						<p>${dataList.teachAddress }</p>
					</div>
					<div class="product_name">
						<h1>金额:</h1>
					<p style="color:red">￥：${dataList.courseJe }</p>
					</div>
				</div>
				<div class="payBtn">
					<button class="mui-btn mui-btn-primary mui-btn-block" style="height: 48px;line-height:20px" onclick="closeWindow()">确认</button>
				</div>
			</div>
			
		</div>
		<div class="nothing_ctn_box">
			<img class="nothing_img" src="img/nothing_icon.png">
			<p>亲，还没有相关的订单哦</p>
		</div>











<%-- 
<div class="ifrRight">
	<!-- main -->
	<div class="yjBox">
			<div><span class="tjTip">我的课程详情<em></em></span></div>
			<div class="tjBox">
					<dl class="tcont">
		  					<dd>
							<div class="bfo">
								<dl>
									<dt>${dataList.year}-${dataList.courseName }<em>${dataList.totalCourse }课时</em>
									<br/>
									${dataList.teacherName }<em><c:if test="${dataList.isPayed==0 }">未缴费</c:if><c:if test="${dataList.isPayed==1 }">已缴费:￥:${dataList.courseJe }</c:if></em>
									<br/>
									${dataList.startDate } – ${dataList.endDate } 
									<br/>
									${dataList.teachTime } <em>购买日期:${dataList.payDate }</em>
									<br/>
									${dataList.teachAddress }
									
									<i></i>
									</dt>
									<dd>
										<p>
											课程详细介绍：
											${dataList.courseInfo }
										</p>
										<!-- <a href="glgd.html" target="_iframe">查看信息</a> -->
									</dd>
								</dl>
							</div>
						</dd>
			  			<c:if test="${dataList==null }">
			  			赞无课程！
			  			</c:if>
						
					</dl>
			</div>
		</div>
				
				</div>
 --%>
</body>
<script type="text/javascript">

</script>
</html>