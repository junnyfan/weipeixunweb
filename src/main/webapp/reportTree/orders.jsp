<%@page import="com.doggadata.teach.service.InterfaceService"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="com.doggadata.teach.pojo.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script src="/skin/default001/js/bootstrap.min.js"></script>
<script src="/skin/default001/js/holder.js"></script>

<title>我的预约</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/skin/default001/css/bootstrap.css">
<link rel="stylesheet" href="/skin/default001/css/cover.css">

</head>
<style type="text/css">
*{ margin:0; padding:0; list-style:none;}
body{ font-size:12px;}
a{color:black}
/* table{width:100%} */
table th{padding:2px}
.formItemDiff {  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
   /*  margin-top: 15px;  */ 
} 
.pItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.tItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.ctItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.caItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.ctemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
</style>

<body>
<%
String openId=request.getParameter("openId");
Map<String,Object> map=InterfaceService.getUserId(openId);
boolean state=Boolean.valueOf(map.get("state").toString());
boolean banded=Boolean.valueOf(map.get("isbanded").toString());
System.out.println(state+"----------"+banded);
%>
<%if(state && !banded){ %>
<div id="LoginForm">

<input type="hidden" name="userId" id="userId"/>
<input type="hidden" name="type" id="type" value="login"/>
<input type="hidden"  name="openId" id="openId" value="${openId }"/>
<div class="navbar navbar-default navbar-fixed-top login_top" >
  <div class="container">
        <a class="center-block logo " href="" >
            <img src="../skin/default001/images/logo37.png" /></a>
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

<%} %>

<div id="myContainer" class="container">
<!-- <div style="background-color: #69C578">
<span id="username"></span>
<span id="subjectName"></span>
</div> -->
<!--代码部分begin-->
<div role="tabpanel">
<!--tag标题-->
    <ul class="nav nav-tabs nav-justified" role="tablist">
        <li role="presentation" class="active"><a href="#Div1" aria-controls="Div1" role="tab" data-toggle="tab">当前课程<span id="currentTotal" class="">【0】</span></a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">历史课程<span id="historyTotal" class="">【0】</span></a></li>
    </ul>
<!--二级菜单-->
	<div class="tab-content">
         <div role="tabpanel" class="tab-pane active" id="Div1">
         </div>
         <div role="tabpanel" class="tab-pane" id="profile">
         </div>
    </div>

</div>
</div>





<input type="hidden" id="courseId" name="courseId"/>
<div id="evalContainer" class="container" style="display: none" >

<!--代码部分begin-->
<div role="tabpanel">
<!--tag标题-->
    <ul class="nav nav-tabs nav-justified" role="tablist">
           <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">学校评价</a>
           </li>
           <li role="presentation"><a href="#profile1" aria-controls="profile1" role="tab" data-toggle="tab">教练</a>
           </li>
     </ul>
