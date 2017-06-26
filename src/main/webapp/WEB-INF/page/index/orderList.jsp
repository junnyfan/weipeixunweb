<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
		<meta charset="utf-8">
		<title>订单详情</title>
	    <script type="text/javascript" src="${root1 }/js/jquery.js" ></script>
	    <link rel="stylesheet" href="${root1 }/css/mui.min.css" />
	    <link rel="stylesheet" href="${root1 }/css/mui.picker.min.css" />
		 <link rel="stylesheet" href="${root1 }/css/my_income.css" />
		 <link rel="stylesheet" href="${root1 }/css/myCourseList.css" />
		 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />				
		
	</head>
	<style type="text/css">
			.hide{ display:none;}
		</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#sure_btn").click(function(){
			//ajax
			var id=$("#temp_courseSid").val();
			var url="${root1}/index/getConfirmPay.do";
			$.post(url,{"courseSid":id,"shId":'${shId}'}, function(data) {
	            if(  data.state == "false"){
	 				alert("网络异常.请稍候再试.");
	 			}else{
	 				window.location.reload();
	 			}
		         
		         }) ;
			$(".tips_box").hide();
		});
		$("#cancel_btn").click(function(){
			
			$(".tips_box").hide();
		});
		
		var openId=$("#openId").val();
		$('.statistics_date').bind('click',function(){
			var id=$(this).attr("attr");
			var state=$("#"+id).attr("state");
			if(state=='no'){
				var url="${root1}/index/getOrderInfo.do";
				$.post(url,{"courseId":id,"openId":openId,"shId":$("#shId").val()}, function(data) {
		            if(  data.state == "false"){
		 				alert("网络异常.请稍候再试.");
		 			}else{
		 				ulHtml(eval(data),id);
		 				
		 				$("#"+id).attr("state","yes");
		 			}
			         
			         }) ;
				
				
			}
			
			var ds = $(this).parent().find('ul');
			//此处ajax去请求已缴费学员列表数据，并拼接为li添加到ul中
			//.....
			//$(ds)[0].html('此处放已缴费学员列表');
			if($(ds).hasClass('hide')){
				$(ds).removeClass('hide');
			}else{
				$(ds).addClass('hide');
			}
			
			
		});
		$('.statistics_date:first').click();
	});

	function callPay(courseSid,stuName){
		$("#stuName").html(stuName);
		$("#temp_courseSid").val(courseSid);
		$(".tips_box").show();
	}
	function ulHtml(data,id){
		var h=0;
		var urlHtml='';
			for(var i=0;i<data.length;i++){
				var state=data[i]["isPayed"];  //0未缴费；1已缴费；2是缴费中；3失效
				var payType=data[i]["payType"];  //1已支付；2是现金支付
				var txt=typeof (data[i]["payDate"])==''?'':data[i]["payDate"];
				var text=''
				var tmp1='';
				if(state==1){
					if(payType==1)
						tmp1='微信支付';
					else if(payType==2)
						tmp1='现金缴费';
					else
						tmp1='其他缴费';
					text='<span style="padding-right: 10px;color: #2AC845;float:right">'+tmp1+'</span>';
							
				}else{
					 
						text='<div style="padding-right: 10px;heigth:20px;float:right" class="mui-btn mui-btn-primary" style="margin:10px"  onclick="callPay(\''+data[i]["courseSid"]+'\',\''+data[i]["studentName"]+'\')">确认已缴费</div>';
						txt='';
					
				}
				
				
				
					
				var html='<li class="mui-table-view-cell mui-media">'+
				'<img src="'+data[i]["common"]+'" class="mui-media-object mui-pull-left" />'+
			    '<div class="mui-media-body"><div><span>'+data[i]["courseName"]+'</span>'+text+
			    '</div>'+
				'<div class="mui-ellipsis"><span>学员：'+data[i]["studentName"]+
				'</span><span style="padding-right: 10px;color: #2AC845;float:right">'+txt+'</span></div></div></li>';
				urlHtml+=html;
			}
			//$("#span_"+id).html(";已缴费:"+h+"）");
			$("#studentList_"+id).html(urlHtml);
	}
	</script>
	<body>
	<div class="tips_box">
	<input type="hidden" id="temp_courseSid"/>
			<div class="tips_ctn">
				<p>提示</p>
				<h1>确认“<span id="stuName"></span>”缴费了吗?</h1>
				<div class="tips_ctn_btn_box">
					<a id="sure_btn" class="sure_btn">确定</a>
					<a id="cancel_btn" class="cancel_btn">取消</a>
					
				</div>
			</div>

</div>
	<input type="hidden" value="${openId}" id="openId"/>
	<input type="hidden" value="${shId}" id="shId"/>
	<div style="padding-left: 10px;height: 30px;line-height: 30px;vertical-align: middle;background-color: #D1CEF1;">
		<span>下单人数：${totals.order_students }</span>
		<span>;总金额：${totals.payed_je }</span>
		<span>(微信：${totals.wx_payed_students }</span>
		<span>；现金：${totals.xj_payed_students })</span>
	</div>
	<c:forEach var="obj" items="${dataList.data}" varStatus="stat">
		<div class="buyList">
			<div class="statistics_date" attr="${obj.courseId }" id="${obj.courseId }" state="no">
 	                           <span style="display:block;height: 23px;">${obj.courseName }</span>
 	                           <span id="span_${obj.courseId }" style="font-size:12px;">【${obj.maxStudents}】报名${obj.payStudents }名&nbsp;&nbsp;&nbsp;&nbsp;已缴费${obj.payedStudents }名</span>
 	                           <img src="${root1 }/image/more_btn.png"/>
              </div>
			<ul class="mui-table-view hide" id="studentList_${obj.courseId }">
			
			</ul>
		</div>
		</c:forEach>
		<!-- <div class="buyList">
			<div class="statistics_date">
 	                           <span>测试名称一（共：20名；缴费10名）</span>
 	                           <img src="img/more_btn.png"/>
              </div>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<img src="img/shuijiao.jpg" class="mui-media-object mui-pull-left" />
					<div class="mui-media-body">
							微信名字
							<p class="mui-ellipsis">学员姓名：张三 
							<span style="padding-left: 10px;color: #2AC845;">缴费时间：2016-06-06--2016-07-06</span></p> 
						</div>
				</li>
				<li class="mui-table-view-cell mui-media">
						<img src="img/muwu.jpg" class="mui-media-object mui-pull-left">
						<div class="mui-media-body">
							木屋
							<p class="mui-ellipsis">想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
				</li>
				
				<li class="mui-table-view-cell mui-media">
						<img src="img/cbd.jpg" class="mui-media-object mui-pull-left">
						<div class="mui-media-body">
							CBD
							<p class="mui-ellipsis">烤炉模式的城，到黄昏，如同打翻的调色盘一般.</p>
						</div>
				</li>
			</ul>
		</div> -->
		
	</body>
	
	<script src="${root1 }/js/my_income.js"></script>
</html>
