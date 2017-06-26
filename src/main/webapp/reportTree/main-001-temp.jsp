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
.continer b{padding-left:20px}
.continer p{padding-left:20px}
.must{color:red}
/* a{color:black} */
#agreeDiv{color:bule;text-align: center;}
#agreeDiv input{border: 1px solid #0331EB;padding:5px}
#agreeDiv a{ color:#0331EB; text-decoration:none;}
ul li{padding-bottom:5px;margin-left:10px}
.hint a{color:rgb(6, 6, 241)}
</style>
<body>
<textarea rows="10" cols="10" style="display: none;" id="tempImg"></textarea>  
<input type="hidden" value="${openId }" id="openId"/>
<%
boolean success=Boolean.valueOf(request.getAttribute("success").toString());
String state=request.getAttribute("state").toString();

%>
<%if(success && state.equals("false")) {%>

<!-- 登录界面 -->
<div id="RegisterForm" style="height: 100%">
<div class="hint">如果您已经注册过，请点击登录<a href="javascript:btnFun('login')">登录</a></div>
	<ul id="form001">
	<li><span class="must">*</span>您的姓名:</br><input type="text" id="username" name="username"/></li>
	<li><span class="must">*</span>身份证号码:</br><input type="text" id="identityCard" name="identityCard"/></li>
	<li><span class="must">*</span>您的性别:</br><select id="sex"><option value="1">男</option><option value="0">女</option></select></li>
	<li><span class="must">*</span>您的头像:</br><div style="padding:5px;border: 1px solid #3016F3;"><input type="file" value="click me" id="uploadFile" style="width:50xp;height:50px" name="uploadFile"/><input type="button" value="test" style="display: none;" value="click me" id="btnUpload" /><div id="coachImg"><img src="/file/img/IMG20150411225438.jpg" style="width:100px"/></div>图片必须为清晰正面免冠照，且不能大于5M，背景颜色不限</div></li>
	<li><div><input type="button" value="下一步" id="nextBtn01"/></div></li>
	</ul>
	<ul id="form002" style="display: none">
	<li><div style="padding-bottom:5px;border-bottom: 2px solid #3016F3;"><p style="font: bold;">合作相关信息</p></div></li>
<!-- 	<li><span class="must">*</span>所属驾校:</br><select id="school"></select></li> -->
	<li><span class="must">*</span>所属网点:</br><select id="branch"></select></li>
	<li><span class="must">*</span>准驾车型:</br><select id="carType"></select></li>
	<li><span class="must">*</span>教练车型:</br><select id="coachCarType"></select></li>
	<li><span class="must">*</span>教练证号:</br><input type="text" id="coachNo" name="coachNo"/></li>
	<li><span class="must">*</span>教练驾龄:</br><input type="text" id="coachDriverYear" name="coachDriverYear"/></li>
	<li><span class="must">*</span>教练教龄:</br><input type="text" id="coachTeachYear" name="coachTeachYear"/></li>
	<li><span class="must">*</span>训练场地址:</br><input type="text" id="address" name="address"/></li>
	<li>考场地址:</br><input type="text" id="examinationRoom" name="examinationRoom"/></li>
	<li><span class="must">*</span>来源渠道:</br><select id="channel"></select></li>
	<li><span class="must">*</span>招生考试指标:</br><input type="text" id="studentInd"/>(人)</li>
	<li><div><input type="button" value="上一步" id="nextBtn102"/><input type="button" value="下一步" id="nextBtn02"/></div></li>
	</ul>
	<ul id="form003" style="display: none">
	<li><div style="padding-bottom:5px;border-bottom: 2px solid #3016F3;"><p style="font: bold;">注册登录信息</p></div></li>
	<li><span class="must">*</span>手机号码:</br><input type="text" id="telphone" name="telphone"/></li>
	<li><span class="must">*</span>密码:</br><input type="text" id="password" name="password"/></li>
	<li><span class="must">*</span>确认密码:</br><input type="text" id="res_password" name="res_password"/></li>
	<li></li>
	<li><div><input type="button" value="上一步" id="nextBtn202"/><input type="button" value="同意并注册" id="btnOk"/></div></li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li><div id="agreeDiv"><input type="checkbox" id="agree" name="agree" onclick="checkFun()" checked="checked"/><a href="#">点击阅读《37学车教练合约说明》</a></div></li>
	</ul>
</div>
<div id="LoginForm" style="display:none;height: 100%">
<div class="hint">如果您未注册过，请点击注册<a href="javascript:btnFun('register')" >注册</a></div>
<div class="content">
	<div class="password marT30">
    	<input class="password_input"  name="username" id="username" type="text" placeholder="请输入姓名" />
    </div>
  <div class="marT30 password_pic">
    	<input class="password_input" name="telphone" onkeyup="this.value=this.value.replace(/\D/g,'')" id="telphone" type=text  placeholder="请输入手机号码" />
   </div>
   <div class="password marT30">
    	<input class="password_input"  name="userno" id="userno" type="text" placeholder="请输入密码" />
    </div>
   <div class="marT30">
   <span id="msg" style="display: none;" ></span>
   </div>
   <div class="marT30">
   		<input class="btn_login" type="button" id="btnLogin" value="登录" /> 
   </div>
</div>


</div>


<%}else{%>
${reason }
<%} %>
<!--对应学员信息 -->



