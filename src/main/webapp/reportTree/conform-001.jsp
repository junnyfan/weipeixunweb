<%@page import="com.doggadata.teach.service.InterfaceService"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="com.doggadata.teach.pojo.*" %>
<%@page import="com.doggadata.teach.service.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<title>确认-001</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />

</head>
<style type="text/css">
/**login model */
.login_foot{background-color:#878787;height:30px;font-size:12px;color:#e5e5e5;white-space:normal;word-break:break-all;overflow:hidden}
.bigBox{width:90%;margin:0 auto;padding-top:30px;}
table{color:white;}
a{color:white;text-decoration:none;}
#confirmMsg{ 
position:absolute; 
filter:Alpha(Opacity=100);
opacity: 1;
width: 100%;
height: 180px;
padding: 8px;
border: 1px solid #E8E9F7;
background-color: white;
z-index:1002;
overflow: auto;
padding-bottom:20px;


}
.windowns1{position:relative;width:80%;height:220px;position:absolute;top:60px; left:20px;padding-bottom:48px;}
#fullbg{ background-color: Gray; display:none; z-index:3; position:absolute; left:0px; top:0px; filter:Alpha(Opacity=30);
opacity: 0.2; 
}
.twobtns{position:absolute;top:210px;width:100%;height:40px;z-index:1990;}

