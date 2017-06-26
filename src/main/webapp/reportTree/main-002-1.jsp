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

<title>main-001</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<!-- 下拉框 -->
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" href="/skin/default001/css/bootstrap.css">
<link rel="stylesheet" href="/skin/default001/css/cover.css">
</head>
<style type="text/css">
#back{

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
 
.panel{}
.panel div{}
.panel div ul{ overflow:hidden;height:auto;}
/* .panel span{ display:block;height:auto; margin:1px 0; cursor:pointer; border-bottom:1px solid #CCC;} */
.panSpan{ display:block;height:auto; margin:1px 0; cursor:pointer; border-bottom:1px solid #CCC;}
/* .panel span:hover{ background-color:#e6e6e6; color:#cf0404;} */
.panSpan:hover{ background-color:#e6e6e6; color:#cf0404;}
.panel a{ color:#333; text-decoration:none;}
.panel a:hover{ color:#06F;} 

dl dd{border-bottom: 1px solid #BEC2C1;padding:20px}
dt{border-bottom: 1px solid #BEC2C1;margin-top:10px;margin-bottom:10px}



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
.windowns1{position:relative;width:80%;height:220px;position:absolute;top:50px; left:20px;padding-bottom:48px;}
#fullbg{ background-color: Gray; display:none; z-index:3; position:absolute; left:0px; top:0px; filter:Alpha(Opacity=30);
opacity: 0.2; 
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
<div id="areaCode">
<input type="hidden" id="currentCoachId" name="currentCoachId"/>
<div id="branchName"></div>	
</div>
<!-- 显示科目信息 -->

 <article id="subjectId" class="tabs">

		<input checked id="one" class="tabinput" name="tabs" type="radio">
	    <label id="one1" lang="<%=subs[0] %>" onclick="clickForm('one')" for="one">科目二</label>

	    <input id="two" name="tabs" class="tabinput" type="radio" value="Two">
	    <label id="two1" onclick="clickForm('two')" lang="<%=subs[1] %>" for="two">科目三</label>

	    <div class="panels">

		    <div id="secondSub" class="panel">
		    
		    </div>
		    	
		    <div id="thirdSub" class="panel">
		   
		  </div>

		</div>

    </article>
</div>


<%-- <div id="menu">

    <ul id="nav">
        <li><a id="one" lang="<%=subs[0] %>"  href="#" class="selected">科目二</a></li>
        <li><a id="two" lang="<%=subs[1] %>"  href="#" class="">科目三</a></li>
    </ul>

    <div id="menu_con">
        <div class="tag" style="display:block">
            	<div id="secondSub">
		    
		</div>
         </div> 
        <div class="tag" style="display:none">
            	<div id="thirdSub">
		   
		  </div>
         </div> 
	</div>
</div>
</div> --%>



<div id="confirmForm" style="display:none;">


<div id="header" style="border-bottom:#000 solid; text-align:center; margin:0 0 20px 0">
<a class="share" id="example1"><img height="60" src="/image/ico_share.png" /></a
<span id="back"><a href="javascript:back()" style="display:block;float:left;padding-top:10px;padding-bottom:10px;">返回</a></span>
<p style="padding-top:10px;padding-bottom:10px;">教练名称：<span id="coachNameSpan"></span>&nbsp;日期：<span id="daySpan"></span></p>
</div>
<div id="container" class="bigbox">
<!-- <table width="100%" cellspacing="0px">
      <tr>
        <td width="25%" height="200px;" align="center" style="background-color:#da532c"><a id="am1"></a></td>
        <td width="25%" height="200px;" align="center" style="background-color:#b91d47"><a id="am2"></a></td>
        <td width="50%" height="170px;">
        	<table width="100%" cellspacing="0px">
        	
              <tr>
                <td width="100%" height="100px;" align="center" style="background-color:#00a300;"><a id="am3"> </a></td>
              </tr>
              <tr>
                <td width="100%" height="100px;" align="center"  style="background-color:#C3F;"><a id="am4"></a></td>
              </tr>
            
            </table>
        </td>
      </tr>
    </table>

下午
<table width="100%" cellspacing="0px">
      <tr>
        <td width="50%" height="170px;">
        	<table width="100%" cellspacing="0px">
              <tr>
                <td width="100%" height="100px;" align="center" style="background-color:#06F;"><a id="pm1"></a></td>
              </tr>
              <tr>
                <td width="100%" height="100px;" align="center"  style="background-color:#7e3878;"><a id="pm2"></a></td>
              </tr>
            </table>
        </td>
        <td width="25%" height="200px;" align="center" style="background-color:#e3a21a;"><a  id="pm3"></a></td>
        <td width="25%" height="200px;" align="center" style="background-color:#603cba;"><a  id="pm4"></a></td>
      </tr>
    </table> -->
    <div id="contianerDiv"></div>
    </div>

<div id="footer" class="login_foot">
    	&nbsp;&nbsp;预约成功但未到达的，练车车时自动累加，请慎重预约功能！
                     如需要解除约定，请至预约时间的前一天解除约定，否则按照预约流程将
                     累加车时.
</div>
<div id="fullbg"></div>
<div class="windowns1" id="windowns1" style="display: none;">

<input type="hidden" id="courseId" name="courseId"/>
<input type="hidden" id="num" name="num"/>
<input type="hidden" id="am" name="am"/>
	<div id="confirmMsg" >
	<p style="text-align: center;">预约友情提示</p>
		您预约的是(<span id="datetims"></span>)时间段， 预约成功但未到达的，练车车时自动累加，请慎重预约功能！ 如需要解除约定，请至预约时间的前一天解除约定，否则按照预约流程将 累加车时，如操作失误产生的后果请自负.是否继续!
	</div>
	<div class="twobtns" id="twobtns">
	<input type="button" class="btnChart" value="确定" id="btnChart"/>
	<input type="button" value="取消" id="btnCancel" class="btnCancel"/>
	</div>
</div>

</div>


</body>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;
$("#one1").css("width",(w/2-5)*0.9+"px");
$("#two1").css("width",(w/2-5)*0.9+"px");
$("#footer").css("width",w+'px');
$("#fullbg").css("width",w+'px');
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
  			   }else{
  				   alert(data.title+":"+data.reason);
  			   }
  			$("#windowns1").css("display","none");
  			$("#fullbg").css("display","none");
  		},'json');
	});
});

