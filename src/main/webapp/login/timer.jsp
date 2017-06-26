<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
 
<body>
<center>
<input type="hidden" id="clock" value="0">
<span id="clocktime"></span>
<script language=javascript>
var ti;
function clock()
  {
	var t;
	  
	  t=parseInt(document.getElementById("clock").value)+1;
	  document.getElementById("clock").value = t;
	  t=formatSeconds(t);
	  document.getElementById("clocktime").innerHTML=t;
  } 
 
function formatSeconds(value) {
var ctime = Number(value);
        var ctime1 = 0;
        var ctime2 = 0;
        if(ctime > 60) {
        	ctime1 = Number(ctime/60);
        	ctime = Number(ctime%60);
        	if(ctime1 > 60) {
        		ctime2 = Number(ctime1/60);
        		ctime1 = Number(ctime%60);
        	}
        }
        var result = ""+ctime+"秒";
        console.log(parseInt(ctime1));
        if(parseInt(ctime1)==15){
        	clearTimeout(ti);
        }
        if(ctime1 > 0) {
        	result = ""+parseInt(ctime1)+"分"+result;
        }
        if(ctime2 > 0) {
        	result = ""+parseInt(ctime2)+"小时"+result;
        }
        return result;
}
ti=setInterval("clock()",1000);
</script>
</body>
</center>
</html>