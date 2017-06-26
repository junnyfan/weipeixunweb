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
    <meta charset="utf-8">
    <title>我是教练</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/skin/default001/css/bootstrap.css">
    <link rel="stylesheet" href="/skin/default001/css/cover.css">
</head>
<style type="text/css">
.dataDetail{padding-bottom:15px}
/* .dataDetail table td{border: 1px solid gray} */
a{color:black}
.uk-badge {
  display: inline-block;
  padding: 0 5px;
  background: #848585;
  /* font-size: 10px;
  font-weight: bold;
  line-height: 14px; */
  color: #ffffff;
  text-align: center;
  vertical-align: middle;
  text-transform: none;
  border: 1px solid rgba(0, 0, 0, 0.06);
  border-radius: 2px;
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.uk-badge-success {
  background-color: #8cc14c;
}
.uk-table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  margin-bottom: 15px;
}
* + .uk-table {
  margin-top: 15px;
}
.uk-table th,
.uk-table td {
  padding: 8px 8px;
  border-bottom: 1px solid #f6f6f6;
}
.uk-table th {
  text-align: left;
}
.uk-table td {
  vertical-align: top;
}
.uk-table thead th {
  vertical-align: bottom;
}
.uk-table caption,
.uk-table tfoot {
  font-size: 12px;
  font-style: italic;
}
.uk-table caption {
  text-align: left;
  color: #999999;
}
.uk-table tbody tr.uk-active {
  background: #f0f0f0;
}
.uk-table-middle,
.uk-table-middle td {
  vertical-align: middle !important;
}
</style>


<body>
<textarea rows="10" cols="10" style="display: none;" id="tempImg"></textarea>  
<input type="hidden" value="${openId }" id="openId"/>
<input id="jxId" type="hidden" name="jxId"/>
<input id="teacherId" type="hidden" name="teacherId" value="${teacherId }"/>
<input id="historyDate" type="hidden" name="historyDate" value="${historyDate }"/>
<input id="jxName" type="hidden" name="jxName"/>
<%
boolean state=Boolean.valueOf(request.getAttribute("state").toString());
boolean isbanded=true;

