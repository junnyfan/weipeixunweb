<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta content="target-densitydpi=device-dpi,width=device-width,user-scalable=no;" name="viewport"> -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" >
		
    $(document).ready( function(){
	
});

</script> 
<title>广东电信资源中心</title>
<style type="text/css">

</style>
</head>
<body>
<%
request.getSession().removeAttribute("username");
request.getSession().removeAttribute("password");
request.getSession().removeAttribute("userId");
request.getSession().removeAttribute("jsessionId");
/* request.getSession().setAttribute("username", "");
request.getSession().setAttribute("password", "");
request.getSession().setAttribute("userId", "");
request.getSession().setAttribute("jsessionId",null); */
HttpSession sess=request.getSession();
sess.invalidate();
//request.getSession().session.invalidate();
String msg="安全退出成功";
%>

<header>
	<div class="logoBox">
    	<img height="60" src="../image/logo.png" />
        <span class="logotext">广东数据超市</span>
    </div>
</header>
<div class="content">

   <div class="quitBox">
   		<a class="btn_login" href="#" onclick="WeixinJSBridge.call('closeWindow');"><%=msg %></a>
   </div>
   
</div>



</body>
</html>
<script type="text/javascript">


</script>