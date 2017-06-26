<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
		<meta charset="utf-8">
		<title>发布通知</title>
		<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" href="${root1 }/css/Fault_Complaint.css" />
		<link rel="stylesheet" href="${root1 }/js/My97DatePicker/skin/WdatePicker.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<script type="text/javascript" src="${root1 }/js/Fault_Complaint.js"></script>
		<script type="text/javascript" src="${root1 }/js/My97DatePicker/WdatePicker.js"></script>
		<style type="text/css">
			i {color:orange;}
		</style>
	</head>

	<body>
		<form id="form_box" action="#">
		<input type="hidden" value="${shId }" id="shId" name="shId"/>
		<input type="hidden" value="${openId }" id="openId" name="openId"/>
		<input type="hidden" value="" id="currentCourseName" name="currentCourseName"/>
			<ul class="user_information">
				<p>信息设置</p>
				<li>
					<label for="name">通知类型</label>
					<select name="type" id="type" required="required">
						<option value="0">调课通知</option>
						<option value="1">其他通知</option>
                     </select><i>*</i>
				</li>
				<li>
					<label for="name">通知班级</label>
					<select name="course" id="course" required="required">
					<c:forEach var="obj" items="${dataList.data}" varStatus="stat">
						<option value="${obj.courseId }">${obj.courseName }</option>
					</c:forEach>
                     </select><i>*</i>
				</li>
				<li>
					<label for="name">通知原因</label>
					<select name="changeResion" id="changeResion" required="required">
                     	 <option value="授课老师请假">授课老师请假</option>
                     	 <option value="法定节假日">法定节假日</option>                     	 
                     	 <option value="天气恶劣">天气恶劣</option>                     	 
                      	 <option value="其他有关原因">其他有关原因</option>                    	 
                     </select><i>*</i>
				</li>
				<li>
					<label for="business_numb">原上课日期</label>
					<input placeholder="调整前上课日期" type="text" name="old_date" id="old_date"  required="required" class="Wdate input" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/><i>*</i>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">调整后日期</label>
					<input placeholder="调整后上课日期" type="text" name="new_date" id="new_date" class="Wdate input" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" />
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">调整后时间</label>
					<input placeholder="调整后时间，比如：15:00-17:00" type="text" name="new_time" id="new_time" />
					<a class="clear_btn"></a>
				</li>
			</ul>
			
			
			<ul class="fault_account">
				<p>最终通知内容</p>
				<li>
                 <textarea id="msg" name="msg" placeholder="比如：亲，由于其他相关原因，原定于2016年06月21日的软笔入门班课程，上课时间调到2016年7月1日13:00--15:00，敬请周知！"></textarea>
				</li>	
				
			</ul>		
			
			
			
		</form>
<button type="button" onclick="sendMessage()" class="submit_btn">提交</button>
	</body>
<script type="text/javascript">
$('#course').bind('change',changeMsg);
$('#changeResion').bind('change',changeMsg);
$('#old_date').bind('blur',changeMsg);
$('#new_date').bind('blur',changeMsg);
$('#new_time').bind('blur',changeMsg);
$('#msg').focus(changeMsg);
function changeMsg(){
	var name = $('#course').find("option:selected").text();
	var resion = $('#changeResion').find("option:selected").text();
	var oldDate = $('#old_date').val();
	var newDate = $('#new_date').val();
	var newTime = $('#new_time').val();
	var msg = "亲，由于"+resion+"的原因，原定于"+oldDate+"的"+name+"课程，";
	if(newDate != ''){
		msg += "上课时间调到"+newDate;
		if(newTime != ''){
			msg += newTime +",敬请周知！";
		}else{
			msg +="，具体时间点，敬请留意后续通知！";
		}
	}else{
		msg +="现做调课安排，调整后上课日期和时间，敬请留意后续通知！";
	}
	$('#msg').val(msg);
}

//

function sendMessage(){
	$("#currentCourseName").val($('#course').find("option:selected").text());
	var form =$("form").serialize();
	//var url =$("form").attr("action");
	var url="${root1 }/index/senTkNoticemessage.do";
	   $.ajax({
	         url:url,
	         data:form,
	         type:'post',
	         cache : false,
	         dataType : 'json',
	         success:function(data){
	        	 if( data.state == "false"){
	 				//alert("提交失败");
        		 	alert.text("调课通知发送失败!");
        		
        		
	 			}else{
	 				//alert("提交成功");
	 				alert("已经成功发送调课通知");
        			
	 			}
	         }
	         }) ;
}
</script>
</html>