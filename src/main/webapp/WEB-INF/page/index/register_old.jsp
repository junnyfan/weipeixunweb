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
<link rel="stylesheet" type="text/css" href="${root1 }/css/common.css" />
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${root1 }/js/center.js"></script>
<script type="text/javascript" src="${root1 }/js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.btnBtm button{margin-left:10px;vertical-align:middle;background-color:#a0d62c;color:#FFF;font-size:14px;font-family:'MicroSoft YaHei';border-top:1px solid #afe969;border-bottom:1px solid #5d8a33;border-left:1px solid #afe969;border-right:1px solid #5d8a33;display:inline-block;text-align:center;width:82px;cursor:pointer;height:28px;}
.btnBtm button:hover{background-color:#dcedfd;color:#FFF;}
</style>
<!-- 出生年月-->
<script type="text/javascript">

	/*加载年份*/
	function years(obj, Cyear) {
		var len = 134; // select长度,即option数量
		var selObj = document.getElementById(obj);
		var selIndex = len - 1;
		var newOpt; // OPTION对象

		// 循环添加OPION元素到年份select对象中
		for (i = 1; i <= len; i++) {
			if (selObj.options.length != len) { // 如果目标对象下拉框升度不等于设定的长度则执行以下代码
				newOpt = window.document.createElement("OPTION"); // 新建一个OPTION对象
				newOpt.text = Cyear - len + i; // 设置OPTION对象的内容
				newOpt.value = Cyear - len + i; // 设置OPTION对象的值
				selObj.options.add(newOpt, i); // 添加到目标对象中
			}

		}
	}

	function months() {
		var month = document.getElementById("bornMonth");
		month.length = 0;
		for (i = 1; i < 13; i++) {
			month.options.add(new Option(i, i));
		}

	}

	function change_date() {
		// var birthday = document.birthday;  
		var year = document.getElementById("bornYear");
		var month = document.getElementById("bornMonth");
		//var day = document.getElementById("date");
		vYear = parseInt(year.value);
		vMonth = parseInt(month.value);
		//date.length = 0;

		//根据年月获取天数  
		var max = (new Date(vYear, vMonth, 0)).getDate();
		for (var i = 1; i <= max; i++) {
			//date.options.add(new Option(i, i));
		}
	}
	
	
	//保存方法
	function save(){
		var studentName=$("#studentName").val();
		var phone=$("#phone").val();
		var address=$("#address").val();
		//var month=$("#bornMonth").val();
		var year=$("#bornYear").val();
		if(studentName==''){
			/* $("#message").css("display","block");
			$("#message").html("请输入姓名."); */
			return;
		}else if(phone==''){
			/* $("#message").css("display","block");
			$("#message").html("请输入电话号码."); */
			return;
		}else if(address==''){
			/* $("#message").css("display","block");
			$("#message").html("请输入住址."); */
			return;
		}else if( year==null){
			return;
		}else{
			//$("#FormInputInfo").submit();
			var form =$("form").serialize();
			
			var url =$("form").attr("action");
			url="${root1 }/index/subUser.do";
			   $.ajax({
			         url:url,
			         data:form,
			         type:'post',
			         cache : false,
			         contentType:'application/json',
			         dataType : 'json',
			         success:function(data){
			        	 if(  data.state == "false"){
			 				alert("提交失败");
			 			}else{
			 				$.post("${root1 }/index/isBuy.do",{"openId":"${openId}","shId":"${shId}","courseId":"${courseId}"}, function(data) {
								if(data=='true'){
									alert("已经购买不能重复");
									window.location='${root1}/index/courceList.do?openId=${openId}';
								}else{
					 				$.post("${root1 }/index/addMineCourse.do",{"openId":"${openId}","shId":"${shId}","courseId":"${courseId}"}, function(data) {
					 					window.location='${root1}/mainWX?openId='+openId+'&shId='+shId+"&courseId=${courseId}"+"&courseSId="+data.data;
					 				});
								}
			 				});
			 				
			 			}
			         }
			         }) ;
			
		}
		
		
	}
</script>
</head>
 <%
/* String	appid =PropertyUtils.getWebServiceProperty("appid");
String	appSecret =PropertyUtils.getWebServiceProperty("appSecret");

String code=request.getParameter("code");
String url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
url=url.replace("APPID", appid).replace("SECRET", appSecret).replace("CODE", code);
 HttpRequestData data = UrlUtil.sendGet(url);
String json=data.getResult();
JSONObject obj = JSONObject.fromObject(json);
String openid =obj.get("openid").toString(); 
String shId=request.getParameter("shId"); */
%> 
<body>
<div class="ifrRight">
	<!-- main -->
	<div class="yjBox">
			<div id="addS" class="easyui-dialog" style="padding:10px 6px;width:50%;">
			<form id="FormInputInfo" name="FormInputInfo" action="${root1 }/index/subUser.do" method="post">
			<input type="hidden" id="openId" name="openId" value="${openId }"/>
			<input type="hidden" id="courseId" name="courseId" value="${courseId }"/>
			 
			<!-- <input type="hidden" id="openId" name="openId" value="oUDNMwBwAOoiYp0JrqHOx6BFiupo"/> -->
			<input type="hidden" id="shId" name="shId" value="${shId }"/>
			<div class="addBox">
				<ul>
					<li>
						<span>姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<input name="studentName" id="studentName" type="text" required="required" placeholder="请输入姓名"/>
					</li>
					<li>
						<span>手机号码</span>
						<input  maxlength="11" name="phone" required="required" onkeyup="this.value=this.value.replace(/\D/g,'')" id="phone" type=text placeholder="请输入手机号码"/>
					</li>
					<li>
						<span>住址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<input name="address" id="address" type="text" required="required" placeholder="请输入家庭地址" />
					</li>
					<li>
						<span>出生年月</span>
						<!-- <select size="1" name="bornYear" required="required" id="bornYear" style="width: 70px"
							onfocus="years('bornYear',new Date().getFullYear()),change_date()"
							onchange="change_date()"></select>&nbsp; <select size="1"
							name="bornMonth" id="bornMonth" required="required" style="width: 70px"
							onfocus="months(),change_date()" onchange="change_date()"></select> -->
							<input type="text" id="bronYear" name="bornYear" class="Wdate input" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
					</li>
					<li>
						<span>性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<label> <input name="sex" type="radio" value="0" checked />男
						</label> <label><input name="sex" type="radio" value="1" />女 </label>
					</li>

					<li>
						<span>学年级&nbsp;&nbsp;</span>
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
					<li><span id="message" style="display:none;color:red;text-align: center;"></span></li>
				</ul>
			</div>
			<div class="btnBtm">
				<button onclick="save()">保存</button>
			</div>
		</form>
		</div>
			
	</div>
				
</div>
</body>

</html>
