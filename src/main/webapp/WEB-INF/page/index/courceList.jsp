<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.doggadata.teach.utils.PropertyUtils"%>
<%@page import="com.doggadata.teach.utils.UrlUtil"%>
<%@page import="com.doggadata.teach.utils.UrlUtil.HttpRequestData"%>
<%@page import="com.doggadata.teach.pojo.PublicWxUtil"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>课程列表</title>
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
	$("#sure_btn").click(function(){
		$(".tips_box").hide();
	});
});
function isLogin(openId,shId,courseId,courseName){
	var url="${root1 }/index/isLogin.do";
	
	 $.post(url,{"openId":openId,"shId":shId}, function(data) {
		 	if(  data.state == "false"){
				alert("网络异常.请稍候再试.");
			}else{
				var studentId=data.studentId;
				if(studentId==''){//注册
					window.location='${root1}/index/register.do?openId='+openId+'&shId='+shId+"&courseId="+courseId;
				}else{
					//1、判断该用户是否已经购买过课程
					
					$.post("${root1 }/index/isBuy.do",{"openId":openId,"shId":shId,"courseId":courseId}, function(data) {
						if(data==true){
							$("#courseTemp").html(courseName);
							
							$(".tips_box").show();
							//alert("已经购买不能重复");
						}else{
							//2、添加到我的课程表里面ajax
							
							$.post("${root1 }/index/addMineCourse.do",{"openId":openId,"shId":shId,"courseId":courseId}, function(data) {
								window.location='${root1}/mainWX?openId='+openId+'&shId='+shId+"&courseId="+courseId+"&courseSId="+data.data;
					
							}, 'json'); 
						}
			
					}, 'json'); 
					
					
					
					
					
				}
			}

		}, 'json'); 
	
	/*  $.ajax({
         url:url,
         data:{"openId":openId,"shId":shId},
         type:'post',
         cache : false,
         dataType : 'json',
         success:function(data){
        	 if(  data.state == "false"){
 				alert("网络异常.请稍候再试.");
 			}else{
 				var studentId=data.studentId;
 				if(studentId==''){//注册
 					window.location='${root1}/index/register.do?openId='+openId+'&shId='+shId;
 				}else{
 					window.location='${root1}/index/courseBuy.do?openId='+openId+'&shId='+shId;
 				}
 			}
         }
         }) ;
	 */
	
}


</script>

</head>
<body>
<input type="hidden" id="openId" name="openId" value="${openId }"/> 
<input type="hidden" id="shId" name="shId" value="${shId}"/>
<!-- <input type="hidden" id="openId" name="openId" value="oUDNMwBwAOoiYp0JrqHOx6BFiupo"/> -->
<div class="filter_box"><c:if test="${isAdmin=='true' }"><c:if test="${shId=='6827b4cf-0eff-4545-9e4f-da8510351fca' }"><a href="${root1}/index/preAddCource.do?openId=${openId}&shId=${shId}&typeId=1">您好,管理员!请点击<span>发布课程</span></a></c:if><c:if test="${shId=='6827b4cf-0eff-4545-9e4f-da8510351fwu' }"><a href="${root1}/index/preAddCource.do?openId=${openId}&shId=${shId}&typeId=2">您好,管理员!请点击<span>发布课程</span></a></c:if></c:if></div>
<c:forEach var="obj" items="${dataList.data}" varStatus="stat">
<div class="crew_information_wrap">
			<img class="title_img" src="${root1 }/image/title_buy.png" style="width:33px;" />
			<div class="information_ctn_L_R_box">
				<div class="information_ctn_L" style="float:left">
					<p>${obj.courseName }</p>
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
						<h1>
			    	    	   <span class="mui-badge mui-badge-danger">剩余${obj.maxStudents-obj.payStudents }名额</span>
			    	    	   <span class="mui-badge mui-badge-danger mui-badge-inverted">￥:${obj.courseJe }</span>
			    	    	</h1>
						<h1>
			    	    	   <span>${obj.teachAddress }</span>
			    	    	</h1>
			    	    	<h1>
			    	    	   <span>${obj.startDate }-${obj.endDate }</span>
			    	    	</h1>
						<h1>
			    	    	   <span>${obj.teachTime }</span>
			    	    	</h1>
			    	    	<h1>
			    	    	   <span>咨询电话:13610122093</span>
			    	    	</h1>
					</div>
				</div>
				
				<div class="payBtn">
					<c:if test="${(obj.maxStudents-obj.payStudents)!=0}"><a href="javascript:isLogin('${openId }','${shId }','${obj.courseId }','${obj.courseName }')"><button type="button" class="mui-btn mui-btn-primary mui-btn-block" style="height: 30px;line-height:2px">报名</button></a></c:if>
					
				</div>

			</div>
			<%-- <div class="information_ctn_Bottom">
				<div>
					<p>星级：</p>
					<img src="${root1 }/image/star_4@2x.png" />
				</div>

			</div> --%>

</div>
</c:forEach>

<c:if test="${dataList.size==0 }">
	<div class="crew_information_wrap">
	<div class="information_ctn_L_R_box">
				<div class="information_ctn_L">
					<span style="color:red">
					暂无发布课程，如果您是管理员，赶快发布课程吧!
					</span>
				</div>
	</div>
					
	</div>
</c:if>
<div class="tips_box">
			<div class="tips_ctn">
				<p>提示</p>
				<li>
					您勾选课程：<span id="courseTemp"></span>

				</li>

				<h1>已购“<span>购买</span>”了.不能重复购买</h1>
				<div class="tips_ctn_btn_box">
					<a id="sure_btn" class="sure_btn" style="margin-left:30px;">确定</a>
				</div>
			</div>

</div>
<%-- 
<div class="ifrRight">
	<!-- main -->
	<div class="yjBox">
			<div><span class="tjTip">课程列表<em>welcome!</em></span><c:if test="${isAdmin=='true' }"><a href="${root1}/index/preAddCource.do?openId=${openId}">发布课程</a></c:if></div>
			<div class="tjBox">
					<dl class="tcont">
			
						 <c:forEach var="obj" items="${dataList.data}" varStatus="stat">
		  					<dd>
							<div class="bfo">
								<dl>
									<dt>${obj.year}-${obj.courseName }<em>${obj.totalCourse }课时</em>
									<br/>
									${obj.teacherName }<em>￥:${obj.courseJe }</em>
									<br/>
									${obj.startDate } – ${obj.endDate } <em>剩余:${obj.maxStudents-obj.payStudents }</em>
									<br/>
									${obj.teachTime } <em><c:if test="${(obj.maxStudents-obj.payStudents)!=0}"><a href="javascript:isLogin('${openId }','${shId }','${obj.courseId }')">缴费</a></c:if></em>
									<br/>
									${obj.teachAddress }
									
									<i></i>
									</dt>
									<dd>
										<p>
											课程详细介绍：
											${obj.courseInfo }
											</br>
											可报人数${obj.maxStudents }：人/已报：${obj.payStudents}
										</p>
										<!-- <a href="glgd.html" target="_iframe">查看信息</a> -->
									</dd>
								</dl>
							</div>
						</dd>
			  			</c:forEach>

						<c:if test="${dataList.size==0 }">
								<dd>
										<div class="bInfo">
											<dl>
												<dt style="color:red">
												暂无发布课程，如果您是管理员，赶快发布课程吧!
												</dt>
												
											</dl>
										</div>
									</dd>
								</c:if>
								
														
					</dl>
			</div>
		</div>
				
				</div> --%>

</body>
<script type="text/javascript">

</script>
</html>