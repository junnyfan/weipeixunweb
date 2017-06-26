<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<!-- <meta name="viewport" content="target-densitydpi=device-dpi,width=device-width, minimum-scale=1.0, maximum-scale=1.0"> -->
<title>xxxx驾校</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>

<style type="text/css">
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
	
</style>
<script  type="text/javascript" >
var request =
{
	QueryString : function(val){
	var uri = window.location.search;
	var re = new RegExp("" +val+ "=([^&?]*)", "ig");
	return ((uri.match(re))?(uri.match(re)[0].substr(val.length+1)):null);
	}
	
};

    $(document).ready( function(){
	$('#btnLogin').click(function(){
		$('#msg').removeAttr("style");
		$('#msg').text("");
		 var checked = $("#remember_me:checked");
		 if(checked&&checked.length>0){ 
			 var username=$('#username').val();
			 var expdate = new Date();
	         expdate.setDate(expdate.getDate()+3);
			 $.cookie("username",username,{ path: '/', expires: 3 });
		 }else{
			// $.cookie("username","",{ path: '/', expires: 3 });
		 }
	});
    
});

    $(function(){
    	initForm();
  
    });
    /**
     * 验证表单
     */
    function validateAndSubmitForm(){
        var username = $('#username').val();
        var userno = $('#userno').val();
        var telphone = $('#telphone').val();
        var fromlineError = $('#msg');
        if (username == '' || userno == '' || telphone == '') {
        	fromlineError.css("color","red");
            fromlineError.text('用户信息不能为空.');
            return false;
        }else{
        	var redirectUrl = request.QueryString("redirectUrl");
        	if(redirectUrl==''){
        		redirectUrl='tree';
        	}
        	$("#redirectUrl").val(redirectUrl);
        	$.post("../login", {
     		   username:$("#username").val(),
     		   txtPassword:$("#userno").val(),
     		   telphone:$("#telphone").val(),
     		   type:'001'
     		   },
     		   function(data){
     			   var json=data.msg;
     			   
     			   if(json=='true'){
     				   $("#userId").val(data.userId);
     				   $("#jsessionId").val(data.jsessionId);
     				   $("#region").val(data.strTree);
     				   //submitForm();
     			   }else{
     				  $("#username").focus();
     				  var msg="";
     				 if(json=='2222'){  //请求webservice失败
     					msg="请求webservice失败";
     				}else if(json=='00002'){  //
     					msg="用户名或者密码不正确";
     				}else if(json=='00003') { //用户名无效
     					msg="用户名无效";
     				}else
     					msg="网络连接失败";
     				 
     				  fromlineError.css("color","red");
     	              fromlineError.text(msg);
     				  return;
     			   }
     		},'json');
        	
        }
    }
    /**
     * 提交登录表单
     */
    function submitForm(){
        $("#btnLogin").attr('disabled', 'false'); //禁用提交按钮
        $("#inputForm").submit(); //提交表单
    }
    function initForm(){
        $('#username').focus();
        //单击提交表单
        $('#btnLogin').bind('click', function(event){
            //validateAndSubmitForm();
        });
        
    }
    function finished(){
    	var userId=$("#userId").val();
    	if(userId!=''){
    		alert("cd"+userId);
    		var region=$("#region").val();
    		return datas=eval('('+ region + ')');
    	}else
    		return "";
    }
window.onload=function getCookie(){ 
	  var username = $.cookie("username"); 
	  if(username){  
	     $("#username").val(username);   
	  }   
	  var msg='${msg}';
	  if(msg!=''){
		 
		  $("#msg").html(msg);
		  $("#msg").css("color","red");
		  $("#userno").focus();
		  return;
	  }
};

</script> 

<body>
<header>
	<div class="logoBox">
    	<img height="60" src="../image/logos.png" />
        <span class="logotext">xx驾校原型</span>
    </div>
</header>
<form id="inputForm" action="../login" method="post" target="_self">
<input type="hidden" name="userId" id="userId"/>
<input type="hidden" name="jsessionId" id="jsessionId"/>
<input type="hidden" name="region" id="region"/>
<input id="type" type="hidden" name="type"  value="sub"/>
<div class="content">
	<div class="password marT60">
    	<input class="password_input"  name="username" id="username" type="text" placeholder="请输入姓名" />
    </div>
    <div class="password marT60">
    	<input class="password_input"  name="userno" id="userno" type="text" placeholder="请输入卡号" />
    </div>
  <div class="marT30 password_pic">
    	<input class="password_input" name="telphone" id="telphone" type=text  placeholder="请输入手机号码" />
   </div>
   <div class="marT20">
    <input id="remember_me" class="regular-checkbox big-checkbox"  name="remember_me" type="checkbox"  /><label for="remember_me"></label><label class="labeltext" >记住账号</label></br></br><label id="msg" class="labeltext" ></label>
   </div>
   <div class="marT20">
   		<!-- <input class="btn_login" type="button" id="btnLogin" value="登录" /> -->
   		<a class="btn_login" href="#"  id="btnLogin">登录</a>
   </div>
</div>
</form>
</body>

</html>
