<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<title>分区-001</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />

</head>
<style type="text/css">
/**login model */
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


/** tree model*/
.menuTree{ }
.menuTree div{ border-bottom:1px solid #fff;}
.menuTree div ul{ overflow:hidden; display:none; height:auto;}
.menuTree span{ display:block; height:70px;  padding-left:2px; margin:1px 0; cursor:pointer;}
.menuTree a{ color:#333; text-decoration:none;}
.btn{ height:30px; margin-top:10px; border-bottom:1px solid #CCC;}

</style>

<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

HttpSession sessions=request.getSession();

Object userId=request.getSession().getAttribute("userId");
Object strTree=request.getSession().getAttribute("strTree");
String openId = request.getParameter("openId");
//根据openId查询是否有绑定电话号码，如果有绑定就不用重新绑定了
boolean falg=false;
System.out.println("userId:"+userId+"=====:openId:"+openId);

%>

<%if(!falg) {%>
<!-- 登录界面 -->
<div id="LoginForm" style="height: 100%">
<iframe name="login_Iframe" id="login_Iframe" onload="getTrees()" src="/login/logins.jsp" scrolling="no" allowtransparency="true" style="background-color:transparent;overflow:hidden;width:100%;height: 100%" frameborder="0" ></iframe>
</div>
<%} %>


<!-- 分区 -001 -->
<div id="treeForm" style="display: none">
<form id="inputForm" action="../tree" method="post" target="_self">
<input type="hidden" name="jsessionId" id="jsessionId" value="${jsessionId }"/>
<input type="hidden" name="userId" id="userId" value="${userId}" />
<input type="hidden" name="openId" id="openId" value="<%=openId %>" />
<input type="hidden" name="falg" id="falg" value="<%=falg %>" />
<input type="hidden" name="username" id="username" value="${username }" />
<input type="hidden" name="password" id="password" value="${password }" />
<div id="menuForm">
<div id="menuTree" class="menuTree"></div>
</div>
</form>
</div>
</body>

<script type="text/javascript">

	$(document).ready( function(){
		var falg=$("#falg").val();
		if(falg=='true'){
		$.post("../login", {
   		   openId:$("#openId").val(),
   		   type:'002'
   		   },
   		   function(data){
   				var json=data.strTree;
   				//json=eval('('+ json + ')');
   				json=eval( json );
   				$("#LoginForm").css("display","none");
   				$("#treeForm").css("display","block");
   				/*递归实现获取无级树数据并生成DOM结构*/
	    				var str = "";
	    				var forTree = function(o){
	    					for(var i=0;i<o.length;i++){
	    						var urlstr = "";
	    						try{
	    							if(typeof o[i]["url"] == "undefined"){
	    								urlstr = "<div><div class=\"titleBox\"><img class=\"title_ico\" height=\"70\" src=\"/image/ico_table_big.png\" /><span class=\"list_title\">"+ o[i]["name"] +"</span><img class=\"titlePic\" src=\"../image/ico_down.png\" /></div><ul>";
	    							}else{
	    								//urlstr = "<div><span><a target=\"_blank\" href="+ o[i]["url"] +">"+ o[i]["name"] +"</a></span><ul>";
	    								//urlstr = "<li class=\"list_bg\"><a class=\"listBox\" href=\"${pageContext.request.contextPath}/report?rptId="+o[i]["id"]+"\"><span style=\"margin-left:55px;\"><img height=\"50\" src=\"../image/ico_table_small.png\" /></span><span class=\"list_text\">"+ o[i]["name"] +"</span></a></li>";
	    								
	    								urlstr = "<div><div class=\"list_bg\"><a class=\"listBox\" target=\"_self\" href=\"../subject?id="+o[i]["id"]+"&type="+o[i]["type"]+"&userId="+data.userId+"\"><span style=\"margin-left:45px;\"><img height=\"50\" src=\"../image/ico_table_small.png\" /></span><span class=\"list_text\">"+ o[i]["name"] +"</span></a></div><ul>";
	    								//urlstr = "<div class=\"list_bg\"><img class=\"title_ico\" height=\"70\" src=\"../image/ico_table_big.png\" /><span class=\"list_title\"><a target=\"_blank\" href=\"${pageContext.request.contextPath}/report?rptId="+o[i]["id"]+"\">"+ o[i]["name"] +"</a></span><ul>";
	    							}
	    							str += urlstr;
	    							if(o[i]["list"] != null){
	    								forTree(o[i]["list"]);
	    							}
	    							str += "</ul></div>";
	    						}catch(e){}
	    					}
	    					return str;
	    				}
	    				
	    				/*添加无级树*/
		    			document.getElementById("menuTree").innerHTML = forTree(json);
		    				/*树形菜单*/
		    			var menuTree = function(){
		    					//给有子对象的元素加[+-]
		    						$("#menuTree ul").each(function(index, element) {
		    							var ulContent = $(element).html();
		    							var spanContent = $(element).siblings("div").find("span").html();
		    							//return;
		    					        if(ulContent){
		    					        	//alert(spanContent);
		    								$(element).siblings("div").find("span").html(spanContent)	;
		    								//$(element).siblings("span").attr("class","jia");
		    							}
		    					    });
		    					
		    						$("#menuTree").find("div div").click(function(){
		    							var ul = $(this).siblings("ul");
		    							var spanStr = $(this).html();
		    							var  spanContent= spanStr.substr(0,spanStr.length);
		    							if(ul.find("div").html() != null){
		    								if(ul.css("display") == "none"){
		    									ul.show(300);
		    									$(this).html(spanContent);
		    								}else{
		    									ul.hide(300);
		    									$(this).html(spanContent);
		    								}
		    							}
		    						});
		    				}();
	    				
	    				
   			   
   		},'json');
      	
		}
	});
	
	function getTrees(){ 
		 var subWeb=window.frames["login_Iframe"].document;
		
		 var userId='<%=userId%>';

			if(userId!='' && userId!='null'){
				$("#LoginForm").css("display","none");
				$("#treeForm").css("display","block");
				var json='<%=strTree%>';
				//json=eval('('+ json + ')');
				json=eval( json );
				/*递归实现获取无级树数据并生成DOM结构*/
				var str = "";
				var forTree = function(o){
					for(var i=0;i<o.length;i++){
						var urlstr = "";
						try{
							if(typeof o[i]["url"] == "undefined"){
								urlstr = "<div><div class=\"titleBox\"><img class=\"title_ico\" height=\"70\" src=\"/image/ico_table_big.png\" /><span class=\"list_title\">"+ o[i]["name"] +"</span><img class=\"titlePic\" src=\"../image/ico_down.png\" /></div><ul>";
							}else{
								//urlstr = "<div><span><a target=\"_blank\" href="+ o[i]["url"] +">"+ o[i]["name"] +"</a></span><ul>";
								//urlstr = "<li class=\"list_bg\"><a class=\"listBox\" href=\"${pageContext.request.contextPath}/report?rptId="+o[i]["id"]+"\"><span style=\"margin-left:55px;\"><img height=\"50\" src=\"../image/ico_table_small.png\" /></span><span class=\"list_text\">"+ o[i]["name"] +"</span></a></li>";
								
								urlstr = "<div><div class=\"list_bg\"><a class=\"listBox\" target=\"_self\" href=\"../subject?id="+o[i]["id"]+"&type="+o[i]["type"]+"&userId="+userId+"&openId="+openId+"\"><span style=\"margin-left:45px;\"><img height=\"50\" src=\"../image/ico_table_small.png\" /></span><span class=\"list_text\">"+ o[i]["name"] +"</span></a></div><ul>";
								//urlstr = "<div class=\"list_bg\"><img class=\"title_ico\" height=\"70\" src=\"../image/ico_table_big.png\" /><span class=\"list_title\"><a target=\"_blank\" href=\"${pageContext.request.contextPath}/report?rptId="+o[i]["id"]+"\">"+ o[i]["name"] +"</a></span><ul>";
							}
							str += urlstr;
							if(o[i]["list"] != null){
								forTree(o[i]["list"]);
							}
							str += "</ul></div>";
						}catch(e){}
					}
					return str;
				}
				
				/*添加无级树*/
				document.getElementById("menuTree").innerHTML = forTree(json);
					/*树形菜单*/
				var menuTree = function(){
						//给有子对象的元素加[+-]
							$("#menuTree ul").each(function(index, element) {
								var ulContent = $(element).html();
								var spanContent = $(element).siblings("div").find("span").html();
								//return;
						        if(ulContent){
						        	//alert(spanContent);
									$(element).siblings("div").find("span").html(spanContent)	;
									//$(element).siblings("span").attr("class","jia");
								}
						    });
						
							$("#menuTree").find("div div").click(function(){
								var ul = $(this).siblings("ul");
								var spanStr = $(this).html();
								var  spanContent= spanStr.substr(0,spanStr.length);
								if(ul.find("div").html() != null){
									if(ul.css("display") == "none"){
										ul.show(300);
										$(this).html(spanContent);
									}else{
										ul.hide(300);
										$(this).html(spanContent);
									}
								}
							});
					}();
				
			
				
				
			}else{
		 
		 
		 subWeb.getElementById("btnLogin").onclick = function(e){
			 e.preventDefault();
	         //parent window    
	         var username=subWeb.getElementById("username").value;
	         var userno= subWeb.getElementById("userno").value;
	         var telphone=subWeb.getElementById("telphone").value;
	         //validateAndSubmitForm(username,userno,telphone);
	         //var p= document.getElementById("login_Iframe").contentWindow.document.getElementById("region");    
	         //var trees=subWeb.getElementById("region").value;
	        // alert(document.getElementById("login_Iframe").contentWindow.finished()+"11");
	        
	     }
		 
		}
		 
		 
	} 
	function initForm(){
		var ifm=window.frames["login_Iframe"].document;
		ifm.getElementById("username").focus();
        //单击提交表单
        $('#btnLogin').bind('click', function(event){
            validateAndSubmitForm();
        });
        
    }
    
     /**
      * 验证表单
      */
     function validateAndSubmitForm(username,userno,telphone){
         var fromlineError = window.frames["login_Iframe"].document.getElementById('msg');
         if (username == '' || userno == '' || telphone == '') {
         	fromlineError.style.color="red";
             fromlineError.innerHTML="用户信息不能为空.";
             return false;
         }else{
         	$.post("../login", {
      		   username:username,
      		   txtPassword:userno,
      		   telphone:telphone,
      		   type:'001'
      		   },
      		   function(data){
      			   var msg=data.msg;  
      			   if(msg=='true'){
      				 window.frames["login_Iframe"].document.getElementById('userId').value=data.userId;
      				 //$("#region").val(data.region);
      				window.frames["login_Iframe"].document.getElementById('region').value=data.region;
      				var json=data.strTree;
      				//json=eval('('+ json + ')');
      				json=eval( json );
      				$("#LoginForm").css("display","none");
      				$("#treeForm").css("display","block");
      				/*递归实现获取无级树数据并生成DOM结构*/
	    				var str = "";
	    				var forTree = function(o){
	    					for(var i=0;i<o.length;i++){
	    						var urlstr = "";
	    						try{
	    							if(typeof o[i]["url"] == "undefined"){
	    								urlstr = "<div><div class=\"titleBox\"><img class=\"title_ico\" height=\"70\" src=\"/image/ico_table_big.png\" /><span class=\"list_title\">"+ o[i]["name"] +"</span><img class=\"titlePic\" src=\"../image/ico_down.png\" /></div><ul>";
	    							}else{
	    								//urlstr = "<div><span><a target=\"_blank\" href="+ o[i]["url"] +">"+ o[i]["name"] +"</a></span><ul>";
	    								//urlstr = "<li class=\"list_bg\"><a class=\"listBox\" href=\"${pageContext.request.contextPath}/report?rptId="+o[i]["id"]+"\"><span style=\"margin-left:55px;\"><img height=\"50\" src=\"../image/ico_table_small.png\" /></span><span class=\"list_text\">"+ o[i]["name"] +"</span></a></li>";
	    								
	    								urlstr = "<div><div class=\"list_bg\"><a class=\"listBox\" target=\"_self\" href=\"../subject?id="+o[i]["id"]+"&type="+o[i]["type"]+"&userId="+data.userId+"\"><span style=\"margin-left:45px;\"><img height=\"50\" src=\"../image/ico_table_small.png\" /></span><span class=\"list_text\">"+ o[i]["name"] +"</span></a></div><ul>";
	    								//urlstr = "<div class=\"list_bg\"><img class=\"title_ico\" height=\"70\" src=\"../image/ico_table_big.png\" /><span class=\"list_title\"><a target=\"_blank\" href=\"${pageContext.request.contextPath}/report?rptId="+o[i]["id"]+"\">"+ o[i]["name"] +"</a></span><ul>";
	    							}
	    							str += urlstr;
	    							if(o[i]["list"] != null){
	    								forTree(o[i]["list"]);
	    							}
	    							str += "</ul></div>";
	    						}catch(e){}
	    					}
	    					return str;
	    				}
	    				
	    				/*添加无级树*/
		    			document.getElementById("menuTree").innerHTML = forTree(json);
		    				/*树形菜单*/
		    			var menuTree = function(){
		    					//给有子对象的元素加[+-]
		    						$("#menuTree ul").each(function(index, element) {
		    							var ulContent = $(element).html();
		    							var spanContent = $(element).siblings("div").find("span").html();
		    							//return;
		    					        if(ulContent){
		    					        	//alert(spanContent);
		    								$(element).siblings("div").find("span").html(spanContent)	;
		    								//$(element).siblings("span").attr("class","jia");
		    							}
		    					    });
		    					
		    						$("#menuTree").find("div div").click(function(){
		    							var ul = $(this).siblings("ul");
		    							var spanStr = $(this).html();
		    							var  spanContent= spanStr.substr(0,spanStr.length);
		    							if(ul.find("div").html() != null){
		    								if(ul.css("display") == "none"){
		    									ul.show(300);
		    									$(this).html(spanContent);
		    								}else{
		    									ul.hide(300);
		    									$(this).html(spanContent);
		    								}
		    							}
		    						});
		    				}();
	    				
	    				
      			   }else{
      				 var ifm=window.frames["login_Iframe"].document;
      				 ifm.getElementById("username").focus();
      				 var msg="";
      				 if(json=='2222'){  //请求webservice失败
      					msg="请求webservice失败";
      				}else if(json=='00002'){  //
      					msg="用户名或者密码不正确";
      				}else if(json=='00003') { //用户名无效
      					msg="用户名无效";
      				}else
      					msg="网络连接失败";
      				 
      				  fromlineError.style.color="red";
      				  fromlineError.innerHTML=msg;
      				  return;
      			   }
      		},'json');
         	
         }
     }
	
</script>

</html>