<!--二级菜单-->
    <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
        <div class="form-horizontal">
            <div class="form-group">
                <label for="exampleInputEmail1">场地环境:</label>
                <p>
          		 <span id="formItemDiff1" class="formItemDiff formItemDiffFirst" style="background-position: 0px -575px;"></span>
		          <span id="formItemDiff2" class="formItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
		          <span id="formItemDiff3" class="formItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="formItemDiff4" class="formItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="formItemDiff5" class="formItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="sArearPointP" class="manfen">满分：5</sapn>分
        		</p>
       		</div>
       		<div class="form-group">
                <label for="exampleInputEmail1">工作人员态度:</label>
                <p>
                    <span id="pItemDiff1" class="pItemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
		            <span id="pItemDiff2" class="pItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
		            <span id="pItemDiff3" class="pItemDiff" style="background-position: 0px -575px;"></span>
		            <span id="pItemDiff4" class="pItemDiff" style="background-position: 0px -575px;"></span>
		            <span id="pItemDiff5" class="pItemDiff" style="background-position: 0px -575px;"></span>
                    <span id="pPointP" class="manfen">满分:5</span>分
                </p>
       		</div>
       		<div class="form-group">
	              <label for="exampleInputEmail1">总体满意度:</label>
	              <p>
	                  <span id="tItemDiff1" class="tItemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
			          <span id="tItemDiff2" class="tItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
			          <span id="tItemDiff3" class="tItemDiff" style="background-position: 0px -575px;"></span>
			          <span id="tItemDiff4" class="tItemDiff" style="background-position: 0px -575px;"></span>
			          <span id="tItemDiff5" class="tItemDiff" style="background-position: 0px -575px;"></span>
	                  <span id="tPointP"  class="manfen">满分:5</span>分
                    </p>
       		</div>
       		<div class="form-group">
                  <label for="exampleInputEmail1">您的意见与建议:</label>
                  <p>
                  	<textarea rows="5" cols="30" id="contexts"></textarea>
                  </p>
       		</div>

         	<input type="button" class="btn btn-primary tijiao" value="提交" name="btnOk" onclick="btnOk('school')"/>
   		</div>
   		</div>
        <div role="tabpanel" class="tab-pane" id="profile1"> 
       	<div class="form-horizontal">
            <div class="form-group">
                <label for="exampleInputEmail1">教学方式:</label>
                <p>
          		 <span id="ctItemDiff1" class="ctItemDiff formItemDiffFirst" style="background-position: 0px -575px;"></span>
		          <span id="ctItemDiff2" class="ctItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
		          <span id="ctItemDiff3" class="ctItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="ctItemDiff4" class="ctItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="ctItemDiff5" class="ctItemDiff" style="background-position: 0px -575px;"></span>
                 <span id="ctArearPointP" class="manfen">满分:5</span>分
        		</p>
       		</div>
       <div class="form-group">
                <label for="exampleInputEmail1">教练态度:</label>
                <p>
                  <span id="caItemDiff1" class="caItemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
		          <span id="caItemDiff2" class="caItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
		          <span id="caItemDiff3" class="caItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="caItemDiff4" class="caItemDiff" style="background-position: 0px -575px;"></span>
		          <span id="caItemDiff5" class="caItemDiff" style="background-position: 0px -575px;"></span>
                  <span id="caPointP" class="manfen">满分:5</span>分
                </p>
       </div>
       <div class="form-group">
	              <label for="exampleInputEmail1">总体满意度:</label>
	              <p>
	              <span id="ctemDiff1" class="ctemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
		          <span id="ctemDiff2" class="ctemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
		          <span id="ctemDiff3" class="ctemDiff" style="background-position: 0px -575px;"></span>
		          <span id="ctemDiff4" class="ctemDiff" style="background-position: 0px -575px;"></span>
		          <span id="ctemDiff5" class="ctemDiff" style="background-position: 0px -575px;"></span>
	               <span id="cttPointP"  class="manfen">满分:5</span>分
                    </p>
       </div>
       <div class="form-group">
                  <label for="exampleInputEmail1">您的意见与建议:</label>
                  <p>
                  <textarea rows="5" cols="30" id="context"></textarea>
                  </p>
       </div>

         <input type="button" class="btn btn-primary tijiao" value="提交" name="btnOk" onclick="btnOk('coach')"/>
   </div>
   </div>
   	</div>
