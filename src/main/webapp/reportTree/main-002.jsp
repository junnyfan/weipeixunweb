<%@page import="com.doggadata.teach.service.InterfaceService"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="com.doggadata.teach.pojo.*" %>
<%@page import="com.doggadata.teach.service.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<!-- <script src="/skin/default001/js/jquery.min.js"></script> -->
<script src="/skin/default001/js/bootstrap.min.js"></script>
<script src="/skin/default001/js/holder.js"></script>

<title>37学车-预约教练</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<!-- 下拉框 -->
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" href="/skin/default001/css/bootstrap.css">
<link rel="stylesheet" href="/skin/default001/css/cover.css">
</head>
<style type="text/css">
.h-header {
  min-height: 16.428571429px;
  padding: 15px;
  border-bottom: 1px solid #e5e5e5;
  background: #efefef;
}

.h-title {
  margin: 0;
  line-height: 1.428571429;
}
.h-body {
  position: relative;
  padding: 20px;
}
.login_foot{background-color:#878787;height:30px;font-size:12px;color:#e5e5e5;white-space:normal;word-break:break-all;overflow:hidden}
.bigBox{width:90%;margin:0 auto;padding-top:30px;}
table{color:white;}
/* a{color:white;text-decoration:none;} */
.fromLine{
	height:38px;
	width:360px; 
	line-height:38px; }
	
.fromlineError{
	/*display:none;*/
	position:absolute; 
	left:330px; top:240px; 
	width:152px;
	height:20px;
	padding:5px;
	padding-left:28px;
		
	color:#cc6600;
	border:1px solid #e19824;
	background:#faefd4 url(../image/ico_erro.png) 10px 7px no-repeat; }
.continer b{padding-left:20px}
.continer p{padding-left:20px}

a{color:black}
#confirmMsg{ 
position:relative; 
filter:Alpha(Opacity=100);
opacity: 1;
width: 100%;
border: 1px solid #E8E9F7;
background-color: white;
z-index:1002;
/* overflow: auto; */


}
.windowns1{width: 80%; margin: 30px auto;position:absolute;border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 6px;outline: none; -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5); box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5); background-clip: padding-box; }
#fullbg{ background-color: gray; overflow:hidden;  display:none; z-index:3; position:absolute; left:0px; top:0px; filter:Alpha(Opacity=30);
opacity: 0.8; 
}
.twobtns{position:absolute;top:140px;width:100%;height:40px;z-index:1990;}
.btnChart{width:45%;height:40px;line-height:40px;text-align:center;-
moz-border-radius: 8px;-webkit-border-radius: 8px;border-radius:8px; background-color:#219fff;border:none;color:white;font-size:20px;position:absolute;bottom:2px;}
.btnChart:hover{ background-color:#0d88e6;}

.btnCancel{width:45%;height:40px;line-height:40px;text-align:center;-
moz-border-radius: 8px;-webkit-border-radius: 8px;border-radius:8px; background-color:#219fff;border:none;color:white;font-size:20px;position:absolute;bottom:2px;right:8px;}

.btnCancel:hover{ background-color:#0d88e6;}
.button{width:25%;height:35px;line-height:35px;text-align:center;-
moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px; background-color:#219fff;border:none;color:white;font-size:22px;margin-top:20px;margin-left:10px;}
.button:hover{ background-color:#0d88e6;}
.row{height: 125px}
.welcome{float:left;color:#fff;font-size:42px;font-family:"微软雅黑";letter-spacing:4px;margin:50px 0px 0px 140px;}
.selected{border-bottom: 5px solid #3016F3;}
/* #LoginForm{margin:0 auto;width:950px;text-align:left;}.redzi{color:#f00;} */
.caItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
</style>
<script type="text/javascript">

</script>
<body>
<div id="fullbg"></div>

<%
String state=request.getAttribute("state").toString();
String banded="";
System.out.print("sessionId test:"+request.getSession().getAttribute("openIdtest"));
if(state.equals("false"))
	banded="false";
else
	banded=request.getAttribute("banded").toString();
%>
<%if(banded.equals("false")) {%>
<div id="LoginForm">

<input type="hidden" name="userId" id="userId"/>
<input type="hidden" name="type" id="type" value="login"/>
<input type="hidden"  name="openId" id="openId" value="${openId }"/>
<div class="navbar navbar-default navbar-fixed-top login_top" >
  <div class="container">
        <a class="center-block logo " href="" >
            <img src="skin/default001/images/logo37.png" /></a>
  </div>
</div>
<div class="container col-xs-12">
  <div class="row">
   
      <h3 class="center-block tittle_denglu" >37学车预约</h3>
      <div class="form-group">
          <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </span>
                <input type="text" id="username" name="username" class="form-control" placeholder="请输入姓名" aria-describedby="basic-addon1">
      </div>
      

      <div class="input-group">   
            <span class="input-group-addon" id="Span1">
                <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
            </span>
                <input type="text" class="form-control" id="userno" name="userno" placeholder="请输入卡号" aria-describedby="basic-addon1">
      </div>
     
      <div class="input-group">
            <span class="input-group-addon" id="Span2">
            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>    
            </span>
                <input type="text" class="form-control" id="telphone" name="telphone" onkeyup="this.value=this.value.replace(/\D/g,'')" placeholder="请输入电话号码" aria-describedby="basic-addon1">
      </div>
      <span id="msg" style="display: none;" ></span>
      </div>

<button type="button" class="btn btn-primary btn-group-justified" id="btnLogin">登录</button>
       
  </div>
  
</div>


</div>
<%}
String [] subs=InterfaceService.getSubjectArray();
%>
<div id="container" class="container" style="display: none;" >
<!-- 显示分点信息 -->
<input type="hidden" id="currentCoachId" name="currentCoachId"/>

<!-- 显示科目信息 -->	
		
		<div class="tabpanel">

            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">科目二教练<span id="one" class=""></span></a>
                </li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">科目三教练<span id="two" class=""></span></a>
                </li>

            </ul>


            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    
				</div>


                <div role="tabpanel" class="tab-pane" id="profile">科目三</div>


               
            </div>

        </div>
		

</div>
<div class="windowns1" id="windowns1" style="display: none;">

<input type="hidden" id="courseId" name="courseId"/>
<input type="hidden" id="num" name="num"/>
<input type="hidden" id="am" name="am"/>
	<div id="confirmMsg" >
	<div class="h-header">
        <h4 class="h-title" id="myModalLabel">友情提示</h4>
    </div>
    <div class="h-body">
          <p class="text-muted">您的预约是<span id="datetims" class="text-danger"></span>时间段。预约成功但未到达的，练车车时自动累加。</p>
          <p class="text-warning">如需要解除约定，请至预约时间的前一天解除约定，否则按照预约流程将累加车时</p>
    </div>
	
	<div class="modal-footer">
        <button type="button"  id="btnCancel" class="btn btn-default" >取消</button>
        <button type="button" id="btnChart" class="btn btn-primary">确认</button>
    </div>
    </div>
</div>

<div id="confirmForm" style="display:none;">
<nav class="navbar navbar-default">
  <div class="container">
  <div class="navbar-header">
      <a class="navbar-brand" href="javascript:back()" >
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <div class="page-title"><span id="coachNameSpan"></span>&nbsp;<span id="daySpan"></span></div>
  </div>      
  </div>
</nav>
<div id="contianerDiv" class="container"></div>
</div>
</body>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;
$("#footer").css("width",w+'px');
//$("#fullbg").css("width",w+'px');
//$("#conformForm").css("height",(h-60)+'px');
$("#btnCancel").on("click",function(){
	$("#windowns1").css("display","none");
	$("#fullbg").css("display","none");
});

$(document).ready( function(){
	 $('#btnLogin').bind('click', function(event){
        validateAndSubmitForm();
    });
	 
	 
	$("#btnCancel").on("click",function(){
		$("#windowns1").css("display","none");
		$("#fullbg").css("display","none");
	});
	$("#btnChart").on("click",function(){
		var num=$("#num").val();
		var am=$("#am").val();
		$.post("../main", {
  		   courseId:$("#courseId").val(),
  		   type:'confrim',
  		   openId:'${openId }'
  		   },
  		   function(data){
  			   var state=data.state;
  			   if(state){
  				   var element="";
  				   var aelement="";
  				   if(am=='am'){
  					   element=$("#amfree"+num);
  					 aelement=$("#am"+num);
  				   }
  				   else{
  					 element=$("#pmfree"+num);
  					aelement=$("#pm"+num);
  				   }
  				   
  				   var free=Number(element.html()-1);
  				   if(free==0){
  					 element.parent("a").attr("href","#");
  					 aelement.parent("td").css("background-color","#AAA2A0");
  				   }
  				   element.html(free);
  				   alert(data.reason);
  				 WeixinJSBridge.call('closeWindow');
  			   }else{
  				   alert(data.title+":"+data.reason);
  			   }
  			$("#windowns1").css("display","none");
  			$("#fullbg").css("display","none");
  		},'json');
	});
});

function back(){
	$("#confirmForm").css("display","none");
	$("#container").css("display","block");
}

function scoreHtmls(score){
	if(score>=5)
		score=5;
	var htmls="";
	for(var i=1;i<=5;i++){
		if(score<=5 && i<=score){
			//htmls+="<span id=\"score"+i+"\" class=\"caItemDiff pItemDiffFirst\" style=\"background-position: 0px -555px;\"></span>";
			htmls+="<span id=\"score"+i+"\" class=\"glyphicon glyphicon-star red_star\" aria-hidden=\"true\"></span>";
		}else{
			htmls+="<span id=\"score"+i+"\" class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span>";
			//htmls+="<span id=\"score"+i+"\" class=\"caItemDiff pItemDiffFirst\" style=\"background-position: 0px -575px;\"></span>";
			
			
		}
	}
	return htmls;
}
function init_t(subjectId,json,text,state){
    
var texts=text;	
var varCoachId="";
var forTree = function(o){
		
		for(var i=0;i<o.length;i++){
			var urlstr = "";
			try{
				if(typeof o[i]["coach"] != "undefined"){
					var scoreHtml=scoreHtmls(o[i]["coach"]["score"]);
					varCoachId=o[i]["coach"]["id"];//浏览次数【"+o[i]["coach"]["checkNum"]+"】
					//urlstr="<div><div style=\"margin-bottom:5px;padding-top:5px\"><img style=\"float:left\" width=\"80px\" height=\"80px\" src=\""+o[i]["coach"]["picUrl"]+"\"/><div class=\"continer\"> <b>姓名："+o[i]["coach"]["name"]+"&nbsp;&nbsp;</b><br/>"+scoreHtml+"<p style=\"white-space:normal;word-break:break-all;overflow:hidden\">简介：</p></div></br></br></div><ul lang=\""+o[i]["coach"]["id"]+"\">";
					urlstr="<div class=\"block bg_h6\"><ul class=\"media-list\"><li class=\"media\"><a class=\"pull-left\" href=\"##\"><img src=\""+o[i]["coach"]["picUrl"]+"\" /></a><div class=\"media-body\"><h3 class=\"media-heading\">"+o[i]["coach"]["name"]+scoreHtml+"</h3><p>简介："+o[i]["coach"]["des"]+"</p> </div></li></ul><ul class=\"list-group\">";
				}else{
					var day=o[i]["day"];
					//urlstr="<div><span class=\"panSpan\"><img src=\"22\" width=\"40px\" height=\"40px\"/><a href=\"javascript:openConfirm('"+day+"','"+varCoachId+"','"+subjectId+"')\">"+o[i]["day"]+"总共【"+o[i]["totalNum"]+"】还剩【"+o[i]["canBookNum"]+"】</a></span><ul>";
					var num=o[i]["canBookNum"];
					if(typeof day != "undefined"){
					if(num==0)
						urlstr="<li class=\"list-group-item\"><a   class=\"course\"><img src=\"/skin/default001/images/rili.png\" /><span>"+o[i]["day"]+"总共【"+o[i]["totalNum"]+"】还剩【"+num+"】</span></a></li>";
					else
						urlstr="<li class=\"list-group-item\"><a href=\"javascript:openConfirm('"+day+"','"+varCoachId+"','"+subjectId+"')\" class=\"course\"><img src=\"/skin/default001/images/rili.png\" /><span>"+o[i]["day"]+"总共【"+o[i]["totalNum"]+"】还剩</span>【<span style=\"color:red;font-size: 18px;font:bold;\">"+num+"</span>】</a></li>";
					}
				}
				texts+=urlstr;
				if(o[i]["courseDays"] != null){
					forTree(o[i]["courseDays"]);
				}
				
			}catch(e){}
			
			}
		if(o!="[{}]" && o.length>0){
			texts += "</ul></div>";
		}
		return texts;
	};
	if(state==2)
		document.getElementById("home").innerHTML = forTree(json);
	else
		document.getElementById("profile").innerHTML = forTree(json);

	
	
	
	
}

var userId='${userId}';
var banded='${banded}';
var state='${state}';
if(userId!='' && banded=='true' && state=='true'){
	$("#container").css("display","block");
	var subjectId='${subjectId}';
	$("#LoginForm").css("display","none");
	$("#currentCoachId").val(subjectId);
	
	//var json=[{"coach":{"branchId":"网点编号","branchName":"网点名称","checkNum":"教练被浏览数","count":"","des":"","duteAge":"教龄N月","id":"教练编号","isHost":"false","jxId":"驾校编号","jxName":"驾校名称","likeNum":"","name":"cd名称","picUrl":"教练头像地址","score":"评分","scoreNum":"点评数","sex":"性别"},"courseDays":[{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"},{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"}]},{"coach":{"branchId":"网点编号","branchName":"网点名称","checkNum":"教练被浏览数","count":"","des":"","duteAge":"教龄N月","id":"教练编号","isHost":"false","jxId":"驾校编号","jxName":"驾校名称","likeNum":"","name":"教练名称","picUrl":"教练头像地址","score":"评分","scoreNum":"点评数","sex":"性别"},"courseDays":[{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"},{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"}]}];
	var json=${data};
	var jsons=${datas};
	var arry=new Array();
	arry[0]='<%=subs[0]%>';
	arry[1]='<%=subs[1]%>';
	var total=0;
	for(var i=0;i<2;i++){
		var id=arry[i];
		if(subjectId==id){
			$("#one").html("【"+'${total}'+"】");
			$("#two").html("【"+'${totals}'+"】");
			init_t(subjectId,json,"",2);
			init_t(arry[1],jsons,"",3);
			i=2;
		}else{
			$("#one").html("【"+'${totals}'+"】");
			$("#two").html("【"+'${total}'+"】");
			init_t(id,json,"",3);
			init_t(arry[0],jsons,"",2);
			i=2;
		}
		
	}
}else{
	$("#LoginForm").css("display","block");
	$("#container").css("display","none");
	var falg='${state}';
	var fromlineError = $("#msg");
	if(falg=='false'){
		fromlineError.css("display","block");
		var fromlineError =$("#msg");
		fromlineError.css("color","red");
		fromlineError.html('${reason}');
		$("#username").val('<%=request.getParameter("username")%>');
		$("#userno").val('<%=request.getParameter("userno")%>');
		$("#telphone").val('<%=request.getParameter("telphone")%>');
	}
		
}
/* function clickForm(id){
	if(id=='one'){
			$("#two1").removeAttr("class");
			$("#one1").attr("class","selected");
			$("#secondSub").css("display","block");
			$("#thirdSub").css("display","none");
	}else{
			$("#one1").removeAttr("class");
			$("#two1").attr("class","selected");
			$("#secondSub").css("display","none");
			$("#thirdSub").css("display","block");
		
		}
} */
function appendHtml(am,data,day){
	var liHtml=" ";
	var forTable=function(o){
		
		for(var i=0;i<o.length;i++){
			var free=o[i]["canSingNum"];
			var str="";
			var courseId=o[i]["courseId"];
			if(typeof courseId !="undefined"){
				if(am=='am'){
					var spanId="amfree"+(i+1);
					str=o[i]["startTime"]+"-"+o[i]["endTime"]+"点(共"+o[i]["courseInNum"]+"个空位,还剩<span id=\""+spanId+"\">"+free+"</span>个)";
					//liHtml+="<dd><a id=\"am"+(i+1)+"\">"+str+"</a></dd>";
					liHtml+="<li class=\"list-group-item\"><a id=\"am"+(i+1)+"\" class=\"course\"><img src=\"/skin/default001/images/20150513051224308_easyicon_net_32.png\" /><span>"+str+"</span></a></li>";
					if(free==0){
						//first  plans
						//second plans
						$("#am"+(i+1)).parent("li").css("background-color","#AAA2A0");
					}else{
						
					} 
					$("#am"+(i+1)).attr("lang",o[i]["courseId"]);
					$("#am"+(i+1)).html(str);
				}else{
					var spanId="pmfree"+(i+1);
					str=o[i]["startTime"]+"-"+o[i]["endTime"]+"点(共"+o[i]["courseInNum"]+"个空位,还剩<span id=\""+spanId+"\">"+free+"</span>个)";
					//liHtml+="<dd><a id=\"pm"+(i+1)+"\">"+str+"<a></dd>";
					liHtml+="<li class=\"list-group-item\"><a id=\"pm"+(i+1)+"\" class=\"course\"><img src=\"/skin/default001/images/20150513051224308_easyicon_net_32.png\" /><span>"+str+"</span></a></li>";
					if(free==0){
						$("#pm"+(i+1)).parent("li").css("background-color","#AAA2A0");
					}else{  
					}
					$("#pm"+(i+1)).attr("lang",o[i]["courseId"]);
					$("#pm"+(i+1)).html(str);
					
				}
			}
		}
		return liHtml;
	}
	var dt="";
	if(am=='am'){
		dt="<div class=\"panel panel-default bg_h6\"><div class=\"panel-heading\">上午课程</div><div class=\"panel-body\"><ul class=\"list-group\">";
	}else{
		dt="<div class=\"panel panel-default bg_h6\"><div class=\"panel-heading\">下午课程</div><div class=\"panel-body\"><ul class=\"list-group\">";
	}
	$("#contianerDiv").append(dt+forTable(data)+"</ul></div></div>");
	
var forTableEvemt=function(o){
		
		for(var i=0;i<o.length;i++){
			var free=o[i]["canSingNum"];
			var courseId=o[i]["courseId"];
			days=o[i]["startTime"]+"-"+o[i]["endTime"];
			if(am=='am'){
				if(free==0){
					$("#am"+(i+1)).attr("disabled",true);
					$("#am"+(i+1)).parent("li").css("background-color","#AAA2A0");
				}else{
					$("#am"+(i+1)).attr("href","javascript:conformOrder('"+courseId+"','"+(i+1)+"','"+days+"','"+am+"')");
				} 
				$("#am"+(i+1)).attr("lang",o[i]["courseId"]);
			}else{
				if(free==0){
					$("#pm"+(i+1)).parent("li").css("background-color","#AAA2A0");
					$("#pm"+(i+1)).attr("disabled",true);
				}else{  
					$("#pm"+(i+1)).attr("href","javascript:conformOrder('"+courseId+"','"+(i+1)+"','"+days+"','"+am+"')");
				}
				$("#pm"+(i+1)).attr("lang",o[i]["courseId"]);
				//$("#pm"+(i+1)).attr("href","javascript:confrim('"+o[i]["courseId"]+"')");
				
			}
		}
	
};
forTableEvemt(data);
}


function confrim(id,num,day){
	//$("#"+num).children("a").find("span")
	$("#free"+num).val("1111");
	$.post("../main", {
		   courseId:$("#courseId").val(),
		   type:'confrim',
		   openId:$("#openId").val()
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				   alert(data.result);
			   }else{
				   alert(data.title+":"+data.reason);
			   }
			$("#windowns1").css("display","none");
			$("#fullbg").css("display","none");
		},'json');
}

function openConfirm(day,obj,subjectId){
	//var coachId=$(obj).parent('span div').find('ul').attr("lang");
	if($("#currentCoachId").val()!=subjectId){
		alert("没有权限.");
		return;
	}
	var coachId=obj;
	$.post("../main", {
		   coachId:coachId,
		   day:day,
		   openId:$("#openId").val(),
		   type:'get'
		   },
		   function(data){
			   var msg=data.state;  
			   if(msg==true){  //success
				 var amData=data.amData;
			   	 var pmData=data.pmData;
			   	 var coachName=data.coachName;
			   	$("#contianerDiv").html("");  //清空
			   	 $("#daySpan").html(data.day);
			   	 $("#coachNameSpan").html(coachName);
			   	 appendHtml("am",amData,day);
			   	 appendHtml("pm",pmData,day);
			   	$("#container").css("display","none");
			   	$("#confirmForm").css("display","block");
			   }else{
				  var message=data.reason;
				  alert(message);
				  return;
			   }
		},'json');
}

/**
* 验证表单
*/
function validateAndSubmitForm(){
   var username = $("#username").val();
   var userno = $("#userno").val();
   var telphone = $("#telphone").val();
   var fromlineError = $("#msg");
   if (username == '' || userno == '' || telphone == '') {
	   fromlineError.css("display","block");
	   fromlineError.css("color","red");
       fromlineError.html("用户信息不能为空.");
       return false;
   }else{
   	var res =/^1\d{10}$/;
   	if(!res.test(telphone)){
   		fromlineError.css("display","block");
   		   fromlineError.css("color","red");
           fromlineError.html("电话号码格式不正确.");
           return ;
   	}
   	fromlineError.css("display","none");
   	
   	
   	
   	$.post("../login", {
		   username:$("#username").val(),
		   userno:$("#userno").val(),
		   telphone:$("#telphone").val(),
		   openId:$("#openId").val(),
		   type:'login'
		   },
		   function(data){
			  	var state=data.state;
			  	if(state==true){
			  		$("#container").css("display","block");
			  		$("#LoginForm").css("display","none");
			  		$("#userId").val(data.userId);
			  		var json=eval( data.data );
			  		var jsons=eval( data.datas );
			  		var subjectId=data.subjectId;
			  		var arry=new Array();
			  		arry[0]='<%=subs[0]%>';
			  		arry[1]='<%=subs[1]%>';
			  		for(var i=0;i<2;i++){
			  			var id=arry[i];
			  			if(subjectId==id){
			  				$("#one").html("【"+data.total+"】");
			  				$("#two").html("【"+data.totals+"】");
			  				init_t(subjectId,json,"",2);
			  				init_t(arry[1],jsons,"",3);
			  				i=2;
			  			}else{
			  				$("#one").html("【"+data.totals+"】");
			  				$("#two").html("【"+data.total+"】");
			  				init_t(id,json,"",3);
			  				init_t(arry[0],jsons,"",2);
			  				i=2;
			  			}
			  			
			  		}
			  		var subjectId=data.subjectId;
			  		$("#currentCoachId").val(subjectId);
			  		if(subjectId=='<%=subs[0]%>'){
			  			$("#one").attr("checked",true);
			  			$("#two").removeAttr("checked");
			  		}else{
			  			$("#one").removeAttr("checked");
			  			$("#two").attr("checked",true);
			  		
			  		}
			  	}else{
			  		var fromlineError =$("#msg");
		  			fromlineError.css("display","block");
		  			fromlineError.css("color","red");
		  			fromlineError.html(data.reason);
				 
			   }
		},'json');
   	
   	
   	
   //	$("#inputForm").submit();
   	
   }
}


//显示灰色JS遮罩层 
function showBg(ct){ 
	var bH=$("#confirmForm").height()+20; 
	var bW=$("#confirmForm").width(); 
	var objWH=getObjWh(ct);
	//var objH=$("#"+ct).height();//浮动对象的高度 
	//$("#fullbg").css({width:bW,height:(bH-objH),display:"block"}); 
	$("#fullbg").css({width:bW,height:bH,display:"block"}); 
	var tbT=objWH.split("|")[0]+"px"; 
	var tbL=objWH.split("|")[1]+"px";
	//tbT=(objWH.split("|")[0]-bH)+"px";
	$("#"+ct).css({top:tbT,left:tbL,display:"block"}); 
	$(window).scroll(function(){resetBg()}); 
	$(window).resize(function(){resetBg()}); 
}

function getObjWh(obj){ 
	var st=$(document).scrollTop();//滚动条距顶部的距离 
	var sl=$(document).scrollLeft();//滚动条距左边的距离 
	var ch=$(window).height();//屏幕的高度 
	var cw=$(window).width();//屏幕的宽度 
	var objH=$("#"+obj).height();//浮动对象的高度 
	var objW=$("#"+obj).width();//浮动对象的宽度 
	var objT=Number(st)+(Number(ch)-Number(objH))/2-10; 
	var objL=Number(sl)+(Number(cw)-Number(objW))/2; 
	return objT+"|"+objL; 
}   

function resetBg(){ 
	var fullbg=$("#fullbg").css("display"); 
	if(fullbg=="block"){ 
	var bH2=$("body").height(); 
	var bW2=$("body").width()+16; 
	$("#fullbg").css({width:bW2,height:bH2}); 
	var objV=getObjWh("windowns1"); 
	var tbT=objV.split("|")[0]+"px"; 
	var tbL=objV.split("|")[1]+"px"; 
	$("#windowns1").css({top:tbT,left:tbL}); 
	} 
} 
function conformOrder(id,num,day,am){
	$("#datetims").text(day);
	$("#courseId").val(id);
	$("#num").val(num);
	$("#am").val(am);
	showBg('windowns1');
	//document.all.Div2.style.display = 'block';
}
function closep() {
    document.all.Div2.style.display = 'none';
    return false;
}



</script>

</html>
