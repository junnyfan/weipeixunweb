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
<title>开班计划</title>
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="${root1 }/css/Fault_Complaint.css" />
<link rel="stylesheet" href="${root1 }/js/My97DatePicker/skin/WdatePicker.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="${root1 }/js/Fault_Complaint.js"></script>
<script type="text/javascript" src="${root1 }/js/My97DatePicker/WdatePicker.js"></script>
<%-- <script type="text/javascript" src="${root1 }/js/center.js"></script> --%>
<style type="text/css">
.btnBtm button{margin-left:10px;vertical-align:middle;background-color:#a0d62c;color:#FFF;font-size:14px;font-family:'MicroSoft YaHei';border-top:1px solid #afe969;border-bottom:1px solid #5d8a33;border-left:1px solid #afe969;border-right:1px solid #5d8a33;display:inline-block;text-align:center;width:82px;cursor:pointer;height:28px;}
.btnBtm button:hover{background-color:#dcedfd;color:#FFF;}
</style>
</head>
<body>
		<form action="${root1 }/index/addCource.do" method="post" id="form_box" name="form_box" onSubmit="return false;">
			<input type="hidden"  name="shId" id="shId" value="${shId }"/>
			<input type="hidden"  name="openId" id="openId" value="${openId }"/>
			<ul class="user_information">
				<p>课程基本信息<i>*</i></p>
				<li>
					<label for="name">学期：</label>
					<select id="period" name="period" required="required">
                     	<option value="1" selected="selected">春季</option>
						<option value="2">暑假</option>
						<option value="3">秋季</option>
						<option value="4">寒假</option>
                     </select>
				</li>
				<li>
					<label for="name">课程类型：</label>
					<select id="courceType" name="courceType" required="required">
                     	 <option value="1" selected="selected">2米测向</option>                     	 
                     	 <option value="2">80米侧向</option>
                     </select>
				</li>
				<li>
					<label for="business_numb">课程名称：</label>
					<input maxlength="20" placeholder="请输入课程名称(例如：春季2米测向)，限20个字内" type="text" required="required" name="courceName" id="courceName"  title="请输入课程名称(例如：春季软笔初级班)，限20个字内" value="春季2米测向"/><input type="hidden" id="oldstff" name="oldstff" />
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">老师姓名：</label>
					<input maxlength="12" placeholder="请输入老师的姓名(例如：蔡老师)，限12个字内" type="text" required="required" name="teacherName" id="teacherName"/>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">总课时数：</label>
					<input placeholder="请输入课时总数(例如：50),限整数" type="text" name="pcount" required="required" id="pcount"/>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">金额：</label>
					<input placeholder="请输入总金额数(例如：800)" type="text" name="money" required="required" id="money"/>
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">限制人数：</label>
					<input placeholder="请输入限制人数(例如：20)，限整数" type="text" name="ptotal" required="required" id="ptotal" value="20" />
					<a class="clear_btn"></a>
				</li>
			</ul>
			<ul class="user_information">
				<p>授课时间及地点<i>*</i></p>
				<li>
					<label for="business_numb">授课地址：</label>
					<select required="required" name="paddress" id="paddress">
						<option value="天河公园">天河公园</option>
                     	 <option value="儿童公园">儿童公园</option>
                     	 <option value="华南农业大学">华南农业大学</option>                     	 
                     </select>
				</li>
				<li>
					<label for="business_numb">开始日期：</label>
					<input required="required" placeholder="开始日期" type="text" id="btime" name="btime" class="Wdate input" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">结束日期：</label>
					<input placeholder="结束日期" type="text" required="required" name="etime" id="etime" class="Wdate input" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					<a class="clear_btn"></a>
				</li>
				<li>
					<label for="business_numb">指定时间：</label>
					<input placeholder="请输入上课时间(例如：每周二、周四08:00-09:00)" type="text" required="required" name="ptime" id="ptime"/>
					<a class="clear_btn"></a>
				</li>
			</ul>
			<ul class="fault_account">
				<p>课程内容简介<i>*</i></p>
				<li>
                 <textarea  maxlength="200" placeholder="" name="common" id="common" ></textarea>                   
				 <input name="okok" id="photo_select" required="required"  type="file" multiple="multiples" accept="image/jpeg" /> <!-- 设置multiple="multiples"选择1个以上的文件-->
				</li>	
			</ul>		
		</form>
		<button class="submit_btn" id="btnOk" onclick="saveAjax()">提交</button>
		<div class="tips_box" style="display:none;"></div>
</body>
<script type="text/javascript">
function saveAjax(){
	var courceName=$("#courceName").val();
	var teacherName=$("#teacherName").val();
	var pcount=$("#pcount").val();
	var ptotal=$("#ptotal").val();
	var money=$("#money").val();
	var common=$("#common").val();
	var ptime=$("#ptime").val();
	if(courceName==''){
		/* tipMsg('课程名称不能为空',2000);
		$("#courceName").focus(); */
		return;
	}
	if(teacherName==''){
		/* tipMsg('老师姓名不能为空',2000);
		$("#teacherName").focus(); */
		return;
	}
	if(pcount==''){
		/* tipMsg('总课时数不能为空',2000);
		$("#pcount").focus(); */
		return;
	}else{
		if(isNaN(parseInt(pcount))){
			tipMsg('总课时数只能为整数',2000);
			$("#pcount").focus();
			return;
		}else{
			pcount = parseInt(pcount);
			$("#pcount").val(pcount);
		}
	}
	if( ptotal==''){
		/* tipMsg('限制人数不能为空',2000);
		$("#ptotal").focus(); */
		return;
	}else{
		if(isNaN(parseInt(ptotal))){
			tipMsg('限制人数只能为整数',2000);
			$("#ptotal").focus();
			return;
		}else{
			ptotal = parseInt(ptotal);
			$('#ptotal').val(ptotal);
		}
	}
	if( money==''){
		/* tipMsg('课程金额不能为空',2000);
		$("#money").focus(); */
		return;
	}else{
		if(isNaN(parseFloat(money))){
			tipMsg('课程金额不符合价格格式',2000);
			$("#money").focus();
			return;
		}else{
			money = parseFloat(money);
			$("#money").val(money);
		}
	}
	$("#btnOk").attr("disabled",true);
	var form =$("form").serialize();
	var url =$("form").attr("action");
	url="${root1 }/index/addCource.do";
	var aa={"courceName":courceName,"teacherName":teacherName,"pcount":pcount,"ptotal":ptotal,"money":money,"courceType":$("#courceType").val(),"period":$("#period").val(),"btime":$("#btime").val(),"etime":$("#etime").val(),"ptime":$("#ptime").val(),"address":$("#address").val(),"common":$("#common").val()};
	   $.ajax({
	         url:url,
	         data:form,
	         type:'post',
	         cache : false,
	         dataType : 'json',
	         success:function(data){
	        	 if( data.state == "false"){
	 				//alert("提交失败");
        		 	$('.tips_box').text("对不起，您提交的课程信息保存失败");
        			$('.tips_box').show();
        			setTimeout(function (){
        				$('.tips_box').text('');
        				$('.tips_box').hide();
        			}, 2000);
	 			}else{
	 				//alert("提交成功");
	 				$('.tips_box').text("您提交的课程信息已保存");
        			$('.tips_box').show();
        			setTimeout(function (){
        				$('.tips_box').text('');
        				$('.tips_box').hide();
		 				window.location='${root1}/index/courceList.do?openId='+data.openId+'&shId='+data.shId;
        			}, 2000);
	 			}
	         }
	         }) ;
}
function tipMsg(msg,tms){
	$('.tips_box').text(msg);
	$('.tips_box').show();
	setTimeout(function (){
		$('.tips_box').text('');
		$('.tips_box').hide();
	}, tms);
}
$('#courceName').bind('blur',changeName);
$('#period').bind('change',changeName);
$('#courceType').bind('change',changeName);
$('#courceName').bind('focus',function(){
	var name = $('#courceName').val();
	if(name == '') changeName();
});

function changeName(){
	var name = $('#courceName').val();
	var period = $('#period').find("option:selected").text();
	var courceType = $('#courceType').find("option:selected").text();
	var stff = period  + courceType ;
	var oldstff = $('#oldstff').val();
	if(name == ''){
		$('#courceName').val(stff);
	}else{
		if(name.indexOf(stff) < 0){
			if(name.indexOf(oldstff) > -1){
				$('#courceName').val(stff + name.substring(name.indexOf(oldstff) + oldstff.length+1,name.length));
			}else{
				$('#courceName').val(stff + name);
			}
		}
	}
	$('#oldstff').val(stff);
}
</script>
</html>