</div>
</div>
</body>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;
$("#myContainer").css("width",w+"px");
$("#myContainer").find("table").css("width",(w-10)+"px");
$("#myContainer").find("li").css("width",(w/2-5)+"px");
$("#evalContainer").find("li").css("width",(w/2-10)+"px");
function init(json,type){
var texts="";
if(type=='current'){
	//texts="<tr id=\"currentTr\"><th>课程名称</th><th>练车时间</th><th>时间段</th><th>状态</th><th>操作</th></tr>";
}
else{
	//texts="<tr id=\"historyTr\"><th>课程名称</th><th>练车时间</th><th>时间段</th><th>状态</th><th>操作</th></tr>";
}
var len=0;
var forTree = function(o){
	len=o.length;
		for(var i=0;i<o.length;i++){
			if(i==0){
				$("#username").html(o[i]["userName"]);
				$("#subjectName").html("<"+o[i]["subjectName"]+">");
			}
			var urlstr = "";
			try{
				var courseId=o[i]["userCourseId"];
				var score=o[i]["courseInfo"];
				var scoreHtml=scoreHtmls(score);
				if(type=='current'){
					
					var opt="<input id=\"b"+courseId+"\" type=\"button\" onClick=\"cancelCourse('"+courseId+"')\" value=\"取消\" />";
					if(o[i]["courseStateCode"]=='YQX'){
						opt="";
					}
					//urlstr+="<tr><td colspan=\"4\" style=\"color:rgb(14, 23, 245)\">"+o[i]["courseName"]+"</td></tr>";
					//urlstr+="<tr lang=\""+courseId+"\"><td>"+o[i]["time"]+"</td><td>"+o[i]["hourArear"]+"</td><td>"+o[i]["courseState"]+"</td><td>"+opt+"</td></tr>";
					
					urlstr+="<div class=\"block bg_h6\"><ul class=\"media-list\"> <li class=\"media\"><a class=\"pull-left\" href=\"##\"><img src=\""+o[i]["common"]+"\" /></a>"+
                    "<div class=\"media-body\"><h3 class=\"media-heading\">"+o[i]["coachName"]+"</h3><p>"+o[i]["time"]+"  &nbsp "+o[i]["hourArear"]+"  </p><p>"+
                    "<span>"+o[i]["courseState"]+"</span> &nbsp  &nbsp &nbsp &nbsp"+   
                    scoreHtml+opt+"</p> </div></li></ul></div>";
				}else{
					//urlstr+="<tr><td colspan=\"4\" style=\"color:rgb(14, 23, 245)\">"+o[i]["courseName"]+"</td></tr>";
					//urlstr+="<tr lang=\""+courseId+"\"><td>"+o[i]["time"]+"</td><td>"+o[i]["hourArear"]+"</td><td>"+o[i]["courseState"]+"</td><td><a id=\"evalute"+courseId+"\" href=\"javascript:evalute('"+courseId+"')\">评价</a></td></tr>";
					var href=o[i]["courseStateCode"]=='YPJ'?" disabled=\"disabled\"":"onclick=\"evalute('"+courseId+"')\"";
					urlstr+="<div class=\"block bg_h6\"><ul class=\"media-list\"> <li class=\"media\"><a class=\"pull-left\" href=\"#\"><img src=\""+o[i]["common"]+"\" /></a>"+
                    "<div class=\"media-body\"><h3 class=\"media-heading\">"+o[i]["coachName"]+"</h3><p>"+o[i]["time"]+"  &nbsp "+o[i]["hourArear"]+"  </p><p>"+
                    "<span id=\"val"+courseId+"\">"+o[i]["courseState"]+"</span> &nbsp  &nbsp &nbsp &nbsp"+   
                    scoreHtml+"</br></br><input type=\"button\"  "+href+" id=\"evalute"+courseId+"\" value=\"评价\" class=\"btn btn-primary tijiao\" /></p> </div></li></ul></div>";
				}
				texts+=urlstr;
			}catch(e){}
			
			}
		return texts;
	};
	if(type=='current'){
		$("#Div1").html(forTree(json,'current'));
		$("#currentTotal").html("【"+len+"】");
	}
	else{
		$("#profile").html(forTree(json,'history'));
		$("#historyTotal").html("【"+len+"】");
	}
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
//load my orders
$(document).ready( function(){
	var state='<%=state%>';
	var banded='<%=banded%>';
	if(state=='true' && banded=='true'){
	$.post("../main", {
		   type:'mine',
		   openId:'<%=openId%>'
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				   var json=data.dataS0A;
				   var jsonh=data.dataS0X;
				   init(json,'current');
				   init(jsonh,'history');
			   }
			   
		},'json');
	}else{
		$("#myContainer").css("display","none");
	}
	
	$('#btnLogin').bind('click', function(event){
        validateAndSubmitForm();
    });
})

