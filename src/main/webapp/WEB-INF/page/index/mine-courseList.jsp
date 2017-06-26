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
<title>我的课程列表</title>
<%-- <link rel="stylesheet" type="text/css" href="${root1 }/css/common.css" /> --%>
<link rel="stylesheet" href="${root1 }/css/mui.min.css">
		<!--App自定义的css-->
<link rel="stylesheet" type="text/css" href="${root1 }/css/mui.picker.min.css" />
<link rel="stylesheet" href="${root1 }/css/myCourseList.css" />


<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${root1 }/js/center.js"></script>
<script type="text/javascript">
$(function(){
	/* $('.tcont dd .bfo:odd').css('background-color','#f9fefa');
	$('.top10 tr').find('td').slice(0,10).addClass('tdCol');
	$('#ckBox .panel div:first').css('min-width','600px'); */
});


</script>

</head>
<body>
<input type="hidden" id="openId" name="openId" value="${openId }"/> 
<input type="hidden" id="shId" name="shId" value="${shId }"/> 
<!-- <input type="hidden" id="openId" name="openId" value="oUDNMwBwAOoiYp0JrqHOx6BFiupo"/> -->

<c:forEach var="obj" items="${dataList.data}" varStatus="stat">
<div class="crew_information_wrap">
			<c:if test="${obj.isPayed==1}">
			<img class="title_img" src="${root1 }/image/title_img.png" />
			</c:if>
			<c:if test="${obj.isPayed==0 || obj.isPayed==2}">
			<img class="title_img" src="${root1 }/image/title_img_pay.png" />
			</c:if>
			<div class="information_ctn_L_R_box">
				<div class="information_ctn_L" style="float:left">

					<div class="information_ctn_photo">
						<c:if test="${shId=='6827b4cf-0eff-4545-9e4f-da8510351fca' }">
							<img src="${root1 }/image/photo1.jpg" />
						</c:if>
						<c:if test="${shId=='6827b4cf-0eff-4545-9e4f-da8510351fwu' }">
							<img src="${root1 }/image/photo2.gif" />
						</c:if>
					<span class="teacherName">
						${obj.teacherName }
						</span>
					</div>
					<div class="information_ctn_text">
						<p>${obj.courseName }</p>
						<h1>
			    	    	  <span class="mui-badge mui-badge-danger mui-badge-inverted"><c:if test="${obj.isPayed==0 ||obj.isPayed==2}">未缴费</c:if><c:if test="${obj.isPayed==1 }">已缴费:￥:${obj.courseJe }</c:if><c:if test="${obj.isPayed==3}">失效</c:if></span>
			    	    	</h1>
						<h1>
			    	    	   <span>${obj.teachAddress }</span>
			    	    	</h1>
						<h1>
			    	    	   <span>${obj.startDate } – ${obj.endDate }</span>
			    	    	</h1>
						<h1>
			    	    	   <span>${obj.teachTime }</span>
			    	    	</h1>
					</div>
				</div>
				<div class="payBtn">
				<c:if test="${obj.isPayed==0 || obj.isPayed==2}"><a href="${root1}/mainWX?openId=${openId }&shId=${shId }&courseId=${obj.courseId}&courseSId=${obj.courseSid}">
					<button type="button" class="mui-btn mui-btn-primary mui-btn-block" style="height: 30px;line-height:2px">付款</button>
				</a></c:if>
				</div>

			</div>
		</div>

</c:forEach>
<c:if test="${dataList.data==null }">
	<div class="crew_information_wrap">
			<div class="information_ctn_L_R_box">
				<div class="information_ctn_L" style="float:left">
			  			尊敬的用户您好，您还未购买课程！
			  			<a href="${root1}/index/courceList.do?openId=${openId}&shId=${shId}"><span style="text-decoration: underline;-size: 16px;color: #0066ff; padding: 4px;">请先选择课程</span></a>
			  			</div>
			  </div>
	</div>
</c:if>
<%-- <div class="ifrRight">
	<!-- main -->
	<div class="yjBox">
			<div><span class="tjTip">我的课程列表<em></em></span></div>
			<div class="tjBox">
					<dl class="tcont">
						 <c:forEach var="obj" items="${dataList.data}" varStatus="stat">
		  					<dd>
							<div class="bfo">
								<dl>
									<dt>${obj.year}-${obj.courseName }<em>${obj.totalCourse }课时</em>
									<br/>
									${obj.teacherName }<em><c:if test="${obj.isPayed==0 }">未缴费</c:if><c:if test="${obj.isPayed==1 }">已缴费:￥:${obj.courseJe }</c:if></em>
									<br/>
									${obj.startDate } – ${obj.endDate } 
									<br/>
									${obj.teachTime } <c:if test="${obj.isPayed==0 || obj.isPayed==2}"><em><a href="${root1}/mainWX?openId=${openId }&shId=${shId }&courseId=${obj.courseId}&courseSId=${obj.courseSid}">缴费</a></em></c:if>
									<c:if test="${obj.isPayed==3 }"><em><a href="${root1}/mainWX?openId=${openId }&shId=${shId }&courseId=${obj.courseId}&courseSid=${obj.courseSid}">已失效</a></em></c:if>
									<br/>
									<c:if test="${obj.isPayed==1 }">
									购买日期<em>${obj.payDate }</em>
									<br/>
									</c:if>
									${obj.courseInfo }
									
									<i></i>
									</dt>
									<dd>
										<p>
											课程详细介绍：
											${obj.courseInfo }
										</p>
										<!-- <a href="glgd.html" target="_iframe">查看信息</a> -->
									</dd>
								</dl>
							</div>
						</dd>
			  			</c:forEach>
			  			<c:if test="${dataList==null }">
			  			赞无课程！
			  			</c:if>
						
					</dl>
			</div>
		</div>
				
				</div> --%>

</body>
<script type="text/javascript">

</script>
</html>