%>
<%if(state) {
	isbanded=Boolean.valueOf(request.getAttribute("isbanded").toString());
	String teacherId=request.getAttribute("teacherId").toString();
if(!isbanded){
%>

<!-- 登录界面 -->
<div id="RegisterForm">
    <div class="container col-xs-12">
	<%-- <h4><span id="jxDesc">${jxName }</span>欢迎您!</h4> --%>
        <form>

            <!-- <h4>如果您已经注册过，请点击<a href="javascript:btnFun('login')">登录</a></h4>  -->

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    您的姓名：</label>
                <input class="form-control" type="text" id="username" name="username" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    身份证号码：</label>
                <input type="text" class="form-control" id="identityCard" name="identityCard" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    您的性别：</label>
                <select id="sex" class="form-control">
                    <option value="1">男</option>
                    <option value="0">女</option>

                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputFile">
                    <span class="small_star">*</span>
                    您的头像：</label>
				<input type="button" value="test" style="display: none;" value="click me" id="btnUpload" />
                <input type="file" id="uploadFile" name="uploadFile">
                <div id="coachImg"><img width="width:100px" src="skin/default001/images/02.jpg" /></div>
                <p class="help-block">图片必须为清晰的正面照，且不能大于1M，背景不限。</p>
				<div><span id="uploadMsg" class="msg" style="display: none;color:red">正在上传…………</span></div>
            </div>



            <h4>合作相关信息</h4>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    所属科目：</label>
                <select class="form-control" id="subject">
                </select>
            </div>
            
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    所属网点：</label>
                <select class="form-control" id="branch">
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    准驾车型：</label>
                <select class="form-control" id="carType">
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练车型：</label>
                <select class="form-control" id="coachCarType">
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练证号：</label>
                <input type="text" class="form-control" id="coachNo" name="coachNo" placeholder="">
            </div>
            
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    驾驶证编号：</label>
                <input type="text" class="form-control" id="carNo" name="carNo" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    车牌号：</label>
                <input type="text" class="form-control" id="carPno" name="carPno" placeholder="">
            </div>
            
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练驾龄（月）：</label>
                <input type="text" class="form-control" id="coachDriverYear" name="coachDriverYear" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练年龄（月）：</label>
                <input type="text" class="form-control" id="coachTeachYear" name="coachTeachYear" placeholder="">
            </div>

           <!--  <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    训练场地址：</label>
                <input type="text" class="form-control" id="Email5" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    考场地址：</label>
                <input type="text" class="form-control" id="Email6" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    来源渠道：</label>
                <select class="form-control">
                    <option>客服经理</option>
                    <option>渠道经理</option>
                    <option>其他</option>
                </select>
            </div>
 			-->
 			
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    招生考试指标（人）：</label>
                <input type="text" class="form-control" id="studentInd" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    住址：</label>
                <input type="text" class="form-control"  id="address" placeholder="">
            </div>

            <h4>注册登录信息</h4>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    手机号码：</label>
                <input type="text" class="form-control" id="telphone" name="telphone" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    密码：</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    确认密码：</label>
                <input type="password" class="form-control" id="res_password" name="res_password" placeholder="">
                <span class="msg" style="display: none;color:red" id="msg"></span>
            </div>

            <div class="checkbox" id="agreeDiv">
                <label>
                    <input type="checkbox" id="agree" checked="checked" name="agree" onclick="checkFun()">
                    点击阅读<a href="#">《37学车教练合约说明》</a>
                </label>
            </div>

            <button type="button" class="btn btn-primary btn-group-justified" id="btnOk">同意并注册</button>
        </form>
    </div>
</div>
<div id="LoginForm" style="display:none;height: 100%">
<!-- <div class="hint">如果您未注册过，请点击注册<a href="javascript:btnFun('register')" >注册</a></div> -->
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
                <input type="text" id="login_username" name="login_username" class="form-control" placeholder="请输入姓名" aria-describedby="basic-addon1">
      </div>
     
      <div class="input-group">
            <span class="input-group-addon" id="Span2">
            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>    
            </span>
                <input type="text" class="form-control" id="login_telphone" name="login_telphone" placeholder="请输入电话号码" aria-describedby="basic-addon1">
      </div>
<div class="input-group">   
            <span class="input-group-addon" id="Span1">
                <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
            </span>
                <input type="password" id="login_password" name="login_password" class="form-control" placeholder="请输入密码" aria-describedby="basic-addon1">
      </div>
      <span id="msg-login" style="display: none;" ></span>
      </div>

<button type="button"  id="btnLogin" class="btn btn-primary btn-group-justified">登录</button>
       
  </div>
  
</div>

</div>
<%}%>

<!--对应学员信息 -->
<div id="container" class="container" style="display: none;" >
<!-- 显示分点信息 -->
<div id="areaCode">
<!-- <span>我的授课记录</span>	 -->
</div>
<div class="tabpanel">
	<ul class="nav nav-tabs nav-justified" role="tablist">
         <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">当前课时<span id="currentCount" class=""></span></a>
         </li>
         <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">历史课时<span id="historyCount" class=""></span></a>
         </li>

   </ul>


  <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="home">
          <div class="block bg_h6" id="currentStudy" >

		  </div>
		 
      </div>
      <div role="tabpanel" class="tab-pane" id="profile">
       <div class="block bg_h6" id="historyStudy">
       
		  <div style="line-height: 15px;width:100%;height:15px; text-align: center; color:black;cursor:pointer;" id="more">更多</div>
		  </div>
      </div>
  </div>
		    	
</div>
</div>		   

<%
}else{%>
${reason }
<%} %>

</body>