/* var tabs=function(){
    function tag(name,elem){
        return (elem||document).getElementsByTagName(name);
    }
    //获得相应ID的元素
    function id(name){
        return document.getElementById(name);
    }
    function first(elem){
        elem=elem.firstChild;
        return elem&&elem.nodeType==1? elem:next(elem);
    }
    function next(elem){
        do{
            elem=elem.nextSibling;  
        }while(
            elem&&elem.nodeType!=1  
        )
        return elem;
    }
    return {
        set:function(elemId,tabId){
            var elem=tag("li",id(elemId));
            var tabs=tag("div",id(tabId));
            var listNum=elem.length;
            var tabNum=tabs.length;
            for(var i=0;i<listNum;i++){
            	 elem[i].onclick=(function(i){
                     return function(){
                         for(var j=0;j<tabNum;j++){
                             if(i==j){
                                 tabs[j].style.display="block";
                                 //alert(elem[j].firstChild);
                                 elem[j].firstChild.className="selected";
                             }
                             else{
                                 tabs[j].style.display="none";
                                 elem[j].firstChild.className="";
                             }
                         }
                     }
                 })(i);
        }
        }
    }
}();
tabs.set("nav","menu_con"); */

function back(){
	$("#confirmForm").css("display","none");
	$("#container").css("display","block");
}

