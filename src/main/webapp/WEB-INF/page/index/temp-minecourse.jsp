<%@page import="com.doggadata.teach.service.WXinterfaceService"%>
<%@page import="com.doggadata.teach.pojo.PublicWx"%>
<%@page import="com.doggadata.teach.pojo.PublicWxUtil"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.doggadata.teach.utils.PropertyUtils"%>
<%@page import="com.doggadata.teach.utils.UrlUtil"%>
<%@page import="com.doggadata.teach.utils.UrlUtil.HttpRequestData"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<%
	
    PublicWx wx=PublicWxUtil.getPublicWx();
    String	appid =wx.getAppId();
	String	appSecret =wx.getAppSecret();
	
	String code=request.getParameter("code");
	String url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	url=url.replace("APPID", appid).replace("SECRET", appSecret).replace("CODE", code);
	HttpRequestData data = UrlUtil.sendGet(url);
	String json=data.getResult();
	JSONObject obj = JSONObject.fromObject(json);
	String openid =obj.get("openid").toString();  
	String urls="/index/minCourstList.do?openId="+openid+"&shId=6827b4cf-0eff-4545-9e4f-da8510351fca";
	System.out.println("-----------minCourstList-----------------"+urls);

	%>
	
	
	

<script language="javascript">
	function process(url){
		//self.location = url+"&shId=${shId}";
		self.location = '${root1}'+url;
	}
</script>
<html>
	<head>
		<title></title>
	</head>
	<body onload="javascript: process('<%=urls%>');">
	</body>
</html>
