<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.doggadata.teach.utils.UrlUtil.HttpRequestData"%>
<%
String path1 = request.getContextPath();
request.setAttribute("path1",path1);
String root1 ="";
if(request.getServerName().contains("doggadata.com")){
	root1 = request.getScheme()+"://doggadata.com"+path1;
}else{
	root1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1;
}
System.out.print(root1);
request.setAttribute("root1",root1);
%>
<script type="text/javascript">
  var contextPath='<%=root1%>';
</script>