function scoreHtmls(score){
	if(score>=5)
		score=5;
	var htmls="<table style=\"padding-left: 20px;color:black\"><tr><td>评价:</td><td>";
	for(var i=1;i<=5;i++){
		if(score<=5 && i<=score){
			htmls+="<span id=\"score"+i+"\" class=\"caItemDiff pItemDiffFirst\" style=\"background-position: 0px -555px;\"></span>";
		}else{
			
			htmls+="<span id=\"score"+i+"\" class=\"caItemDiff pItemDiffFirst\" style=\"background-position: 0px -575px;\"></span>";
			
			
		}
	}
	htmls+="</td></tr></table>";
	return htmls;
}
function init(subjectId,json,text,state){
var texts=text;	
var varCoachId="";
var forTree = function(o){
		
		for(var i=0;i<o.length;i++){
			var urlstr = "";
			try{
				if(typeof o[i]["coach"] != "undefined"){
					var scoreHtml=scoreHtmls(o[i]["coach"]["score"]);
					varCoachId=o[i]["coach"]["id"];//浏览次数【"+o[i]["coach"]["checkNum"]+"】
					urlstr="<div><div style=\"margin-bottom:5px;padding-top:5px\"><img style=\"float:left\" width=\"80px\" height=\"80px\" src=\""+o[i]["coach"]["picUrl"]+"\"/><div class=\"continer\"> <b>姓名："+o[i]["coach"]["name"]+"&nbsp;&nbsp;</b><br/>"+scoreHtml+"<p style=\"white-space:normal;word-break:break-all;overflow:hidden\">简介：</p></div></br></br></div><ul lang=\""+o[i]["coach"]["id"]+"\">";
				}else{
					var day=o[i]["day"];
					//urlstr="<div><span><img src=\"22\" width=\"40px\" height=\"40px\"/><a href=\"javascript:openConfirm('"+day+"',"+this+")\">"+o[i]["day"]+"总共【"+o[i]["totalNum"]+"】还剩【"+o[i]["canBookNum"]+"】</a></span><ul>";
					urlstr="<div><span class=\"panSpan\"><img src=\"22\" width=\"40px\" height=\"40px\"/><a href=\"javascript:openConfirm('"+day+"','"+varCoachId+"','"+subjectId+"')\">"+o[i]["day"]+"总共【"+o[i]["totalNum"]+"】还剩【"+o[i]["canBookNum"]+"】</a></span><ul>";
				}
				texts+=urlstr;
				if(o[i]["courseDays"] != null){
					forTree(o[i]["courseDays"]);
				}
				texts += "</ul></div>";
			}catch(e){}
			
			}
		return texts;
	};
	if(state==2)
		document.getElementById("secondSub").innerHTML = forTree(json);
	else
		document.getElementById("thirdSub").innerHTML = forTree(json);
}
var userId='${userId}';
var banded='${banded}';
var state='${state}';
if(userId!='' && banded=='true' && state=='true'){
	$("#container").css("display","block");
	var subjectId='${subjectId}';
	$("#LoginForm").css("display","none");
	$("#branchName").html('${branchName }');
	$("#currentCoachId").val(subjectId);
	if(subjectId=='<%=subs[0]%>'){
		$("#noe").attr("css","checked");
		$("#one1").attr("class","selected");
		$("#two1").removeAttr("class");
		$("#two").removeAttr("checked");
		$("#secondSub").css("display","block");
		$("#thirdSub").css("display","none");
	}else{
		$("#one").removeAttr("checked");
		$("#one1").removeAttr("class");
		$("#two").attr("css","checked");
		$("#two1").attr("class","selected");
		$("#secondSub").css("display","none");
		$("#thirdSub").css("display","block");
	}
	
	
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
			init(subjectId,json,"<h>科目二教练共【"+'${total}'+"】</h>",2);
			init(arry[1],jsons,"<h>科目三教练共【"+'${totals}'+"】</h>",3);
			i=2;
		}else{
			init(id,json,"<h>科目三教练共【"+'${total}'+"】</h>",3);
			init(arry[0],jsons,"<h>科目二教练共【"+'${totals}'+"】</h>",2);
			i=2;
		}
		
	}
	/*树形菜单*/
	var menuTree = function(){
		//给有子对象的元素加[+-]
		$("#secondSub ul").each(function(index, element) {
			var ulContent = $(element).html();
			//var spanContent = $(element).siblings("div").find("span").html();
	        if(ulContent){
			//	$(element).siblings("span").html( spanContent)	
			}
	    });
		
		/* $("#secondSub").find("div").click(function(){
			var ul = $(this).siblings("ul");
			var spanStr = $(this).html();
			var spanContent = spanStr.substr(3,spanStr.length);
			if(ul.find("div").html() != null){
				if(ul.css("display") == "none"){
					ul.show(300);
					$(this).html( spanContent);
				}else{
					ul.hide(300);
					$(this).html( spanContent);
				}
			}
		}) */
	}()
	$("#secondSub ul").show(300);
	$("#secondSub span").each(function(index, element) {
			var ul = $(this).siblings("ul");
	        var spanStr = $(this).html();
			var spanContent = spanStr.substr(3,spanStr.length);
			if(ul.find("div").html() != null){
				$(this).html("["+ v +"] " + spanContent);
			}
	    });	
	    
	$("#thirdSub ul").show(300);
	$("#thirdSub span").each(function(index, element) {
			var ul = $(this).siblings("ul");
	        var spanStr = $(this).html();
			var spanContent = spanStr.substr(3,spanStr.length);
			if(ul.find("div").html() != null){
				$(this).html("["+ v +"] " + spanContent);
			}
	    });
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
function clickForm(id){
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
}
function appendHtml(am,data,day){
	var liHtml="";
	var forTable=function(o){
		
		for(var i=0;i<o.length;i++){
			var free=o[i]["canSingNum"];
			var str="";
			var courseId=o[i]["courseId"];
			if(am=='am'){
				var spanId="amfree"+(i+1);
				str=o[i]["startTime"]+"-"+o[i]["endTime"]+"点(共"+o[i]["courseInNum"]+"个空位,还剩<span id=\""+spanId+"\">"+free+"</span>个)";
				liHtml+="<dd><a id=\"am"+(i+1)+"\">"+str+"</a></dd>";
				if(free==0){
					//first  plans
					//$("#am"+(i+1)).parent("td").css("background-color","#AAA2A0");
					$("#am"+(i+1)).attr("disabled",true);
					//second plans
					$("#am"+(i+1)).parent("dd").css("background-color","#AAA2A0");
				}else{
					//$("#am"+(i+1)).attr("href","javascript:conformOrder('"+courseId+"','"+(i+1)+"','"+day+"','"+am+"')");
				   /* $("#am"+(i+1)).parent("td").bind("click",function(){
					//confrim(courseId,(i+1),day);
					conformOrder(courseId,(i+1),day,am);
					}); */
				} 
				$("#am"+(i+1)).attr("lang",o[i]["courseId"]);
				$("#am"+(i+1)).html(str);
			}else{
				var spanId="pmfree"+(i+1);
				str=o[i]["startTime"]+"-"+o[i]["endTime"]+"点(共"+o[i]["courseInNum"]+"个空位,还剩<span id=\""+spanId+"\">"+free+"</span>个)";
				liHtml+="<dd><a id=\"pm"+(i+1)+"\">"+str+"<a></dd>";
				if(free==0){
					//$("#pm"+(i+1)).parent("td").css("background-color","#AAA2A0");
					$("#pm"+(i+1)).parent("dd").css("background-color","#AAA2A0");
					$("#pm"+(i+1)).attr("disabled",true);
				}else{  
					/* $("#pm"+(i+1)).parent("dd").bind("click",function(){
						//confrim(courseId,(i+1),day);
						conformOrder(courseId,(i+1),day,am);
					});  */
					//$("#pm"+(i+1)).attr("href","javascript:conformOrder('"+courseId+"','"+(i+1)+"','"+day+"','"+am+"')");
				}
				$("#pm"+(i+1)).attr("lang",o[i]["courseId"]);
				$("#pm"+(i+1)).html(str);
				//$("#pm"+(i+1)).attr("href","javascript:confrim('"+o[i]["courseId"]+"')");
				
			}
		}
		return liHtml;
	}
	var dt="";
	if(am=='am'){
		dt="上午课程";
	}else{
		dt="下午课程";
	}
	$("#contianerDiv").append("<dl><dt>"+dt+"</dt>"+forTable(data)+"</dl>");
	
var forTableEvemt=function(o){
		
		for(var i=0;i<o.length;i++){
			var free=o[i]["canSingNum"];
			var courseId=o[i]["courseId"];
			days=o[i]["startTime"]+"-"+o[i]["endTime"];
			if(am=='am'){
				if(free==0){
					$("#am"+(i+1)).attr("disabled",true);
					$("#am"+(i+1)).parent("dd").css("background-color","#AAA2A0");
				}else{
					$("#am"+(i+1)).attr("href","javascript:conformOrder('"+courseId+"','"+(i+1)+"','"+days+"','"+am+"')");
				} 
				$("#am"+(i+1)).attr("lang",o[i]["courseId"]);
			}else{
				if(free==0){
					$("#pm"+(i+1)).parent("dd").css("background-color","#AAA2A0");
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
		alert("您当前所练科目无法预约此课程.");
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
			   	 $("#daySpan").html(data.day);
			   	 $("#coachNameSpan").html(coachName);
			   	$("#contianerDiv").html("");  //清空
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
			  		var arry=new Array();
			  		arry[0]='<%=subs[0]%>';
			  		arry[1]='<%=subs[1]%>';
			  		for(var i=0;i<2;i++){
			  			var id=arry[i];
			  			if(subjectId==id){
			  				init(subjectId,json,"<h>科目二教练共【"+data.total+"】</h>",2);
			  				init(arry[1],jsons,"<h>科目三教练共【"+data.totals+"】</h>",3);
			  				i=2;
			  			}else{
			  				init(id,json,"<h>科目三教练共【"+data.total+"】</h>",3);
			  				init(arry[0],jsons,"<h>科目二教练共【"+data.totals+"】</h>",2);
			  				i=2;
			  			}
			  			
			  		}
			  		var subjectId=data.subjectId;
			  		$("#branchName").html(data.branchName);
			  		$("#currentCoachId").val(subjectId);
			  		if(subjectId=='<%=subs[0]%>'){
			  			$("#one").attr("checked",true);
			  			$("#two").removeAttr("checked");
			  		}else{
			  			$("#one").removeAttr("checked");
			  			$("#two").attr("checked",true);
			  		
			  		}
			  	}else{
		  			fromlineError.css("display","block");
		  			var fromlineError =$("#msg");
		  			fromlineError.css("color","red");
		  			fromlineError.html(data.reason);
				 
			   }
		},'json');
   	
   	
   	
   //	$("#inputForm").submit();
   	
   }
}


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
function conformOrder(id,num,day,am){
	$("#datetims").text(day);
	$("#courseId").val(id);
	$("#num").val(num);
	$("#am").val(am);
	showBg('windowns1');
}



</script>

</html>
