<%@page import="com.doggadata.teach.service.WXinterfaceService"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="com.doggadata.teach.pojo.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<title>main-001</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<!-- 下拉框 -->
<link rel="stylesheet" type="text/css" href="/css/style.css" />
</head>
<style type="text/css">
.formItemDiff {  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
    margin-top: 15px;  
} 
.continer {
	margin-left:115px
	}
</style>
        <script  type="text/javascript" >
        $(document).ready(function(e) {
        	var score=7;
        	for(var i=1;i<=7;i++){
        		$("#formItemDiff"+i).css("background-position", "0px -555px"); 
        	}
        	$("#pointP").html(score+'分');  
        	/* $(".formItemDiff").hover(function() {  
                        $(this).css("background-position", "0px -555px");  
                        $(this).prevAll().css("background-position", "0px -555px");  
                        $(this).nextAll().css("background-position", "0px -575px");  
                        $("#pointP").html(($(this).prevAll().length)+1+'分');  
                    });  */ 
        });
        </script>
<body>

<div style="float:left;">
	<img width="100px" height="120px" src="360截图20141021153506133.jpg"/>
</div>
<div class="continer">
	<b>姓名：陈丹</b><br/>
	<div id="score" style="text-align: center; height: 40px; max-height: 60px;">
        <div class="item">
          <div id="formItemDiff1" class="formItemDiff formItemDiffFirst" style="background-position: 0px -555px;"></div>
          <div id="formItemDiff2" class="formItemDiff" style="background-position: 0px -555px;"></div>
          <div id="formItemDiff3" class="formItemDiff" style="background-position: 0px -555px;"></div>
          <div id="formItemDiff4" class="formItemDiff" style="background-position: 0px -555px;"></div>
          <div id="formItemDiff5" class="formItemDiff" style="background-position: 0px -555px;"></div>
          <div id="formItemDiff6" class="formItemDiff" style="background-position: 0px -555px;"></div>
          <div id="formItemDiff7" class="formItemDiff" style="background-position: 0px -575px;"></div>
          <div id="formItemDiff8" class="formItemDiff" style="background-position: 0px -575px;"></div>
          <div id="formItemDiff9" class="formItemDiff" style="background-position: 0px -575px;"></div>
          <div id="formItemDiff10" class="formItemDiff" style="background-position: 0px -575px;"></div>
          <p id="pointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">6分</p>
        </div>
 </div>
 	<p>教龄：15个月</p>
	<p>【浏览 20次】【被赞 15次】</p>
	</div>
	<br/>
	<p style="white-space:normal;word-break:break-all;">简介：xxxxssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssxsssssssssssssssssssssssssssssssssssss</p>
      
    </body>


</html>