</body>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;

function IdentityCodeValid(code) { 
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;
    
    if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
        tip = "请核对你的身份证号码.身份证号格式错误";
        pass = false;
    }
    
   else if(!city[code.substr(0,2)]){
        tip = "地址编码错误";
        pass = false;
    }
    else{
        //18位身份证需要验证最后一位校验位
        if(code.length == 18){
            code = code.split('');
            //∑(ai×Wi)(mod 11)
            //加权因子
            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
            //校验位
            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++)
            {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if(parity[sum % 11] != code[17]){
                tip = "校验位错误";
                pass =false;
            }
        }
    }
    if(!pass) alert(tip);
    return pass;
}

window.onload = function(){
	 var input = document.getElementById("uploadFile");
	 var result= document.getElementById("coachImg");
	 if ( typeof(FileReader) === 'undefined' ){
	         //result.innerHTML = "抱歉，你的浏览器不支持 FileReader，请使用现代浏览器操作！";
	         //input.setAttribute( 'disabled','disabled' );
	         alert("浏览器不支持上传");
	 } else {
	         input.addEventListener( 'change',readFile,false );}
	}
	function readFile(){
	        var file = this.files[0];
	        var result= document.getElementById("coachImg");
	        var temp=document.getElementById("tempImg");
	//这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件 
	        if(!/image\/\w+/.test(file.type)){ 
	                alert("请确保文件为图像类型");
	                return false;
	        }
	        var reader = new FileReader();
	        reader.readAsDataURL(file);
	        reader.onload = function(e){
	        	    temp.innerHTML = this.result;  //this is base64 type
	                result.innerHTML = '<img id="coachImg" style=\"width:100px\" src="'+this.result+'" alt=""/>';
	                 
	    	        //alert((file.size/1024)/1024+"M");
	        }
	        
	}

	function validata001(){
		var img=$("#tempImg").text();
		//console.log($("#coachImg").attr("src"));
		var username=$("#username").val();
		//var sex=$("#sex").val();
		var identityCard=$("#identityCard").val();
		var state=true;
		if(username=='' || identityCard=='' || img==''){
			alert("信息不齐全，请输入完整.");
			state=false;
		}else{
			var falg= IdentityCodeValid(identityCard);
			if(!falg){
			state=false;
			}
		}
		return state;
	}
	function validata003(){
		var telphone=$("#telphone").val();
		var password=$("#password").val();
		var res_password=$("#res_password").val();
		if(telphone=='' && password=='' && res_password==''){
			
		}else{
			if(password!=res_password){
				
			}else{
				
			}
		}
	}
	function loadHtml(id,json){
		var forOption = function(o){
			var urlstr = "";
			for(var i=0;i<o.length;i++){
				try{
					if(typeof o[i]["id"] != "undefined"){
						urlstr+="<option value=\""+o[i]["id"]+"\">"+o[i]["name"]+"</option>";
					}
					
				}catch(e){}
				
				}
			return urlstr;
		};
		$("#"+id).append(forOption(json));
	}
	function checkFun(){
		var agree=$("#agree").attr("checked");
		//var agree= $("[name='checkbox']").attr("checked");
		if(agree){
			$("#btnOk").attr("disable",false);
		}else{
			$("#btnOk").attr("disable",true);
		}
	}
	function btnFun(id){
		if(id=='login'){
			$("#RegisterForm").css("display","none");
			$("#LoginForm").css("display","block");
		}else{
			$("#RegisterForm").css("display","block");
			$("#LoginForm").css("display","none");
		}
	}
	$(document).ready( function(){
		//load data
		var state='<%=state%>';
		if(state=='false'){
		 $.post("../mainCoach", {
		   type:"common",
		   openId:$("#openId").val()
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				   loadHtml("carType",data.carType);
					loadHtml("coachCarType",data.coachCarType);
					loadHtml("channel",data.channel);
					loadHtml("branch",data.branch); 
			   }
			   
		},'json'); 	
			
		}
		$('#nextBtn01').bind('click', function(event){
		    var state = validata001();
		    if(state){
	        $("#form001").css("display","none");
	        $("#form002").css("display","block");
		    }
	    });
		 
		$("#nextBtn102").bind("click",function(event){
			$("#form001").css("display","block");
	        $("#form002").css("display","none");
		});
		$("#nextBtn02").bind("click",function(event){
			$("#form002").css("display","none");
	        $("#form003").css("display","block");
		});
		$("#nextBtn202").bind("click",function(event){
			$("#form002").css("display","block");
	        $("#form003").css("display","none");
		});
		$("#btnOk").bind("click",function(event){
			alert("ok");
		});
		
	});
</script>

</html>
