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
<title>购买课程详细信息</title>
<link rel="stylesheet" type="text/css" href="${root1 }/css/order_info.css" />
<script type="text/javascript" src="${root1 }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${root1 }/js/center.js"></script>
<script type="text/javascript">
$(function(){
	$('.tcont dd .bfo:odd').css('background-color','#f9fefa');
	$('.top10 tr').find('td').slice(0,10).addClass('tdCol');
	$('#ckBox .panel div:first').css('min-width','600px');
	
});
var ti;
function clock()
  {
	var t;
	  
	  t=parseInt(document.getElementById("clock").value)+1;
	  document.getElementById("clock").value = t;
	  t=formatSeconds(t);
	  document.getElementById("clocktime").innerHTML=t;
  } 
 
function formatSeconds(value) {
var ctime = Number(value);
        var ctime1 = 0;
        var ctime2 = 0;
        if(ctime > 60) {
        	ctime1 = Number(ctime/60);
        	ctime = Number(ctime%60);
        	if(ctime1 > 60) {
        		ctime2 = Number(ctime1/60);
        		ctime1 = Number(ctime%60);
        	}
        }
        var result = ""+ctime+"秒";
        console.log(parseInt(ctime1));
        if(parseInt(ctime1)==15){
        	clearTimeout(ti);
        }
        if(ctime1 > 0) {
        	result = ""+parseInt(ctime1)+"分"+result;
        }
        if(ctime2 > 0) {
        	result = ""+parseInt(ctime2)+"小时"+result;
        }
        return result;
}
ti=setInterval("clock()",1000);

function pay(openId,courseId,payje,sId){
	  var url="${root1}/index/payOk.do";
	  $.post(url,{"openId":openId,"courseId":courseId,"payJe":payje,"courseSid":sId}, function(data) {
		 	if(  data.state == "false"){
				alert("网络异常.请稍候再试.");
			}else{
				//微信端提示用户付款成功.
				
				alert("付款成功.");
				window.location="${root1}/index/minCourstList.do?openId="+openId;
				WeixinJSBridge.call('closeWindow');
			}

		}, 'json');  
}



function callpay(openId,courseId,payje,sId){
	var url="${root1}/index/isZhifuOut.do";
	  $.post(url,{"courseSid":sId,"orderId":"${package}"}, function(data) {
		 	if(  data.state == "false"){
				alert("您的提交的课程超过期限已被限制，请重新购买课程.");
			}else{
				//微信端提示用户付款成功.
				WeixinJSBridge.invoke('getBrandWCPayRequest',{
		 	"appId" : "${appid}","timeStamp" : "${timeStamp}", "nonceStr" : "${nonceStr}", "package" : "${package}","signType" : "MD5", "paySign" : "${sign}" 
			},function(res){
			WeixinJSBridge.log(res.err_msg);
			alert("${appid},${timeStamp},${nonceStr}, ${package}, ${sign}" );
			alert(res.err_code + res.err_desc + res.err_msg);
           if(res.err_msg == "get_brand_wcpay_request:ok"){  
        	     var url="${root1}/index/message.do";
        		  $.post(url,{"openId":openId,"courseName":"${data.courseName }","payJe":payje}, function(data) {
        			 	
        			}, 'json');  
        	   
        	   
               alert("微信支付成功!");  
           }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
               alert("用户取消支付!");  
           }else{  
              alert("支付失败!");  
           }  
		})
			}

		}, 'json');  
	 
	}
</script>
</head>
<body>
<div class="filter_box">
			<p>${data.year}-${data.courseName }</p>
		</div>

		<div style=" height: 52px;"></div>

		<div class="order_box">

			<div class="order_ctn_box">
				<div class="product_img" style="line-height: 75px;">
					<img src="img/product_phone.png" />
				</div>
				<div class="order_ctn">
					<div class="order_number">
						<h1>学期：</h1>
						<p><c:if test="${data.semester==1}">春季</c:if><c:if test="${data.semester==2}">暑假</c:if><c:if test="${data.semester==3}">秋季</c:if><c:if test="${data.semester==4}">寒假</c:if></p>
					</div>
					<div class="product_name">
						<h1>年级：</h1>
						<p>
						<c:if test="${data.inGrad==1}">幼班</c:if>
						<c:if test="${data.inGrad==4}">小一</c:if>
						<c:if test="${data.inGrad==5}">小二</c:if>
						<c:if test="${data.inGrad==6}">小三</c:if>
						<c:if test="${data.inGrad==7}">小四</c:if>
						<c:if test="${data.inGrad==8}">小五</c:if>
						<c:if test="${data.inGrad==9}">小六</c:if>
						<c:if test="${data.inGrad==10}">初一</c:if>
						<c:if test="${data.inGrad==11}">初二</c:if>
						<c:if test="${data.inGrad==12}">初三</c:if>
						<c:if test="${data.inGrad==13}">高一</c:if>
						<c:if test="${data.inGrad==14}">高二</c:if>
						<c:if test="${data.inGrad==15}">高三</c:if>
						<c:if test="${data.inGrad==2}">高中以上</c:if>
						<c:if test="${data.inGrad==3}">大学以上</c:if>
						</p>
					</div>
					<div class="business_number">
						<h1>日期：</h1>
						<p>${data.startDate } – ${data.endDate } </p>
					</div>
					<div class="order_time">
						<h1>时间：</h1>
						<p>${data.teachTime }</p>
					</div>
					<div class="work_address">
						<h1>地址：</h1>
						<p>${data.teachAddress }</p>
					</div>

				</div>
				<div style="float:left;padding-left:20px;width:30%"><h2>金额:￥${data.courseJe }</h2></div>
				<div class="payBtn">
					<button class="mui-btn mui-btn-primary mui-btn-block" style="height: 48px;line-height:20px" onclick="callpay('${openId}','${courseId }','${data.courseJe }','${courseSid }')">确认付款</button>
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
	<input type="hidden" id="clock" value="0">
	<div class="yjBox">
			<div class="tjBox">
			<span>您本次报班的信息，已锁定本次名额，请尽快付款(请在15分钟内付款，否则课课程将无效):</span><span style="color:red;font-size: 23px" id="clocktime"></span>
					<dl class="tcont">
						<dd>
							<div class="bfo">
								<dl>
									<dt>${data.year}-${data.courseName }<em>${data.totalCourse }课时</em>
									<br/>
									${data.teacherName }<em>￥:${data.courseJe }</em>
									<br/>
									${data.startDate } – ${data.endDate } 
									<br/>
									${data.teachTime } <em></em>
									<br/>
									${data.teachAddress }
									<br/>
									课程介绍：</br>
									${data.courseInfo }
									<!-- <i></i> -->
									</dt>
									
						</dl>
				</div>
			
			</dd>						
			</dl>
			</div>
			<div class="btnBtm">
				<button onclick="callpay('${openId}','${courseId }','${data.courseJe }','${courseSid }')" >确认付款</button>
			</div>
			
			
		</div>
				
				</div> --%>
</body>
</html>