<script src="/skin/default001/js/jquery.min.js"></script>
<script src="/skin/default001/js/bootstrap.min.js"></script>
<script src="/skin/default001/js/holder.js"></script>

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
                tip = "身份证校验位错误";
                pass =false;
            }
        }
    }
    if(!pass){
    	$("#identityCard").focus();
    	$("#msg").css("display","block");
		$("#msg").html(tip);
    }
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
		    $("#uploadMsg").html("正在上传……");
		    $("#uploadMsg").css("display","block");
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
	        	var size=(file.size/1024)/1024;
	        	if(size<=1){
	        	    temp.innerHTML = this.result;  //this is base64 type
	                result.innerHTML = '<img id="coachImg" style=\"width:100px\" src="'+this.result+'" alt=""/>';
	                $("#uploadMsg").css("display","none"); 
	    	        //alert((file.size/1024)/1024+"M");
	        	}else{
	        		$("#uploadMsg").html("您的图片已经超过1M了，请重新选择.");
	        		return;
	        	}
	        }
	        
	}

	function validata(){
		var img=$("#tempImg").text();
		var username=$("#username").val();
		var identityCard=$("#identityCard").val();
		var carNo=$("#carNo").val();
		var carPno=$("#carPno").val();
		var telphone=$("#telphone").val();
		var password=$("#password").val();
		var res_password=$("#res_password").val();
		var coachNo=$("#coachNo").val();
		var coachDriverYear=$("#coachDriverYear").val();
		var coachTeachYear=$("#coachTeachYear").val();
		//var address=$("#address").val();
		var studentInd=$("#studentInd").val();
		var address=$("#address").val();
		var state=true;
		if(username=='' || identityCard=='' || img=='' || telphone=='' || password=='' || res_password=='' || coachNo=='' ||coachDriverYear=='' || studentInd=='' || coachTeachYear==''|| carNo=='' || carPno==''){
			$("#msg").css("display","block");
			$("#msg").html("信息不齐全，请输入完整.");
			//alert("信息不齐全，请输入完整.");
			state=false;
		}else{
			
			var falg= IdentityCodeValid(identityCard);
			if(!falg){
			state=false;
			}else if(password!=res_password){
				$("#msg").css("display","block");
				$("#msg").html("密码输入不一致.");
				state=false;
			}
		}
		return state;
	}

	function loadHtml(id,json,state){
		var forOption = function(o){
			var urlstr = "";
			for(var i=0;i<o.length;i++){
				try{
					if(typeof o[i]["id"] != "undefined"){
						//String opt = o[i]["branchAddress"]!="undefined"?"lang=\""+o[i]["branchAddress"]+"\"":" ";
						//String opt ="sssssdddddd ";
						if(state==0)
							urlstr+="<option value=\""+o[i]["id"]+"\">"+o[i]["name"]+"</option>";
						else
							urlstr+="<option lang=\""+o[i]["branchAddress"]+"\" value=\""+o[i]["id"]+"\">"+o[i]["name"]+"</option>";
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
		var isbanded='<%=isbanded%>';
		if(state=='true' && isbanded=='false'){
		 $.post("../mainCoach", {
		   type:"common",
		   openId:$("#openId").val()
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				    loadHtml("carType",data.carType,0);
					loadHtml("coachCarType",data.coachCarType,0);
					//loadHtml("channel",data.channel);
					loadHtml("branch",data.branch,1); 
					loadHtml("subject",data.subject,0);
					$("#jxDesc").html(data.jxName);
					$("#jxId").val(data.jxId);
					$("#jxName").val(data.jxName);
			   }
			   
		},'json'); 	
			
		}else if(isbanded=='true' && state=='true'){  
				$("#container").css("display","block");
				
			    var json=${data};
				var jsons=${datas};
				var checkstat='${checkstat}';
				var text='${text}';
				var t = text.split(":");
				var text="<div style=\"padding:5px 0 15px -5px\"><h3>"+t[0]+"</h3><p>&nbsp;&nbsp;&nbsp;&nbsp;"+t[1]+"</p></div></br>";
				if(checkstat=='DSH' || checkstat=='SHWTG'){
					var msg="";
					if(checkstat=='DSH' )
						msg="亲，您提交的教练申请信息正在<span style=\"color:red;font-size: 24px;font:bold;\">等待审核</span>，暂时无法访问此功能；审核通过后平台将第一时间通知您！";
					else
						msg="您提交信息在平台审核失败，可能是由于您提交的资料不完整导致的,请联系驾校工作人员重新注册.";
					text="<div style=\"padding:5px 0 15px -5px\">"+msg+"</div>";
				}
				//var texts="<div style=\"padding:5px 0 15px -5px\">"+'${texts}'+"</div>";//历史记录的统计信息
				init(json,text,'current');
				init(jsons,"",'history');
						
				
			
		}
		
		$('#btnLogin').bind('click', function(event){
		        validateAndSubmitForm();
		});
		 
		$("#agree").bind("click",function(event){
			 var checked = $("#agree:checked");
			 $("#btnOk").removeAttr("disabled");
			 if(checked&&checked.length>0){  //1 is checked 0 is unchecked
				 
			 }else{
				 $("#btnOk").attr("disabled",'false');
			 }
		});
		 $("#more").on("click",function(){
         	moreData();
          
		});  
		 
		/*  var obj = document.getElementById('more');
         obj.addEventListener('touchmove', function(event) { 
         // 如果这个元素的位置内只有一个手指的话 
      		event.preventDefault();// 阻止浏览器默认事件，重要 
   			$("#dataDetail").removeAttr("id");
   			moreData();
      			//添加事件
      		
         }, false);  */
		$("#btnOk").bind("click",function(event){

		    var state=validata();
			//var state=true;
			if(state==true){

				var username=$("#username").val();
				var carNo=$("#carNo").val();
				var carPno=$("#carPno").val();
				var identityCard=$("#identityCard").val();
				var telphone=$("#telphone").val();
				var password=$("#password").val();
				var coachNo=$("#coachNo").val();
				var coachDriverYear=$("#coachDriverYear").val();
				var coachTeachYear=$("#coachTeachYear").val();
				var studentInd=$("#studentInd").val();
				var address=$("#address").val();
				var branchId=$("#branch").val();
				var branchName=$("#branch option:selected").text();
				var carTypeId=$("#carType").val();
				var carTypeName=$("#carType option:selected").text();
				var coachCarTypeId=$("#coachCarType").val();
				var coachCarTypeName=$("#coachCarType option:selected").text();
				var sex=$("#sex").val();
				var subjectId=$("#subject").val();
				var subjectName=$("#subject option:selected").text();
				var branchAddress=$('#branch option:selected').attr("lang");
				$("#msg").css("display","none");
				var base64=$("#tempImg").html().substring(23);
				
				$.post("../mainCoach", {
					   base64 :base64,
					   identityCard:identityCard,
					   username:username,
					   telphone:telphone,
					   password:password,
					   branchAddress:branchAddress,
					   sex:sex,
					   carNo:carNo,
					   carPno:carPno,
					   subjectId:subjectId,
					   subjectName:subjectName,
					   coachNo:coachNo,
					   coachDriverYear:coachDriverYear,
					   coachTeachYear:coachTeachYear,
					   studentInd:studentInd,
					   address:address,
					   branchId:branchId,
					   branchName:branchName,
					   carTypeId:carTypeId,
					   carTypeName:carTypeName,
					   coachCarTypeId:coachCarTypeId,
					   coachCarTypeName:coachCarTypeName,
					   jxName:$("#jxName").val(),
					   jxId:$("#jxId").val(),
					   type:"resgister",
					   openId:'${openId}'
					   },
					   function(data){
						   
						   if(data.state==true){
						   $("#RegisterForm").css("display","none");
						   $("#container").css("display","block");
						   var json=data.data;
						   var jsons=data.datas;
						   var text="<div style=\"padding:5px 0 5px -5px\">"+'亲，您提交的教练申请信息正在<span style=\"color:red;font-size: 24px;font:bold;\">等待审核</span>，暂时无法访问此功能；审核通过后平台将第一时间通知您！'+"</div>";
						   //var texts="<div style=\"padding:5px 0 5px -5px\">"+'我们的工作人员将尽快对您提交的信息进行审核，将在一个工作日之内完成审核，期待您再次访问本系统将得到答复'+"</div>";  //历史记录的统计信息
						   init(json,text,'current');
						   init(jsons,"",'history');
						   }else{
							   alert(data.reason);
						   }
						   
					},'json');
			}else{
				return;
			} 
		});
		
	});
	
	
	
	/**
	* 验证表单
	*/
	function validateAndSubmitForm(){
	   var username = $("#login_username").val();
	   var password = $("#login_password").val();
	   var telphone = $("#login_telphone").val();
	   var fromlineError = $("#msg-login");
	   if (username == '' || password == '' || telphone == '') {
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
	   	
	   	
	   	
	   	$.post("../mainCoach", {
			   username:username,
			   password:password,
			   telphone:telphone,
			   openId:'${openId}',
			   type:'login'
			   },
			   function(data){
				  	var state=data.state;
				  	if(state==true){
				  		$("#container").css("display","block");
				  		$("#LoginForm").css("display","none");
				  		var json=data.data; 
						var jsons=data.datas;
						var checkstat=data.checkstat;
						var text=data.text;
						var t = text.split(":");
						var text="<div style=\"padding:5px 0 15px -5px\"><h3>"+t[0]+"</h3><p>&nbsp;&nbsp;&nbsp;&nbsp;"+t[1]+"</p></div></br>";
						if(checkstat=='DSH' || checkstat=='SHWTG'){
							var msg="";
							if(checkstat=='DSH' )
								msg="亲，您提交的教练申请信息正在<span style=\"color:red;font-size: 24px;font:bold;\">等待审核</span>，暂时无法访问此功能；审核通过后平台将第一时间通知您！";
							else
								msg="您提交信息在平台审核失败，可能是由于您提交的资料不完整导致的,请联系驾校工作人员重新注册.";
							text="<div style=\"padding:5px 0 15px -5px\">"+msg+"</div>";
						}
						init(json,text,'current');
						init(jsons,"",'history');
				  	}else{
				  		var fromlineError = $("#msg-login");
			  			fromlineError.css("display","block");
			  			fromlineError.css("color","red");
			  			fromlineError.html(data.reason);
					 
				   }
			},'json');
	   	
	   	
	   	
	   //	$("#inputForm").submit();
	   	
	   }
	}
	
	 function moreData(){
      	var openId=$("#openId").val();
      	var historyDate=$("#historyDate").val();
      	if($("#more").html()!='无更多数据'){
      		$("#more").html('正在加载……');
      		$.post("/mainCoach", {
    			   date:historyDate,
    			   type:"more",
    			   openId:openId,
    			   teacherId:$("#teacherId").val()
    			   },function(data){
    				   if(data.size>0){
    					   $("#historyDate").val(data.historyDate);
			            	$("#dataDetail").after(init(data.data,"",'history'));
			            	$("#more").html("更多数据");
    				   }else{
    					   $("#more").html("无更多数据");
    				   }
    			
           		  }
    		,'json');
      	}
      	
      }

	
	function init(json,text,state){  //text汇总信息
		var texts=text;	
		var varCoachId="";
		var forTree = function(o){
				for(var i=0;i<o.length;i++){
					var urlstr = "";
					try{
						if(typeof o[i]["dataLine"] != "undefined"){
							var time=o[i]["dataLine"]+o[i]["areaCode"];
							var opt=(i+1)==o.length?"id=\"dataDetail\" onscroll=\"moreData()\"":"";
							urlstr="<div "+opt+" class=\"dataDetail\"><span style=\"padding-bottom:12px;color:#666666;\">"+time+"</span><table class=\"uk-panel uk-table\">";
						}else{
							//var start=o[i]["start"];
							//var end=o[i]["end"];
							var dataTime=o[i]["dataTime"];
							if(typeof dataTime !="undefined"){
								var cl="";
								if(o[i]["students"]=='无人'){
									cl="class=\"uk-badge\"";
								}else{
									cl="class=\"uk-badge uk-badge-success\"";
								}
								urlstr="<tr><td style=\"color:#666666;\">"+dataTime+"</td><td><span "+cl+">"+o[i]["students"]+"</span></td></tr>";
							}
						}
						texts+=urlstr;
						if(o[i]["dataList"] != null){
							forTree(o[i]["dataList"]);
						}
						
					}catch(e){}
					
					}
				if(json!="[{}]" && o.length>0){
					texts += "</table></div>";
				}
				return texts;
			};
			if(state=='current')
				$("#currentStudy").html(forTree(json));//document.getElementById("currentStudy").innerHTML = forTree(json);
			else
				$("#historyStudy").before(forTree(json));
		}
		
	
	
	
</script>

</html>