.button{width:25%;height:35px;line-height:35px;text-align:center;-
moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px; background-color:#219fff;border:none;color:white;font-size:22px;margin-top:20px;margin-left:10px;}
.button:hover{ background-color:#0d88e6;}
</style>

<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

HttpSession sessions=request.getSession();

Object userId=request.getSession().getAttribute("userId");
String openId = request.getParameter("openId");
String coachId = request.getParameter("coachId");
String name=request.getParameter("name");   //教练名称
//name=new String(name.getBytes("ISO-8859-1"),"UTF-8");
//date=new String(date.getBytes("ISO-8859-1"),"UTF-8");
//name=new String(name.getBytes("UTF-8"),"UTF-8");
name=new String(name.getBytes("ISO-8859-1"),"UTF-8");
String day=request.getParameter("day");
Map<String,Object> dataMap=InterfaceService.getSubjects(openId, coachId,day);
boolean state=Boolean.valueOf(dataMap.get("state").toString());
List<Course> courseListAm=null;
List<Course> courseListPm=null;
if(state){
	day=dataMap.get("day").toString();
	name= dataMap.get("coachName").toString();
	courseListAm= (List<Course>)dataMap.get("amData");
	courseListPm = (List<Course>)dataMap.get("pmData");
}
System.out.println(name);

//System.out.println("userId:"+userId+"=====:openId:"+openId);

%>

<div id="header" style="border-bottom:#000 solid; text-align:center; margin:0 0 20px 0">
<p style="padding-top:10px;padding-bottom:10px;">教练名称：<%=name %>&nbsp;日期：<%=day %></p>
</div>
<div id="container" class="bigbox">
<%if(state) {%>
<table width="100%" cellspacing="0px">
      <tr>
      <%
      for(int index=0;index<courseListAm.size();index++){
    	  String []color=new String[]{"#da532c","#b91d47"};
    	  if(index<=1){
      %>
        <td width="25%" height="200px;" align="center" style="background-color:<%=color[index]%>"><a href="javascript:conformOrder('<%=courseListAm.get(index).getCourseTimearea() %>:<%=courseListAm.get(index).getStartTime() %>-<%=courseListAm.get(index).getEndTime() %>','<%=courseListAm.get(index).getCourseId() %>>')"><%=courseListAm.get(index).getStartTime() %>-<%=courseListAm.get(index).getEndTime() %>点（共<%=courseListAm.get(index).getCourseInNum() %>个空位，还剩<%=courseListAm.get(index).getCanSingNum() %>个）</a></td>
        <%}else{%>
        <td width="50%" height="170px;">
        	<table width="100%" cellspacing="0px">
        	<%if(index==2 && index<courseListAm.size()){ %>
              <tr>
                <td width="100%" height="100px;" align="center" style="background-color:#00a300;"><a href="javascript:conformOrder('<%=courseListAm.get(index).getCourseTimearea() %>:<%=courseListAm.get(index).getStartTime() %>-<%=courseListAm.get(index).getEndTime() %>','<%=courseListAm.get(index).getCourseId() %>>')"><%=courseListAm.get(index).getStartTime() %>-<%=courseListAm.get(index).getEndTime() %>点（共<%=courseListAm.get(index).getCourseInNum() %>个空位，还剩<%=courseListAm.get(index).getCanSingNum() %>个）</a></td>
              </tr>
              <tr>
                <td width="100%" height="100px;" align="center"  style="background-color:#C3F;"><a href="javascript:conformOrder('<%=courseListAm.get(index+1).getCourseTimearea() %>:<%=courseListAm.get(index+1).getStartTime() %>-<%=courseListAm.get(index+1).getEndTime() %>','<%=courseListAm.get(index+1).getCourseId() %>>')"><%=courseListAm.get(index+1).getStartTime() %>-<%=courseListAm.get(index+1).getEndTime() %>点（共<%=courseListAm.get(index+1).getCourseInNum() %>个空位，还剩<%=courseListAm.get(index+1).getCanSingNum() %>个）</a></td>
              </tr>
              <%index++;} %>
            </table>
        </td>
        
        <%}} %>
      </tr>
    </table>

<!--下午-->
<table width="100%" cellspacing="0px">
      <tr>
      <%
      for(int index=0;index<courseListPm.size();index++){
    	  String []color=new String[]{"","","#e3a21a","#603cba"};
    	  System.out.print(index);
    	  if(index==0){
      %>
        <td width="50%" height="170px;">
        	<table width="100%" cellspacing="0px">
              <tr>
                <td width="100%" height="100px;" align="center" style="background-color:#06F;"><a href="javascript:conformOrder('<%=courseListPm.get(index).getCourseTimearea() %>:<%=courseListPm.get(index).getStartTime() %>-<%=courseListPm.get(index).getEndTime() %>','<%=courseListPm.get(index).getCourseId() %>>')"><%=courseListPm.get(index).getStartTime() %>-<%=courseListPm.get(index).getEndTime() %>点（共<%=courseListPm.get(index).getCourseInNum() %>个空位，还剩<%=courseListPm.get(index).getCanSingNum() %>个）</a></td>
              </tr>
              <tr>
                <td width="100%" height="100px;" align="center"  style="background-color:#7e3878;"><a href="javascript:conformOrder('<%=courseListPm.get(index+1).getCourseTimearea() %>:<%=courseListPm.get(index+1).getStartTime() %>-<%=courseListPm.get(index+1).getEndTime() %>','<%=courseListPm.get(index+1).getCourseId() %>>')"><%=courseListPm.get(index+1).getStartTime() %>-<%=courseListPm.get(index+1).getEndTime() %>点（共<%=courseListPm.get(index+1).getCourseInNum() %>个空位，还剩<%=courseListPm.get(index+1).getCanSingNum() %>个）</a></td>
              </tr>
            </table>
        </td>
        <%index=1;}else{
        	System.out.print("----------------:"+index+"------------"+courseListPm.size());
        	if(index<courseListPm.size()){ %>
        <td width="25%" height="200px;" align="center" style="background-color:<%=color[index]%>;"><a href="javascript:conformOrder('<%=courseListPm.get(index).getCourseTimearea() %>:<%=courseListPm.get(index).getStartTime() %>-<%=courseListPm.get(index).getEndTime() %>','<%=courseListPm.get(index).getCourseId() %>>')"><%=courseListPm.get(index).getStartTime() %>-<%=courseListPm.get(index).getEndTime() %>点（共<%=courseListPm.get(index).getCourseInNum() %>个空位，还剩<%=courseListPm.get(index).getCanSingNum() %>个）</a></td>
        <%}}} %>
      </tr>
    </table>
<%}else{ %>
<%=dataMap.get("reason").toString() %>
<%} %>
    </div>






<div id="footer" class="login_foot">
    	&nbsp;&nbsp;预约成功但未到达的，练车车时自动累加，请慎重预约功能！
                     如需要解除约定，请至预约时间的前一天解除约定，否则按照预约流程将
                     累加车时.
</div>
<div id="fullbg"></div>
<div class="windowns1" id="windowns1" style="display: none;">
<input type="hidden" id="courseId" name="courseId"/>
	<div id="confirmMsg" >
		您预约的是(<label id="datetims"></label>)时间段， 预约成功但未到达的，练车车时自动累加，请慎重预约功能！ 如需要解除约定，请至预约时间的前一天解除约定，否则按照预约流程将 累加车时，如操作失误产生的后果请自负.是否继续!
	</div>
	<div class="twobtns" id="twobtns">
	<input type="button" class="btnChart" value="确定" id="btnChart"/>
	<input type="button" value="取消" id="btnCancel" class="btnCancel"/>
	</div>
</div>
</body>

<script type="text/javascript">

$(document).ready( function(){
	
	var w = document.documentElement.clientWidth;
	var h = document.documentElement.clientHeight;
	$("#conformForm").css("width",w+'px');
	$("#footer").css("width",w+'px');
	$("#conformForm").css("height",(h-60)+'px');
	$("#btnCancel").on("click",function(){
		$("#windowns1").css("display","none");
		$("#fullbg").css("display","none");
	});
	$("#btnChart").on("click",function(){
		$.post("../main", {
  		   courseId:$("#courseId").val(),
  		   type:'confrim',
  		   openId:'<%=openId%>'
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
	  });
});

	//显示灰色JS遮罩层 
	function showBg(ct){ 
		var bH=$("#container").height(); 
		var bW=$("#container").width()+16; 
		var objWH=getObjWh(ct); 
		$("#fullbg").css({width:bW,height:bH,display:"block"}); 
		var tbT=objWH.split("|")[0]+"px"; 
		var tbL=objWH.split("|")[1]+"px"; 
		$("#"+ct).css({top:tbT,left:tbL,display:"block"}); 
		$(window).scroll(function(){resetBg()}); 
		$(window).resize(function(){resetBg()}); 
	}
	
	function getObjWh(obj){ 
		var st=document.documentElement.scrollTop;//滚动条距顶部的距离 
		var sl=document.documentElement.scrollLeft;//滚动条距左边的距离 
		var ch=document.documentElement.clientHeight;//屏幕的高度 
		var cw=document.documentElement.clientWidth;//屏幕的宽度 
		var objH=$("#"+obj).height();//浮动对象的高度 
		var objW=$("#"+obj).width();//浮动对象的宽度 
		var objT=Number(st)+(Number(ch)-Number(objH))/2; 
		var objL=Number(sl)+(Number(cw)-Number(objW))/2; 
		return objT+"|"+objL; 
	}   
	
	function resetBg(){ 
		var fullbg=$("#fullbg").css("display"); 
		if(fullbg=="block"){ 
		var bH2=$("body").height(); 
		var bW2=$("body").width()+16; 
		$("#fullbg").css({width:bW2,height:bH2}); 
		var objV=getObjWh("dialog"); 
		var tbT=objV.split("|")[0]+"px"; 
		var tbL=objV.split("|")[1]+"px"; 
		$("#dialog").css({top:tbT,left:tbL}); 
		} 
	} 
	function conformOrder(value,id){
		$("#datetims").text(value);
		$("#courseId").val(id);
		showBg('windowns1');
		/* var falg=confirm("您预约的是("+value+")时间段，请认真查看本页面下脚提示信息，如操作失误产生的后果请自负.是否继续!");
		if(falg==true){
			alert("提示：预约成功!请提示15分钟到达场地.");
		}else{
			alert("提示：你取消了本次操作.");
		} */
	}
	
	
</script>

</html>