$(".formItemDiff").hover(function() {  
                        $(this).css("background-position", "0px -555px");  
                        $(this).prevAll().css("background-position", "0px -555px");  
                        $(this).nextAll().css("background-position", "0px -575px");  
                        $("#sArearPointP").html(($(this).prevAll().length)+1);  
                    });  
$(".pItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#pPointP").html(($(this).prevAll().length)+1);  
}); 
$(".tItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#tPointP").html(($(this).prevAll().length)+1);  
}); 




$(".ctItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#ctArearPointP").html(($(this).prevAll().length)+1);  
});
$(".caItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#caPointP").html(($(this).prevAll().length)+1);  
});
$(".ctemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#cttPointP").html(($(this).prevAll().length)+1);  
});

function clearCalutate(){
	for(var i=0;i<5;i++){
		$("#ctemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#cttPointP").html("满分：5");
		$("#caItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#caPointP").html("满分：5");
		$("#ctItemDifff"+(i+1)).css("background-position", "0px -575px");  
		$("#ctArearPointPP").html("满分：5");
		$("#tItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#tPointP").html("满分：5");
		$("#pItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#pPointP").html("满分：5");
		$("#formItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#sArearPointP").html("满分：5");
	}
}
function cancelCourse(courseId){
	$("#b"+courseId).attr('disabled', 'false'); //禁用提交按钮
	$.post("../main", {
		   type:'cancel',
		   openId:'<%=openId%>',
		   courseId:courseId
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				  // $("#Div1").siblings().remove();
				   //$("#profile").siblings().remove();
				   $("#Div1").html("");
				   $("#profile").html("");
				   var json=data.dataS0A;
				   var jsonh=data.dataS0X;
				   init(json,'current');
				   init(jsonh,'history');
			   }
			   alert(data.reason);
			   $("#b"+courseId).attr('disabled', 'true'); //禁用提交按钮
		},'json');
}
function evalute(courseId){  
	$("#courseId").val(courseId);
	$("#myContainer").css("display","none");
	$("#evalContainer").css("display","block");
}
function btnOk(type){
	var courseId=$("#courseId").val();
	var desc=$("#context").val();
	if(type=='school'){
		desc=$("#contexts").val();
		alert("此功能还在开发中！敬请期待.");
	}else{
		$.post("../main", {
			   type:'evalute',
			   openId:'<%=openId%>',
			   courseId:courseId,
			   desc:desc,
			   param1:$("#ctArearPointP").val(),
			   param2:$("#caPointP").val(),
			   param3:$("#cttPointP").val()
			   },
			   function(data){
				   var state=data.state;
				   $("#val"+courseId).html("已评价");
				   $("#evalute"+courseId).attr('disabled','true');
				   alert(data.reason);
				   
			},'json');
	}
	
	clearCalutate();
	$("#myContainer").css("display","block");
	$("#evalContainer").css("display","none");
}
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
           // console.log(tabId);
            //console.log(tabs);
            for(var i=0;i<listNum;i++){
                    elem[i].onclick=(function(i){
                        return function(){
                        	console.log("tabNum"+tabNum);
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
                    })(i)
            }
        }
    }
}();
tabs.set("nav","menu_con");//我的预约
tabs.set("evalNav","evalMenu_con");//评价 */



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
		   type:'mine'
		   },
		   function(data){
			  	var state=data.state;
			  	if(state==true){
			  		$("#myContainer").css("display","block");
			  		$("#LoginForm").css("display","none");
			  		$("#userId").val(data.userId);
				    var json=data.dataS0A;
				    var jsonh=data.dataS0X;
				    init(json,'current');
				    init(jsonh,'history');
				   
			  	}else{
			  		var fromlineError = $("#msg");
			  		
		  			fromlineError.css("display","block");
		  			var fromlineError =$("#msg");
		  			fromlineError.css("color","red");
		  			fromlineError.html(data.reason);
				 
			   }
		},'json');
   	
   	
   	
   }
}
</script>
</html>
