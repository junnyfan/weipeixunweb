<!DOCTYPE html>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.doggadata.teach.utils.UrlUtil"%>
<%@page import="com.doggadata.teach.utils.UrlUtil.HttpRequestData"%>
<%@page import="com.doggadata.teach.utils.PropertyUtils"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学员注册</title>
<link rel="stylesheet" href="${root1 }/css/Fault_Complaint.css" />
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${root1 }/js/Fault_Complaint.js"></script>
<script type="text/javascript" src="${root1 }/js/center.js"></script>
<script type="text/javascript" src="${root1 }/js/My97DatePicker/WdatePicker.js"></script>

</head>
 
<body>

<form id="form_box" name="form_box" action="${root1}/index/subUser.do" method="post">
		<input type="hidden" id="openId" name="openId" value="${openId }"/>
			<input type="hidden" id="courseId" name="courseId" value="${courseId }"/>
			<input type="hidden" id="shId" name="shId" value="${shId }"/>
			
			<ul class="user_information">
				<p>学员基本信息</p>
				<li>
					<label for="name">姓名：<i>*</i></label>
					<input maxlength="12" name="studentName" id="studentName" type="text" required="required" placeholder="请输入姓名(例如：王小薇)"/>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="name">手机号码：<i>*</i></label>
					<input maxlength="11" name="phone" required="required" onkeyup="this.value=this.value.replace(/\D/g,'')" id="phone" type=text placeholder="请输入手机号码(例如：13512726275)"/>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="name">出生日期：<i>*</i></label>
					<input required="required" placeholder="请选择出生日期" type="text" id="bornYear" name="bornYear" class="Wdate input" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="name">学员姓别：<i>*</i></label>
					<select id="sex" name="sex" class="input_text">
						<option value="0" selected="selected">男</option>
						<option value="1">女</option>
					</select>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="phone_numb">现读班级：</label>
					<select id="inSchool" name="inSchool" class="input_text">
						<option value="1">幼班</option>
						<option value="4">小一</option>
						<option value="5">小二</option>
						<option value="6">小三</option>
						<option value="7">小四</option>
						<option value="8">小五</option>
						<option value="9">小六</option>
						<option value="10">初一</option>
						<option value="11">初二</option>
						<option value="12">初三</option>
						<option value="13">高一</option>
						<option value="14">高二</option>
						<option value="15">高三</option>
						<option value="2">高中以上</option>
						<option value="3">大学以上</option>
                     </select>
				</li>
				<li>
					<label for="name">住址：</label>
					<input name="address" id="address" type="text" placeholder="请输入家庭地址"/>
					<a class="clear_btn"></a>
				</li>
				</ul>
		</form>
		<button id="btnOk" class="submit_btn" onclick="save()">提交</button>
		<div class="tips_box" style="display:none;">我是漏/错填提示</div>
</body>
<script type="text/javascript">
	
	//保存方法
	function save(){
		var studentName=$("#studentName").val();
		var phone=$("#phone").val();
		var address=$("#address").val();
		//var month=$("#bornMonth").val();
		var year=$("#bornYear").val();
		if(studentName==''){
			tipMsg('学员姓名不能为空',2000);
			$("#studentName").focus();
			return;
		}else if(phone==''){
			tipMsg('手机号码不能为空',2000);
			$("#phone").focus();
			return;
		}else if( year==null){
			tipMsg('出生日期不能为空',2000);
			$("#bornYear").focus();
			return;
		}else{
			//$("#FormInputInfo").submit();
			$("#btnOk").attr("disabled",true);
			var form =$("form").serializeArray();
			
			var url =$("form").attr("action");
			   $.ajax({
			         url:url,
			         data:form,
			         type:'post',
			         cache : false,
			         dataType : 'json',
			         success:function(data){
			        	 if(  data.state == "false"){
			        		 $('.tips_box').text("对不起，您提交的学员信息保存失败");
			        			$('.tips_box').show();
			        			setTimeout(function (){
			        				$('.tips_box').text('');
			        				$('.tips_box').hide();
			        			}, 2000);
			 			}else{
			 				
			 				$.post("${root1 }/index/isBuy.do",{"openId":"${openId}","shId":"${shId}","courseId":"${courseId}"}, function(data) {
								if(data=='true'){
									$('.tips_box').text("对不起，您已经购买过该课程了。");
				        			$('.tips_box').show();
				        			setTimeout(function (){
				        				$('.tips_box').text('');
				        				$('.tips_box').hide();
										window.location='${root1}/index/courceList.do?openId=${openId}';
				        			}, 2000);
									window.location='${root1}/index/courceList.do?openId=${openId}';
								}else{
					 				$.post("${root1 }/index/addMineCourse.do",{"openId":"${openId}","shId":"${shId}","courseId":"${courseId}"}, function(data) {
					 					window.location='${root1}/mainWX?openId=${openId}&shId=${shId}&courseId=${courseId}&courseSId='+data.data;
					 				});
								}
			 				});
			 				
			 			}
			         }
			         }) ;
			
		}
		
		
	}
</script>
</html>
