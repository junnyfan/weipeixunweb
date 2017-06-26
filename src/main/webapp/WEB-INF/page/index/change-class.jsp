<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/contextPath.jsp"%>
<head>
		<meta charset="utf-8">
		<title>调课功能</title>
	    <script type="text/javascript" src="${root1 }/js/jquery.js" ></script>
		 <link rel="stylesheet" href="${root1 }/css/search.css" />
		 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />				
		
	</head>
	<style type="text/css">
			.hide{ display:none;}
		</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#sure_btn").click(function(){
			//ajax
			var id=$("#temp_courseSid").val();
			var url="${root1}/index/getConfirmPay.do";
			$.post(url,{"courseSid":id}, function(data) {
	            if(  data.state == "false"){
	 				alert("网络异常.请稍候再试.");
	 			}else{
	 				window.location.reload();
	 			}
		         
		         }) ;
			
		});
		$("#allCheck").click(){
			var vals=$(this).val();
			$('input:checkbox').each(function() {
				if(vals==0){
					$("#allCheck").val("1");
		        	$(this).attr('checked', true);
				}else{
					$("#allCheck").val("0");
		        	$(this).attr('checked', false);
				}
			});
			
			//$("#serchForm").find("name=[nameCheck]");
		}
		
	});

	
	</script>
	<body>
		<div class="ic-chart pad20" style="padding-top:10px; padding-bottom:0;">                    
	                    	<div>
	                        	<form id="searchForm" class="search">
									<label>输入姓名：</label><input  id="username" type="text">
	                            	<a id="searchBtn">查询</a>
	                            </form>
	                        </div>
	                    	<div class="clear">                            
	                        </div>
	                        <div><!-- 用户列表 -->
	                            <table cellspacing="0" id="tabInfo" cellpadding="0" border="0" class="ic_tab1_zf06 up_tab01_yke"><tbody>
		                            <tr><th><input type="checkbox" value="0" id="allCheck"/>姓名</th><th>所在班级</th></tr>
		                            <tr><td><input type="checkbox" name="nameCheck" />黎友兵</td><td>XXXX</td></tr>
	                            </tbody></table> 
	                            
	                        </div>                       
	    </div>
		
	</body>
	
</html>
